---
comments: true
---

# 2.4 &nbsp; 空间复杂度

<u>空间复杂度（space complexity）</u>用于衡量算法占用内存空间随着数据量变大时的增长趋势。这个概念与时间复杂度非常类似，只需将“运行时间”替换为“占用内存空间”。

## 2.4.1 &nbsp; 算法相关空间

算法在运行过程中使用的内存空间主要包括以下几种。

- **输入空间**：用于存储算法的输入数据。
- **暂存空间**：用于存储算法在运行过程中的变量、对象、函数上下文等数据。
- **输出空间**：用于存储算法的输出数据。

一般情况下，空间复杂度的统计范围是“暂存空间”加上“输出空间”。

暂存空间可以进一步划分为三个部分。

- **暂存数据**：用于保存算法运行过程中的各种常量、变量、对象等。
- **栈帧空间**：用于保存调用函数的上下文数据。系统在每次调用函数时都会在栈顶部创建一个栈帧，函数返回后，栈帧空间会被释放。
- **指令空间**：用于保存编译后的程序指令，在实际统计中通常忽略不计。

在分析一段程序的空间复杂度时，**我们通常统计暂存数据、栈帧空间和输出数据三部分**，如图 2-15 所示。

![算法使用的相关空间](space_complexity.assets/space_types.png){ class="animation-figure" }

<p align="center"> 图 2-15 &nbsp; 算法使用的相关空间 </p>

相关代码如下：

=== "Python"

    ```python title=""
    class Node:
        """类"""
        def __init__(self, x: int):
            self.val: int = x              # 节点值
            self.next: Node | None = None  # 指向下一节点的引用

    def function() -> int:
        """函数"""
        # 执行某些操作...
        return 0

    def algorithm(n) -> int:  # 输入数据
        A = 0                 # 暂存数据（常量，一般用大写字母表示）
        b = 0                 # 暂存数据（变量）
        node = Node(0)        # 暂存数据（对象）
        c = function()        # 栈帧空间（调用函数）
        return A + b + c      # 输出数据
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
        // 执行某些操作...
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
        // 执行某些操作...
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

=== "C#"

    ```csharp title=""
    /* 类 */
    class Node(int x) {
        int val = x;
        Node next;
    }

    /* 函数 */
    int Function() {
        // 执行某些操作...
        return 0;
    }

    int Algorithm(int n) {        // 输入数据
        const int a = 0;          // 暂存数据（常量）
        int b = 0;                // 暂存数据（变量）
        Node node = new(0);       // 暂存数据（对象）
        int c = Function();       // 栈帧空间（调用函数）
        return a + b + c;         // 输出数据
    }
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
        // 执行某些操作...
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
        // 执行某些操作...
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

=== "JS"

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
        // 执行某些操作
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

