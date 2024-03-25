---
comments: true
---

# 2.2 &nbsp; Iteration and Recursion

In algorithms, the repeated execution of a task is quite common and is closely related to the analysis of complexity. Therefore, before delving into the concepts of time complexity and space complexity, let's first explore how to implement repetitive tasks in programming. This involves understanding two fundamental programming control structures: iteration and recursion.

## 2.2.1 &nbsp; Iteration

"Iteration" is a control structure for repeatedly performing a task. In iteration, a program repeats a block of code as long as a certain condition is met until this condition is no longer satisfied.

### 1. &nbsp; For Loops

The `for` loop is one of the most common forms of iteration, and **it's particularly suitable when the number of iterations is known in advance**.

The following function uses a `for` loop to perform a summation of $1 + 2 + \dots + n$, with the sum being stored in the variable `res`. It's important to note that in Python, `range(a, b)` creates an interval that is inclusive of `a` but exclusive of `b`, meaning it iterates over the range from $a$ up to $b−1$.

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

??? pythontutor "Code Visualization"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The flowchart below represents this sum function.

![Flowchart of the Sum Function](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-1 &nbsp; Flowchart of the Sum Function </p>

The number of operations in this summation function is proportional to the size of the input data $n$, or in other words, it has a "linear relationship." This "linear relationship" is what time complexity describes. This topic will be discussed in more detail in the next section.

### 2. &nbsp; While Loops

Similar to `for` loops, `while` loops are another approach for implementing iteration. In a `while` loop, the program checks a condition at the beginning of each iteration; if the condition is true, the execution continues, otherwise, the loop ends.

Below we use a `while` loop to implement the sum $1 + 2 + \dots + n$.

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

??? pythontutor "Code Visualization"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

**`While` loops provide more flexibility than `for` loops**, especially since they allow for custom initialization and modification of the condition variable at each step.

For example, in the following code, the condition variable $i$ is updated twice each round, which would be inconvenient to implement with a `for` loop.

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

??? pythontutor "Code Visualization"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%204,%2010,%20...%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20*%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%B1%82%E5%92%8C%201,%204,%2010,%20...%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9D%A1%E4%BB%B6%E5%8F%98%E9%87%8F%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20*%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E5%BE%AA%E7%8E%AF%EF%BC%88%E4%B8%A4%E6%AC%A1%E6%9B%B4%E6%96%B0%EF%BC%89%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Overall, **`for` loops are more concise, while `while` loops are more flexible**. Both can implement iterative structures. Which one to use should be determined based on the specific requirements of the problem.

### 3. &nbsp; Nested Loops

We can nest one loop structure within another. Below is an example using `for` loops:

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

??? pythontutor "Code Visualization"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20i%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20j%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E9%81%8D%E5%8E%86%E7%BB%93%E6%9E%9C%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20i%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%20j%20%3D%201,%202,%20...,%20n-1,%20n%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%8F%8C%E5%B1%82%20for%20%E5%BE%AA%E7%8E%AF%E7%9A%84%E9%81%8D%E5%8E%86%E7%BB%93%E6%9E%9C%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The flowchart below represents this nested loop.

![Flowchart of the Nested Loop](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-2 &nbsp; Flowchart of the Nested Loop </p>

In such cases, the number of operations of the function is proportional to $n^2$, meaning the algorithm's runtime and the size of the input data $n$ has a 'quadratic relationship.'

We can further increase the complexity by adding more nested loops, each level of nesting effectively "increasing the dimension," which raises the time complexity to "cubic," "quartic," and so on.

## 2.2.2 &nbsp; Recursion

"Recursion" is an algorithmic strategy where a function solves a problem by calling itself. It primarily involves two phases:

1. **Calling**: This is where the program repeatedly calls itself, often with progressively smaller or simpler arguments, moving towards the "termination condition."
2. **Returning**: Upon triggering the "termination condition," the program begins to return from the deepest recursive function, aggregating the results of each layer.

From an implementation perspective, recursive code mainly includes three elements.

1. **Termination Condition**: Determines when to switch from "calling" to "returning."
2. **Recursive Call**: Corresponds to "calling," where the function calls itself, usually with smaller or more simplified parameters.
3. **Return Result**: Corresponds to "returning," where the result of the current recursion level is returned to the previous layer.

Observe the following code, where simply calling the function `recur(n)` can compute the sum of $1 + 2 + \dots + n$:

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

??? pythontutor "Code Visualization"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The Figure 2-3  shows the recursive process of this function.

![Recursive Process of the Sum Function](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-3 &nbsp; Recursive Process of the Sum Function </p>

Although iteration and recursion can achieve the same results from a computational standpoint, **they represent two entirely different paradigms of thinking and problem-solving**.

- **Iteration**: Solves problems "from the bottom up." It starts with the most basic steps, and then repeatedly adds or accumulates these steps until the task is complete.
- **Recursion**: Solves problems "from the top down." It breaks down the original problem into smaller sub-problems, each of which has the same form as the original problem. These sub-problems are then further decomposed into even smaller sub-problems, stopping at the base case whose solution is known.

Let's take the earlier example of the summation function, defined as $f(n) = 1 + 2 + \dots + n$.

- **Iteration**: In this approach, we simulate the summation process within a loop. Starting from $1$ and traversing to $n$, we perform the summation operation in each iteration to eventually compute $f(n)$.
- **Recursion**: Here, the problem is broken down into a sub-problem: $f(n) = n + f(n-1)$. This decomposition continues recursively until reaching the base case, $f(1) = 1$, at which point the recursion terminates.

### 1. &nbsp; Call Stack

Every time a recursive function calls itself, the system allocates memory for the newly initiated function to store local variables, the return address, and other relevant information. This leads to two primary outcomes.

- The function's context data is stored in a memory area called "stack frame space" and is only released after the function returns. Therefore, **recursion generally consumes more memory space than iteration**.
- Recursive calls introduce additional overhead. **Hence, recursion is usually less time-efficient than loops.**

As shown in the Figure 2-4 , there are $n$ unreturned recursive functions before triggering the termination condition, indicating a **recursion depth of $n$**.

![Recursion Call Depth](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> Figure 2-4 &nbsp; Recursion Call Depth </p>

In practice, the depth of recursion allowed by programming languages is usually limited, and excessively deep recursion can lead to stack overflow errors.

### 2. &nbsp; Tail Recursion

Interestingly, **if a function performs its recursive call as the very last step before returning,** it can be optimized by the compiler or interpreter to be as space-efficient as iteration. This scenario is known as "tail recursion."

- **Regular Recursion**: In standard recursion, when the function returns to the previous level, it continues to execute more code, requiring the system to save the context of the previous call.
- **Tail Recursion**: Here, the recursive call is the final operation before the function returns. This means that upon returning to the previous level, no further actions are needed, so the system does not need to save the context of the previous level.

For example, in calculating $1 + 2 + \dots + n$, we can make the result variable `res` a parameter of the function, thereby achieving tail recursion:

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

??? pythontutor "Code Visualization"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%E5%B0%BE%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%E5%B0%BE%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%E5%B0%BE%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%E5%B0%BE%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%E5%B0%BE%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%E5%B0%BE%E9%80%92%E5%BD%92%E5%87%BD%E6%95%B0%E7%9A%84%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The execution process of tail recursion is shown in the following figure. Comparing regular recursion and tail recursion, the point of the summation operation is different.

- **Regular Recursion**: The summation operation occurs during the "returning" phase, requiring another summation after each layer returns.
- **Tail Recursion**: The summation operation occurs during the "calling" phase, and the "returning" phase only involves returning through each layer.

![Tail Recursion Process](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-5 &nbsp; Tail Recursion Process </p>

!!! tip

    Note that many compilers or interpreters do not support tail recursion optimization. For example, Python does not support tail recursion optimization by default, so even if the function is in the form of tail recursion, it may still encounter stack overflow issues.

### 3. &nbsp; Recursion Tree

When dealing with algorithms related to "divide and conquer", recursion often offers a more intuitive approach and more readable code than iteration. Take the "Fibonacci sequence" as an example.

!!! question

    Given a Fibonacci sequence $0, 1, 1, 2, 3, 5, 8, 13, \dots$, find the $n$th number in the sequence.

Let the $n$th number of the Fibonacci sequence be $f(n)$, it's easy to deduce two conclusions:

- The first two numbers of the sequence are $f(1) = 0$ and $f(2) = 1$.
- Each number in the sequence is the sum of the two preceding ones, that is, $f(n) = f(n - 1) + f(n - 2)$.

Using the recursive relation, and considering the first two numbers as termination conditions, we can write the recursive code. Calling `fib(n)` will yield the $n$th number of the Fibonacci sequence:

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

??? pythontutor "Code Visualization"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%EF%BC%9A%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%20f%28n%29%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%E7%9A%84%E7%AC%AC%20%7Bn%7D%20%E9%A1%B9%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%EF%BC%9A%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%20f%28n%29%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97%E7%9A%84%E7%AC%AC%20%7Bn%7D%20%E9%A1%B9%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Observing the above code, we see that it recursively calls two functions within itself, **meaning that one call generates two branching calls**. As illustrated below, this continuous recursive calling eventually creates a "recursion tree" with a depth of $n$.

![Fibonacci Sequence Recursion Tree](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> Figure 2-6 &nbsp; Fibonacci Sequence Recursion Tree </p>

Fundamentally, recursion embodies the paradigm of "breaking down a problem into smaller sub-problems." This divide-and-conquer strategy is crucial.

- From an algorithmic perspective, many important strategies like searching, sorting, backtracking, divide-and-conquer, and dynamic programming directly or indirectly use this way of thinking.
- From a data structure perspective, recursion is naturally suited for dealing with linked lists, trees, and graphs, as they are well suited for analysis using the divide-and-conquer approach.

## 2.2.3 &nbsp; Comparison

Summarizing the above content, the following table shows the differences between iteration and recursion in terms of implementation, performance, and applicability.

<p align="center"> Table: Comparison of Iteration and Recursion Characteristics </p>

<div class="center-table" markdown>

|                   | Iteration                                                   | Recursion                                                                                                                        |
| ----------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Approach          | Loop structure                                              | Function calls itself                                                                                                            |
| Time Efficiency   | Generally higher efficiency, no function call overhead      | Each function call generates overhead                                                                                            |
| Memory Usage      | Typically uses a fixed size of memory space                 | Accumulative function calls can use a substantial amount of stack frame space                                                    |
| Suitable Problems | Suitable for simple loop tasks, intuitive and readable code | Suitable for problem decomposition, like trees, graphs, divide-and-conquer, backtracking, etc., concise and clear code structure |

</div>

!!! tip

    If you find the following content difficult to understand, consider revisiting it after reading the "Stack" chapter.

So, what is the intrinsic connection between iteration and recursion? Taking the above recursive function as an example, the summation operation occurs during the recursion's "return" phase. This means that the initially called function is the last to complete its summation operation, **mirroring the "last in, first out" principle of a stack**.

Recursive terms like "call stack" and "stack frame space" hint at the close relationship between recursion and stacks.

1. **Calling**: When a function is called, the system allocates a new stack frame on the "call stack" for that function, storing local variables, parameters, return addresses, and other data.
2. **Returning**: When a function completes execution and returns, the corresponding stack frame is removed from the "call stack," restoring the execution environment of the previous function.

Therefore, **we can use an explicit stack to simulate the behavior of the call stack**, thus transforming recursion into an iterative form:

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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E4%B8%80%E4%B8%AA%E6%98%BE%E5%BC%8F%E7%9A%84%E6%A0%88%E6%9D%A5%E6%A8%A1%E6%8B%9F%E7%B3%BB%E7%BB%9F%E8%B0%83%E7%94%A8%E6%A0%88%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%85%A5%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E9%80%92%E2%80%9D%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%87%BA%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E5%BD%92%E2%80%9D%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%22%22%22%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E4%B8%80%E4%B8%AA%E6%98%BE%E5%BC%8F%E7%9A%84%E6%A0%88%E6%9D%A5%E6%A8%A1%E6%8B%9F%E7%B3%BB%E7%BB%9F%E8%B0%83%E7%94%A8%E6%A0%88%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E9%80%92%EF%BC%9A%E9%80%92%E5%BD%92%E8%B0%83%E7%94%A8%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%85%A5%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E9%80%92%E2%80%9D%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%E5%BD%92%EF%BC%9A%E8%BF%94%E5%9B%9E%E7%BB%93%E6%9E%9C%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E2%80%9C%E5%87%BA%E6%A0%88%E6%93%8D%E4%BD%9C%E2%80%9D%E6%A8%A1%E6%8B%9F%E2%80%9C%E5%BD%92%E2%80%9D%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E4%BD%BF%E7%94%A8%E8%BF%AD%E4%BB%A3%E6%A8%A1%E6%8B%9F%E9%80%92%E5%BD%92%E6%B1%82%E5%92%8C%E7%BB%93%E6%9E%9C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Observing the above code, when recursion is transformed into iteration, the code becomes more complex. Although iteration and recursion can often be transformed into each other, it's not always advisable to do so for two reasons:

- The transformed code may become more challenging to understand and less readable.
- For some complex problems, simulating the behavior of the system's call stack can be quite challenging.

In conclusion, **whether to choose iteration or recursion depends on the specific nature of the problem**. In programming practice, it's crucial to weigh the pros and cons of both and choose the most suitable approach for the situation at hand.
