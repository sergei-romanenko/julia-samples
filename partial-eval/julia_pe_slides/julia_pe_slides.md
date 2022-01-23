---
marp: true
theme: custom
size: 4:3
paginate: true

title: Специализация программ в недрах реализации языка Julia
author: Сергей Романенко
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Специализация программ в недрах реализации языка Julia

<br/>

## С.А.Романенко

ИПМ им. М.В. Келдыша РАН, Москва<br/>
23 января 2022

---

<!-- _class: lead -->

## Двуязычие - основа процветания<br/> :tongue: :tongue:

<br/><br/><br/>

---

## Примеры симбиоза двух языков

- Refal + (Fortran | PL/I | C++)
- Python + C++

**Почему?**

- "Нижний" язык (Fortran, PL/I, C++) - для реализации операций нижнего
  уровня (простых, но требующих много вычислений).
- "Верхний" язык (Refal, Python) - для соединения вместе операций
  нижнего уровня, чтобы быстро получить нечто работающее.

---

## "Нижний" и "верхний" - для кого?

- **Нижний** - для профессиональных программистов. "Результат" -
  программа.
  - Ошибки делать легко, но трудно их обнаруживать.
  - Статическая типизация (для пресечения).

- **Верхний** - для специалистов в "прикладных" областях
  (биоинформатика, анализ данных). "Результат" - не программа, а
  **результат работы** программы.
  - Ошибки делать легко, но легко их обнаруживать.
  - Динамическая типизация (для вылавливания).
  
---

## Симбиоз в случае Рефала

- Климов Анд.В. , Романенко С.А. **РЕФАЛ в мониторной системе “Дубна”
  БЭСМ-6. Интерфейс РЕФАЛа и ФОРТРАНа.** - М.:ИПМ АН СССР, 1975. - 86 с.

- С.А.Романенко. **Система программирования Рефал-2 для ЕС ЭВМ.
  Интерфейс Рефала и PL/I.** - М.:ИПМ им.М.В.Келдыша АН СССР, 1987. - 79
  с.

Реализации Рефала нашли практическое применение благодаря тому, что не
были "вещью в себе", а использовались в сочетании с языками "нижнего
уровня". (Впоследствии по такому же пути пошёл и Python.)

---

<!-- _class: lead -->

## Julia - гармоническое соединение низменного и возвышенного!

## :sandal: :waning_crescent_moon: &nbsp; + &nbsp; :high_heel: :high_brightness:

<br/><br/>

**The Julia Programming Language**<br/>
<https://julialang.org/>

---

## Цели (и достижения) проекта Julia

- "Нижний" и "верхний" язык соединяются вместе.
  - "Программист" может достигать эффективности такой же, как в случае
    C++.
  - "Прикладник" может "творить" быстро и небрежно, не боясь "волчьих
    ям" и "ловушек", так же, как при использовании Python.
  - Можно пользоваться благами как статической, так и динамической
  типизации.
- Julia - это не только язык, но и "экосистема", обеспечивающая
  сотрудничество между людьми (легко делиться плодами труда с другими).

---

## "Нужно делиться". А как?

В экосистеме Julia, сотрудничество и обмен плодами труда основаны на
следующих принципах.

- Программисты работают с **понятиями**. А плодами их труда являются
  **определения** понятий, **реализации** понятий и **соединение**
  понятий друг с другом.
- Желательно определять понятия в **абстрактном** виде. Чем абстрактнее
  определишь - тем шире будет область применения.
- При применении понятий в конкретной ситуации (= при
  соединении понятий вместе), необходима
  **конкретизация** (= **специализация**) понятий.

---

## Конкретизация понятий = специализация программ

- Определяем понятие в абстрактном виде, не указывая типы (или указывая
  очень абстрактные типы).
- Используем понятие в конкретной ситуации. При этом возникают типы (или
  же абстрактные типы заменяются на более конкретные).

**Вывод:** чтобы программа работала эффективно, система программирования
должна реализовывать **специализацию** программ **по отношению к
типам**.

