---
comments: true
---

# 2.2 &nbsp; 迭代与递归

在算法中，重复执行某个任务是很常见的，它与复杂度分析息息相关。因此，在介绍时间复杂度和空间复杂度之前，我们先来了解如何在程序中实现重复执行任务，即两种基本的程序控制结构：迭代、递归。

## 2.2.1 &nbsp; 迭代

「迭代 iteration」是一种重复执行某个任务的控制结构。在迭代中，程序会在满足一定的条件下重复执行某段代码，直到这个条件不再满足。

### 1. &nbsp; for 循环

`for` 循环是最常见的迭代形式之一，**适合在预先知道迭代次数时使用**。

以下函数基于 `for` 循环实现了求和 $1 + 2 + \dots + n$ ，求和结果使用变量 `res` 记录。需要注意的是，Python 中 `range(a, b)` 对应的区间是“左闭右开”的，对应的遍历范围为 $a, a + 1, \dots, b-1$ ：

=== "Python"

    ```python title="iteration.py"
    def for_loop(n: int) -> int:
        """for 循环"""
        res = 0
        # 循环求和 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            res += i
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* for 循环 */
    int forLoop(int n) {
        int res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* for 循环 */
    int forLoop(int n) {
        int res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* for 循环 */
    int ForLoop(int n) {
        int res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* for 循环 */
    func forLoop(n int) int {
        res := 0
        // 循环求和 1, 2, ..., n-1, n
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* for 循环 */
    func forLoop(n: Int) -> Int {
        var res = 0
        // 循环求和 1, 2, ..., n-1, n
        for i in 1 ... n {
            res += i
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* for 循环 */
    function forLoop(n) {
        let res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* for 循环 */
    function forLoop(n: number): number {
        let res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* for 循环 */
    int forLoop(int n) {
      int res = 0;
      // 循环求和 1, 2, ..., n-1, n
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* for 循环 */
    fn for_loop(n: i32) -> i32 {
        let mut res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for i in 1..=n {
            res += i;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* for 循环 */
    int forLoop(int n) {
        int res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* for 循环 */
    fun forLoop(n: Int): Int {
        var res = 0
        // 循环求和 1, 2, ..., n-1, n
        for (i in 1..n) {
            res += i
        }
        return res
    }
    ```

=== "Zig"

    ```zig title="iteration.zig"
    // for 循环
    fn forLoop(n: usize) i32 {
        var res: i32 = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (1..n+1) |i| {
            res = res + @as(i32, @intCast(i));
        }
        return res;
    } 
    ```

??? pythontutor "可视化运行"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

图 2-1 是该求和函数的流程框图。

