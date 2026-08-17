---
comments: true
---

# 2.6 &nbsp; Упражнения

## 2.6.1 &nbsp; Вопросы для самопроверки

### 1. &nbsp; Временная и пространственная сложность итерации и рекурсии

Обе функции ниже вычисляют $1 + 2 + \dots + n$ (считайте, что $n \ge 1$). Присвойте `n` значение 4,
ответьте на вопросы в порядке фактического выполнения программы, а затем сравните эффективность двух вариантов.

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """Итеративное суммирование"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """Рекурсивное суммирование"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* Итеративное суммирование */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* Итеративное суммирование */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* Итеративное суммирование */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* Итеративное суммирование */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* Рекурсивное суммирование */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* Итеративное суммирование */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* Рекурсивное суммирование */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* Итеративное суммирование */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* Итеративное суммирование */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* Итеративное суммирование */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* Рекурсивное суммирование */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* Итеративное суммирование */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* Рекурсивное суммирование */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* Итеративное суммирование */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* Итеративное суммирование */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* Рекурсивное суммирование */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### Итеративное суммирование ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### Рекурсивное суммирование ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. Какие значения принимает переменная-аккумулятор `res` после каждой итерации при выполнении итеративной функции с `n = 4`?
2. Какие значения поочередно принимает параметр `n` при выполнении рекурсивной функции с `n = 4`? Как формируется результат при возврате, начиная с самого глубокого вызова?
3. Каковы временная и пространственная сложности каждого варианта? Обоснуйте ответ, опираясь на процессы выполнения из вопросов 1 и 2.

??? success "Ответ"

    1. Переменная цикла `i` поочередно принимает значения `1, 2, 3, 4`, а `res` после каждой итерации становится равной
        `1, 3, 6, 10`. Поэтому итеративная функция возвращает 10.

    2. Параметр `n` принимает значения `4 → 3 → 2 → 1`.
        Самый глубокий вызов возвращает 1, после чего следующие уровни поочередно получают `2 + 1 = 3`, `3 + 3 = 6` и `4 + 6 = 10`.
        В самой глубокой точке все 4 вызова функции еще не завершены.

    3. В обеих функциях число итераций или вызовов пропорционально $n$, поэтому их временная сложность равна $O(n)$.
        Пространственная сложность различается: итеративный вариант использует постоянное число переменных, поэтому она равна $O(1)$;
        в рекурсивном варианте предыдущие вызовы ожидают возврата результата до достижения условия завершения, поэтому в стеке вызовов одновременно хранится до $n$ вызовов.
        Его пространственная сложность равна $O(n)$.

        При анализе пространственной сложности нужно учитывать не только переменные в коде, но и память, занимаемую рекурсивными вызовами.

### 2. &nbsp; Временная сложность трех фрагментов кода

Во всех трех фрагментах кода входные данные — положительное целое число $n$. Расположите фрагменты в порядке возрастания временной сложности и укажите сложность каждого из них.

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """Цикл линейной сложности"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """Цикл квадратичной сложности"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """Цикл логарифмической сложности"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* Цикл линейной сложности */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* Цикл линейной сложности */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* Цикл линейной сложности */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* Цикл линейной сложности */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* Цикл квадратичной сложности */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* Цикл логарифмической сложности */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* Цикл линейной сложности */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* Цикл квадратичной сложности */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* Цикл логарифмической сложности */
    func logarithmicLoop(n: Int) -> Int {
        var n = n
        while n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* Цикл линейной сложности */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* Цикл линейной сложности */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* Цикл линейной сложности */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* Цикл квадратичной сложности */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* Цикл логарифмической сложности */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* Цикл линейной сложности */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* Цикл квадратичной сложности */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* Цикл логарифмической сложности */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* Цикл линейной сложности */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* Цикл линейной сложности */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* Цикл квадратичной сложности */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* Цикл логарифмической сложности */
    fun logarithmicLoop(n: Int): Int {
        var value = n
        while (value > 1) {
            value /= 2
        }
        return value
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### Цикл линейной сложности ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### Цикл квадратичной сложности ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### Цикл логарифмической сложности ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "Ответ"

    Порядок от меньшей сложности к большей: фрагмент 3 — $O(\log n)$, фрагмент 1 — $O(n)$, фрагмент 2 — $O(n^2)$.
    В фрагменте 3 на каждой итерации $n$ уменьшается вдвое, поэтому цикл выполняется примерно $\log_2 n$ раз.
    Цикл во фрагменте 1 выполняется ровно $n$ раз. Число итераций внутреннего цикла во фрагменте 2 последовательно равно
    $n,n-1,\dots,1$, а их сумма — $n(n+1)/2$, поэтому сложность квадратичная.

### 3. &nbsp; Какой способ разворота экономнее по памяти

Все элементы массива `nums` можно расположить в обратном порядке двумя способами:

<!-- numbered-subquestions -->

1. создать новый массив `res` той же длины, скопировать в него элементы в обратном порядке и вернуть его;
2. задать два индекса `i` и `j`, перемещать их от начала и конца массива к середине и попарно менять местами `nums[i]` и `nums[j]`.

    Какова пространственная сложность каждого способа? Какой из них выполняет операцию «на месте»?

??? success "Ответ"

    1. Требуется вспомогательный массив той же длины, что и входной, поэтому пространственная сложность равна $O(n)$.

    2. Используются только две индексные переменные,
        поэтому пространственная сложность равна $O(1)$, а операция выполняется на месте.

        Обратите внимание: разворот на месте изменяет входной массив,
        поэтому его следует предпочитать только тогда, когда менять входные данные разрешено. Если исходный массив нужно сохранить, затрат на копирование в способе 1 не избежать.

## 2.6.2 &nbsp; Задачи по программированию

### 1. &nbsp; Число Фибоначчи

Последовательность Фибоначчи задается так: $F(0)=0$, $F(1)=1$, а при $n\ge2$
выполняется $F(n)=F(n-1)+F(n-2)$.

Дано неотрицательное целое число `n`. Вычислите и верните $F(n)$ с помощью цикла, не используя рекурсию.

??? tip "Подсказки"

    1. Сначала отдельно обработайте случаи, когда n равно 0 или 1
    2. Для вычисления следующего члена нужны только два предыдущих, поэтому хранить всю последовательность не требуется
    3. Обновляя две переменные, не перезапишите слишком рано старое значение, которое еще понадобится

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
