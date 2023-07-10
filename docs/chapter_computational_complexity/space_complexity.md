# 空间复杂度

「空间复杂度 Space Complexity」用于衡量算法使用内存空间随着数据量变大时的增长趋势。这个概念与时间复杂度非常类似。

## 算法相关空间

算法运行过程中使用的内存空间主要包括以下几种：

- 「输入空间」用于存储算法的输入数据；
- 「暂存空间」用于存储算法运行过程中的变量、对象、函数上下文等数据；
- 「输出空间」用于存储算法的输出数据；

通常情况下，空间复杂度统计范围是「暂存空间」+「输出空间」。

暂存空间可以进一步划分为三个部分：

- 「暂存数据」用于保存算法运行过程中的各种常量、变量、对象等。
- 「栈帧空间」用于保存调用函数的上下文数据。系统在每次调用函数时都会在栈顶部创建一个栈帧，函数返回后，栈帧空间会被释放。
- 「指令空间」用于保存编译后的程序指令，在实际统计中通常忽略不计。

因此，在分析一段程序的空间复杂度时，我们一般统计 **暂存数据、输出数据、栈帧空间** 三部分。

![算法使用的相关空间](space_complexity.assets/space_types.png)

=== "Java"

    ```java title=""
    /* 类 */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }
    
    /* 函数 */
    int function() {
        // do something...
        return 0;
    }
    
    int algorithm(int n) {        // 输入数据
        final int a = 0;          // 暂存数据（常量）
        int b = 0;                // 暂存数据（变量）
        Node node = new Node(0);  // 暂存数据（对象）
        int c = function();       // 栈帧空间（调用函数）
        return a + b + c;         // 输出数据
    }
    ```

=== "C++"

    ```cpp title=""
    /* 结构体 */
    struct Node {
        int val;
        Node *next;
        Node(int x) : val(x), next(nullptr) {}
    };

    /* 函数 */
    int func() {
        // do something...
        return 0;
    }

    int algorithm(int n) {        // 输入数据
        const int a = 0;          // 暂存数据（常量）
        int b = 0;                // 暂存数据（变量）
        Node* node = new Node(0); // 暂存数据（对象）
        int c = func();           // 栈帧空间（调用函数）
        return a + b + c;         // 输出数据
    }
    ```

=== "Python"

    ```python title=""
    class Node:
        """类"""
        def __init__(self, x: int):
            self.val: int = x                 # 节点值
            self.next: Optional[Node] = None  # 指向下一节点的指针（引用）

    def function() -> int:
        """函数"""
        # do something...
        return 0

    def algorithm(n) -> int:  # 输入数据
        A = 0                 # 暂存数据（常量，一般用大写字母表示）
        b = 0                 # 暂存数据（变量）
        node = Node(0)        # 暂存数据（对象）
        c = function()        # 栈帧空间（调用函数）
        return A + b + c      # 输出数据
    ```

=== "Go"

    ```go title=""
    /* 结构体 */
    type node struct {
        val  int
        next *node
    }

    /* 创建 node 结构体  */
    func newNode(val int) *node {
        return &node{val: val}
    }
    
    /* 函数 */
    func function() int {
        // do something...
        return 0
    }

    func algorithm(n int) int { // 输入数据
        const a = 0             // 暂存数据（常量）
        b := 0                  // 暂存数据（变量）
        newNode(0)              // 暂存数据（对象）
        c := function()         // 栈帧空间（调用函数）
        return a + b + c        // 输出数据
    }
    ```

=== "JavaScript"

    ```javascript title=""
    /* 类 */
    class Node {
        val;
        next;
        constructor(val) {
            this.val = val === undefined ? 0 : val; // 节点值
            this.next = null;                       // 指向下一节点的引用
        }
    }

    /* 函数 */
    function constFunc() {
        // do something
        return 0;
    }

    function algorithm(n) {       // 输入数据
        const a = 0;              // 暂存数据（常量）
        let b = 0;                // 暂存数据（变量）
        const node = new Node(0); // 暂存数据（对象）
        const c = constFunc();    // 栈帧空间（调用函数）
        return a + b + c;         // 输出数据
    }
    ```

=== "TypeScript"

    ```typescript title=""
    /* 类 */
    class Node {
        val: number;
        next: Node | null;
        constructor(val?: number) {
            this.val = val === undefined ? 0 : val; // 节点值
            this.next = null;                       // 指向下一节点的引用
        }
    }

    /* 函数 */
    function constFunc(): number {
        // do something
        return 0;
    }

    function algorithm(n: number): number { // 输入数据
        const a = 0;                        // 暂存数据（常量）
        let b = 0;                          // 暂存数据（变量）
        const node = new Node(0);           // 暂存数据（对象）
        const c = constFunc();              // 栈帧空间（调用函数）
        return a + b + c;                   // 输出数据
    }
    ```

