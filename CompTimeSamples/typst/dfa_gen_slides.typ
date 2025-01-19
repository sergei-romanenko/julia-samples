#import "@preview/touying:0.5.5": *
#import themes.simple: *
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#show: simple-theme.with(
  aspect-ratio: "4-3",
  // footer: [Simple slides],
)

#set text(size: 21pt, font: "FreeSans")

#let show-jl(font-size: 0.75em, body) = {
  rect(
    width: 100%,
    stroke: 1pt,
    fill: luma(98%),
  )[
    #set text(size: font-size)
    #box(body)
  ]
}

#show raw.where(lang: "julia"): it => {
  show-jl(it)
}

#let show-jl-output(font-size: 0.75em, body) = {
  block(
    above: -0.5em,
    width: 100%,
    breakable: true,
  )
  [
    #set text(size: font-size)
    #h(0.4em)
    #box(body)
  ]
}

#show raw.where(lang: "julia-output"): it => {
  show-jl-output(it)
}

#set document(
  title: "Julia: генерация программ с goto",
  author: "Сергей Анатольевич Романенко",
  date: datetime(year: 2024, month: 7, day: 14),
)

#title-slide[
  #v(6fr)
  = #text(font: "Comic Sans MS", style: "italic")[
    Julia: генерация программ\ с `goto`
  ]

  #v(3fr)
  *Сергей Анатольевич Романенко*
  #v(5fr)
  Институт им. М.В.Келдыша РАН
  #v(1fr)
  Москва, 14 июля 2024
]

= Пререквизиты

== Вспомогательные средства

Подключаем `CompTime`, чтобы провести эксперимент по его использованию
(неудачный).

```julia
using CompTime
```

Поключаем функцию `cleanup`, для подчистки сгенерированных программ,
которая делает следующее:

- Удаляет информацию о номерах строк исходной программы.
- Удаляет константные выражения (неиспользуемые).
- Удаляет лишние `begin ... end`.

```julia
include("MacroUtils.jl")
using .MacroUtils: cleanup
```
= Пример: детерминированный конечный автомат

== Автомат проверки чётности

- На вход поступает последовательность из символов `0` и `1`.
- На выходе получается последовательности из символов `even` и `odd`.
- На каждом шаге читается один входной символ и пишется один выходной.

#align(center)[
  #diagram(
    node-shape: "circle",
    node-stroke: 1pt,
    // label-side: center,
    spacing: (5em, 2.2em),
    {
      node((-1, 0), `s0`, name: <s0>)
      node((+1, 0), `s1`, name: <s1>)
      edge(<s0.north>, <s0.west>, "-|>", [`0/even`], bend: -152deg, label-side: center)
      edge(<s0.north>, <s1.north>, "-|>", [`1/odd`], bend: 30deg, label-side: center)
      edge(<s1.south>, <s1.east>, "-|>", [`0/odd`], bend: -152deg, label-side: center)
      edge(<s1.south>, <s0.south>, "-|>", [`1/even`], bend: 30deg, label-side: center)
    },
  )
]


- Если уже прочитанная последовательность содержит *_четное_*
  количество символов `1`, на выход пишется `even`.
- Если уже прочитанная последовательность содержит *_нечетное_*
  количество символов `1`, на выход пишется `even`.

== Реализация без `goto`

```julia
function dfa_parity(xs)
    ys = ()
    state = :s0
    for x in xs
        if state == :s0
            x == 0 && (ys = (ys..., :even); state = :s0; continue)
            x == 1 && (ys = (ys..., :odd); state = :s1; continue)
            error("Unexpected input: ", x)
        elseif state == :s1
            x == 0 && (ys = (ys..., :odd); state = :s1; continue)
            x == 1 && (ys = (ys..., :even); state = :s0; continue)
            error("Unexpected input: ", x)
        end
    end
    return ys
end
```

Проверяем:

```julia
dfa_parity((0, 1, 0, 1, 0))
```

```julia-output
(:even, :odd, :odd, :even, :even)
```

Очевидная неэффективность - манипуляции с переменной `state`!

== Реализация с `@label` и `@goto`

```julia
function dfa_parity_goto(xs)
    ys = ()
    xs_it = iterate(xs)
    @goto s0

    @label s0
    xs_it !== nothing || return ys
    x, xs_state = xs_it
    xs_it = iterate(xs, xs_state)
    x == 0 && (ys = (ys..., :even); @goto s0)
    x == 1 && (ys = (ys..., :odd); @goto s1)
    error("Unexpected input: ", x)

    @label s1
    xs_it !== nothing || return ys
    x, xs_state = xs_it
    xs_it = iterate(xs, xs_state)
    x == 0 && (ys = (ys..., :odd); @goto s1)
    x == 1 && (ys = (ys..., :even); @goto s0)
    error("Unexpected input: ", x)
end
```

== Реализация с `@label` и `@goto` (замечания)

- В случае ручного программирования, использование `@label` и `@goto` --
  дурной стиль и источник ошибок.
- Если программа генерируется автоматически, хороший стиль не так важен,
  ибо:
  - Эту программу (почти) никто читать не будет.
  - Описки не возникают, поскольку программа не пишется вручную.