**Замечание.** В Julia типы являются такими же значениями, как, скажем,
числа. Какой вывод?

---

## Ссылки (Julia) 1

- Tim Besard, Valentin Churavy, Alan Edelman, Bjorn De Sutter. **Rapid
  software prototyping for heterogeneous and distributed platforms.**
  Advances in Engineering Software, Volume 132, 2019, Pages 29-46, ISSN
  0965-9978.  
  <https://doi.org/10.1016/j.advengsoft.2019.02.002>

- Martin Biel, Arda Aytekin, Mikael Johansson. **POLO.Jl: Policy-based
  optimization algorithms in Julia.** Advances in Engineering Software,
  Volume 136, 2019, 102695, ISSN 0965-9978.  
  <https://doi.org/10.1016/j.advengsoft.2019.102695>

---

## Ссылки (Julia) 2

- Tim Besard, Christophe Foket, Bjorn De Sutter. **Effective Extensible
  Programming: Unleashing Julia on GPUs.** In _IEEE Transactions on
  Parallel and Distributed Systems_, vol. 30, no. 4, pp. 827-841, 1
  April 2019.  
<https://doi.org/10.1109/TPDS.2018.2872064>

---

<!-- _class: lead -->

## Типизация в Julia:<br/>статическая или динамическая?

### (compile time) :construction_worker::construction: &nbsp; ⟺ &nbsp; (run time):runner::horse_racing:

<br/>

### Подсказка: для Julia<br/> compile & run - "в одном флаконе"...

<br/>

---

## Определения функций

Маленькие функции можно определять так:

```julia
sq(x) = x * x
```

А большие - так:

```julia
function sq(x)
  x * x
end
```

Или так:

```julia
function sq(x)
  return x * x
end
```

---

## Вызов для аргументов разных типов

```julia
sq(3)
```

⟹ `9`

```julia
sq("abc")
```

⟹ `"abcabc"`

- Операция `*` работает по-разному для чисел и строк.
- Обычно, у математиков, операция `+` - **коммутативна и ассоциативна**,
  а `*` - только ассоциативна.
- Конкатенация строк - **не коммутативна**, поэтому в Julia она
  обозначена через `*`.

---

## Под конкретные типы - конкретный код!

При вызове под конкретные типы аргументов генерируется (и запоминается)
отдельная версия кода.

```julia
@code_typed sq(3)
⟹
CodeInfo(
1 ─ %1 = Base.mul_int(x, x)::Int64
└──      return %1
) ⇒ Int64
```

```julia
@code_typed sq("abc")
⟹
CodeInfo(
1 ─ %1 = invoke Base.string(_2::String, _2::String)::String
└──      return %1
) ⇒ String
```

---

## Полиморфное возведение в степень

```julia
function pw(n, x)
  if iszero(n)
    one(x)
  else
    x * pw(n-1, x)
  end
end
```

Работает для любого **моноида**. Иначе говоря, `x` должен принадлежать к
такому типу, в котором определены понятия "единицы" и "умножения".

```julia
pw(4, 2) ⟹ 16
pw(4, "Ab") ⟹ "AbAbAbAb"
```

---

## Тип результата зависит от аргумента

```julia
one("a") ⟹ ""
one(25) ⟹ 1
one(25.0) ⟹ 1.0

2 * 3 ⟹ 6
"Aa" * "Bb" ⟹ "AaBb"

typeof(10) ⟹ Int64
typeof("a") ⟹ String

```

- **Вопрос:** как определять функции/операции вроде `one` и `*`?

- **Ответ:** нужно иметь возможность работать с типами во время
  исполнения программы.

---

## Проверка типов во время исполнения

```julia
function type_to_str(x)
  t = typeof(x)
  if t === Int64
    "Int64"
  elseif t === String
    "String"
  else
    "Unknown"
  end
end
```

```julia
type_to_str(3) ⟹ "Int64"
type_to_str("a") ⟹ "String"
type_to_str(3.14) ⟹ "Unknown"
```

Но есть и более идиоматичный способ записать то же самое!

---

## Определение функций через несколько "методов"

