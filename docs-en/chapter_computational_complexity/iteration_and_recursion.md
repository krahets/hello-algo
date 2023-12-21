---
comments: true
---

# 2.2 &nbsp; Iteration vs. Recursion

In data structures and algorithms, it is common to repeat a task, which is closely related to the complexity of the algorithm. There are two basic program structures that we usually use to repeat a task: iteration and recursion.

## 2.2.1 &nbsp; Iteration

An "iteration iteration" is a control structure that repeats a task. In iteration, a program repeats the execution of a piece of code until the condition is no longer satisfied.

### 1. &nbsp; For Loops

`for` loops are one of the most common forms of iteration, **suitable when the number of iterations is known in advance**.

The following function implements the summation $1 + 2 + \dots + n$ based on a `for` loop, and the result is recorded using the variable `res`. Note that `range(a, b)` in Python corresponds to a "left-closed-right-open" interval, which is traversed in the range $a, a + 1, \dots, b-1$.

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

The Figure 2-1  shows the flow block diagram of this summation function.

![Flow block diagram of the summation function](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-1 &nbsp; Flow block diagram of the summation function </p>

The number of operations in this summation function is proportional to the size of the input data $n$, or a "linear relationship". In fact, **time complexity describes this "linear relationship"**. This is described in more detail in the next section.

### 2. &nbsp; While Loop

Similar to a `for` loop, a `while` loop is a way to implement iteration. In a `while` loop, the program first checks the condition at each turn, and if the condition is true, it continues, otherwise it ends the loop.

Below, we use a `while` loop to realize the summation $1 + 2 + \dots + n$ .

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

In `while` loops, since the steps of initializing and updating condition variables are independent of the loop structure, **it has more degrees of freedom than `for` loops**.

For example, in the following code, the condition variable $i$ is updated twice per round, which is not convenient to implement with a `for` loop.

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
        // 循环求和 1, 2, 4, 5...
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

Overall, **`for` loops have more compact code and `while` loops are more flexible**, and both can implement iteration structures. The choice of which one to use should be based on the needs of the particular problem.

### 3. &nbsp; Nested Loops

We can nest one loop structure inside another, using the `for` loop as an example:

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

The Figure 2-2  gives the block diagram of the flow of this nested loop.

![Block diagram of the flow of nested loops](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> Figure 2-2 &nbsp; Block diagram of the flow of nested loops </p>

In this case, the number of operations of the function is proportional to $n^2$, or the algorithm's running time is "squared" to the size of the input data $n$.

We can continue to add nested loops, and each nest is a "dimension up", which will increase the time complexity to "cubic relations", "quadratic relations", and so on.

## 2.2.2 &nbsp; Recursion

 "Recursion recursion is an algorithmic strategy to solve a problem by calling the function itself. It consists of two main phases.

1. **recursive**: the program calls itself deeper and deeper, usually passing smaller or simpler arguments, until a "termination condition" is reached.
2. **Recursion**: After the "termination condition" is triggered, the program returns from the deepest level of the recursion function, level by level, aggregating the results of each level.

And from an implementation point of view, recursion code contains three main elements.

1. **Termination condition**: used to decide when to switch from "recursive" to "inductive".
2. **Recursion call**: corresponds to "recursion", where the function calls itself, usually with smaller or more simplified input parameters.
3. **return result**: corresponds to "return", returning the result of the current recursion level to the previous one.

Observe the following code, we only need to call the function `recur(n)` , and the calculation of $1 + 2 + \dots + n$ is done:

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

The Figure 2-3  shows the recursion of the function.

![Recursion process for the summation function](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-3 &nbsp; Recursion process for the summation function </p>

Although iteration and recursion can yield the same results from a computational point of view, **they represent two completely different paradigms for thinking about and solving problems**.

- **Iteration**: solving problems "from the bottom up". Start with the most basic steps and repeat or add to them until the task is completed.
- **Recursion**: solving problems "from the top down". The original problem is broken down into smaller subproblems that have the same form as the original problem. Next, the subproblem continues to be broken down into smaller subproblems until it stops at the base case (the solution to the base case is known).

As an example of the above summation function, set the problem $f(n) = 1 + 2 + \dots + n$ .

- **Iteration**: the summation process is simulated in a loop, iterating from $1$ to $n$ and executing the summation operation in each round to find $f(n)$.
- **Recursion**: decompose the problem into subproblems $f(n) = n + f(n-1)$ and keep (recursively) decomposing until the base case $f(1) = 1$ terminates.

### 1. &nbsp; Call The Stack

Each time a recursion function calls itself, the system allocates memory for the newly opened function to store local variables, call addresses, other information, and so on. This results in two things.

- The context data for a function is stored in an area of memory called "stack frame space" and is not freed until the function returns. As a result, **recursion is usually more memory-intensive than iteration**.
- Recursion calls to functions incur additional overhead. **Therefore recursion is usually less time efficient than loops**.

As shown in the Figure 2-4 , before the termination condition is triggered, there are $n$ unreturned recursion functions at the same time, **with a recursion depth of $n$** .

![Recursion call depth](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> Figure 2-4 &nbsp; Recursion call depth </p>

In practice, the depth of recursion allowed by a programming language is usually limited, and too deep a recursion may result in a stack overflow error.

### 2. &nbsp; Tail Recursion

Interestingly, **if a function makes a recursion call only at the last step before returning**, the function can be optimized by the compiler or interpreter to be comparable to iteration in terms of space efficiency. This situation is called "tail recursion tail recursion".

- **Ordinary recursion**: when a function returns to a function at a higher level, it needs to continue executing the code, so the system needs to save the context of the previous call.
- **tail recursion**: the recursion call is the last operation before the function returns, which means that the function does not need to continue with other operations after returning to the previous level, so the system does not need to save the context of the previous function.

In the case of calculating $1 + 2 + \dots + n$, for example, we can implement tail recursion by setting the result variable `res` as a function parameter.

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

The execution of tail recursion is shown in the Figure 2-5 . Comparing normal recursion and tail recursion, the execution point of the summation operation is different.

- **Ordinary recursion**: the summing operation is performed during the "return" process, and the summing operation is performed again after returning from each level.
- **Tail recursion**: the summing operation is performed in a "recursion" process, the "recursion" process simply returns in levels.

![tail recursion process](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> Figure 2-5 &nbsp; tail recursion process </p>

!!! tip

    Note that many compilers or interpreters do not support tail recursion optimization. For example, Python does not support tail recursion optimization by default, so even if a function is tail recursive, you may still encounter stack overflow problems.

### 3. &nbsp; Recursion Tree

When dealing with algorithmic problems related to divide and conquer, recursion is often more intuitive and easier to read than iteration. Take the Fibonacci sequence as an example.

!!! question

    Given a Fibonacci series $0, 1, 1, 2, 3, 5, 8, 13, \dots$ , find the $n$th number of the series.

Let the $n$th number of the Fibonacci series be $f(n)$ , which leads to two easy conclusions.

- The first two numbers of the series are $f(1) = 0$ and $f(2) = 1$.
- Each number in the series is the sum of the previous two numbers, i.e. $f(n) = f(n - 1) + f(n - 2)$ .

Recursion code can be written by making recursion calls according to the recursion relationship, using the first two numbers as termination conditions. Call `fib(n)` to get the $n$th number of the Fibonacci series.

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

Looking at the above code, we have recursively called two functions within a function, **this means that from one call, two call branches are created**. As shown in the Figure 2-6 , this recursion will result in a recursion tree with the number of levels $n$.

![Recursion tree for Fibonacci series](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> Figure 2-6 &nbsp; Recursion tree for Fibonacci series </p>

Essentially, recursion embodies the paradigm of "breaking down a problem into smaller sub-problems", and this divide and conquer strategy is essential.

- From an algorithmic point of view, many important algorithmic strategies such as searching, sorting algorithm, backtracking, divide and conquer, dynamic programming, etc. directly or indirectly apply this way of thinking.
- From a data structure point of view, recursion is naturally suited to problems related to linked lists, trees and graphs because they are well suited to be analyzed with the idea of partitioning.

## 2.2.3 &nbsp; Compare The Two

To summarize the above, as shown in the Table 2-1 , iteration and recursion differ in implementation, performance and applicability.

<p align="center"> Table 2-1 &nbsp; Comparison of iteration and recursion features </p>

<div class="center-table" markdown>

|                     | iteration                                               | recursion                                                                                                                             |
| ------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| implementation      | circular structure                                      | function call itself                                                                                                                  |
| time-efficient      | typically efficient, no function call overhead          | overhead on every function call                                                                                                       |
| Memory Usage        | Usually uses a fixed size of memory space               | Cumulative function calls may use a lot of stack frame space                                                                          |
| Applicable Problems | For simple cyclic tasks, code is intuitive and readable | For sub-problem decomposition, such as trees, graphs, divide and conquer, backtracking, etc., the code structure is concise and clear |

</div>

!!! tip

    If you find the following solutions difficult to understand, you can review them after reading the "Stack" chapter.

So what is the intrinsic connection between iteration and recursion? In the case of the recursive function described above, the summing operation takes place in the "return" phase of the recursion. This means that the function that is initially called is actually the last to complete its summing operation, **This mechanism works in the same way as the stack's "first in, last out" principle**.

In fact, recursion terms like "call stack" and "stack frame space" already imply a close relationship between recursion and the stack.

1. **Recursive**: When a function is called, the system allocates a new stack frame on the "call stack" for the function, which is used to store the function's local variables, parameters, return address, and other data.
2. **Return to**: When a function completes execution and returns, the corresponding stack frame is removed from the "call stack", restoring the function's previous execution environment.

Thus, **we can use an explicit stack to model the behavior of the call stack**, thus transforming recursion into an iteration form:

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
        for i in stride(from: n, to: 0, by: -1) {
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
        for (let i = 1; i <= n; i++) {
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
        for (let i = 1; i <= n; i++) {
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

Observing the code above, it becomes more complex when recursion is converted to iteration. Although iteration and recursion can be converted to each other in many cases, it is not always worth doing so for two reasons.

- The transformed code may be more difficult to understand and less readable.
- For some complex problems, simulating the behavior of the system call stack can be very difficult.

In short, **the choice of iteration or recursion depends on the nature of the particular problem**. In programming practice, it is crucial to weigh the advantages and disadvantages of both and choose the appropriate method based on the context.
