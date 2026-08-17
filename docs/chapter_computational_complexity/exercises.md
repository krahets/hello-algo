---
comments: true
---

# 2.6 &nbsp; 练习

## 2.6.1 &nbsp; 知识巩固

### 1. &nbsp; 迭代与递归的时间和空间

下面两段代码都计算 $1 + 2 + \dots + n$（设 $n \ge 1$）。请把 `n` 设为 4，
按照程序实际执行的顺序回答问题，然后比较两种写法的效率。

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """迭代求和"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """递归求和"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 迭代求和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* 递归求和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 迭代求和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 递归求和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 迭代求和 */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 递归求和 */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 迭代求和 */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* 递归求和 */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 迭代求和 */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* 递归求和 */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* 迭代求和 */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 递归求和 */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 迭代求和 */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 递归求和 */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 迭代求和 */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* 递归求和 */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 迭代求和 */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* 递归求和 */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 迭代求和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 递归求和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 迭代求和 */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* 递归求和 */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### 迭代求和 ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### 递归求和 ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. 输入 `n = 4` 执行迭代函数时，每轮循环结束后，累加变量 `res` 的值分别是多少？
2. 输入 `n = 4` 执行递归函数时，参数 `n` 会依次取哪些值？从最深的一层开始返回时，结果怎样得到？
3. 两种写法的时间复杂度和空间复杂度分别是多少？结合第 1、2 问的执行过程说明理由。

??? success "参考答案"

    1. 循环变量 `i` 依次为 `1、2、3、4`，每轮结束后，`res` 依次变为
        `1、3、6、10`，所以迭代函数返回 10。

    2. 参数 `n` 依次为 `4 → 3 → 2 → 1`。
        最深一层返回 1，随后各层依次得到 `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10`。
        在最深处，4 次函数调用都尚未结束。

    3. 两段代码都进行与 $n$ 成正比的循环或调用，因此时间复杂度均为 $O(n)$ 。
        空间复杂度不同：迭代版只使用常数个变量，为 $O(1)$ ；
        递归版在到达终止条件前，前面的函数调用都要等待返回结果，因此调用栈中最多同时保存 $n$ 次调用，
        空间复杂度为 $O(n)$。

        分析空间复杂度时，除代码中的变量外，还要考虑递归调用占用的空间。

### 2. &nbsp; 三段代码的时间复杂度

以下三个代码片段的输入均为正整数 $n$ 。请按时间复杂度从低到高排序，并写出各自的复杂度。

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """线性阶循环"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """平方阶循环"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """对数阶循环"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 线性阶循环 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* 平方阶循环 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* 对数阶循环 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 线性阶循环 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方阶循环 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 对数阶循环 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 线性阶循环 */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方阶循环 */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 对数阶循环 */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 线性阶循环 */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* 平方阶循环 */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* 对数阶循环 */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 线性阶循环 */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* 平方阶循环 */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* 对数阶循环 */
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
    /* 线性阶循环 */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方阶循环 */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 对数阶循环 */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 线性阶循环 */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方阶循环 */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 对数阶循环 */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 线性阶循环 */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* 平方阶循环 */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* 对数阶循环 */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 线性阶循环 */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* 平方阶循环 */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* 对数阶循环 */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 线性阶循环 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方阶循环 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 对数阶循环 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 线性阶循环 */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* 平方阶循环 */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* 对数阶循环 */
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
    ### 线性阶循环 ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### 平方阶循环 ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### 对数阶循环 ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "参考答案"

    从低到高为：片段三 $O(\log n)$、片段一 $O(n)$、片段二 $O(n^2)$。
    片段三每轮把 $n$ 缩小为原来的一半，约循环 $\log_2 n$ 次。
    片段一的循环恰好执行 $n$ 次。片段二的内层循环次数依次为
    $n,n-1,\dots,1$，总次数为 $n(n+1)/2$，因此属于平方阶。

### 3. &nbsp; 哪种反转更节省空间

要将数组 `nums` 中的元素全部反转，有两种做法：

<!-- numbered-subquestions -->

1. 新建一个等长数组 `res`，倒序复制后返回；
2. 用两个索引 `i` 和 `j` 分别从首、尾向中间移动，逐对交换 `nums[i]` 与 `nums[j]` 。

    两种做法的空间复杂度各是多少？哪种属于“原地”操作？

??? success "参考答案"

    1. 需要与输入等长的辅助数组，空间复杂度 $O(n)$。

    2. 只使用两个索引变量，
        空间复杂度 $O(1)$ ，属于原地操作。

        需要注意：原地反转会修改输入数组，
        仅在允许修改输入时才应优先选用；若需保留原数组，第 1 种做法的复制开销不可避免。

## 2.6.2 &nbsp; 编程练习

### 1. &nbsp; 斐波那契数

斐波那契数列满足：$F(0)=0$、$F(1)=1$，并且当 $n\ge2$ 时，
$F(n)=F(n-1)+F(n-2)$。

给定非负整数 `n`，请使用循环计算并返回 $F(n)$，不使用递归。

??? tip "解题提示"

    1. 先单独处理 n 为 0 和 1 的情况
    2. 计算下一项时只需要前两项，无须保存整个数列
    3. 更新两个变量时，注意不要过早覆盖仍会用到的旧值

[LeetCode](https://leetcode.cn/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/fibonacci-number/solutions/2361746/509-fei-bo-na-qi-shu-dong-tai-gui-hua-qi-so8h/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