```julia
type_to_str2(x::Int64) = "Int64"
type_to_str2(x::String) = "String"
type_to_str2(x) = "Unknown"
```

`type_to_str2` - это "функция", определённая 3-мя методами.

На что это похоже? На **Рефал**! Однако, определения методов можно писать
**в любом порядке**!

```julia
type_to_str2(x) = "Unknown"
type_to_str2(x::Int64) = "Int64"
type_to_str2(x::String) = "String"
```

---

## Жизнь методов внутри экосистемы Julia

- Разбор случаев идёт не по **значениям** аргументов, а по **типам**
  аргументов.
- Выбор метода при вызове функции может происходить как во время
  исполнения (~ **виртуальные** методы в C++), так и во время компиляции
  (~ **перегрузка** методов в C++)!
- Методы можно определять в **любом порядке**. (Компилятор вылавливает
  двусмысленности.)
- Можно добавлять новые методы к существующим функциям. Поэтому можно
  расширять области определения функций, **не модифицируя ранее написанный
  код**.

---

<!-- _class: lead -->

## Множественная диспетчеризация<br/>(multiple dispatch)<br/>:email: ⟹ :inbox_tray::inbox_tray::inbox_tray::inbox_tray::inbox_tray:

### Выбор метода -<br/> на основе типов **_всех_** аргументов!

<br/>

---

## Как определять новые типы?

```julia
abstract type Pet end
struct Dog <: Pet; name::String end
struct Cat <: Pet; name::String end
```

- Типы делятся на **абстрактные** и **конкретные**.
- Значения абстрактных типов создавать нельзя (и они не содержат данных).
- Значения конкретных данных создавать можно (и они могут содержать данные).
  - `rex = Dog("Rex")`
- Для абстрактных типов **можно** определять **подтипы**.
- Для конкретных типов **нельзя** определять **подтипы**.

---

## Абстрактная "встреча зверей"

Создаём зоопарк:

```Julia
rex = Dog("Rex")
fido = Dog("Fido")
kitty = Cat("Kitty")
simba = Cat("Simba")
```

Определяем понятие "встречи" для зверей:

```julia
function encounter(a::Pet, b::Pet)
  verb = meets(a, b)
  "$(a.name) meets $(b.name) and $verb"
end
```

Теперь нужно определить действие, которое совершается при встрече зверей
разных типов.

---

## Применение мульти-диспетчеризации

```julia
meets(a::Dog, b::Dog) = "sniffs"
meets(a::Dog, b::Cat) = "chases"
meets(a::Cat, b::Dog) = "hisses"
meets(a::Cat, b::Cat) = "slinks"
```

Теперь можно вызывать `encounter`

```julia
encounter(rex, fido) ⟹ "Rex meets Fido and sniffs"
encounter(rex, kitty) ⟹ "Rex meets Kitty and chases"
encounter(kitty, rex) ⟹ "Kitty meets Rex and hisses"
encounter(kitty, simba) ⟹ "Kitty meets Simba and slinks"
```

---

## Особенности системы типов в Julia

Отличия от C++, Java, Python, ...

- Наследуются **не данные**, а **поведение/операции**.
- Мульти-диспетчеризация - это синтез понятий "перегрузка" и
  "виртуальный метод".
- Выбор метода делается не по первому аргументу, а по всем аргументам.
- Выбор метода может происходить как статически (при компиляции), так и
  динамически (при исполнении).

---

<!-- _class: lead -->

## Вычисления с типами<br/>:computer: :question: ⟹ :fire::exclamation:

<br/><br/><br/>

---

## Числа Пеано

```julia
abstract type Peano end
struct Zero <: Peano end
struct Succ{T <: Peano} <: Peano
  prev::T
end
```

```julia
typeof(Peano) ⟹ DataType
p0 = Zero()
p1 = Succ(p0)
p2 = Succ(p1)
p3 = Succ(p2)
```

```julia
p1 ⟹ Succ{Zero}(Zero())
p1.prev ⟹ Zero()
Succ(Zero()) == p1 ⟹ true
```

---

## Сложение чисел Пеано