=== "C"

    ```c title=""
    /* 函数 */
    int func() {
        // do something...
        return 0;
    }

    int algorithm(int n) { // 输入数据
        const int a = 0;   // 暂存数据（常量）
        int b = 0;         // 暂存数据（变量）
        int c = func();    // 栈帧空间（调用函数）
        return a + b + c;  // 输出数据
    }
    ```

=== "C#"

    ```csharp title=""
    /* 类 */
    class Node
    {
        int val;
        Node next;
        Node(int x) { val = x; }
    }

    /* 函数 */
    int function()
    {
        // do something...
        return 0;
    }

    int algorithm(int n)          // 输入数据
    {
        const int a = 0;          // 暂存数据（常量）
        int b = 0;                // 暂存数据（变量）
        Node node = new Node(0);  // 暂存数据（对象）
        int c = function();       // 栈帧空间（调用函数）
        return a + b + c;         // 输出数据
    }
    ```

=== "Swift"

    ```swift title=""
    /* 类 */
    class Node {
        var val: Int
        var next: Node?

        init(x: Int) {
            val = x
        }
    }

    /* 函数 */
    func function() -> Int {
        // do something...
        return 0
    }

    func algorithm(n: Int) -> Int { // 输入数据
        let a = 0             // 暂存数据（常量）
        var b = 0             // 暂存数据（变量）
        let node = Node(x: 0) // 暂存数据（对象）
        let c = function()    // 栈帧空间（调用函数）
        return a + b + c      // 输出数据
    }
    ```

=== "Zig"

    ```zig title=""

    ```

=== "Dart"

    ```dart title=""
    /* 类 */
    class Node {
      int val;
      Node next;
      Node(this.val, [this.next]);
    }

    /* 函数 */
    int function() {
      // do something...
      return 0;
    }

    int algorithm(int n) {  // 输入数据
      const int a = 0;      // 暂存数据（常量）
      int b = 0;            // 暂存数据（变量）
      Node node = Node(0);  // 暂存数据（对象）
      int c = function();   // 栈帧空间（调用函数）
      return a + b + c;     // 输出数据
    }
    ```

## 推算方法

空间复杂度的推算方法与时间复杂度大致相同，只是将统计对象从“计算操作数量”转为“使用空间大小”。与时间复杂度不同的是，**我们通常只关注「最差空间复杂度」**，这是因为内存空间是一项硬性要求，我们必须确保在所有输入数据下都有足够的内存空间预留。

**最差空间复杂度中的“最差”有两层含义**，分别是输入数据的最差分布和算法运行过程中的最差时间点。

