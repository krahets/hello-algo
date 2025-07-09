---
comments: true
---

# 2.4 &nbsp; Space complexity

<u>Space complexity</u> is used to measure the growth trend of the memory space occupied by an algorithm as the amount of data increases. This concept is very similar to time complexity, except that "running time" is replaced with "occupied memory space".

## 2.4.1 &nbsp; Space related to algorithms

The memory space used by an algorithm during its execution mainly includes the following types.

- **Input space**: Used to store the input data of the algorithm.
- **Temporary space**: Used to store variables, objects, function contexts, and other data during the algorithm's execution.
- **Output space**: Used to store the output data of the algorithm.

Generally, the scope of space complexity statistics includes both "Temporary Space" and "Output Space".

Temporary space can be further divided into three parts.

- **Temporary data**: Used to save various constants, variables, objects, etc., during the algorithm's execution.
- **Stack frame space**: Used to save the context data of the called function. The system creates a stack frame at the top of the stack each time a function is called, and the stack frame space is released after the function returns.
- **Instruction space**: Used to store compiled program instructions, which are usually negligible in actual statistics.

When analyzing the space complexity of a program, **we typically count the Temporary Data, Stack Frame Space, and Output Data**, as shown in Figure 2-15.

![Space types used in algorithms](space_complexity.assets/space_types.png){ class="animation-figure" }

<p align="center"> Figure 2-15 &nbsp; Space types used in algorithms </p>

The relevant code is as follows:

=== "Python"

    ```python title=""
    class Node:
        """Classes"""
        def __init__(self, x: int):
            self.val: int = x               # node value
            self.next: Node | None = None   # reference to the next node

    def function() -> int:
        """Functions"""
        # Perform certain operations...
        return 0

    def algorithm(n) -> int:    # input data
        A = 0                   # temporary data (constant, usually in uppercase)
        b = 0                   # temporary data (variable)
        node = Node(0)          # temporary data (object)
        c = function()          # Stack frame space (call function)
        return A + b + c        # output data
    ```

=== "C++"

    ```cpp title=""
    /* Structures */
    struct Node {
        int val;
        Node *next;
        Node(int x) : val(x), next(nullptr) {}
    };

    /* Functions */
    int func() {
        // Perform certain operations...
        return 0;
    }

    int algorithm(int n) {          // input data
        const int a = 0;            // temporary data (constant)
        int b = 0;                  // temporary data (variable)
        Node* node = new Node(0);   // temporary data (object)
        int c = func();             // stack frame space (call function)
        return a + b + c;           // output data
    }
    ```

=== "Java"

    ```java title=""
    /* Classes */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }
   
    /* Functions */
    int function() {
        // Perform certain operations...
        return 0;
    }
   
    int algorithm(int n) {          // input data
        final int a = 0;            // temporary data (constant)
        int b = 0;                  // temporary data (variable)
        Node node = new Node(0);    // temporary data (object)
        int c = function();         // stack frame space (call function)
        return a + b + c;           // output data
    }
    ```

=== "C#"

    ```csharp title=""
    /* Classes */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }

    /* Functions */
    int Function() {
        // Perform certain operations...
        return 0;
    }

    int Algorithm(int n) {  // input data
        const int a = 0;    // temporary data (constant)
        int b = 0;          // temporary data (variable)
        Node node = new(0); // temporary data (object)
        int c = Function(); // stack frame space (call function)
        return a + b + c;   // output data
    }
    ```

=== "Go"

    ```go title=""
    /* Structures */
    type node struct {
        val  int
        next *node
    }

    /* Create node structure */
    func newNode(val int) *node {
        return &node{val: val}
    }
   
    /* Functions */
    func function() int {
        // Perform certain operations...
        return 0
    }

    func algorithm(n int) int { // input data
        const a = 0             // temporary data (constant)
        b := 0                  // temporary storage of data (variable)
        newNode(0)              // temporary data (object)
        c := function()         // stack frame space (call function)
        return a + b + c        // output data
    }
    ```