```julia
add(x::Zero, y::Peano) = y
add(x::Succ, y::Peano) = Succ(add(x.prev, y))
```

```julia
add(p2, p3) ⟹ Succ(Succ(Succ(Succ(Succ(Zero())))))
```

Здесь вычисления выполняются во время компиляции.

> Строго говоря`add` выполняет вычисления над **значениям**. Однако, у
> значений типа `Peano`, информация содержится в тегах (типах), а данные
> \- ничего не содержат.

А что, если смешать вычисления над типами с вычислениями над
"нормальными" значениями?

---

## Возведение в степень

```julia
pw(n::Zero, x) = one(x)
pw(n::Succ, x) = x * pw(n.prev, x)
```

```julia
pw(p2, 2.0) ⟹ 4.0
```

```julia
@code_typed pw(p2, 2.0) ⟹

CodeInfo(
1 ─ %1 = Base.mul_float(x, 1.0)::Float64
│   %2 = Base.mul_float(x, %1)::Float64
└──      return %2
) ⇒ Float64
```

Компилятор **(1)** сгенерировал три версии метода `pw` и **(2)** раскрыл
вызовы этих методов.

---

<!-- _class: lead -->

## Превращение констант в типы: `Val(99)`<br/> :fearful::scream::exclamation:

<br/><br/><br/>

---

## Отображение констант в типы

```julia
Val(99) ⟹ Val{99}()
typeof(Val(99)) ⟹ Val{99}
Val((1, 2, (3, 4))) ⟹ Val{(1, 2, (3, 4))}()
```

Тип `Val{c}` населён единственным значением `Val{c}()`, которое
порождается конструктором `Val(c)`.

Это значение можно "выковырнуть" из типа!

```julia
get_val(::Val{n}) where {n} = n
```

```julia
get_val(Val(99)) ⟹ 99
get_val(Val((1,2,(3,4)))) ⟹ (1,2,(3,4))
get_val(Val((:L,:D))) ⟹ (:L,:D)
```

---

## Определение возведения в степень с помощью `Val`

```julia
pw(::Val{0}, x) = one(x)
pw(::Val{n}, x) where {n} = x * pw(Val(n-1), x)
```

(Если интересен только тип параметра, но не его значение, то имя
параметра можно опускать.)

```julia
pw(Val(3), "a") ⟹ "aaa"
pw(Val(3), 2) ⟹ 8
```

Использование `Val` в реализации можно скрыть от конечного пользователя:

```julia
pw(n::Int64, x) = pw(Val(n), x)
```

---

## Специализация `pw` по первому аргументу

```julia
@code_typed pw(Val(5), 10)
⟹
CodeInfo(
1 ─ %1 = Base.mul_int(x, 1)::Int64
│   %2 = Base.mul_int(x, %1)::Int64
│   %3 = Base.mul_int(x, %2)::Int64
│   %4 = Base.mul_int(x, %3)::Int64
│   %5 = Base.mul_int(x, %4)::Int64
└──      return %5
) ⇒ Int64
```

Компилятор сгенерировал отдельную реализацию метода для каждого типа
`Val{n}` и раскрыл вызовы этих методов.

> Сделал ровно то, что сделал бы классический частичный вычислитель!

---

<!-- _class: lead -->

## Остаточная программа с динамическими проверками условий<br/> :nose::question:

<br/><br/><br/>

---

## Проверка принадлежности к списку

```julia
function one_of(::Val{s}, ::Val{k}, x) where {s, k}
  if k == 0
    false
  elseif s[length(s) - k + 1] == x
    true
  else
    one_of(Val(s), Val(k-1), x)
  end
end

one_of(s::NTuple, x) = one_of(Val(s), Val(length(s)), x)
```

```julia
one_of((:A, :B, :C), :B) ⟹ true
one_of((:A, :B, :C), :Q) ⟹ false
```

**Тонкость:** параметр `Val(k)` сделан **убывающим**! Зачем?

---

## Остаточная программа для `one_of`