- **以最差输入数据为准**。当 $n < 10$ 时，空间复杂度为 $O(1)$ ；但当 $n > 10$ 时，初始化的数组 `nums` 占用 $O(n)$ 空间；因此最差空间复杂度为 $O(n)$ ；
- **以算法运行过程中的峰值内存为准**。例如，程序在执行最后一行之前，占用 $O(1)$ 空间；当初始化数组 `nums` 时，程序占用 $O(n)$ 空间；因此最差空间复杂度为 $O(n)$ ；

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 0;                   // O(1)
        int[] b = new int[10000];    // O(1)
        if (n > 10)
            int[] nums = new int[n]; // O(n)
    }
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 0;               // O(1)
        vector<int> b(10000);    // O(1)
        if (n > 10)
            vector<int> nums(n); // O(n)
    }
    ```

=== "Python"

    ```python title=""
    def algorithm(n: int) -> None:
        a = 0               # O(1)
        b = [0] * 10000     # O(1)
        if n > 10:
            nums = [0] * n  # O(n)
    ```

=== "Go"

    ```go title=""
    func algorithm(n int) {
        a := 0                      // O(1)
        b := make([]int, 10000)     // O(1)
        var nums []int
        if n > 10 {
            nums := make([]int, n)  // O(n)
        }
        fmt.Println(a, b, nums)
    }
    ```

=== "JavaScript"

    ```javascript title=""
    function algorithm(n) {
        const a = 0;                   // O(1)
        const b = new Array(10000);    // O(1)
        if (n > 10) {
            const nums = new Array(n); // O(n)
        }
    }
    ```

=== "TypeScript"

    ```typescript title=""
    function algorithm(n: number): void {
        const a = 0;                   // O(1)
        const b = new Array(10000);    // O(1)
        if (n > 10) {
            const nums = new Array(n); // O(n)
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 0;               // O(1)
        int b[10000];            // O(1)
        if (n > 10)
            vector<int> nums(n); // O(n)
    }
    ```

=== "C#"

    ```csharp title=""
    void algorithm(int n)
    {
        int a = 0;                   // O(1)
        int[] b = new int[10000];    // O(1)
        if (n > 10)
        {
            int[] nums = new int[n]; // O(n)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    func algorithm(n: Int) {
        let a = 0 // O(1)
        let b = Array(repeating: 0, count: 10000) // O(1)
        if n > 10 {
            let nums = Array(repeating: 0, count: n) // O(n)
        }
    }
    ```

=== "Zig"

    ```zig title=""

    ```

=== "Dart"

    ```dart title=""
    void algorithm(int n) {
      int a = 0;                            // O(1)
      List<int> b = List.filled(10000, 0);  // O(1)
      if (n > 10) {
        List<int> nums = List.filled(n, 0); // O(n)
      }
    }
    ```

**在递归函数中，需要注意统计栈帧空间**。例如，函数 `loop()` 在循环中调用了 $n$ 次 `function()` ，每轮中的 `function()` 都返回并释放了栈帧空间，因此空间复杂度仍为 $O(1)$ 。而递归函数 `recur()` 在运行过程中会同时存在 $n$ 个未返回的 `recur()` ，从而占用 $O(n)$ 的栈帧空间。

=== "Java"

    ```java title=""
    int function() {
        // do something
        return 0;
    }
    /* 循环 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* 递归 O(n) */
    void recur(int n) {
        if (n == 1) return;
        return recur(n - 1);
    }
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // do something
        return 0;
    }
    /* 循环 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 递归 O(n) */
    void recur(int n) {
        if (n == 1) return;
        return recur(n - 1);
    }
    ```

=== "Python"

    ```python title=""
    def function() -> int:
        # do something
        return 0

    def loop(n: int) -> None:
        """循环 O(1)"""
        for _ in range(n):
            function()

    def recur(n: int) -> int:
        """递归 O(n)"""
        if n == 1: return
        return recur(n - 1)
    ```

=== "Go"

    ```go title=""
    func function() int {
        // do something
        return 0
    }
    
    /* 循环 O(1) */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
    
    /* 递归 O(n) */
    func recur(n int) {
        if n == 1 {
            return
        }
        recur(n - 1)
    }
    ```

=== "JavaScript"

    ```javascript title=""
    function constFunc() {
        // do something
        return 0;
    }
    /* 循环 O(1) */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 递归 O(n) */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TypeScript"

    ```typescript title=""
    function constFunc(): number {
        // do something
        return 0;
    }
    /* 循环 O(1) */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 递归 O(n) */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "C"

    ```c title=""
    int func() {
        // do something
        return 0;
    }
    /* 循环 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 递归 O(n) */
    void recur(int n) {
        if (n == 1) return;
        return recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int function()
    {
        // do something
        return 0;
    }
    /* 循环 O(1) */
    void loop(int n)
    {
        for (int i = 0; i < n; i++)
        {
            function();
        }
    }
    /* 递归 O(n) */
    int recur(int n)
    {
        if (n == 1) return 1;
        return recur(n - 1);
    }
    ```

=== "Swift"

    ```swift title=""
    @discardableResult
    func function() -> Int {
        // do something
        return 0
    }

    /* 循环 O(1) */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* 递归 O(n) */
    func recur(n: Int) {
        if n == 1 {
            return
        }
        recur(n: n - 1)
    }
    ```

=== "Zig"

    ```zig title=""

    ```

=== "Dart"

    ```dart title=""
    int function() {
      // do something
      return 0;
    }
    /* 循环 O(1) */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* 递归 O(n) */
    void recur(int n) {
      if (n == 1) return;
      return recur(n - 1);
    }
    ```

## 常见类型

设输入数据大小为 $n$ ，常见的空间复杂度类型有（从低到高排列）

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
\text{常数阶} < \text{对数阶} < \text{线性阶} < \text{平方阶} < \text{指数阶}
\end{aligned}
$$

![空间复杂度的常见类型](space_complexity.assets/space_complexity_common_types.png)

!!! tip

    部分示例代码需要一些前置知识，包括数组、链表、二叉树、递归算法等。如果遇到看不懂的地方无需担心，可以在学习完后面章节后再来复习，现阶段我们先专注于理解空间复杂度的含义和推算方法。

### 常数阶 $O(1)$

常数阶常见于数量与输入数据大小 $n$ 无关的常量、变量、对象。

需要注意的是，在循环中初始化变量或调用函数而占用的内存，在进入下一循环后就会被释放，即不会累积占用空间，空间复杂度仍为 $O(1)$ 。

=== "Java"

    ```java title="space_complexity.java"
    [class]{space_complexity}-[func]{constant}
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    [class]{}-[func]{constant}
    ```

=== "Python"

    ```python title="space_complexity.py"
    [class]{}-[func]{constant}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceConstant}
    ```

=== "JavaScript"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{constant}
    ```

=== "TypeScript"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{constant}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{constant}
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{constant}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{constant}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{constant}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{constant}
    ```

### 线性阶 $O(n)$

线性阶常见于元素数量与 $n$ 成正比的数组、链表、栈、队列等。

=== "Java"

    ```java title="space_complexity.java"
    [class]{space_complexity}-[func]{linear}
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    [class]{}-[func]{linear}
    ```

=== "Python"

    ```python title="space_complexity.py"
    [class]{}-[func]{linear}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceLinear}
    ```

=== "JavaScript"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{linear}
    ```