![求和函数的流程框图](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> 图 2-1 &nbsp; 求和函数的流程框图 </p>

此求和函数的操作数量与输入数据大小 $n$ 成正比，或者说成“线性关系”。实际上，**时间复杂度描述的就是这个“线性关系”**。相关内容将会在下一节中详细介绍。

### 2. &nbsp; while 循环

与 `for` 循环类似，`while` 循环也是一种实现迭代的方法。在 `while` 循环中，程序每轮都会先检查条件，如果条件为真，则继续执行，否则就结束循环。

下面我们用 `while` 循环来实现求和 $1 + 2 + \dots + n$ ：

=== "Python"

    ```python title="iteration.py"
    def while_loop(n: int) -> int:
        """while 循环"""
        res = 0
        i = 1  # 初始化条件变量
        # 循环求和 1, 2, ..., n-1, n
        while i <= n:
            res += i
            i += 1  # 更新条件变量
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while 循环 */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新条件变量
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while 循环 */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新条件变量
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while 循环 */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // 更新条件变量
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while 循环 */
    func whileLoop(n int) int {
        res := 0
        // 初始化条件变量
        i := 1
        // 循环求和 1, 2, ..., n-1, n
        for i <= n {
            res += i
            // 更新条件变量
            i++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while 循环 */
    func whileLoop(n: Int) -> Int {
        var res = 0
        var i = 1 // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while i <= n {
            res += i
            i += 1 // 更新条件变量
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while 循环 */
    function whileLoop(n) {
        let res = 0;
        let i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新条件变量
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while 循环 */
    function whileLoop(n: number): number {
        let res = 0;
        let i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新条件变量
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while 循环 */
    int whileLoop(int n) {
      int res = 0;
      int i = 1; // 初始化条件变量
      // 循环求和 1, 2, ..., n-1, n
      while (i <= n) {
        res += i;
        i++; // 更新条件变量
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while 循环 */
    fn while_loop(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // 初始化条件变量

        // 循环求和 1, 2, ..., n-1, n
        while i <= n {
            res += i;
            i += 1; // 更新条件变量
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while 循环 */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // 更新条件变量
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while 循环 */
    fun whileLoop(n: Int): Int {
        var res = 0
        var i = 1 // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i
            i++ // 更新条件变量
        }
        return res
    }
    ```

=== "Zig"

    ```zig title="iteration.zig"
    // while 循环
    fn whileLoop(n: i32) i32 {
        var res: i32 = 0;
        var i: i32 = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += @intCast(i);
            i += 1;
        }
        return res;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

**`while` 循环比 `for` 循环的自由度更高**。在 `while` 循环中，我们可以自由地设计条件变量的初始化和更新步骤。

例如在以下代码中，条件变量 $i$ 每轮进行两次更新，这种情况就不太方便用 `for` 循环实现：

=== "Python"

    ```python title="iteration.py"
    def while_loop_ii(n: int) -> int:
        """while 循环（两次更新）"""
        res = 0
        i = 1  # 初始化条件变量
        # 循环求和 1, 4, 10, ...
        while i <= n:
            res += i
            # 更新条件变量
            i += 1
            i *= 2
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while 循环（两次更新） */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while 循环（两次更新） */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while 循环（两次更新） */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i += 1; 
            i *= 2;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while 循环（两次更新） */
    func whileLoopII(n int) int {
        res := 0
        // 初始化条件变量
        i := 1
        // 循环求和 1, 4, 10, ...
        for i <= n {
            res += i
            // 更新条件变量
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while 循环（两次更新） */
    func whileLoopII(n: Int) -> Int {
        var res = 0
        var i = 1 // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while i <= n {
            res += i
            // 更新条件变量
            i += 1
            i *= 2
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while 循环（两次更新） */
    function whileLoopII(n) {
        let res = 0;
        let i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while 循环（两次更新） */
    function whileLoopII(n: number): number {
        let res = 0;
        let i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while 循环（两次更新） */
    int whileLoopII(int n) {
      int res = 0;
      int i = 1; // 初始化条件变量
      // 循环求和 1, 4, 10, ...
      while (i <= n) {
        res += i;
        // 更新条件变量
        i++;
        i *= 2;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while 循环（两次更新） */
    fn while_loop_ii(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // 初始化条件变量

        // 循环求和 1, 4, 10, ...
        while i <= n {
            res += i;
            // 更新条件变量
            i += 1;
            i *= 2;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while 循环（两次更新） */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新条件变量
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while 循环（两次更新） */
    fun whileLoopII(n: Int): Int {
        var res = 0
        var i = 1 // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += i
            // 更新条件变量
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Zig"

    ```zig title="iteration.zig"
    //  while 循环（两次更新）
    fn whileLoopII(n: i32) i32 {
        var res: i32 = 0;
        var i: i32 = 1; // 初始化条件变量
        // 循环求和 1, 4, 10, ...
        while (i <= n) {
            res += @intCast(i);
            // 更新条件变量
            i += 1;
            i *= 2;
        }
        return res;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%204,%2010,%20...%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20*%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%204,%2010,%20...%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20*%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

总的来说，**`for` 循环的代码更加紧凑，`while` 循环更加灵活**，两者都可以实现迭代结构。选择使用哪一个应该根据特定问题的需求来决定。

### 3. &nbsp; 嵌套循环

我们可以在一个循环结构内嵌套另一个循环结构，下面以 `for` 循环为例：

=== "Python"

    ```python title="iteration.py"
    def nested_for_loop(n: int) -> str:
        """双层 for 循环"""
        res = ""
        # 循环 i = 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            # 循环 j = 1, 2, ..., n-1, n
            for j in range(1, n + 1):
                res += f"({i}, {j}), "
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* 双层 for 循环 */
    string nestedForLoop(int n) {
        ostringstream res;
        // 循环 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; ++i) {
            // 循环 j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; ++j) {
                res << "(" << i << ", " << j << "), ";
            }
        }
        return res.str();
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* 双层 for 循环 */
    String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // 循环 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* 双层 for 循环 */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // 循环 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* 双层 for 循环 */
    func nestedForLoop(n int) string {
        res := ""
        // 循环 i = 1, 2, ..., n-1, n
        for i := 1; i <= n; i++ {
            for j := 1; j <= n; j++ {
                // 循环 j = 1, 2, ..., n-1, n
                res += fmt.Sprintf("(%d, %d), ", i, j)
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* 双层 for 循环 */
    func nestedForLoop(n: Int) -> String {
        var res = ""
        // 循环 i = 1, 2, ..., n-1, n
        for i in 1 ... n {
            // 循环 j = 1, 2, ..., n-1, n
            for j in 1 ... n {
                res.append("(\(i), \(j)), ")
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* 双层 for 循环 */
    function nestedForLoop(n) {
        let res = '';
        // 循环 i = 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* 双层 for 循环 */
    function nestedForLoop(n: number): string {
        let res = '';
        // 循环 i = 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* 双层 for 循环 */
    String nestedForLoop(int n) {
      String res = "";
      // 循环 i = 1, 2, ..., n-1, n
      for (int i = 1; i <= n; i++) {
        // 循环 j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; j++) {
          res += "($i, $j), ";
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* 双层 for 循环 */
    fn nested_for_loop(n: i32) -> String {
        let mut res = vec![];
        // 循环 i = 1, 2, ..., n-1, n
        for i in 1..=n {
            // 循环 j = 1, 2, ..., n-1, n
            for j in 1..=n {
                res.push(format!("({}, {}), ", i, j));
            }
        }
        res.join("")
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* 双层 for 循环 */
    char *nestedForLoop(int n) {
        // n * n 为对应点数量，"(i, j), " 对应字符串长最大为 6+10*2，加上最后一个空字符 \0 的额外空间
        int size = n * n * 26 + 1;
        char *res = malloc(size * sizeof(char));
        // 循环 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                char tmp[26];
                snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
                strncat(res, tmp, size - strlen(res) - 1);
            }
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* 双层 for 循环 */
    fun nestedForLoop(n: Int): String {
        val res = StringBuilder()
        // 循环 i = 1, 2, ..., n-1, n
        for (i in 1..n) {
            // 循环 j = 1, 2, ..., n-1, n
            for (j in 1..n) {
                res.append(" ($i, $j), ")
            }
        }
        return res.toString()
    }
    ```

=== "Zig"

    ```zig title="iteration.zig"
    // 双层 for 循环
    fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
        var res = std.ArrayList(u8).init(allocator);
        defer res.deinit();
        var buffer: [20]u8 = undefined;
        // 循环 i = 1, 2, ..., n-1, n
        for (1..n+1) |i| {
            // 循环 j = 1, 2, ..., n-1, n
            for (1..n+1) |j| {
                var _str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{i, j});
                try res.appendSlice(_str);
            }
        }
        return res.toOwnedSlice();
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20i%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20j%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E9%81%8D%E5%8E%86%E7%BB%93%E6%9E%9C%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20i%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20j%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E9%81%8D%E5%8E%86%E7%BB%93%E6%9E%9C%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

图 2-2 是该嵌套循环的流程框图。

![嵌套循环的流程框图](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> 图 2-2 &nbsp; 嵌套循环的流程框图 </p>

在这种情况下，函数的操作数量与 $n^2$ 成正比，或者说算法运行时间和输入数据大小 $n$ 成“平方关系”。

我们可以继续添加嵌套循环，每一次嵌套都是一次“升维”，将会使时间复杂度提高至“立方关系”“四次方关系”，以此类推。

## 2.2.2 &nbsp; 递归

 「递归 recursion」是一种算法策略，通过函数调用自身来解决问题。它主要包含两个阶段。

1. **递**：程序不断深入地调用自身，通常传入更小或更简化的参数，直到达到“终止条件”。
2. **归**：触发“终止条件”后，程序从最深层的递归函数开始逐层返回，汇聚每一层的结果。

而从实现的角度看，递归代码主要包含三个要素。

1. **终止条件**：用于决定什么时候由“递”转“归”。
2. **递归调用**：对应“递”，函数调用自身，通常输入更小或更简化的参数。
3. **返回结果**：对应“归”，将当前递归层级的结果返回至上一层。

观察以下代码，我们只需调用函数 `recur(n)`  ，就可以完成 $1 + 2 + \dots + n$ 的计算：

=== "Python"

    ```python title="recursion.py"
    def recur(n: int) -> int:
        """递归"""
        # 终止条件
        if n == 1:
            return 1
        # 递：递归调用
        res = recur(n - 1)
        # 归：返回结果
        return n + res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 递归 */
    int recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 递归 */
    int recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 递归 */
    int Recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = Recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 递归 */
    func recur(n int) int {
        // 终止条件
        if n == 1 {
            return 1
        }
        // 递：递归调用
        res := recur(n - 1)
        // 归：返回结果
        return n + res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 递归 */
    func recur(n: Int) -> Int {
        // 终止条件
        if n == 1 {
            return 1
        }
        // 递：递归调用
        let res = recur(n: n - 1)
        // 归：返回结果
        return n + res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 递归 */
    function recur(n) {
        // 终止条件
        if (n === 1) return 1;
        // 递：递归调用
        const res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 递归 */
    function recur(n: number): number {
        // 终止条件
        if (n === 1) return 1;
        // 递：递归调用
        const res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 递归 */
    int recur(int n) {
      // 终止条件
      if (n == 1) return 1;
      // 递：递归调用
      int res = recur(n - 1);
      // 归：返回结果
      return n + res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 递归 */
    fn recur(n: i32) -> i32 {
        // 终止条件
        if n == 1 {
            return 1;
        }
        // 递：递归调用
        let res = recur(n - 1);
        // 归：返回结果
        n + res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 递归 */
    int recur(int n) {
        // 终止条件
        if (n == 1)
            return 1;
        // 递：递归调用
        int res = recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 递归 */
    fun recur(n: Int): Int {
        // 终止条件
        if (n == 1)
            return 1
        // 递: 递归调用
        val res = recur(n - 1)
        // 归: 返回结果
        return n + res
    }
    ```

=== "Zig"

    ```zig title="recursion.zig"
    // 递归函数
    fn recur(n: i32) i32 {
        // 终止条件
        if (n == 1) {
            return 1;
        }
        // 递：递归调用
        var res: i32 = recur(n - 1);
        // 归：返回结果
        return n + res;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

图 2-3 展示了该函数的递归过程。

![求和函数的递归过程](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> 图 2-3 &nbsp; 求和函数的递归过程 </p>

虽然从计算角度看，迭代与递归可以得到相同的结果，**但它们代表了两种完全不同的思考和解决问题的范式**。

- **迭代**：“自下而上”地解决问题。从最基础的步骤开始，然后不断重复或累加这些步骤，直到任务完成。
- **递归**：“自上而下”地解决问题。将原问题分解为更小的子问题，这些子问题和原问题具有相同的形式。接下来将子问题继续分解为更小的子问题，直到基本情况时停止（基本情况的解是已知的）。

以上述求和函数为例，设问题 $f(n) = 1 + 2 + \dots + n$ 。

- **迭代**：在循环中模拟求和过程，从 $1$ 遍历到 $n$ ，每轮执行求和操作，即可求得 $f(n)$ 。
- **递归**：将问题分解为子问题 $f(n) = n + f(n-1)$ ，不断（递归地）分解下去，直至基本情况 $f(1) = 1$ 时终止。

### 1. &nbsp; 调用栈

递归函数每次调用自身时，系统都会为新开启的函数分配内存，以存储局部变量、调用地址和其他信息等。这将导致两方面的结果。

- 函数的上下文数据都存储在称为“栈帧空间”的内存区域中，直至函数返回后才会被释放。因此，**递归通常比迭代更加耗费内存空间**。
- 递归调用函数会产生额外的开销。**因此递归通常比循环的时间效率更低**。

如图 2-4 所示，在触发终止条件前，同时存在 $n$ 个未返回的递归函数，**递归深度为 $n$** 。

![递归调用深度](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> 图 2-4 &nbsp; 递归调用深度 </p>

在实际中，编程语言允许的递归深度通常是有限的，过深的递归可能导致栈溢出错误。

### 2. &nbsp; 尾递归

有趣的是，**如果函数在返回前的最后一步才进行递归调用**，则该函数可以被编译器或解释器优化，使其在空间效率上与迭代相当。这种情况被称为「尾递归 tail recursion」。

- **普通递归**：当函数返回到上一层级的函数后，需要继续执行代码，因此系统需要保存上一层调用的上下文。
- **尾递归**：递归调用是函数返回前的最后一个操作，这意味着函数返回到上一层级后，无须继续执行其他操作，因此系统无须保存上一层函数的上下文。

以计算 $1 + 2 + \dots + n$ 为例，我们可以将结果变量 `res` 设为函数参数，从而实现尾递归：

=== "Python"

    ```python title="recursion.py"
    def tail_recur(n, res):
        """尾递归"""
        # 终止条件
        if n == 0:
            return res
        # 尾递归调用
        return tail_recur(n - 1, res + n)
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 尾递归 */
    int tailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 尾递归 */
    int tailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 尾递归 */
    int TailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return TailRecur(n - 1, res + n);
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 尾递归 */
    func tailRecur(n int, res int) int {
        // 终止条件
        if n == 0 {
            return res
        }
        // 尾递归调用
        return tailRecur(n-1, res+n)
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 尾递归 */
    func tailRecur(n: Int, res: Int) -> Int {
        // 终止条件
        if n == 0 {
            return res
        }
        // 尾递归调用
        return tailRecur(n: n - 1, res: res + n)
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 尾递归 */
    function tailRecur(n, res) {
        // 终止条件
        if (n === 0) return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 尾递归 */
    function tailRecur(n: number, res: number): number {
        // 终止条件
        if (n === 0) return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 尾递归 */
    int tailRecur(int n, int res) {
      // 终止条件
      if (n == 0) return res;
      // 尾递归调用
      return tailRecur(n - 1, res + n);
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 尾递归 */
    fn tail_recur(n: i32, res: i32) -> i32 {
        // 终止条件
        if n == 0 {
            return res;
        }
        // 尾递归调用
        tail_recur(n - 1, res + n)
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 尾递归 */
    int tailRecur(int n, int res) {
        // 终止条件
        if (n == 0)
            return res;
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Kotlin tailrec 关键词使函数实现尾递归优化 */
    tailrec fun tailRecur(n: Int, res: Int): Int {
        // 终止条件
        if (n == 0)
            return res
        // 尾递归调用
        return tailRecur(n - 1, res + n)
    }
    ```

=== "Zig"

    ```zig title="recursion.zig"
    // 尾递归函数
    fn tailRecur(n: i32, res: i32) i32 {
        // 终止条件
        if (n == 0) {
            return res;
        }
        // 尾递归调用
        return tailRecur(n - 1, res + n);
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%E5%B0%BE%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%E5%B0%BE%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%E5%B0%BE%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%E5%B0%BE%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%E5%B0%BE%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%E5%B0%BE%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

尾递归的执行过程如图 2-5 所示。对比普通递归和尾递归，两者的求和操作的执行点是不同的。

- **普通递归**：求和操作是在“归”的过程中执行的，每层返回后都要再执行一次求和操作。
- **尾递归**：求和操作是在“递”的过程中执行的，“归”的过程只需层层返回。

![尾递归过程](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> 图 2-5 &nbsp; 尾递归过程 </p>

!!! tip

    请注意，许多编译器或解释器并不支持尾递归优化。例如，Python 默认不支持尾递归优化，因此即使函数是尾递归形式，仍然可能会遇到栈溢出问题。

### 3. &nbsp; 递归树

当处理与“分治”相关的算法问题时，递归往往比迭代的思路更加直观、代码更加易读。以“斐波那契数列”为例。

!!! question

    给定一个斐波那契数列 $0, 1, 1, 2, 3, 5, 8, 13, \dots$ ，求该数列的第 $n$ 个数字。

设斐波那契数列的第 $n$ 个数字为 $f(n)$ ，易得两个结论。

- 数列的前两个数字为 $f(1) = 0$ 和 $f(2) = 1$ 。
- 数列中的每个数字是前两个数字的和，即 $f(n) = f(n - 1) + f(n - 2)$ 。

按照递推关系进行递归调用，将前两个数字作为终止条件，便可写出递归代码。调用 `fib(n)` 即可得到斐波那契数列的第 $n$ 个数字：

=== "Python"

    ```python title="recursion.py"
    def fib(n: int) -> int:
        """斐波那契数列：递归"""
        # 终止条件 f(1) = 0, f(2) = 1
        if n == 1 or n == 2:
            return n - 1
        # 递归调用 f(n) = f(n-1) + f(n-2)
        res = fib(n - 1) + fib(n - 2)
        # 返回结果 f(n)
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 斐波那契数列：递归 */
    int fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 斐波那契数列：递归 */
    int fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 斐波那契数列：递归 */
    int Fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 斐波那契数列：递归 */
    func fib(n int) int {
        // 终止条件 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // 递归调用 f(n) = f(n-1) + f(n-2)
        res := fib(n-1) + fib(n-2)
        // 返回结果 f(n)
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 斐波那契数列：递归 */
    func fib(n: Int) -> Int {
        // 终止条件 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // 递归调用 f(n) = f(n-1) + f(n-2)
        let res = fib(n: n - 1) + fib(n: n - 2)
        // 返回结果 f(n)
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 斐波那契数列：递归 */
    function fib(n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 斐波那契数列：递归 */
    function fib(n: number): number {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 斐波那契数列：递归 */
    int fib(int n) {
      // 终止条件 f(1) = 0, f(2) = 1
      if (n == 1 || n == 2) return n - 1;
      // 递归调用 f(n) = f(n-1) + f(n-2)
      int res = fib(n - 1) + fib(n - 2);
      // 返回结果 f(n)
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 斐波那契数列：递归 */
    fn fib(n: i32) -> i32 {
        // 终止条件 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1;
        }
        // 递归调用 f(n) = f(n-1) + f(n-2)
        let res = fib(n - 1) + fib(n - 2);
        // 返回结果
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 斐波那契数列：递归 */
    int fib(int n) {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 递归调用 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 斐波那契数列：递归 */
    fun fib(n: Int): Int {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1
        // 递归调用 f(n) = f(n-1) + f(n-2)
        val res = fib(n - 1) + fib(n - 2)
        // 返回结果 f(n)
        return res
    }
    ```

=== "Zig"

    ```zig title="recursion.zig"
    // 斐波那契数列
    fn fib(n: i32) i32 {
        // 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 or n == 2) {
            return n - 1;
        }
        // 递归调用 f(n) = f(n-1) + f(n-2)
        var res: i32 = fib(n - 1) + fib(n - 2);
        // 返回结果 f(n)
        return res;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%EF%BC%9A%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%20f%28n%29%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%E7%9A%84%E7%AC%AC%20%7Bn%7D%20%E9%A1%B9%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%EF%BC%9A%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%20f%28n%29%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%E7%9A%84%E7%AC%AC%20%7Bn%7D%20%E9%A1%B9%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

观察以上代码，我们在函数内递归调用了两个函数，**这意味着从一个调用产生了两个调用分支**。如图 2-6 所示，这样不断递归调用下去，最终将产生一棵层数为 $n$ 的「递归树 recursion tree」。

![斐波那契数列的递归树](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> 图 2-6 &nbsp; 斐波那契数列的递归树 </p>

从本质上看，递归体现了“将问题分解为更小子问题”的思维范式，这种分治策略至关重要。

- 从算法角度看，搜索、排序、回溯、分治、动态规划等许多重要算法策略直接或间接地应用了这种思维方式。
- 从数据结构角度看，递归天然适合处理链表、树和图的相关问题，因为它们非常适合用分治思想进行分析。

## 2.2.3 &nbsp; 两者对比

总结以上内容，如表 2-1 所示，迭代和递归在实现、性能和适用性上有所不同。

<p align="center"> 表 2-1 &nbsp; 迭代与递归特点对比 </p>

<div class="center-table" markdown>

|          | 迭代                                   | 递归                                                         |
| -------- | -------------------------------------- | ------------------------------------------------------------ |
| 实现方式 | 循环结构                               | 函数调用自身                                                 |
| 时间效率 | 效率通常较高，无函数调用开销           | 每次函数调用都会产生开销                                     |
| 内存使用 | 通常使用固定大小的内存空间             | 累积函数调用可能使用大量的栈帧空间                           |
| 适用问题 | 适用于简单循环任务，代码直观、可读性好 | 适用于子问题分解，如树、图、分治、回溯等，代码结构简洁、清晰 |

</div>

!!! tip

    如果感觉以下内容理解困难，可以在读完“栈”章节后再来复习。

那么，迭代和递归具有什么内在联系呢？以上述递归函数为例，求和操作在递归的“归”阶段进行。这意味着最初被调用的函数实际上是最后完成其求和操作的，**这种工作机制与栈的“先入后出”原则异曲同工**。

事实上，“调用栈”和“栈帧空间”这类递归术语已经暗示了递归与栈之间的密切关系。

1. **递**：当函数被调用时，系统会在“调用栈”上为该函数分配新的栈帧，用于存储函数的局部变量、参数、返回地址等数据。
2. **归**：当函数完成执行并返回时，对应的栈帧会被从“调用栈”上移除，恢复之前函数的执行环境。

因此，**我们可以使用一个显式的栈来模拟调用栈的行为**，从而将递归转化为迭代形式：

=== "Python"

    ```python title="recursion.py"
    def for_loop_recur(n: int) -> int:
        """使用迭代模拟递归"""
        # 使用一个显式的栈来模拟系统调用栈
        stack = []
        res = 0
        # 递：递归调用
        for i in range(n, 0, -1):
            # 通过“入栈操作”模拟“递”
            stack.append(i)
        # 归：返回结果
        while stack:
            # 通过“出栈操作”模拟“归”
            res += stack.pop()
        # res = 1+2+3+...+n
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 使用迭代模拟递归 */
    int forLoopRecur(int n) {
        // 使用一个显式的栈来模拟系统调用栈
        stack<int> stack;
        int res = 0;
        // 递：递归调用
        for (int i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack.push(i);
        }
        // 归：返回结果
        while (!stack.empty()) {
            // 通过“出栈操作”模拟“归”
            res += stack.top();
            stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 使用迭代模拟递归 */
    int forLoopRecur(int n) {
        // 使用一个显式的栈来模拟系统调用栈
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // 递：递归调用
        for (int i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack.push(i);
        }
        // 归：返回结果
        while (!stack.isEmpty()) {
            // 通过“出栈操作”模拟“归”
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 使用迭代模拟递归 */
    int ForLoopRecur(int n) {
        // 使用一个显式的栈来模拟系统调用栈
        Stack<int> stack = new();
        int res = 0;
        // 递：递归调用
        for (int i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack.Push(i);
        }
        // 归：返回结果
        while (stack.Count > 0) {
            // 通过“出栈操作”模拟“归”
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 使用迭代模拟递归 */
    func forLoopRecur(n int) int {
        // 使用一个显式的栈来模拟系统调用栈
        stack := list.New()
        res := 0
        // 递：递归调用
        for i := n; i > 0; i-- {
            // 通过“入栈操作”模拟“递”
            stack.PushBack(i)
        }
        // 归：返回结果
        for stack.Len() != 0 {
            // 通过“出栈操作”模拟“归”
            res += stack.Back().Value.(int)
            stack.Remove(stack.Back())
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 使用迭代模拟递归 */
    func forLoopRecur(n: Int) -> Int {
        // 使用一个显式的栈来模拟系统调用栈
        var stack: [Int] = []
        var res = 0
        // 递：递归调用
        for i in (1 ... n).reversed() {
            // 通过“入栈操作”模拟“递”
            stack.append(i)
        }
        // 归：返回结果
        while !stack.isEmpty {
            // 通过“出栈操作”模拟“归”
            res += stack.removeLast()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 使用迭代模拟递归 */
    function forLoopRecur(n) {
        // 使用一个显式的栈来模拟系统调用栈
        const stack = [];
        let res = 0;
        // 递：递归调用
        for (let i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack.push(i);
        }
        // 归：返回结果
        while (stack.length) {
            // 通过“出栈操作”模拟“归”
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 使用迭代模拟递归 */
    function forLoopRecur(n: number): number {
        // 使用一个显式的栈来模拟系统调用栈 
        const stack: number[] = [];
        let res: number = 0;
        // 递：递归调用
        for (let i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack.push(i);
        }
        // 归：返回结果
        while (stack.length) {
            // 通过“出栈操作”模拟“归”
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 使用迭代模拟递归 */
    int forLoopRecur(int n) {
      // 使用一个显式的栈来模拟系统调用栈
      List<int> stack = [];
      int res = 0;
      // 递：递归调用
      for (int i = n; i > 0; i--) {
        // 通过“入栈操作”模拟“递”
        stack.add(i);
      }
      // 归：返回结果
      while (!stack.isEmpty) {
        // 通过“出栈操作”模拟“归”
        res += stack.removeLast();
      }
      // res = 1+2+3+...+n
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 使用迭代模拟递归 */
    fn for_loop_recur(n: i32) -> i32 {
        // 使用一个显式的栈来模拟系统调用栈
        let mut stack = Vec::new();
        let mut res = 0;
        // 递：递归调用
        for i in (1..=n).rev() {
            // 通过“入栈操作”模拟“递”
            stack.push(i);
        }
        // 归：返回结果
        while !stack.is_empty() {
            // 通过“出栈操作”模拟“归”
            res += stack.pop().unwrap();
        }
        // res = 1+2+3+...+n
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 使用迭代模拟递归 */
    int forLoopRecur(int n) {
        int stack[1000]; // 借助一个大数组来模拟栈
        int top = -1;    // 栈顶索引
        int res = 0;
        // 递：递归调用
        for (int i = n; i > 0; i--) {
            // 通过“入栈操作”模拟“递”
            stack[1 + top++] = i;
        }
        // 归：返回结果
        while (top >= 0) {
            // 通过“出栈操作”模拟“归”
            res += stack[top--];
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 使用迭代模拟递归 */
    fun forLoopRecur(n: Int): Int {
        // 使用一个显式的栈来模拟系统调用栈
        val stack = Stack<Int>()
        var res = 0
        // 递: 递归调用
        for (i in n downTo 0) {
            stack.push(i)
        }
        // 归: 返回结果
        while (stack.isNotEmpty()) {
            // 通过“出栈操作”模拟“归”
            res += stack.pop()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Zig"

    ```zig title="recursion.zig"
    // 使用迭代模拟递归
    fn forLoopRecur(comptime n: i32) i32 {
        // 使用一个显式的栈来模拟系统调用栈
        var stack: [n]i32 = undefined;
        var res: i32 = 0;
        // 递：递归调用
        var i: usize = n;
        while (i > 0) {
            stack[i - 1] = @intCast(i);
            i -= 1;
        }
        // 归：返回结果
        var index: usize = n;
        while (index > 0) {
            index -= 1;
            res += stack[index];
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E4%B8%80%E4%B8%AA%E6%98%BE%E5%BC%8F%E7%9A%84%E6%A0%88%E6%9D%A5%E6%A8%A1%E6%8B%9F%E7%B3%BB%E7%BB%9F%E8%B0%83%E7%94%A8%E6%A0%88%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%85%A5%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E9%80%92%E2%80%9D%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%87%BA%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E5%BD%92%E2%80%9D%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E4%B8%80%E4%B8%AA%E6%98%BE%E5%BC%8F%E7%9A%84%E6%A0%88%E6%9D%A5%E6%A8%A1%E6%8B%9F%E7%B3%BB%E7%BB%9F%E8%B0%83%E7%94%A8%E6%A0%88%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%85%A5%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E9%80%92%E2%80%9D%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%87%BA%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E5%BD%92%E2%80%9D%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

观察以上代码，当递归转化为迭代后，代码变得更加复杂了。尽管迭代和递归在很多情况下可以互相转化，但不一定值得这样做，有以下两点原因。

- 转化后的代码可能更加难以理解，可读性更差。
- 对于某些复杂问题，模拟系统调用栈的行为可能非常困难。

总之，**选择迭代还是递归取决于特定问题的性质**。在编程实践中，权衡两者的优劣并根据情境选择合适的方法至关重要。