```julia
@code_typed one_of(Val((:A, :B)), Val(2), :D)
⟹
CodeInfo(
1 ─       goto #3 if not false
2 ─       nothing::Nothing
3 ┄ %3  = (:A === x)::Bool
└──       goto #5 if not %3
4 ─       return true
5 ─ %6  = (:B === x)::Bool
└──       goto #7 if not %6
6 ─       goto #8
7 ─       goto #8
8 ┄ %10 = φ (#6 => true, #7 => false)::Bool
└──       return %10
) ⇒ Bool
```

Классические частичные вычисления!

---

<!-- _class: lead -->

## Специализация высшего порядка

### :star2::sparkle: (по функциям) :sparkle::star2:

<br/><br/>

---

## Типы функций

```julia
mul2(x) = x * 2
mul3(x) = x * 3

typeof(mul2) ⟹ typeof(mul2)
supertype(typeof(mul2)) ⟹ Function
typeof(mul2) <: Function ⟹ true

typeof(mul2) === typeof(mul3) ⟹ false
```

- Типы всех функций являются подтипами `Function`.
- Каждая функция имеет **уникальный** тип.

> **Вывод:** специализация по типам функций и специализация по функциям
> \- это **одно и то же**.

---

## Специализация по функциям

```julia
const mul6 = mul3 ∘ mul2
typeof(mul6) ⟹
    ComposedFunction{typeof(mul3), typeof(mul2)}
mul6(10) ⟹ 60
```
```julia
@code_llvm mul6(10) ⟹
define i64
  @julia_ComposedFunction_1834(i64 signext %0) {
top:
    %1 = mul i64 %0, 6
  ret i64 %1
}
```

Получилась функция, которая умножает аргумент на 6.

<!--
---


## Пакет `StaticNumbers`

<br/>

### static(99)

<br/><br/>

-->

<!--
---

## `static(x)` - помечает, что желательно,<br/> чтобы результат был статическим

```julia
using StaticNumbers

d = 2
s = static(2)
```

Макрос @stat делает результат вычисления статическим, если в нём
участвуют константы и/или переменные со статическими значениями.

```julia
s + s ⟹ 4
@stat s + s ⟹ static(4)
@stat s + 2 ⟹ static(4)
@stat s + d ⟹ 4
```

-->

<!--
---

```julia
Tuple(i^2 for i in static(1):static(4))
  ⟹ (1, 4, 9, 16)
```

```julia
@code_typed Tuple(i^2 for i in static(1):static(4))
  ⟹
CodeInfo(
1 ─     invoke Base.power_by_squaring(
          static(1)::StaticInteger{1}, 2::Int64)::Int64
└──     return (1, 4, 9, 16)
) => NTuple{4, Int64}
```

---

```julia
@code_typed Tuple(i^2 for i in 1:4)
  ⟹
CodeInfo(
1 ─ %1 = invoke Base.collect(_2::Base.Generator{UnitRange{Int64}, var"#5#6"})::Vector{Int64}
│   %2 = Core._apply_iterate(Base.iterate, Core.tuple, %1)::Tuple{Vararg{Int64, N} where N}
└──      return %2
) => Tuple{Vararg{Int64, N} where N}
```
-->

<!--
---

## Снова - функция возведения в степень

```julia
pw_s(n, x) =
  iszero(n) ? one(x) : x * pw_s(static(n-1), x)

pw_s(3, 10)
  ⟹ 1000
```

``` julia
@code_typed pw_s(static(3), 10)
  ⟹
CodeInfo(
1 ─      goto #3 if not false
2 ─      nothing::Nothing
3 ┄ %3 = Base.mul_int(x, 1)::Int64
│   %4 = Base.mul_int(x, %3)::Int64
│   %5 = Base.mul_int(x, %4)::Int64
└──      return %5
) => Int64
```

---

## Снова - функция Аккермана

```julia
function A(m,n)
    if iszero(m)
        n + one(n)
    elseif iszero(n)
        A(@stat(m - one(m)), one(n))
    else
        A(@stat(m - one(m)), A(m, n - one(n)))
    end
end
```

