---
comments: true
---

# 2.6 &nbsp; Exercises

## 2.6.1 &nbsp; Concept Review

### 1. &nbsp; Time and Space Complexity of Iteration and Recursion

The two functions below both calculate $1 + 2 + \dots + n$ (assume $n \ge 1$). Set `n` to 4,
answer the questions by following the program's actual execution order, and then compare the efficiency of the two approaches.

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """Iterative summation"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """Recursive summation"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* Iterative summation */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* Iterative summation */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* Iterative summation */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* Iterative summation */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* Recursive summation */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* Iterative summation */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* Recursive summation */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* Iterative summation */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* Iterative summation */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* Iterative summation */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* Recursive summation */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* Iterative summation */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* Recursive summation */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* Iterative summation */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* Iterative summation */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* Recursive summation */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### Iterative summation ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### Recursive summation ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. When the iterative function runs with `n = 4`, what is the value of the accumulator `res` after each loop iteration?
2. When the recursive function runs with `n = 4`, which values does the argument `n` take in order? As the calls return from the deepest level, how is the result obtained?
3. What are the time and space complexities of the two approaches? Explain your reasoning using the execution processes from Questions 1 and 2.

??? success "Answer"

    1. The loop variable `i` takes the values `1, 2, 3, 4`. After each iteration, `res` becomes
        `1, 3, 6, 10`, respectively, so the iterative function returns 10.

    2. The argument `n` takes the values `4 → 3 → 2 → 1`.
        The deepest call returns 1. The remaining calls then obtain `2 + 1 = 3`, `3 + 3 = 6`, and `4 + 6 = 10`, in that order.
        At the deepest point, all four function calls are still unfinished.

    3. Both functions perform a number of loop iterations or calls proportional to $n$, so both have a time complexity of $O(n)$.
        Their space complexities differ. The iterative version uses only a constant number of variables, so its space complexity is $O(1)$.
        In the recursive version, earlier calls must wait for a result before returning, so the call stack holds up to $n$ calls at the same time.
        Its space complexity is $O(n)$.

        When analyzing space complexity, remember to include the space used by recursive calls as well as the variables written in the code.

### 2. &nbsp; Time Complexity of Three Code Fragments

Each of the following code fragments takes a positive integer $n$ as input. Order them from lowest to highest time complexity, and give the complexity of each one.

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """Linear loop"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """Quadratic loop"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """Logarithmic loop"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* Linear loop */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* Linear loop */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* Linear loop */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* Linear loop */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* Quadratic loop */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* Logarithmic loop */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* Linear loop */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* Quadratic loop */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* Logarithmic loop */
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
    /* Linear loop */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* Linear loop */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* Linear loop */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* Quadratic loop */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* Logarithmic loop */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* Linear loop */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* Quadratic loop */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* Logarithmic loop */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* Linear loop */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* Linear loop */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* Quadratic loop */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* Logarithmic loop */
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
    ### Linear loop ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### Quadratic loop ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### Logarithmic loop ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "Answer"

    From lowest to highest, the order is Fragment 3 with $O(\log n)$, Fragment 1 with $O(n)$, and Fragment 2 with $O(n^2)$.
    Fragment 3 halves $n$ in each iteration, so it runs about $\log_2 n$ times.
    The loop in Fragment 1 runs exactly $n$ times. The inner loop in Fragment 2 runs
    $n,n-1,\dots,1$ times, for a total of $n(n+1)/2$, so its time complexity is quadratic.

### 3. &nbsp; Which Reversal Uses Less Space?

There are two ways to reverse all the elements in the array `nums`:

<!-- numbered-subquestions -->

1. Create a new array `res` of the same length, copy the elements into it in reverse order, and return it.
2. Move two indices `i` and `j` inward from the beginning and end, swapping `nums[i]` and `nums[j]` at each step.

    What is the space complexity of each approach? Which one is an "in-place" operation?

??? success "Answer"

    1. This approach needs an auxiliary array with the same length as the input, so its space complexity is $O(n)$.

    2. This approach uses only two index variables,
        so its space complexity is $O(1)$. It is an in-place operation.

        Note that an in-place reversal changes the input array,
        so it should be preferred only when modifying the input is allowed. If the original array must be kept, the copying cost of the first approach is unavoidable.

## 2.6.2 &nbsp; Programming Exercises

### 1. &nbsp; Fibonacci Number

The Fibonacci sequence is defined by $F(0)=0$, $F(1)=1$, and, for $n\ge2$,
$F(n)=F(n-1)+F(n-2)$.

Given a non-negative integer `n`, use a loop to calculate and return $F(n)$. Do not use recursion.

??? tip "Hints"

    1. Handle the cases where n is 0 or 1 separately
    2. Only the previous two terms are needed to calculate the next term; there is no need to store the entire sequence
    3. When updating the two variables, take care not to overwrite an old value before it is used

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
