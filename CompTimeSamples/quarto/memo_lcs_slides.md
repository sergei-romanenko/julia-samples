# Julia: стадирование и динамическое программирование

- Частичные вычисления - это способ генерации программ. Его полезно
  понимать даже вне связи с **практической** пользой, а просто - "для
  расширения сознания". Чтобы понимать, "как мир устроен".
- Во многих случаях, частичных вычислений "в чистом виде" -
  **достаточно**, чтобы получить нужный результат.
- Но иногда - требуется **добавить** что-то ещё.
- Для дополнительного "расширения сознания", полезно находить и изучать
  случаи, когда "чистых" частичных вычислений - **недостаточно**.
- Мы рассмотрим один из таких случаев: вычисление "длины самой длинной
  общей подпоследовательности".
- Это задача, которая решается с помощью "мемоизации".
- Чтобы устранить "административные" затраты связанные с мемоизацией, мы
  "вручную" изготовим **генератор** программ и будем выполнять
  мемоизацию **при генерации** остаточной программы.

## Литература

1. Yukiyoshi Kameyama, Oleg Kiselyov, and Chung-chieh Shan. 2009.
   Shifting the stage: Staging with delimited control. In _Proceedings
   of the 2009 ACM SIGPLAN workshop on partial evaluation and program
   manipulation_ (_PEPM ’09_), 2009. Association for Computing
   Machinery, New York, NY, USA, 111–120.
   [https://doi.org/10.1145/1480945.1480962](https://doi.org/10.1145/1480945.1480962)

2. Oleg Kiselyov. 2010. Delimited control in OCaml, abstractly and
   concretely: System description. In _Functional and logic
   programming_, 2010. Springer Berlin Heidelberg, Berlin, Heidelberg,
   304–320.

3. Oleg Kiselyov. 2018. Reconciling abstraction with high performance: A
   MetaOCaml approach. _Found. Trends Program. Lang._ 5, 1 (2018),
   1–101.
   [https://doi.org/10.1561/2500000038](https://doi.org/10.1561/2500000038)

4. Oleg Kiselyov, Kedar N. Swadi, and Walid Taha. 2004. A methodology
   for generating verified combinatorial circuits. In _Proceedings of
   the 4th ACM international conference on embedded software_ (_EMSOFT
   ’04_), 2004. Association for Computing Machinery, New York, NY, USA,
   249–258.
   [https://doi.org/10.1145/1017753.1017794](https://doi.org/10.1145/1017753.1017794)

5. Kedar Swadi, Walid Taha, and Oleg Kiselyov. 2005. Staging dynamic
   programming algorithms. _Proc. of the 10th ACM SIGPLAN ICFP_ (2005).
   Retrieved from
   [https://www.academia.edu/download/71507693/2005-04-13.pdf](https://www.academia.edu/download/71507693/2005-04-13.pdf)

6. Walid Taha. 2004. A gentle introduction to multi-stage programming.
   In _Domain-specific program generation: International seminar,
   dagstuhl castle, germany, march 23-28, 2003. Revised papers_,
   Christian Lengauer, Don Batory, Charles Consel and Martin Odersky
   (eds.). Springer Berlin Heidelberg, Berlin, Heidelberg, 30–50.
   [https://doi.org/10.1007/978-3-540-25935-0\_3](https://doi.org/10.1007/978-3-540-25935-0_3)

7. Peter Thiemann. 1999. Combinators for program generation. _Journal of
   Functional Programming_ 9, 5 (1999), 483–525.
   [https://doi.org/10.1017/S0956796899003469](https://doi.org/10.1017/S0956796899003469)

Введение в **стадирование** программ: [6]. Стадирование алгоритмов
**динамического программирования** для генерации программ, подходящих
для **ПЛИС/FPGA**: [4], [3], [5]. Использование **комбинаторов** при
стадировании: [7], [1], [2].