Когда следует использовать `static`, а когда - `@stat`? Из описания
пакета `StaticNumbers` это не совсем понятно.

(Ясно, что `static` "обёртывает" число, а `@stat` - анализирует
выражение. Но почему бы тогда не использовать `@stat` везде?.)

---

## Ускорение при специализации

```julia
using BenchmarkTools

@btime A(4, 1)
  13.930 s (0 allocations: 0 bytes)
65533

@btime A(static(4), 1)
  2.035 s (0 allocations: 0 bytes)
65533
```

-->

---

<!-- _class: lead -->

## **_Две_** интерпретации **_одной_** программы

## :tv: :point_up::question: ⟹ :zap::zap::v:

<br/><br/><br/>

---

## Текст - один, а интерпретаций - много!

- Идея "метавычислений" состоит в том, что **одну и ту же** программу
  можно "исполнять" **разными** способами. При этом программе
  приписываются **разные семантики**.
- В процессе обычного исполнения, программа работает с обычными значениями.
- В процессе метавычислений программа работает с "мета-значениями".

**Вопрос.** Можно ли в системе Julia приписывать разные семантики одной
и той же программе?

**Ответ.** Да!

---

## Снова - возведение в степень

```julia
function pw(n, x)
  if iszero(n)
    one(x)
  else
    x * pw(n-1, x)
  end
end
```

```julia
pw(3, "Abc") ⟹ "AbcAbcAbc"

pw(Val(3), 10) ⟹
  MethodError: no method matching zero(::Val{3})
```

Однако, можно, **не меняя текст программы**, **доопределить** операции
над данными, чтобы они работали с метаданными!

---

## Доопределения операций

```julia
import Base: -

Base.iszero(::Val{n}) where {n} = iszero(n)

Base.one(::Val{n}) where {n} = one(n)

-(::Val{m}, n) where {m} = Val(m - n)
```

```julia
iszero(Val(3)) ⟹ false
one(Val(3)) ⟹ 1
Val(3) - 2 ⟹ Val{1}()
Val(3) - one(Val(3)) ⟹ Val{2}()
```

Доопределение можно делать инкрементно. Запускаем программу - а она
"падает" (и сообщает, для каких аргументов не определена операция)...

---

## Результат специализации `pw`

```julia
pw(Val(3), 10) ⟹ 1000
```

```julia
@code_typed pw(Val(3), 10)
⟹
CodeInfo(
1 ─      goto #3 if not false
2 ─      nothing::Nothing
3 ┄ %3 = Base.mul_int(x, 1)::Int64
│   %4 = Base.mul_int(x, %3)::Int64
│   %5 = Base.mul_int(x, %4)::Int64
└──      return %5
) => Int64
```

Проспециализировали `pw` по первому аргументу, **не меняя текст
программы**!

---

## Функция Аккермана

```julia
function ackermann(m, n)
  if iszero(m)
    n + one(n)
  elseif iszero(n)
    ackermann((m - one(m)), one(n))
  else
    ackermann((m - one(m)), ackermann(m, n - one(n)))
  end
end
```

Операции `iszero`, `one` и `-` были доопределены для мета-значений,
поэтому `ackermann` можно вызывать так:

```julia
ackermann(3, 2) ⟹ 29
ackermann(Val(3), 2) ⟹ 29
```

---

## Специализация даёт ускорение!

```julia
using BenchmarkTools

@btime ackermann(4, 1)
  13.752 s (0 allocations: 0 bytes)
65533

@btime ackermann(Val(4), 1)
  2.060 s (0 allocations: 0 bytes)
65533
```

---

<!-- _class: lead -->

## Выводы<br/> :star2::star2::star2:

<br/><br/><br/>

---

## Выводы

- В недрах экосистемы Julia реализована специализа&shy;ция программ (о
  которой пользователь может и не догадываться).
- Специализация методов происходит **по типам аргументов**.
- Константы можно превращать в типы (и наоборот). Поэтому, возможна и
  специализация **по значениям аргументов**.
- При определённых условиях происходит **раскрытие вызовов** функций.
- Можно специализировать функции, **не меняя их определения**.