=== "TypeScript"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{linear}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{hashTable}-[func]{}

    [class]{}-[func]{linear}
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{linear}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{linear}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{linear}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{linear}
    ```

以下递归函数会同时存在 $n$ 个未返回的 `algorithm()` 函数，使用 $O(n)$ 大小的栈帧空间。

=== "Java"

    ```java title="space_complexity.java"
    [class]{space_complexity}-[func]{linearRecur}
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    [class]{}-[func]{linearRecur}
    ```

=== "Python"

    ```python title="space_complexity.py"
    [class]{}-[func]{linear_recur}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceLinearRecur}
    ```

=== "JavaScript"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{linearRecur}
    ```

=== "TypeScript"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{linearRecur}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{linearRecur}
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{linearRecur}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{linearRecur}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{linearRecur}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{linearRecur}
    ```

![递归函数产生的线性阶空间复杂度](space_complexity.assets/space_complexity_recursive_linear.png)

### 平方阶 $O(n^2)$

平方阶常见于矩阵和图，元素数量与 $n$ 成平方关系。

=== "Java"

    ```java title="space_complexity.java"
    [class]{space_complexity}-[func]{quadratic}
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    [class]{}-[func]{quadratic}
    ```

=== "Python"

    ```python title="space_complexity.py"
    [class]{}-[func]{quadratic}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceQuadratic}
    ```

=== "JavaScript"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{quadratic}
    ```

=== "TypeScript"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{quadratic}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{quadratic}
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{quadratic}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{quadratic}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{quadratic}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{quadratic}
    ```

在以下递归函数中，同时存在 $n$ 个未返回的 `algorithm()` ，并且每个函数中都初始化了一个数组，长度分别为 $n, n-1, n-2, ..., 2, 1$ ，平均长度为 $\frac{n}{2}$ ，因此总体占用 $O(n^2)$ 空间。

=== "Java"

    ```java title="space_complexity.java"
    [class]{space_complexity}-[func]{quadraticRecur}
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Python"

    ```python title="space_complexity.py"
    [class]{}-[func]{quadratic_recur}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceQuadraticRecur}
    ```

=== "JavaScript"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{quadraticRecur}
    ```

=== "TypeScript"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{quadraticRecur}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{quadraticRecur}
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{quadraticRecur}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{quadraticRecur}
    ```

![递归函数产生的平方阶空间复杂度](space_complexity.assets/space_complexity_recursive_quadratic.png)

### 指数阶 $O(2^n)$

指数阶常见于二叉树。高度为 $n$ 的「满二叉树」的节点数量为 $2^n - 1$ ，占用 $O(2^n)$ 空间。

=== "Java"

    ```java title="space_complexity.java"
    [class]{space_complexity}-[func]{buildTree}
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    [class]{}-[func]{buildTree}
    ```

=== "Python"

    ```python title="space_complexity.py"
    [class]{}-[func]{build_tree}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{buildTree}
    ```

=== "JavaScript"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{buildTree}
    ```

=== "TypeScript"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{buildTree}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{buildTree}
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{buildTree}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{buildTree}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{buildTree}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{buildTree}
    ```

![满二叉树产生的指数阶空间复杂度](space_complexity.assets/space_complexity_exponential.png)

### 对数阶 $O(\log n)$

对数阶常见于分治算法和数据类型转换等。

例如“归并排序”算法，输入长度为 $n$ 的数组，每轮递归将数组从中点划分为两半，形成高度为 $\log n$ 的递归树，使用 $O(\log n)$ 栈帧空间。

再例如“数字转化为字符串”，输入任意正整数 $n$ ，它的位数为 $\log_{10} n$ ，即对应字符串长度为 $\log_{10} n$ ，因此空间复杂度为 $O(\log_{10} n) = O(\log n)$ 。

## 权衡时间与空间

理想情况下，我们希望算法的时间复杂度和空间复杂度都能达到最优。然而在实际情况中，同时优化时间复杂度和空间复杂度通常是非常困难的。

**降低时间复杂度通常需要以提升空间复杂度为代价，反之亦然**。我们将牺牲内存空间来提升算法运行速度的思路称为“以空间换时间”；反之，则称为“以时间换空间”。

选择哪种思路取决于我们更看重哪个方面。在大多数情况下，时间比空间更宝贵，因此以空间换时间通常是更常用的策略。当然，在数据量很大的情况下，控制空间复杂度也是非常重要的。
