---
marp: true
theme: custom
size: 4:3
paginate: true

title: Специализация программ в недрах экосистемы Julia
author: Сергей Романенко
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Специализация программ в недрах экосистемы Julia

<br/>

## С.А.Романенко

ИПМ им. М.В. Келдыша РАН, Москва<br/>
28 ноября 2022

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

- Benjamin Biggs, Ian McInerney, Eric C. Kerrigan, George A.
  Constantinides. **High-level Synthesis using the Julia Language.**
  Presented at the 2nd Workshop on Languages, Tools, and Techniques for
  Accelerator Design (LATTE'22), March 1, 2022.  
  <https://arxiv.org/abs/2201.11522>

---

## Ссылки (Julia) 3

- Luo, Xiu-Zhe & Jinguo, Liu & Zhang, Pan & Wang, Lei. (2020). **Yao.jl:
  Extensible, Efficient Framework for Quantum Algorithm Design.**
  Quantum. 4\. 341\. 10.22331/q-2020-10-11-341.  
  <https://quantum-journal.org/papers/q-2020-10-11-341/>
  <https://arxiv.org/abs/1912.10877>

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
    x * pw(n - 1, x)
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

## Абстрактные и конкретные типы

```julia
abstract type Entity end
abstract type Creature <: Entity end
struct God <: Entity end

struct Human <: Creature
    name::String
end

struct Dog <: Creature
    name::String
end
```

- Абстрактные типы не содержат данных, но могут иметь подтипы.
- Конкретные struct-типы могут содержать данные, но не могут иметь
  подтипы.

---

## Создание struct-значений

```julia
god = God()
john = Human("John")
rex = Dog("Rex")
```

- Можно определять дополнительные конструкторы.

```Julia
Human() = Human("Ivan")
```

```julia
ivan = Human()
```

---

## Функции и методы

- Функция может иметь несколько _**методов**_.
- Методы различаются по _**числу**_ аргументов и по _**типам**_
  аргументов.
- Более _**частные**_ методы имеют приоритет над более _**общими**_, а
  определяются \- _**в любом порядке**_.

```julia
get_name(e) = error("a $(typeof(e)) is nameless")
get_name(::God) = "God"
get_name(x::Creature) = x.name
```

```julia
get_name(god)  ⟹ "God"
get_name(john) ⟹ "John"
get_name(rex)  ⟹ "Rex"
```

---

## Множественная диспетчеризация

```julia
eats(e1, e2) =
  error("`eats` undefined for $(typeof(e1)) and $(typeof(e2)))")
eats(e1::Entity, e2::Entity) = false
eats(::Human, ::Dog) = true
```

```julia
eats("Aa", 100) ⟹
  error("`eats` undefined for String and Int64")
eats(john, god) ⟹ false
eats(john, rex) ⟹ true
```

---

<!-- _class: lead -->

## Модули, импорт<br/>и<br/>доопределение функций<br/> :arrow_double_up: :arrow_double_down: :white_check_mark:

---

## Модули, импорт и доопределение (1)

```julia
module Heavens

export Entity, Creature, get_name, eats

abstract type Entity end
abstract type Creature <: Entity end
...
```

```julia
module Earth

using Heavens
import Heavens: get_name, eats

struct Devil <: Creature end
get_name(::Devil) = "Lucifer"
```

---

## Модули, импорт и доопределение (2)

- `using` даёт возможность _**использовать**_ типы и методы из другого
  модуля.
- `import` даёт возможность _**добавлять**_ новые методы к функции,
  принадлежащей к другому модулю. (Не модифицируя исходный текст другого
  модуля.)
- Возможность добавлять методы основана на том, что _**порядок**_, в
  котором определяются методы - _**несуществен**_! При этом, более
  _**частные**_ методы имеют _**приоритет**_ над более общими.
- Типичный способ расширения функции: добавляем новый _**подтип**_ к
  абстрактному типу и добавляем новые _**методы**_ для обработки этого
  подтипа.

---

## Итог: особенности системы типов в Julia

Отличия от C++, Java, Python, ...

- Наследуются **не данные**, а **поведение/операции**.
- Мульти-диспетчеризация - это синтез понятий "перегрузка" и
  "виртуальный метод".
- Выбор метода делается не по первому аргументу, а по всем аргументам.
- Выбор метода может происходить как статически (при компиляции), так и
  динамически (при исполнении).

---

<!-- _class: lead -->

## Множественные реализации интерфейсов<br/>:grimacing::grimacing::grimacing:

<br/><br/><br/>

---

## Пример: тип - один, моноидов - много

```julia
abstract type Monoid{T} end

m_one(::Monoid{T}, x::T) where {T} = one(x)

m_mult(::Monoid{T}, x::T, y::T) where {T} = x * y

function pw(m::Monoid{T}, n::Int, x::T)::T where {T}
    if n <= 0
        m_one(m, x)
    else
        m_mult(m, x, pw(m, n - 1, x))
    end
end
```

---

## Разные моноиды для разных типов

```julia
struct StringMonoid <: Monoid{String} end

struct IntMultMonoid <: Monoid{Int} end

struct IntAddMonoid <: Monoid{Int} end

m_one(::IntAddMonoid, x::Int) = 0
m_mult(::IntAddMonoid, x::Int, y::Int) = x + y
```

Теперь для одного типа можно определить несколько моноидов.

```julia
pw(StringMonoid(),  3, "Ab") ⇒ "AbAbAb"
pw(IntMultMonoid(), 3, 2)     ⇒ 8
pw(IntAddMonoid(),  3, 2)     ⇒ 6
```

---

<!-- _class: lead -->

## Превращение констант в типы: `Val(99)`<br/> :fearful::scream::exclamation:

<br/><br/><br/>

---

## Обёртывание констант в типы

Тип `Val` определён в стандартной библиотеке:

```julia
struct Val{x} end

Val(x) = Val{x}()
```

Тип `Val{c}` населён единственным значением `Val{c}()`, которое
порождается конструктором `Val(c)`.

Хитрость состоит в том, что параметр `x` **не обязан быть типом**! И
может быть "обычной" константой!

```julia
Val(99) ⟹ Val{99}()
typeof(Val(99)) ⟹ Val{99}
Val((1, 2, (3, 4))) ⟹ Val{(1, 2, (3, 4))}()
```

---

## Извлечение констант из типов

Значение можно "выковырнуть" из типа!

```julia
get_val(::Val{n}) where {n} = n
```

```julia
get_val(Val(99)) ⟹ 99
get_val(Val((1,2,(3,4)))) ⟹ (1,2,(3,4))
get_val(Val((:L,:D))) ⟹ (:L,:D)
```

**Ограничение.**

Параметр в `Val` должен быть "константой", т.е. представим в виде
комбинации битов известной длины.

Строка `"L"` - не годится, а символ `:L` - годится.

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

## Специализация `pw` ещё и по моноиду

```julia
function pw(m::Monoid{T}, ::Val{n}, x::T)::T where {T, n}
    if n <= 0
        m_one(m, x)
    else
        m_mult(m, x, pw(m, Val(n - 1), x))
    end
end
```

```julia
@code_typed pw(IntAddMonoid(), Val(3), 2)
⟹
CodeInfo(
1 ─      nothing::Nothing
│   %2 = Base.add_int(x, 0)::Int64
│   %3 = Base.add_int(x, %2)::Int64
│   %4 = Base.add_int(x, %3)::Int64
└──      return %4
) => Int64
```

---

<!-- _class: lead -->

## Остаточная программа с динамическими проверками условий<br/> :nose::question:

<br/><br/><br/>

---

## Проверка принадлежности к списку

```julia
one_of(x, s::NTuple{N, T}) where {N, T} =
    one_of(x, Val(s), Val(N))

function one_of(x, ::Val{s}, ::Val{k}) where {s, k}
  if k == 0
    false
  elseif s[k] == x
    true
  else
    one_of(x, Val(s), Val(k-1))
  end
end
```

```julia
one_of(300, (100, 200, 300)) ⟹ true
one_of(400, (100, 200, 300)) ⟹ false
```

**Тонкость:** параметр `Val(k)` сделан **убывающим**! Зачем?

---

## Остаточная программа для `one_of`

```julia
@code_typed one_of(300, Val((100, 200)), Val(2))
⟹
CodeInfo(
1 ─      nothing::Nothing
│   %2 = (200 === x)::Bool
└──      goto #3 if not %2
2 ─      return true
3 ─ %5 = (100 === x)::Bool
└──      goto #5 if not %5
4 ─      goto #6
5 ─      goto #6
6 ┄ %9 = φ (#4 => true, #5 => false)::Bool
└──      return %9
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
@code_typed mul6(10) ⟹
CodeInfo(
1 ─ %1 = Core.getfield(x, 1)::Int64
│   %2 = Base.mul_int(%1, 2)::Int64
│   %3 = Base.mul_int(%2, 3)::Int64
└──      return %3
) => Int64
```

Получилась функция, которая умножает аргумент на 6.

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
import Base: iszero, one, -

iszero(::Val{n}) where {n} = iszero(n)

one(::Val{n}) where {n} = one(n)

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

## 1-я проекция Футамуры

### На примере интерпретатора языка<br/>стековой машины<br/>:tongue::scissors:<br/><br/>

<br/><br/>

---

## Команды и последовательности команд

Абстрактный тип команд

```julia
abstract type Instr end
```

Объявление функции - интерпретатора команды

```julia
function run(instr::Instr, s::Tuple)::Tuple end
```

Модифицирует стек `s` и его же выдаёт в качестве результата.

---

## Последовательность команд

```julia
struct Seq{I1 <: Instr, I2 <: Instr} <: Instr end

Seq(::I1, ::I2) where {I1 <: Instr, I2 <: Instr} =
    Seq{I1, I2}()

run(::Seq{I1, I2}, s::Tuple) where {I1 <: Instr, I2 <: Instr} =
    run(I2(), run(I1(), s))
```

Главная хитрость заключается в том, что все команды определяются как
"пустышки", которые не содержат полей. А реальная информация
сосредоточена в их типах.

Поэтому, `I1()` всегда генерирует одну и ту же команду.

---

## Команды `Push{x}` и `Op2`

```julia
struct Push{x} <: Instr end

Push(x) = Push{x}()

run(::Push{x}, s::Tuple) where {x} = (x, s)
```

```julia
struct Op2{f} <: Instr end

Op2(f) = Op2{f}()

function run(::Op2{f}, s::Tuple) where {f}
    x2 = s[1]
    x1 = s[2][1]
    (f(x1, x2), s[2][2])
end
```

---

## Исполнение программы

```text
run(Seq(Push(100), Seq(Push(200), Op2((+)))), ())
  ⟹ (300, ())

run(Seq(Push(:Aa), Seq(Push(:Bb), Op2((==)))), ())
  ⟹ (false, ())

run(Seq(Push(200), Op2((+))), (100, ()))
  ⟹ (300, ())
```

---

## Достигается 1-я проекция Футамуры!

Специализация интерпретатора по отношению к программе.

```julia
@code_typed run(Seq(Push(200), Op2((+))), (100, ()))
⟹
CodeInfo(
1 ─ %1 = Base.getfield(s, 1, true)::Int64
│   %2 = Base.add_int(%1, 200)::Int64
│   %3 = Core.tuple(%2, ())::Tuple{Int64, Tuple{}}
└──      return %3
) => Tuple{Int64, Tuple{}}
```

Интерпретатор статически "исполняется" по отношению к программе. В
результате, и интерпретатор, и исходная программа "сплавляются". И
возникает их "гибрид" - "остаточная программа"...

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