- Можно заменить `goto` на хвостовую рекурсию. В этом случае:
  - Каждому состоянию автомата соответствует отдельная функция.
  - Однако, если реализация языка не умеет эффективно реализовывать
    хвостовую рекурсию, то получится переполнение стека.
  - Но даже если хвостовая рекурсия реализована хорошо, всё равно
    получается "стрельба из пушки по воробьям". И в конце -- всё равно
    появляются `goto`.

= Интерпретатор конечных автоматов

== Кодирование автомата таблицей

Будем кодировать конечный автомат в виде таблицы.

```julia
parity_table =
    (:s0, (
        (0, :s0, :even),
        (1, :s1, :odd))),
    (:s1, (
        (0, :s1, :odd),
        (1, :s0, :even)))
```

- Состояния обозначаются символами (в смысле Джулии).
- На верхнем уровне перечислены возможные состояния.
- Для каждого состояния перечислены возможные входные символы.
- Для каждого входного символа указано:
  - в какое состояние нужно перейти и
  - какой символ послать на выход.

== Генерация автомата из таблицы

```julia
function dfa_gen_impl(tbl, start)
    body = Expr[]

    for (s, r) in tbl
        push!(body, quote
            @label $s
            xs_it !== nothing || return ys
            (x, xs_state) = xs_it; xs_it = iterate(xs, xs_state)
        end)

        for (x0, g, w) in r
            push!(body, :(
                x == $x0 && (ys = (ys..., $(Meta.quot(w))); @goto $g)))
        end
        push!(body, :(error("Unexpected input: ", x)))
    end

    quote
        ys = (); xs_it = iterate(xs)
        @goto $start
        $(body...)
    end
end
```

== Результат генерации программы из таблицы

```julia
dfa_gen_impl(parity_table, :s0) |> cleanup
```

#grid(
  columns: 2,
  gutter: 1em,
  align: center,
  show-jl-output(
    font-size: 0.7em,
    ```
    quote
        ys = ()
        xs_it = iterate(xs)
        @goto s0
        @label s0
        xs_it !== nothing || return ys
        (x, xs_state) = xs_it
        xs_it = iterate(xs, xs_state)
        x == 0 && begin
                ys = (ys..., :even)
                @goto s0
            end
        x == 1 && begin
                ys = (ys..., :odd)
                @goto s1
            end
        error("Unexpected input: ", x)
    end
    ```,
  ),
  show-jl-output(
    font-size: 0.6em,
    ```
        @label s1
        xs_it !== nothing || return ys
        (x, xs_state) = xs_it
        xs_it = iterate(xs, xs_state)
        x == 0 && begin
                ys = (ys..., :odd)
                @goto s1
            end
        x == 1 && begin
                ys = (ys..., :even)
                @goto s0
            end
        error("Unexpected input: ", x)
    end
    ```,
  ),
)

// (#emoji.arrow.t.filled Не забываем прокрутить.)

Получилась такая же (с точностью до форматирования) программа, как и та,
что ранее была написана вручную.

== Обёртываем генератор в `@generated function`

```julia
@generated function dfa_gen(::Val{tbl}, ::Val{start}, xs) where {tbl,start}
    dfa_gen_impl(tbl, start)
end
```

- Параметр `xs` используется в `dfa_gen_impl` только "символически",
  внутри "кавычек", а его тип - не используется. Поэтому, `xs` не
  передаётся в `dfa_gen_impl` в качестве параметра.

Проверяем:

```julia
dfa_gen(Val(parity_table), Val(:s0), (0, 1, 0, 1, 0))
```

```julia-output
(:even, :odd, :odd, :even, :even)
```

= Попытка использовать пакет `CompTime`

== Добавление аннотаций к `dfa_gen`

Переписываем `dfa_gen`, вставляя `@ct...`.

```julia
@ct_enable function dfa_gen_ct(@ct(tbl), @ct(start), xs)
    ys = ()
    xs_it = iterate(xs)
    @goto @ct(start)

    @ct_ctrl for (s, r) in tbl
        @label @ct(s)
        xs_it !== nothing || return ys
        (x, xs_state) = xs_it
        xs_it = iterate(xs, xs_state)
        @ct_ctrl for (x0, g, w) in r
            x == @ct(x0) && (ys = (ys..., @ct(w)); @goto @ct(g))
        end
        error("Unexpected input: ", x)
    end
end
```

- `@label @ct( )` и `@goto @ct( )` не работают как надо!
- Не получается превращать состояния в метки: `:s0` в `s0`.

== Почему не получилось использовать `CompTime`

Видимо, есть принципиальные затруднения.

- Идея `CompTime` (и, вообще, стадированного программирования) состоит в
  том, что программу можно использовать двумя способами: напрямую (без
  генерации) и в две стадии (генерация и исполнение сгенерированной
  программы).
- После стирания аннотаций должна получаться "обыкновенная" программы,
  которую можно исполнить "обыкновенным" способом.
- В случае `dfa_gen_ct`, стерев аннотации `@ct...`, мы не получаем
  корректную программу! В `@label l` и `@goto l`, метка `l` должна быть
  константой, которая известна статически. Но, после стирания аннотаций,
  получаются конструкции `@label s` и `@goto ns`, в которых `s` и `ns`
  -- не константы, а переменные.

= Мудрые умозаключения

#align(left)[
  - Если писать генераторы вручную, то можно делать кое-какие вещи,
    который не получаются с помощью частичных вычислений или стадирования.
  - Нужно подумать, может ли помочь в таких случаях суперкомпиляция.
    (Может быть - и нет...)
]