=== "TS"

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
        // 执行某些操作
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
      // 执行某些操作...
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

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    
    /* 结构体 */
    struct Node {
        val: i32,
        next: Option<Rc<RefCell<Node>>>,
    }

    /* 创建 Node 结构体 */
    impl Node {
        fn new(val: i32) -> Self {
            Self { val: val, next: None }
        }
    }

    /* 函数 */
    fn function() -> i32 {      
        // 执行某些操作...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {       // 输入数据
        const a: i32 = 0;               // 暂存数据（常量）
        let mut b = 0;                  // 暂存数据（变量）
        let node = Node::new(0);        // 暂存数据（对象）
        let c = function();             // 栈帧空间（调用函数）
        return a + b + c;               // 输出数据
    }
    ```

=== "C"

    ```c title=""
    /* 函数 */
    int func() {
        // 执行某些操作...
        return 0;
    }

    int algorithm(int n) { // 输入数据
        const int a = 0;   // 暂存数据（常量）
        int b = 0;         // 暂存数据（变量）
        int c = func();    // 栈帧空间（调用函数）
        return a + b + c;  // 输出数据
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 类 */
    class Node(var _val: Int) {
        var next: Node? = null
    }

    /* 函数 */
    fun function(): Int {
        // 执行某些操作...
        return 0
    }

    fun algorithm(n: Int): Int { // 输入数据
        val a = 0                // 暂存数据（常量）
        var b = 0                // 暂存数据（变量）
        val node = Node(0)       // 暂存数据（对象）
        val c = function()       // 栈帧空间（调用函数）
        return a + b + c         // 输出数据
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### 类 ###
    class Node
        attr_accessor :val      # 节点值
        attr_accessor :next     # 指向下一节点的引用

        def initialize(x)
            @val = x
        end
    end

    ### 函数 ###
    def function
        # 执行某些操作...
        0
    end

    ### 算法 ###
    def algorithm(n)        # 输入数据
        a = 0               # 暂存数据（常量）
        b = 0               # 暂存数据（变量）
        node = Node.new(0)  # 暂存数据（对象）
        c = function        # 栈帧空间（调用函数）
        a + b + c           # 输出数据
    end
    ```

=== "Zig"

    ```zig title=""

    ```

## 2.4.2 &nbsp; 推算方法

空间复杂度的推算方法与时间复杂度大致相同，只需将统计对象从“操作数量”转为“使用空间大小”。

而与时间复杂度不同的是，**我们通常只关注最差空间复杂度**。这是因为内存空间是一项硬性要求，我们必须确保在所有输入数据下都有足够的内存空间预留。

观察以下代码，最差空间复杂度中的“最差”有两层含义。

1. **以最差输入数据为准**：当 $n < 10$ 时，空间复杂度为 $O(1)$ ；但当 $n > 10$ 时，初始化的数组 `nums` 占用 $O(n)$ 空间，因此最差空间复杂度为 $O(n)$ 。
2. **以算法运行中的峰值内存为准**：例如，程序在执行最后一行之前，占用 $O(1)$ 空间；当初始化数组 `nums` 时，程序占用 $O(n)$ 空间，因此最差空间复杂度为 $O(n)$ 。

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 0               # O(1)
        b = [0] * 10000     # O(1)
        if n > 10:
            nums = [0] * n  # O(n)
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

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 0;                   // O(1)
        int[] b = new int[10000];    // O(1)
        if (n > 10)
            int[] nums = new int[n]; // O(n)
    }
    ```

=== "C#"

    ```csharp title=""
    void Algorithm(int n) {
        int a = 0;                   // O(1)
        int[] b = new int[10000];    // O(1)
        if (n > 10) {
            int[] nums = new int[n]; // O(n)
        }
    }
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

=== "JS"

    ```javascript title=""
    function algorithm(n) {
        const a = 0;                   // O(1)
        const b = new Array(10000);    // O(1)
        if (n > 10) {
            const nums = new Array(n); // O(n)
        }
    }
    ```

=== "TS"

    ```typescript title=""
    function algorithm(n: number): void {
        const a = 0;                   // O(1)
        const b = new Array(10000);    // O(1)
        if (n > 10) {
            const nums = new Array(n); // O(n)
        }
    }
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

=== "Rust"

    ```rust title=""
    fn algorithm(n: i32) {
        let a = 0;                              // O(1)
        let b = [0; 10000];                     // O(1)
        if n > 10 {
            let nums = vec![0; n as usize];     // O(n)
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 0;               // O(1)
        int b[10000];            // O(1)
        if (n > 10)
            int nums[n] = {0};   // O(n)
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun algorithm(n: Int) {
        val a = 0                    // O(1)
        val b = IntArray(10000)      // O(1)
        if (n > 10) {
            val nums = IntArray(n)   // O(n)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    def algorithm(n)
        a = 0                           # O(1)
        b = Array.new(10000)            # O(1)
        nums = Array.new(n) if n > 10   # O(n)
    end
    ```

=== "Zig"

    ```zig title=""

    ```

**在递归函数中，需要注意统计栈帧空间**。观察以下代码：

=== "Python"

    ```python title=""
    def function() -> int:
        # 执行某些操作
        return 0

    def loop(n: int):
        """循环的空间复杂度为 O(1)"""
        for _ in range(n):
            function()

    def recur(n: int):
        """递归的空间复杂度为 O(n)"""
        if n == 1:
            return
        return recur(n - 1)
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Java"

    ```java title=""
    int function() {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int Function() {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    void Loop(int n) {
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    int Recur(int n) {
        if (n == 1) return 1;
        return Recur(n - 1);
    }
    ```

=== "Go"

    ```go title=""
    func function() int {
        // 执行某些操作
        return 0
    }
    
    /* 循环的空间复杂度为 O(1) */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
    
    /* 递归的空间复杂度为 O(n) */
    func recur(n int) {
        if n == 1 {
            return
        }
        recur(n - 1)
    }
    ```

=== "Swift"

    ```swift title=""
    @discardableResult
    func function() -> Int {
        // 执行某些操作
        return 0
    }

    /* 循环的空间复杂度为 O(1) */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* 递归的空间复杂度为 O(n) */
    func recur(n: Int) {
        if n == 1 {
            return
        }
        recur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title=""
    function constFunc() {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TS"

    ```typescript title=""
    function constFunc(): number {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "Dart"

    ```dart title=""
    int function() {
      // 执行某些操作
      return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* 递归的空间复杂度为 O(n) */
    void recur(int n) {
      if (n == 1) return;
      recur(n - 1);
    }
    ```

=== "Rust"

    ```rust title=""
    fn function() -> i32 {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    fn loop(n: i32) {
        for i in 0..n {
            function();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    fn recur(n: i32) {
        if n == 1 {
            return;
        }
        recur(n - 1);
    }
    ```

=== "C"

    ```c title=""
    int func() {
        // 执行某些操作
        return 0;
    }
    /* 循环的空间复杂度为 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 递归的空间复杂度为 O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun function(): Int {
        // 执行某些操作
        return 0
    }
    /* 循环的空间复杂度为 O(1) */
    fun loop(n: Int) {
        for (i in 0..<n) {
            function()
        }
    }
    /* 递归的空间复杂度为 O(n) */
    fun recur(n: Int) {
        if (n == 1) return
        return recur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title=""
    def function
        # 执行某些操作
        0
    end

    ### 循环的空间复杂度为 O(1) ###
    def loop(n)
        (0...n).each { function }
    end

    ### 递归的空间复杂度为 O(n) ###
    def recur(n)
        return if n == 1
        recur(n - 1)
    end
    ```

=== "Zig"

    ```zig title=""

    ```

函数 `loop()` 和 `recur()` 的时间复杂度都为 $O(n)$ ，但空间复杂度不同。

- 函数 `loop()` 在循环中调用了 $n$ 次 `function()` ，每轮中的 `function()` 都返回并释放了栈帧空间，因此空间复杂度仍为 $O(1)$ 。
- 递归函数 `recur()` 在运行过程中会同时存在 $n$ 个未返回的 `recur()` ，从而占用 $O(n)$ 的栈帧空间。

## 2.4.3 &nbsp; 常见类型

设输入数据大小为 $n$ ，图 2-16 展示了常见的空间复杂度类型（从低到高排列）。

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
\text{常数阶} < \text{对数阶} < \text{线性阶} < \text{平方阶} < \text{指数阶}
\end{aligned}
$$

![常见的空间复杂度类型](space_complexity.assets/space_complexity_common_types.png){ class="animation-figure" }

<p align="center"> 图 2-16 &nbsp; 常见的空间复杂度类型 </p>

### 1. &nbsp; 常数阶 $O(1)$ {data-toc-label="1. &nbsp; 常数阶"}

常数阶常见于数量与输入数据大小 $n$ 无关的常量、变量、对象。

需要注意的是，在循环中初始化变量或调用函数而占用的内存，在进入下一循环后就会被释放，因此不会累积占用空间，空间复杂度仍为 $O(1)$ ：

=== "Python"

    ```python title="space_complexity.py"
    def function() -> int:
        """函数"""
        # 执行某些操作
        return 0

    def constant(n: int):
        """常数阶"""
        # 常量、变量、对象占用 O(1) 空间
        a = 0
        nums = [0] * 10000
        node = ListNode(0)
        # 循环中的变量占用 O(1) 空间
        for _ in range(n):
            c = 0
        # 循环中的函数占用 O(1) 空间
        for _ in range(n):
            function()
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 函数 */
    int func() {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    void constant(int n) {
        // 常量、变量、对象占用 O(1) 空间
        const int a = 0;
        int b = 0;
        vector<int> nums(10000);
        ListNode node(0);
        // 循环中的变量占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 函数 */
    int function() {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    void constant(int n) {
        // 常量、变量、对象占用 O(1) 空间
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // 循环中的变量占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 函数 */
    int Function() {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    void Constant(int n) {
        // 常量、变量、对象占用 O(1) 空间
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // 循环中的变量占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 函数 */
    func function() int {
        // 执行某些操作...
        return 0
    }

    /* 常数阶 */
    func spaceConstant(n int) {
        // 常量、变量、对象占用 O(1) 空间
        const a = 0
        b := 0
        nums := make([]int, 10000)
        node := newNode(0)
        // 循环中的变量占用 O(1) 空间
        var c int
        for i := 0; i < n; i++ {
            c = 0
        }
        // 循环中的函数占用 O(1) 空间
        for i := 0; i < n; i++ {
            function()
        }
        b += 0
        c += 0
        nums[0] = 0
        node.val = 0
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 函数 */
    @discardableResult
    func function() -> Int {
        // 执行某些操作
        return 0
    }

    /* 常数阶 */
    func constant(n: Int) {
        // 常量、变量、对象占用 O(1) 空间
        let a = 0
        var b = 0
        let nums = Array(repeating: 0, count: 10000)
        let node = ListNode(x: 0)
        // 循环中的变量占用 O(1) 空间
        for _ in 0 ..< n {
            let c = 0
        }
        // 循环中的函数占用 O(1) 空间
        for _ in 0 ..< n {
            function()
        }
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 函数 */
    function constFunc() {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    function constant(n) {
        // 常量、变量、对象占用 O(1) 空间
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // 循环中的变量占用 O(1) 空间
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 函数 */
    function constFunc(): number {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    function constant(n: number): void {
        // 常量、变量、对象占用 O(1) 空间
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // 循环中的变量占用 O(1) 空间
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 函数 */
    int function() {
      // 执行某些操作
      return 0;
    }

    /* 常数阶 */
    void constant(int n) {
      // 常量、变量、对象占用 O(1) 空间
      final int a = 0;
      int b = 0;
      List<int> nums = List.filled(10000, 0);
      ListNode node = ListNode(0);
      // 循环中的变量占用 O(1) 空间
      for (var i = 0; i < n; i++) {
        int c = 0;
      }
      // 循环中的函数占用 O(1) 空间
      for (var i = 0; i < n; i++) {
        function();
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 函数 */
    fn function() -> i32 {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    #[allow(unused)]
    fn constant(n: i32) {
        // 常量、变量、对象占用 O(1) 空间
        const A: i32 = 0;
        let b = 0;
        let nums = vec![0; 10000];
        let node = ListNode::new(0);
        // 循环中的变量占用 O(1) 空间
        for i in 0..n {
            let c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for i in 0..n {
            function();
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 函数 */
    int func() {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    void constant(int n) {
        // 常量、变量、对象占用 O(1) 空间
        const int a = 0;
        int b = 0;
        int nums[1000];
        ListNode *node = newListNode(0);
        free(node);
        // 循环中的变量占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 函数 */
    fun function(): Int {
        // 执行某些操作
        return 0
    }

    /* 常数阶 */
    fun constant(n: Int) {
        // 常量、变量、对象占用 O(1) 空间
        val a = 0
        var b = 0
        val nums = Array(10000) { 0 }
        val node = ListNode(0)
        // 循环中的变量占用 O(1) 空间
        for (i in 0..<n) {
            val c = 0
        }
        // 循环中的函数占用 O(1) 空间
        for (i in 0..<n) {
            function()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 函数 ###
    def function
      # 执行某些操作
      0
    end

    ### 常数阶 ###
    def constant(n)
      # 常量、变量、对象占用 O(1) 空间
      a = 0
      nums = [0] * 10000
      node = ListNode.new

      # 循环中的变量占用 O(1) 空间
      (0...n).each { c = 0 }
      # 循环中的函数占用 O(1) 空间
      (0...n).each { function }
    end
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    // 函数
    fn function() i32 {
        // 执行某些操作
        return 0;
    }

    // 常数阶
    fn constant(n: i32) void {
        // 常量、变量、对象占用 O(1) 空间
        const a: i32 = 0;
        const b: i32 = 0;
        const nums = [_]i32{0} ** 10000;
        const node = ListNode(i32){ .val = 0 };
        var i: i32 = 0;
        // 循环中的变量占用 O(1) 空间
        while (i < n) : (i += 1) {
            const c: i32 = 0;
            _ = c;
        }
        // 循环中的函数占用 O(1) 空间
        i = 0;
        while (i < n) : (i += 1) {
            _ = function();
        }
        _ = a;
        _ = b;
        _ = nums;
        _ = node;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%87%BD%E6%95%B0%22%22%22%0A%20%20%20%20%23%20%E6%89%A7%E8%A1%8C%E6%9F%90%E4%BA%9B%E6%93%8D%E4%BD%9C%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%B8%B8%E6%95%B0%E9%98%B6%22%22%22%0A%20%20%20%20%23%20%E5%B8%B8%E9%87%8F%E3%80%81%E5%8F%98%E9%87%8F%E3%80%81%E5%AF%B9%E8%B1%A1%E5%8D%A0%E7%94%A8%20O%281%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20*%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E4%B8%AD%E7%9A%84%E5%8F%98%E9%87%8F%E5%8D%A0%E7%94%A8%20O%281%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E4%B8%AD%E7%9A%84%E5%87%BD%E6%95%B0%E5%8D%A0%E7%94%A8%20O%281%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%B8%B8%E6%95%B0%E9%98%B6%0A%20%20%20%20constant%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%87%BD%E6%95%B0%22%22%22%0A%20%20%20%20%23%20%E6%89%A7%E8%A1%8C%E6%9F%90%E4%BA%9B%E6%93%8D%E4%BD%9C%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%B8%B8%E6%95%B0%E9%98%B6%22%22%22%0A%20%20%20%20%23%20%E5%B8%B8%E9%87%8F%E3%80%81%E5%8F%98%E9%87%8F%E3%80%81%E5%AF%B9%E8%B1%A1%E5%8D%A0%E7%94%A8%20O%281%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20*%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E4%B8%AD%E7%9A%84%E5%8F%98%E9%87%8F%E5%8D%A0%E7%94%A8%20O%281%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E4%B8%AD%E7%9A%84%E5%87%BD%E6%95%B0%E5%8D%A0%E7%94%A8%20O%281%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%B8%B8%E6%95%B0%E9%98%B6%0A%20%20%20%20constant%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

### 2. &nbsp; 线性阶 $O(n)$ {data-toc-label="2. &nbsp; 线性阶"}

线性阶常见于元素数量与 $n$ 成正比的数组、链表、栈、队列等：

=== "Python"

    ```python title="space_complexity.py"
    def linear(n: int):
        """线性阶"""
        # 长度为 n 的列表占用 O(n) 空间
        nums = [0] * n
        # 长度为 n 的哈希表占用 O(n) 空间
        hmap = dict[int, str]()
        for i in range(n):
            hmap[i] = str(i)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 线性阶 */
    void linear(int n) {
        // 长度为 n 的数组占用 O(n) 空间
        vector<int> nums(n);
        // 长度为 n 的列表占用 O(n) 空间
        vector<ListNode> nodes;
        for (int i = 0; i < n; i++) {
            nodes.push_back(ListNode(i));
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        unordered_map<int, string> map;
        for (int i = 0; i < n; i++) {
            map[i] = to_string(i);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 线性阶 */
    void linear(int n) {
        // 长度为 n 的数组占用 O(n) 空间
        int[] nums = new int[n];
        // 长度为 n 的列表占用 O(n) 空间
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 线性阶 */
    void Linear(int n) {
        // 长度为 n 的数组占用 O(n) 空间
        int[] nums = new int[n];
        // 长度为 n 的列表占用 O(n) 空间
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 线性阶 */
    func spaceLinear(n int) {
        // 长度为 n 的数组占用 O(n) 空间
        _ = make([]int, n)
        // 长度为 n 的列表占用 O(n) 空间
        var nodes []*node
        for i := 0; i < n; i++ {
            nodes = append(nodes, newNode(i))
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        m := make(map[int]string, n)
        for i := 0; i < n; i++ {
            m[i] = strconv.Itoa(i)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 线性阶 */
    func linear(n: Int) {
        // 长度为 n 的数组占用 O(n) 空间
        let nums = Array(repeating: 0, count: n)
        // 长度为 n 的列表占用 O(n) 空间
        let nodes = (0 ..< n).map { ListNode(x: $0) }
        // 长度为 n 的哈希表占用 O(n) 空间
        let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 线性阶 */
    function linear(n) {
        // 长度为 n 的数组占用 O(n) 空间
        const nums = new Array(n);
        // 长度为 n 的列表占用 O(n) 空间
        const nodes = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 线性阶 */
    function linear(n: number): void {
        // 长度为 n 的数组占用 O(n) 空间
        const nums = new Array(n);
        // 长度为 n 的列表占用 O(n) 空间
        const nodes: ListNode[] = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 线性阶 */
    void linear(int n) {
      // 长度为 n 的数组占用 O(n) 空间
      List<int> nums = List.filled(n, 0);
      // 长度为 n 的列表占用 O(n) 空间
      List<ListNode> nodes = [];
      for (var i = 0; i < n; i++) {
        nodes.add(ListNode(i));
      }
      // 长度为 n 的哈希表占用 O(n) 空间
      Map<int, String> map = HashMap();
      for (var i = 0; i < n; i++) {
        map.putIfAbsent(i, () => i.toString());
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 线性阶 */
    #[allow(unused)]
    fn linear(n: i32) {
        // 长度为 n 的数组占用 O(n) 空间
        let mut nums = vec![0; n as usize];
        // 长度为 n 的列表占用 O(n) 空间
        let mut nodes = Vec::new();
        for i in 0..n {
            nodes.push(ListNode::new(i))
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        let mut map = HashMap::new();
        for i in 0..n {
            map.insert(i, i.to_string());
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 哈希表 */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // 基于 uthash.h 实现
    } HashTable;

    /* 线性阶 */
    void linear(int n) {
        // 长度为 n 的数组占用 O(n) 空间
        int *nums = malloc(sizeof(int) * n);
        free(nums);

        // 长度为 n 的列表占用 O(n) 空间
        ListNode **nodes = malloc(sizeof(ListNode *) * n);
        for (int i = 0; i < n; i++) {
            nodes[i] = newListNode(i);
        }
        // 内存释放
        for (int i = 0; i < n; i++) {
            free(nodes[i]);
        }
        free(nodes);

        // 长度为 n 的哈希表占用 O(n) 空间
        HashTable *h = NULL;
        for (int i = 0; i < n; i++) {
            HashTable *tmp = malloc(sizeof(HashTable));
            tmp->key = i;
            tmp->val = i;
            HASH_ADD_INT(h, key, tmp);
        }

        // 内存释放
        HashTable *curr, *tmp;
        HASH_ITER(hh, h, curr, tmp) {
            HASH_DEL(h, curr);
            free(curr);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 线性阶 */
    fun linear(n: Int) {
        // 长度为 n 的数组占用 O(n) 空间
        val nums = Array(n) { 0 }
        // 长度为 n 的列表占用 O(n) 空间
        val nodes = mutableListOf<ListNode>()
        for (i in 0..<n) {
            nodes.add(ListNode(i))
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        val map = mutableMapOf<Int, String>()
        for (i in 0..<n) {
            map[i] = i.toString()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 线性阶 ###
    def linear(n)
      # 长度为 n 的列表占用 O(n) 空间
      nums = Array.new(n, 0)

      # 长度为 n 的哈希表占用 O(n) 空间
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    // 线性阶
    fn linear(comptime n: i32) !void {
        // 长度为 n 的数组占用 O(n) 空间
        const nums = [_]i32{0} ** n;
        // 长度为 n 的列表占用 O(n) 空间
        var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
        defer nodes.deinit();
        var i: i32 = 0;
        while (i < n) : (i += 1) {
            try nodes.append(i);
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        var map = std.AutoArrayHashMap(i32, []const u8).init(std.heap.page_allocator);
        defer map.deinit();
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            const string = try std.fmt.allocPrint(std.heap.page_allocator, "{d}", .{j});
            defer std.heap.page_allocator.free(string);
            try map.put(i, string);
        }
        _ = nums;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%BA%BF%E6%80%A7%E9%98%B6%22%22%22%0A%20%20%20%20%23%20%E9%95%BF%E5%BA%A6%E4%B8%BA%20n%20%E7%9A%84%E5%88%97%E8%A1%A8%E5%8D%A0%E7%94%A8%20O%28n%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20nums%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20%23%20%E9%95%BF%E5%BA%A6%E4%B8%BA%20n%20%E7%9A%84%E5%93%88%E5%B8%8C%E8%A1%A8%E5%8D%A0%E7%94%A8%20O%28n%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20hmap%20%3D%20dict%5Bint,%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%BA%BF%E6%80%A7%E9%98%B6%0A%20%20%20%20linear%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%BA%BF%E6%80%A7%E9%98%B6%22%22%22%0A%20%20%20%20%23%20%E9%95%BF%E5%BA%A6%E4%B8%BA%20n%20%E7%9A%84%E5%88%97%E8%A1%A8%E5%8D%A0%E7%94%A8%20O%28n%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20nums%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20%23%20%E9%95%BF%E5%BA%A6%E4%B8%BA%20n%20%E7%9A%84%E5%93%88%E5%B8%8C%E8%A1%A8%E5%8D%A0%E7%94%A8%20O%28n%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20hmap%20%3D%20dict%5Bint,%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%BA%BF%E6%80%A7%E9%98%B6%0A%20%20%20%20linear%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

如图 2-17 所示，此函数的递归深度为 $n$ ，即同时存在 $n$ 个未返回的 `linear_recur()` 函数，使用 $O(n)$ 大小的栈帧空间：

=== "Python"

    ```python title="space_complexity.py"
    def linear_recur(n: int):
        """线性阶（递归实现）"""
        print("递归 n =", n)
        if n == 1:
            return
        linear_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 线性阶（递归实现） */
    void linearRecur(int n) {
        cout << "递归 n = " << n << endl;
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 线性阶（递归实现） */
    void linearRecur(int n) {
        System.out.println("递归 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 线性阶（递归实现） */
    void LinearRecur(int n) {
        Console.WriteLine("递归 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 线性阶（递归实现） */
    func spaceLinearRecur(n int) {
        fmt.Println("递归 n =", n)
        if n == 1 {
            return
        }
        spaceLinearRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 线性阶（递归实现） */
    func linearRecur(n: Int) {
        print("递归 n = \(n)")
        if n == 1 {
            return
        }
        linearRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 线性阶（递归实现） */
    function linearRecur(n) {
        console.log(`递归 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 线性阶（递归实现） */
    function linearRecur(n: number): void {
        console.log(`递归 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 线性阶（递归实现） */
    void linearRecur(int n) {
      print('递归 n = $n');
      if (n == 1) return;
      linearRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 线性阶（递归实现） */
    fn linear_recur(n: i32) {
        println!("递归 n = {}", n);
        if n == 1 {
            return;
        };
        linear_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 线性阶（递归实现） */
    void linearRecur(int n) {
        printf("递归 n = %d\r\n", n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 线性阶（递归实现） */
    fun linearRecur(n: Int) {
        println("递归 n = $n")
        if (n == 1)
            return
        linearRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 线性阶（递归实现）###
    def linear_recur(n)
      puts "递归 n = #{n}"
      return if n == 1
      linear_recur(n - 1)
    end
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    // 线性阶（递归实现）
    fn linearRecur(comptime n: i32) void {
        std.debug.print("递归 n = {}\n", .{n});
        if (n == 1) return;
        linearRecur(n - 1);
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%BA%BF%E6%80%A7%E9%98%B6%EF%BC%88%E9%80%92%E5%BD%92%E5%AE%9E%E7%8E%B0%EF%BC%89%22%22%22%0A%20%20%20%20print%28%22%E9%80%92%E5%BD%92%20n%20%3D%22,%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%BA%BF%E6%80%A7%E9%98%B6%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%BA%BF%E6%80%A7%E9%98%B6%EF%BC%88%E9%80%92%E5%BD%92%E5%AE%9E%E7%8E%B0%EF%BC%89%22%22%22%0A%20%20%20%20print%28%22%E9%80%92%E5%BD%92%20n%20%3D%22,%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%BA%BF%E6%80%A7%E9%98%B6%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

![递归函数产生的线性阶空间复杂度](space_complexity.assets/space_complexity_recursive_linear.png){ class="animation-figure" }

<p align="center"> 图 2-17 &nbsp; 递归函数产生的线性阶空间复杂度 </p>

### 3. &nbsp; 平方阶 $O(n^2)$ {data-toc-label="3. &nbsp; 平方阶"}

平方阶常见于矩阵和图，元素数量与 $n$ 成平方关系：

=== "Python"

    ```python title="space_complexity.py"
    def quadratic(n: int):
        """平方阶"""
        # 二维列表占用 O(n^2) 空间
        num_matrix = [[0] * n for _ in range(n)]
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 平方阶 */
    void quadratic(int n) {
        // 二维列表占用 O(n^2) 空间
        vector<vector<int>> numMatrix;
        for (int i = 0; i < n; i++) {
            vector<int> tmp;
            for (int j = 0; j < n; j++) {
                tmp.push_back(0);
            }
            numMatrix.push_back(tmp);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 平方阶 */
    void quadratic(int n) {
        // 矩阵占用 O(n^2) 空间
        int[][] numMatrix = new int[n][n];
        // 二维列表占用 O(n^2) 空间
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 平方阶 */
    void Quadratic(int n) {
        // 矩阵占用 O(n^2) 空间
        int[,] numMatrix = new int[n, n];
        // 二维列表占用 O(n^2) 空间
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 平方阶 */
    func spaceQuadratic(n int) {
        // 矩阵占用 O(n^2) 空间
        numMatrix := make([][]int, n)
        for i := 0; i < n; i++ {
            numMatrix[i] = make([]int, n)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 平方阶 */
    func quadratic(n: Int) {
        // 二维列表占用 O(n^2) 空间
        let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 平方阶 */
    function quadratic(n) {
        // 矩阵占用 O(n^2) 空间
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 二维列表占用 O(n^2) 空间
        const numList = [];
        for (let i = 0; i < n; i++) {
            const tmp = [];
            for (let j = 0; j < n; j++) {
                tmp.push(0);
            }
            numList.push(tmp);
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 平方阶 */
    function quadratic(n: number): void {
        // 矩阵占用 O(n^2) 空间
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 二维列表占用 O(n^2) 空间
        const numList = [];
        for (let i = 0; i < n; i++) {
            const tmp = [];
            for (let j = 0; j < n; j++) {
                tmp.push(0);
            }
            numList.push(tmp);
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 平方阶 */
    void quadratic(int n) {
      // 矩阵占用 O(n^2) 空间
      List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
      // 二维列表占用 O(n^2) 空间
      List<List<int>> numList = [];
      for (var i = 0; i < n; i++) {
        List<int> tmp = [];
        for (int j = 0; j < n; j++) {
          tmp.add(0);
        }
        numList.add(tmp);
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 平方阶 */
    #[allow(unused)]
    fn quadratic(n: i32) {
        // 矩阵占用 O(n^2) 空间
        let num_matrix = vec![vec![0; n as usize]; n as usize];
        // 二维列表占用 O(n^2) 空间
        let mut num_list = Vec::new();
        for i in 0..n {
            let mut tmp = Vec::new();
            for j in 0..n {
                tmp.push(0);
            }
            num_list.push(tmp);
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 平方阶 */
    void quadratic(int n) {
        // 二维列表占用 O(n^2) 空间
        int **numMatrix = malloc(sizeof(int *) * n);
        for (int i = 0; i < n; i++) {
            int *tmp = malloc(sizeof(int) * n);
            for (int j = 0; j < n; j++) {
                tmp[j] = 0;
            }
            numMatrix[i] = tmp;
        }

        // 内存释放
        for (int i = 0; i < n; i++) {
            free(numMatrix[i]);
        }
        free(numMatrix);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 平方阶 */
    fun quadratic(n: Int) {
        // 矩阵占用 O(n^2) 空间
        val numMatrix = arrayOfNulls<Array<Int>?>(n)
        // 二维列表占用 O(n^2) 空间
        val numList = mutableListOf<MutableList<Int>>()
        for (i in 0..<n) {
            val tmp = mutableListOf<Int>()
            for (j in 0..<n) {
                tmp.add(0)
            }
            numList.add(tmp)
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 平方阶 ###
    def quadratic(n)
      # 二维列表占用 O(n^2) 空间
      Array.new(n) { Array.new(n, 0) }
    end
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    // 平方阶
    fn quadratic(n: i32) !void {
        // 二维列表占用 O(n^2) 空间
        var nodes = std.ArrayList(std.ArrayList(i32)).init(std.heap.page_allocator);
        defer nodes.deinit();
        var i: i32 = 0;
        while (i < n) : (i += 1) {
            var tmp = std.ArrayList(i32).init(std.heap.page_allocator);
            defer tmp.deinit();
            var j: i32 = 0;
            while (j < n) : (j += 1) {
                try tmp.append(0);
            }
            try nodes.append(tmp);
        }
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 405px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%98%B6%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E7%BB%B4%E5%88%97%E8%A1%A8%E5%8D%A0%E7%94%A8%20O%28n%5E2%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20*%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%B9%B3%E6%96%B9%E9%98%B6%0A%20%20%20%20quadratic%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%98%B6%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E7%BB%B4%E5%88%97%E8%A1%A8%E5%8D%A0%E7%94%A8%20O%28n%5E2%29%20%E7%A9%BA%E9%97%B4%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20*%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%B9%B3%E6%96%B9%E9%98%B6%0A%20%20%20%20quadratic%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

如图 2-18 所示，该函数的递归深度为 $n$ ，在每个递归函数中都初始化了一个数组，长度分别为 $n$、$n-1$、$\dots$、$2$、$1$ ，平均长度为 $n / 2$ ，因此总体占用 $O(n^2)$ 空间：

=== "Python"

    ```python title="space_complexity.py"
    def quadratic_recur(n: int) -> int:
        """平方阶（递归实现）"""
        if n <= 0:
            return 0
        # 数组 nums 长度为 n, n-1, ..., 2, 1
        nums = [0] * n
        return quadratic_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 平方阶（递归实现） */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        vector<int> nums(n);
        cout << "递归 n = " << n << " 中的 nums 长度 = " << nums.size() << endl;
        return quadraticRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 平方阶（递归实现） */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 数组 nums 长度为 n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("递归 n = " + n + " 中的 nums 长度 = " + nums.length);
        return quadraticRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 平方阶（递归实现） */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("递归 n = " + n + " 中的 nums 长度 = " + nums.Length);
        return QuadraticRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 平方阶（递归实现） */
    func spaceQuadraticRecur(n int) int {
        if n <= 0 {
            return 0
        }
        nums := make([]int, n)
        fmt.Printf("递归 n = %d 中的 nums 长度 = %d \n", n, len(nums))
        return spaceQuadraticRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 平方阶（递归实现） */
    @discardableResult
    func quadraticRecur(n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        // 数组 nums 长度为 n, n-1, ..., 2, 1
        let nums = Array(repeating: 0, count: n)
        print("递归 n = \(n) 中的 nums 长度 = \(nums.count)")
        return quadraticRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 平方阶（递归实现） */
    function quadraticRecur(n) {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`递归 n = ${n} 中的 nums 长度 = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 平方阶（递归实现） */
    function quadraticRecur(n: number): number {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`递归 n = ${n} 中的 nums 长度 = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 平方阶（递归实现） */
    int quadraticRecur(int n) {
      if (n <= 0) return 0;
      List<int> nums = List.filled(n, 0);
      print('递归 n = $n 中的 nums 长度 = ${nums.length}');
      return quadraticRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 平方阶（递归实现） */
    fn quadratic_recur(n: i32) -> i32 {
        if n <= 0 {
            return 0;
        };
        // 数组 nums 长度为 n, n-1, ..., 2, 1
        let nums = vec![0; n as usize];
        println!("递归 n = {} 中的 nums 长度 = {}", n, nums.len());
        return quadratic_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 平方阶（递归实现） */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        int *nums = malloc(sizeof(int) * n);
        printf("递归 n = %d 中的 nums 长度 = %d\r\n", n, n);
        int res = quadraticRecur(n - 1);
        free(nums);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 平方阶（递归实现） */
    tailrec fun quadraticRecur(n: Int): Int {
        if (n <= 0)
            return 0
        // 数组 nums 长度为 n, n-1, ..., 2, 1
        val nums = Array(n) { 0 }
        println("递归 n = $n 中的 nums 长度 = ${nums.size}")
        return quadraticRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 平方阶（递归实现）###
    def quadratic_recur(n)
      return 0 unless n > 0

      # 数组 nums 长度为 n, n-1, ..., 2, 1
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    // 平方阶（递归实现）
    fn quadraticRecur(comptime n: i32) i32 {
        if (n <= 0) return 0;
        const nums = [_]i32{0} ** n;
        std.debug.print("递归 n = {} 中的 nums 长度 = {}\n", .{ n, nums.len });
        return quadraticRecur(n - 1);
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%98%B6%EF%BC%88%E9%80%92%E5%BD%92%E5%AE%9E%E7%8E%B0%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E6%95%B0%E7%BB%84%20nums%20%E9%95%BF%E5%BA%A6%E4%B8%BA%20n,%20n-1,%20...,%202,%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%B9%B3%E6%96%B9%E9%98%B6%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%98%B6%EF%BC%88%E9%80%92%E5%BD%92%E5%AE%9E%E7%8E%B0%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E6%95%B0%E7%BB%84%20nums%20%E9%95%BF%E5%BA%A6%E4%B8%BA%20n,%20n-1,%20...,%202,%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%B9%B3%E6%96%B9%E9%98%B6%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

![递归函数产生的平方阶空间复杂度](space_complexity.assets/space_complexity_recursive_quadratic.png){ class="animation-figure" }

<p align="center"> 图 2-18 &nbsp; 递归函数产生的平方阶空间复杂度 </p>

### 4. &nbsp; 指数阶 $O(2^n)$ {data-toc-label="4. &nbsp; 指数阶"}

指数阶常见于二叉树。观察图 2-19 ，层数为 $n$ 的“满二叉树”的节点数量为 $2^n - 1$ ，占用 $O(2^n)$ 空间：

=== "Python"

    ```python title="space_complexity.py"
    def build_tree(n: int) -> TreeNode | None:
        """指数阶（建立满二叉树）"""
        if n == 0:
            return None
        root = TreeNode(0)
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
        return root
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 指数阶（建立满二叉树） */
    TreeNode *buildTree(int n) {
        if (n == 0)
            return nullptr;
        TreeNode *root = new TreeNode(0);
        root->left = buildTree(n - 1);
        root->right = buildTree(n - 1);
        return root;
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 指数阶（建立满二叉树） */
    TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 指数阶（建立满二叉树） */
    TreeNode? BuildTree(int n) {
        if (n == 0) return null;
        TreeNode root = new(0) {
            left = BuildTree(n - 1),
            right = BuildTree(n - 1)
        };
        return root;
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 指数阶（建立满二叉树） */
    func buildTree(n int) *TreeNode {
        if n == 0 {
            return nil
        }
        root := NewTreeNode(0)
        root.Left = buildTree(n - 1)
        root.Right = buildTree(n - 1)
        return root
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 指数阶（建立满二叉树） */
    func buildTree(n: Int) -> TreeNode? {
        if n == 0 {
            return nil
        }
        let root = TreeNode(x: 0)
        root.left = buildTree(n: n - 1)
        root.right = buildTree(n: n - 1)
        return root
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 指数阶（建立满二叉树） */
    function buildTree(n) {
        if (n === 0) return null;
        const root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 指数阶（建立满二叉树） */
    function buildTree(n: number): TreeNode | null {
        if (n === 0) return null;
        const root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 指数阶（建立满二叉树） */
    TreeNode? buildTree(int n) {
      if (n == 0) return null;
      TreeNode root = TreeNode(0);
      root.left = buildTree(n - 1);
      root.right = buildTree(n - 1);
      return root;
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 指数阶（建立满二叉树） */
    fn build_tree(n: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if n == 0 {
            return None;
        };
        let root = TreeNode::new(0);
        root.borrow_mut().left = build_tree(n - 1);
        root.borrow_mut().right = build_tree(n - 1);
        return Some(root);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 指数阶（建立满二叉树） */
    TreeNode *buildTree(int n) {
        if (n == 0)
            return NULL;
        TreeNode *root = newTreeNode(0);
        root->left = buildTree(n - 1);
        root->right = buildTree(n - 1);
        return root;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 指数阶（建立满二叉树） */
    fun buildTree(n: Int): TreeNode? {
        if (n == 0)
            return null
        val root = TreeNode(0)
        root.left = buildTree(n - 1)
        root.right = buildTree(n - 1)
        return root
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 指数阶（建立满二叉树）###
    def build_tree(n)
      return if n == 0

      TreeNode.new.tap do |root|
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
      end
    end
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    // 指数阶（建立满二叉树）
    fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
        if (n == 0) return null;
        const root = try allocator.create(TreeNode(i32));
        root.init(0);
        root.left = try buildTree(allocator, n - 1);
        root.right = try buildTree(allocator, n - 1);
        return root;
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E9%98%B6%EF%BC%88%E5%BB%BA%E7%AB%8B%E6%BB%A1%E4%BA%8C%E5%8F%89%E6%A0%91%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E6%8C%87%E6%95%B0%E9%98%B6%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E9%98%B6%EF%BC%88%E5%BB%BA%E7%AB%8B%E6%BB%A1%E4%BA%8C%E5%8F%89%E6%A0%91%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E5%A4%A7%E5%B0%8F%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E6%8C%87%E6%95%B0%E9%98%B6%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

![满二叉树产生的指数阶空间复杂度](space_complexity.assets/space_complexity_exponential.png){ class="animation-figure" }

<p align="center"> 图 2-19 &nbsp; 满二叉树产生的指数阶空间复杂度 </p>

### 5. &nbsp; 对数阶 $O(\log n)$ {data-toc-label="5. &nbsp; 对数阶"}

对数阶常见于分治算法。例如归并排序，输入长度为 $n$ 的数组，每轮递归将数组从中点处划分为两半，形成高度为 $\log n$ 的递归树，使用 $O(\log n)$ 栈帧空间。

再例如将数字转化为字符串，输入一个正整数 $n$ ，它的位数为 $\lfloor \log_{10} n \rfloor + 1$ ，即对应字符串长度为 $\lfloor \log_{10} n \rfloor + 1$ ，因此空间复杂度为 $O(\log_{10} n + 1) = O(\log n)$ 。

## 2.4.4 &nbsp; 权衡时间与空间

理想情况下，我们希望算法的时间复杂度和空间复杂度都能达到最优。然而在实际情况中，同时优化时间复杂度和空间复杂度通常非常困难。

**降低时间复杂度通常需要以提升空间复杂度为代价，反之亦然**。我们将牺牲内存空间来提升算法运行速度的思路称为“以空间换时间”；反之，则称为“以时间换空间”。

选择哪种思路取决于我们更看重哪个方面。在大多数情况下，时间比空间更宝贵，因此“以空间换时间”通常是更常用的策略。当然，在数据量很大的情况下，控制空间复杂度也非常重要。
