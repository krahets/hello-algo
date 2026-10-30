---
comments: true
---

# 2.6 &nbsp; Exercises

## 2.6.1 &nbsp; Check your understanding

### 1. &nbsp; Time and space in iteration and recursion

Both functions below compute $1 + 2 + \dots + n$ (assume $n \ge 1$). Set `n` to 4,
follow the program's execution order to answer the questions, and then compare the efficiency of the two approaches.

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """Sum using iteration"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """Sum using recursion"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* Sum using iteration */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* Sum using recursion */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* Sum using iteration */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Sum using recursion */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* Sum using iteration */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Sum using recursion */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* Sum using iteration */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* Sum using recursion */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* Sum using iteration */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* Sum using recursion */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* Sum using iteration */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Sum using recursion */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* Sum using iteration */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Sum using recursion */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* Sum using iteration */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* Sum using recursion */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* Sum using iteration */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* Sum using recursion */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* Sum using iteration */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Sum using recursion */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* Sum using iteration */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* Sum using recursion */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### Sum using iteration ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### Sum using recursion ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. When the iterative function runs with `n = 4`, what is the value of the accumulator `res` at the end of each iteration?
2. When the recursive function runs with `n = 4`, what values does the parameter `n` take, in order? How is the result computed as the calls return, starting from the deepest call?
3. What are the time and space complexities of each approach? Explain using the execution steps from questions 1 and 2.

??? success "Reference answer"

    1. The loop variable `i` takes the values `1, 2, 3, 4` in order. At the end of each iteration, `res` becomes
        `1, 3, 6, 10`, respectively, so the iterative function returns 10.

    2. The parameter `n` follows the sequence `4 → 3 → 2 → 1`.
        The deepest call returns 1. The remaining calls then compute `2 + 1 = 3`, `3 + 3 = 6`, and `4 + 6 = 10`, in order.
        At the deepest point, all four function calls are still active.

    3. Both functions perform a number of iterations or calls proportional to $n$, so both have time complexity $O(n)$.
        Their space complexities differ: the iterative version uses only a constant number of variables, giving $O(1)$.
        In the recursive version, earlier calls must wait for their results until the base case is reached. The call stack therefore holds up to $n$ calls at once,
        giving space complexity $O(n)$.

        When analyzing space complexity, consider the space used by recursive calls as well as the variables in the code.

### 2. &nbsp; Time complexity of three code snippets

Each of the following three code snippets takes a positive integer $n$ as input. Rank them from lowest to highest time complexity, and state each complexity.

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """Linear-time loop"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """Quadratic-time loop"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """Logarithmic-time loop"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* Linear-time loop */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* Quadratic-time loop */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic-time loop */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* Linear-time loop */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic-time loop */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic-time loop */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* Linear-time loop */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic-time loop */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic-time loop */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* Linear-time loop */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* Quadratic-time loop */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* Logarithmic-time loop */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* Linear-time loop */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* Quadratic-time loop */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* Logarithmic-time loop */
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
    /* Linear-time loop */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic-time loop */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic-time loop */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* Linear-time loop */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic-time loop */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic-time loop */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* Linear-time loop */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* Quadratic-time loop */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* Logarithmic-time loop */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* Linear-time loop */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* Quadratic-time loop */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* Logarithmic-time loop */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* Linear-time loop */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic-time loop */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic-time loop */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* Linear-time loop */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* Quadratic-time loop */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* Logarithmic-time loop */
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
    ### Linear-time loop ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### Quadratic-time loop ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### Logarithmic-time loop ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "Reference answer"

    From lowest to highest: snippet 3, $O(\log n)$; snippet 1, $O(n)$; snippet 2, $O(n^2)$.
    Snippet 3 halves $n$ at each iteration, so it runs approximately $\log_2 n$ times.
    Snippet 1 runs its loop exactly $n$ times. In snippet 2, the inner loop runs
    $n,n-1,\dots,1$ times in successive iterations, for a total of $n(n+1)/2$, giving quadratic time complexity.

### 3. &nbsp; Which reversal method uses less space?

There are two ways to reverse all the elements in an array `nums`:

<!-- numbered-subquestions -->

1. Create an array `res` of the same length, copy the elements into it in reverse order, and return it.
2. Move two indices, `i` and `j`, inward from the beginning and end, swapping `nums[i]` with `nums[j]` in pairs.

    What is the space complexity of each approach? Which operation is in-place?

??? success "Reference answer"

    1. An auxiliary array as long as the input is needed, giving space complexity $O(n)$.

    2. Only two index variables are used,
        giving space complexity $O(1)$. This is an in-place operation.

        Keep in mind that in-place reversal modifies the input array.
        Prefer it only when modifying the input is allowed. If the original array must be preserved, the copying cost of approach 1 is unavoidable.

## 2.6.2 &nbsp; Programming exercises

### 1. &nbsp; Fibonacci number

The Fibonacci sequence satisfies $F(0)=0$, $F(1)=1$, and, for $n\ge2$,
$F(n)=F(n-1)+F(n-2)$.

Given a nonnegative integer `n`, use a loop to compute and return $F(n)$ without recursion.

??? tip "Hints"

    1. Handle n equal to 0 or 1 separately first.
    2. Computing the next term requires only the previous two terms; there is no need to store the entire sequence.
    3. When updating the two variables, take care not to overwrite an old value before you have finished using it.

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