=== "Swift"

    ```swift title=""
    /* Classes */
    class Node {
        var val: Int
        var next: Node?

        init(x: Int) {
            val = x
        }
    }

    /* Functions */
    func function() -> Int {
        // Perform certain operations...
        return 0
    }

    func algorithm(n: Int) -> Int { // input data
        let a = 0                   // temporary data (constant)
        var b = 0                   // temporary data (variable)
        let node = Node(x: 0)       // temporary data (object)
        let c = function()          // stack frame space (call function)
        return a + b + c            // output data
    }
    ```

=== "JS"

    ```javascript title=""
    /* Classes */
    class Node {
        val;
        next;
        constructor(val) {
            this.val = val === undefined ? 0 : val; // node value
            this.next = null;                       // reference to the next node
        }
    }

    /* Functions */
    function constFunc() {
        // Perform certain operations
        return 0;
    }

    function algorithm(n) {         // input data
        const a = 0;                // temporary data (constant)
        let b = 0;                  // temporary data (variable)
        const node = new Node(0);   // temporary data (object)
        const c = constFunc();      // Stack frame space (calling function)
        return a + b + c;           // output data
    }
    ```

=== "TS"

    ```typescript title=""
    /* Classes */
    class Node {
        val: number;
        next: Node | null;
        constructor(val?: number) {
            this.val = val === undefined ? 0 : val; // node value
            this.next = null;                       // reference to the next node
        }
    }

    /* Functions */
    function constFunc(): number {
        // Perform certain operations
        return 0;
    }

    function algorithm(n: number): number { // input data
        const a = 0;                        // temporary data (constant)
        let b = 0;                          // temporary data (variable)
        const node = new Node(0);           // temporary data (object)
        const c = constFunc();              // Stack frame space (calling function)
        return a + b + c;                   // output data
    }
    ```

=== "Dart"

    ```dart title=""
    /* Classes */
    class Node {
      int val;
      Node next;
      Node(this.val, [this.next]);
    }

    /* Functions */
    int function() {
      // Perform certain operations...
      return 0;
    }

    int algorithm(int n) {  // input data
      const int a = 0;      // temporary data (constant)
      int b = 0;            // temporary data (variable)
      Node node = Node(0);  // temporary data (object)
      int c = function();   // stack frame space (call function)
      return a + b + c;     // output data
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
   
    /* Structures */
    struct Node {
        val: i32,
        next: Option<Rc<RefCell<Node>>>,
    }

    /* Constructor */
    impl Node {
        fn new(val: i32) -> Self {
            Self { val: val, next: None }
        }
    }

    /* Functions */
    fn function() -> i32 {     
        // Perform certain operations...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {   // input data
        const a: i32 = 0;           // temporary data (constant)
        let mut b = 0;              // temporary data (variable)
        let node = Node::new(0);    // temporary data (object)
        let c = function();         // stack frame space (call function)
        return a + b + c;           // output data
    }
    ```

=== "C"

    ```c title=""
    /* Functions */
    int func() {
        // Perform certain operations...
        return 0;
    }

    int algorithm(int n) {  // input data
        const int a = 0;    // temporary data (constant)
        int b = 0;          // temporary data (variable)
        int c = func();     // stack frame space (call function)
        return a + b + c;   // output data
    }
    ```

=== "Kotlin"

    ```kotlin title=""

    ```

=== "Zig"

    ```zig title=""

    ```

## 2.4.2 &nbsp; Calculation method

The method for calculating space complexity is roughly similar to that of time complexity, with the only change being the shift of the statistical object from "number of operations" to "size of used space".

However, unlike time complexity, **we usually only focus on the worst-case space complexity**. This is because memory space is a hard requirement, and we must ensure that there is enough memory space reserved under all input data.

Consider the following code, the term "worst-case" in worst-case space complexity has two meanings.

