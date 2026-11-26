---
comments: true
---

# 2.6 &nbsp; Упражнения

## 2.6.1 &nbsp; Вопросы для закрепления

### 1. &nbsp; Затраты времени и памяти при итерации и рекурсии

Оба фрагмента вычисляют $1 + 2 + \dots + n$ (при $n \ge 1$). Присвойте `n` значение 4,
проследите за ходом выполнения программ и ответьте на вопросы. Затем сравните эффективность двух решений.

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """Суммирование в цикле"""
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    /* Суммирование в цикле */
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
    ### Суммирование в цикле ###
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

1. Какие значения принимает накопленная сумма `res` после каждой итерации цикла при `n = 4`?
2. Какие значения последовательно принимает параметр `n` при вызове рекурсивной функции с `n = 4`? Как вычисляется результат при возврате из вызовов, начиная с самого глубокого?
3. Какова временная и пространственная сложность каждого решения? Обоснуйте ответ, опираясь на ход выполнения программ в первых двух вопросах.

??? success "Вариант ответа"

    1. Переменная цикла `i` принимает значения `1, 2, 3, 4`. Соответствующие значения `res` в конце каждой итерации —
        `1, 3, 6, 10`. Поэтому итеративная функция возвращает 10.

    2. Значения параметра `n` сменяют друг друга в таком порядке: `4 → 3 → 2 → 1`.
        Самый глубокий вызов возвращает 1, а при последующих возвратах получаем `2 + 1 = 3`, `3 + 3 = 6` и `4 + 6 = 10`.
        В самой глубокой точке ещё не завершился ни один из четырёх вызовов.

    3. Число итераций в первом решении и число вызовов во втором пропорциональны $n$, поэтому временная сложность обоих решений равна $O(n)$.
        Пространственная сложность различается. Итеративному решению нужно постоянное число переменных, поэтому его сложность по памяти равна $O(1)$.
        В рекурсивном решении до достижения условия остановки все предыдущие вызовы ждут результата. Всего в стеке одновременно может находиться до $n$ вызовов,
        поэтому пространственная сложность равна $O(n)$.

        При анализе пространственной сложности учитывайте и переменные программы, и память, которую занимают рекурсивные вызовы.

### 2. &nbsp; Временная сложность трёх фрагментов кода

Каждый из трёх фрагментов получает на вход положительное целое число $n$. Расположите фрагменты в порядке возрастания временной сложности и укажите сложность каждого.

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

??? success "Вариант ответа"

    В порядке возрастания: третий фрагмент — $O(\log n)$, первый — $O(n)$, второй — $O(n^2)$.
    В третьем фрагменте на каждом шаге $n$ уменьшается вдвое. Цикл выполняется примерно $\log_2 n$ раз.
    В первом фрагменте цикл выполняется ровно $n$ раз. Во втором число итераций внутреннего цикла последовательно принимает значения
    $n,n-1,\dots,1$. Суммарное число итераций равно $n(n+1)/2$, поэтому сложность квадратичная.

### 3. &nbsp; Как развернуть массив с меньшими затратами памяти?

Элементы массива `nums` можно расположить в обратном порядке двумя способами:

<!-- numbered-subquestions -->

1. Создать массив `res` той же длины, скопировать в него элементы в обратном порядке и вернуть его.
2. Перемещать индексы `i` и `j` от начала и конца массива к середине, попарно меняя местами `nums[i]` и `nums[j]`.

    Какова пространственная сложность каждого способа? Какой из них выполняет разворот «на месте»?

??? success "Вариант ответа"

    1. Требуется вспомогательный массив той же длины, что и исходный. Пространственная сложность равна $O(n)$.

    2. Используются лишь две индексные переменные,
        поэтому пространственная сложность равна $O(1)$. Разворот выполняется на месте.

        Разворот на месте изменяет исходный массив,
        поэтому этот способ предпочтителен, только если входные данные можно менять. Если требуется сохранить исходный массив, затрат на копирование в первом способе не избежать.

## 2.6.2 &nbsp; Задачи по программированию

### 1. &nbsp; Число Фибоначчи

Последовательность Фибоначчи задаётся так: $F(0)=0$, $F(1)=1$, а при $n\ge2$ выполняется равенство
$F(n)=F(n-1)+F(n-2)$.

Дано неотрицательное целое число `n`. Вычислите и верните $F(n)$ с помощью цикла, без рекурсии.

??? tip "Подсказки"

    1. Сначала отдельно рассмотрите случаи n = 0 и n = 1.
    2. Для вычисления следующего члена нужны только два предыдущих. Хранить всю последовательность не требуется.
    3. Обновляя две переменные, следите за тем, чтобы не затереть значение, которое ещё понадобится.

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