1. **Based on the worst input data**: When $n < 10$, the space complexity is $O(1)$; but when $n > 10$, the initialized array `nums` occupies $O(n)$ space, thus the worst-case space complexity is $O(n)$.
2. **Based on the peak memory used during the algorithm's execution**: For example, before executing the last line, the program occupies $O(1)$ space; when initializing the array `nums`, the program occupies $O(n)$ space, hence the worst-case space complexity is $O(n)$.

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
        let a = 0;                           // O(1)
        let b = [0; 10000];                  // O(1)
        if n > 10 {
            let nums = vec![0; n as usize];  // O(n)
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

    ```

=== "Zig"

    ```zig title=""

    ```

**In recursive functions, stack frame space must be taken into count**. Consider the following code:

=== "Python"

    ```python title=""
    def function() -> int:
        # Perform certain operations
        return 0

    def loop(n: int):
        """Loop O(1)"""
        for _ in range(n):
            function()

    def recur(n: int):
        """Recursion O(n)"""
        if n == 1:
            return
        return recur(n - 1)
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* Recursion O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Java"

    ```java title=""
    int function() {
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* Recursion O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int Function() {
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    void Loop(int n) {
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    /* Recursion O(n) */
    int Recur(int n) {
        if (n == 1) return 1;
        return Recur(n - 1);
    }
    ```

=== "Go"

    ```go title=""
    func function() int {
        // Perform certain operations
        return 0
    }
   
    /* Cycle O(1) */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
   
    /* Recursion O(n) */
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
        // Perform certain operations
        return 0
    }

    /* Cycle O(1) */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* Recursion O(n) */
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
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* Recursion O(n) */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TS"

    ```typescript title=""
    function constFunc(): number {
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* Recursion O(n) */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "Dart"

    ```dart title=""
    int function() {
      // Perform certain operations
      return 0;
    }
    /* Cycle O(1) */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* Recursion O(n) */
    void recur(int n) {
      if (n == 1) return;
      recur(n - 1);
    }
    ```

=== "Rust"

    ```rust title=""
    fn function() -> i32 {
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    fn loop(n: i32) {
        for i in 0..n {
            function();
        }
    }
    /* Recursion O(n) */
    void recur(n: i32) {
        if n == 1 {
            return;
        }
        recur(n - 1);
    }
    ```

=== "C"

    ```c title=""
    int func() {
        // Perform certain operations
        return 0;
    }
    /* Cycle O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* Recursion O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title=""

    ```

=== "Zig"

    ```zig title=""

    ```

The time complexity of both `loop()` and `recur()` functions is $O(n)$, but their space complexities differ.

- The `loop()` function calls `function()` $n$ times in a loop, where each iteration's `function()` returns and releases its stack frame space, so the space complexity remains $O(1)$.
- The recursive function `recur()` will have $n$ instances of unreturned `recur()` existing simultaneously during its execution, thus occupying $O(n)$ stack frame space.

## 2.4.3 &nbsp; Common types

Let the size of the input data be $n$, Figure 2-16 displays common types of space complexities (arranged from low to high).

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
& \text{Constant} < \text{Logarithmic} < \text{Linear} < \text{Quadratic} < \text{Exponential}
\end{aligned}
$$

![Common types of space complexity](space_complexity.assets/space_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Figure 2-16 &nbsp; Common types of space complexity </p>

### 1. &nbsp; Constant order $O(1)$ {data-toc-label="1. &nbsp; Constant order"}

Constant order is common in constants, variables, objects that are independent of the size of input data $n$.

Note that memory occupied by initializing variables or calling functions in a loop, which is released upon entering the next cycle, does not accumulate over space, thus the space complexity remains $O(1)$:

=== "Python"

    ```python title="space_complexity.py"
    def function() -> int:
        """Function"""
        # Perform some operations
        return 0

    def constant(n: int):
        """Constant complexity"""
        # Constants, variables, objects occupy O(1) space
        a = 0
        nums = [0] * 10000
        node = ListNode(0)
        # Variables in a loop occupy O(1) space
        for _ in range(n):
            c = 0
        # Functions in a loop occupy O(1) space
        for _ in range(n):
            function()
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Function */
    int func() {
        // Perform some operations
        return 0;
    }

    /* Constant complexity */
    void constant(int n) {
        // Constants, variables, objects occupy O(1) space
        const int a = 0;
        int b = 0;
        vector<int> nums(10000);
        ListNode node(0);
        // Variables in a loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Functions in a loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Function */
    int function() {
        // Perform some operations
        return 0;
    }

    /* Constant complexity */
    void constant(int n) {
        // Constants, variables, objects occupy O(1) space
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // Variables in a loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Functions in a loop occupy O(1) space
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{Function}

    [class]{space_complexity}-[func]{Constant}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{function}

    [class]{}-[func]{spaceConstant}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{function}

    [class]{}-[func]{constant}
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{constFunc}

    [class]{}-[func]{constant}
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{constFunc}

    [class]{}-[func]{constant}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{function}

    [class]{}-[func]{constant}
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    [class]{}-[func]{function}

    [class]{}-[func]{constant}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{func}

    [class]{}-[func]{constant}
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    [class]{}-[func]{function}

    [class]{}-[func]{constant}
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    [class]{}-[func]{function}

    [class]{}-[func]{constant}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{function}

    [class]{}-[func]{constant}
    ```

### 2. &nbsp; Linear order $O(n)$ {data-toc-label="2. &nbsp; Linear order"}

Linear order is common in arrays, linked lists, stacks, queues, etc., where the number of elements is proportional to $n$:

=== "Python"

    ```python title="space_complexity.py"
    def linear(n: int):
        """Linear complexity"""
        # A list of length n occupies O(n) space
        nums = [0] * n
        # A hash table of length n occupies O(n) space
        hmap = dict[int, str]()
        for i in range(n):
            hmap[i] = str(i)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Linear complexity */
    void linear(int n) {
        // Array of length n occupies O(n) space
        vector<int> nums(n);
        // A list of length n occupies O(n) space
        vector<ListNode> nodes;
        for (int i = 0; i < n; i++) {
            nodes.push_back(ListNode(i));
        }
        // A hash table of length n occupies O(n) space
        unordered_map<int, string> map;
        for (int i = 0; i < n; i++) {
            map[i] = to_string(i);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Linear complexity */
    void linear(int n) {
        // Array of length n occupies O(n) space
        int[] nums = new int[n];
        // A list of length n occupies O(n) space
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // A hash table of length n occupies O(n) space
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{Linear}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceLinear}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{linear}
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{linear}
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{linear}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{linear}
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    [class]{}-[func]{linear}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{HashTable}-[func]{}

    [class]{}-[func]{linear}
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    [class]{}-[func]{linear}
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    [class]{}-[func]{linear}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{linear}
    ```

As shown in Figure 2-17, this function's recursive depth is $n$, meaning there are $n$ instances of unreturned `linear_recur()` function, using $O(n)$ size of stack frame space:

=== "Python"

    ```python title="space_complexity.py"
    def linear_recur(n: int):
        """Linear complexity (recursive implementation)"""
        print("Recursive n =", n)
        if n == 1:
            return
        linear_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Linear complexity (recursive implementation) */
    void linearRecur(int n) {
        cout << "Recursion n = " << n << endl;
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Linear complexity (recursive implementation) */
    void linearRecur(int n) {
        System.out.println("Recursion n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{LinearRecur}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceLinearRecur}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{linearRecur}
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{linearRecur}
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{linearRecur}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{linearRecur}
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    [class]{}-[func]{linear_recur}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{linearRecur}
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    [class]{}-[func]{linearRecur}
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    [class]{}-[func]{linear_recur}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{linearRecur}
    ```

![Recursive function generating linear order space complexity](space_complexity.assets/space_complexity_recursive_linear.png){ class="animation-figure" }

<p align="center"> Figure 2-17 &nbsp; Recursive function generating linear order space complexity </p>

### 3. &nbsp; Quadratic order $O(n^2)$ {data-toc-label="3. &nbsp; Quadratic order"}

Quadratic order is common in matrices and graphs, where the number of elements is quadratic to $n$:

=== "Python"

    ```python title="space_complexity.py"
    def quadratic(n: int):
        """Quadratic complexity"""
        # A two-dimensional list occupies O(n^2) space
        num_matrix = [[0] * n for _ in range(n)]
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Quadratic complexity */
    void quadratic(int n) {
        // A two-dimensional list occupies O(n^2) space
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
    /* Quadratic complexity */
    void quadratic(int n) {
        // Matrix occupies O(n^2) space
        int[][] numMatrix = new int[n][n];
        // A two-dimensional list occupies O(n^2) space
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
    [class]{space_complexity}-[func]{Quadratic}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceQuadratic}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{quadratic}
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{quadratic}
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{quadratic}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{quadratic}
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    [class]{}-[func]{quadratic}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{quadratic}
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    [class]{}-[func]{quadratic}
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    [class]{}-[func]{quadratic}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{quadratic}
    ```

As shown in Figure 2-18, the recursive depth of this function is $n$, and in each recursive call, an array is initialized with lengths $n$, $n-1$, $\dots$, $2$, $1$, averaging $n/2$, thus overall occupying $O(n^2)$ space:

=== "Python"

    ```python title="space_complexity.py"
    def quadratic_recur(n: int) -> int:
        """Quadratic complexity (recursive implementation)"""
        if n <= 0:
            return 0
        # Array nums length = n, n-1, ..., 2, 1
        nums = [0] * n
        return quadratic_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Quadratic complexity (recursive implementation) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        vector<int> nums(n);
        cout << "Recursive n = " << n << ", length of nums = " << nums.size() << endl;
        return quadraticRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Quadratic complexity (recursive implementation) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // Array nums length = n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("Recursion n = " + n + " in the length of nums = " + nums.length);
        return quadraticRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    [class]{space_complexity}-[func]{QuadraticRecur}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{spaceQuadraticRecur}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{quadraticRecur}
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{quadraticRecur}
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    [class]{}-[func]{quadratic_recur}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    [class]{}-[func]{quadraticRecur}
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    [class]{}-[func]{quadratic_recur}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{quadraticRecur}
    ```

![Recursive function generating quadratic order space complexity](space_complexity.assets/space_complexity_recursive_quadratic.png){ class="animation-figure" }

<p align="center"> Figure 2-18 &nbsp; Recursive function generating quadratic order space complexity </p>

### 4. &nbsp; Exponential order $O(2^n)$ {data-toc-label="4. &nbsp; Exponential order"}

Exponential order is common in binary trees. Observe Figure 2-19, a "full binary tree" with $n$ levels has $2^n - 1$ nodes, occupying $O(2^n)$ space:

=== "Python"

    ```python title="space_complexity.py"
    def build_tree(n: int) -> TreeNode | None:
        """Exponential complexity (building a full binary tree)"""
        if n == 0:
            return None
        root = TreeNode(0)
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
        return root
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Exponential complexity (building a full binary tree) */
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
    /* Exponential complexity (building a full binary tree) */
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
    [class]{space_complexity}-[func]{BuildTree}
    ```

=== "Go"

    ```go title="space_complexity.go"
    [class]{}-[func]{buildTree}
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    [class]{}-[func]{buildTree}
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    [class]{}-[func]{buildTree}
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    [class]{}-[func]{buildTree}
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    [class]{}-[func]{buildTree}
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    [class]{}-[func]{build_tree}
    ```

=== "C"

    ```c title="space_complexity.c"
    [class]{}-[func]{buildTree}
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    [class]{}-[func]{buildTree}
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    [class]{}-[func]{build_tree}
    ```

=== "Zig"

    ```zig title="space_complexity.zig"
    [class]{}-[func]{buildTree}
    ```

![Full binary tree generating exponential order space complexity](space_complexity.assets/space_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Figure 2-19 &nbsp; Full binary tree generating exponential order space complexity </p>

### 5. &nbsp; Logarithmic order $O(\log n)$ {data-toc-label="5. &nbsp; Logarithmic order"}

Logarithmic order is common in divide-and-conquer algorithms. For example, in merge sort, an array of length $n$ is recursively divided in half each round, forming a recursion tree of height $\log n$, using $O(\log n)$ stack frame space.

Another example is converting a number to a string. Given a positive integer $n$, its number of digits is $\log_{10} n + 1$, corresponding to the length of the string, thus the space complexity is $O(\log_{10} n + 1) = O(\log n)$.

## 2.4.4 &nbsp; Balancing time and space

Ideally, we aim for both time complexity and space complexity to be optimal. However, in practice, optimizing both simultaneously is often difficult.

**Lowering time complexity usually comes at the cost of increased space complexity, and vice versa**. The approach of sacrificing memory space to improve algorithm speed is known as "space-time tradeoff"; the reverse is known as "time-space tradeoff".

The choice depends on which aspect we value more. In most cases, time is more precious than space, so "space-time tradeoff" is often the more common strategy. Of course, controlling space complexity is also very important when dealing with large volumes of data.
