# Space Complexity

"Space complexity is a measure of how the amount of memory space an algorithm occupies grows as the amount of data grows. This concept is very similar to time complexity, just replace "runtime" with "memory space".

## Algorithmic Correlation Space

The main types of memory space used by algorithms during operation include the following.

- **Input Space**: used to store the input data for the algorithm.
- **Staging Space**: used to store data such as variables, objects, function contexts, etc. of the algorithm during runtime.
- **Output Space**: used to store the output data of the algorithm.

In general, the statistical range of space complexity is "staging space" plus "output space".

The staging space can be further divided into three sections.

- **Staging Data**: used to save various constants, variables, objects, etc. during the running of the algorithm.
- **Stack frame space**: used to hold the context data of the called function. The system creates a stack frame at the top of the stack each time a function is called, and the stack frame space is freed when the function returns.
- **Instruction space**: used to hold compiled program instructions, usually ignored in practical statistics.

When analyzing the space complexity of a piece of program, **we usually count three parts**: transient data, stack frame space and output data.

![Associated spaces used by the algorithm](space_complexity.assets/space_types.png)

=== "Python"

    ```python title=""
    class Node:
        """Classes""""
        def __init__(self, x: int):
            self.val: int = x # node value
            self.next: Node | None = None # reference to the next node

    def function() -> int:
        """"Function"""""
        # Perform certain operations...
        return 0

    def algorithm(n) -> int: # input data
        A = 0 # Temporary storage of data (constant, usually in uppercase)
        b = 0 # Temporary data (variable)
        node = Node(0) # temporary data (object)
        c = function() # Stack frame space (call function)
        return A + b + c # output data
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

    int algorithm(int n) { // input data
        const int a = 0; // temporary data (constant)
        int b = 0; // temporary data (variable)
        Node* node = new Node(0); // temporary data (object)
        int c = func(); // stack frame space (call function)
        return a + b + c; // output data
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
   
    int algorithm(int n) { // input data
        final int a = 0; // temporary data (constant)
        int b = 0; // temporary data (variable)
        Node node = new Node(0); // temporary data (object)
        int c = function(); // stack frame space (call function)
        return a + b + c; // output data
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

    int Algorithm(int n) { // input data
        const int a = 0; // temporary data (constant)
        int b = 0; // temporary data (variable)
        Node node = new(0); // temporary data (object)
        int c = Function(); // stack frame space (call function)
        return a + b + c; // output data
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
        const a = 0 // temporary data (constant)
        b := 0 // temporary storage of data (variable)
        newNode(0) // temporary data (object)
        c := function() // stack frame space (call function)
        return a + b + c // output data
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
        let a = 0 // temporary data (constant)
        var b = 0 // temporary data (variable)
        let node = Node(x: 0) // temporary data (object)
        let c = function() // stack frame space (call function)
        return a + b + c // output data
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
            this.next = null; // reference to the next node
        }
    }

    /* Functions */
    function constFunc() {
        // Perform certain operations
        return 0;
    }

    function algorithm(n) { // input data
        const a = 0; // temporary data (constant)
        let b = 0; // temporary data (variable)
        const node = new Node(0); // temporary data (object)
        const c = constFunc(); // Stack frame space (calling function)
        return a + b + c; // output data
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
            this.next = null; // reference to the next node
        }
    }

    /* Functions */
    function constFunc(): number {
        // Perform certain operations
        return 0;
    }

    function algorithm(n: number): number { // input data
        const a = 0; // temporary data (constant)
        let b = 0; // temporary data (variable)
        const node = new Node(0); // temporary data (object)
        const c = constFunc(); // Stack frame space (calling function)
        return a + b + c; // output data
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

    int algorithm(int n) { // input data
      const int a = 0; // temporary data (constant)
      int b = 0; // temporary data (variable)
      Node node = Node(0); // temporary data (object)
      int c = function(); // stack frame space (call function)
      return a + b + c; // output data
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

    /* Creating a Node structure */
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

    fn algorithm(n: i32) -> i32 { // input data
        const a: i32 = 0; // temporary data (constant)
        let mut b = 0; // temporary data (variable)
        let node = Node::new(0); // temporary data (object)
        let c = function(); // stack frame space (call function)
        return a + b + c; // output data
    }
    ```

=== "C"

    ```c title=""
    /* Functions */
    int func() {
        // Perform certain operations...
        return 0;
    }

    int algorithm(int n) { // input data
        const int a = 0; // temporary data (constant)
        int b = 0; // temporary data (variable)
        int c = func(); // stack frame space (call function)
        return a + b + c; // output data
    }
    ```

=== "Zig"

    ```zig title=""

    ```

## Method Of Projection

Space complexity is derived in much the same way as time complexity, simply by changing the statistic from "number of operations" to "amount of space used".

And unlike time complexity, **we usually focus only on the worst space complexity**. This is because memory space is a hard requirement and we have to make sure that there is enough memory space reserved under all input data.

Looking at the following code, the "worst" in worst space complexity has two levels of meaning.

1. **whichever is the worst input data**: when $n < 10$, the space complexity is $O(1)$; however, when $n > 10$, the initialized array `nums` occupies $O(n)$ space; thus the worst space complexity is $O(n)$ .
2. **in terms of peak memory during the run of the algorithm**: for example, the program occupies $O(1)$ space until the last line is executed; when the array `nums` is initialized, the program occupies $O(n)$ space; thus the worst space complexity is $O(n)$ .

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

=== "Zig"

    ```zig title=""

    ```

**In recursion functions, care needs to be taken to count the stack frame space**. For example in the following code:

- The function `loop()` calls $n$ times `function()` in a loop, and each round of `function()` returns and frees stack frame space, so the space complexity is still $O(1)$.
- The recursion function `recur()` will have $n$ unreturned `recur()` at the same time during runtime, thus occupying $O(n)$ of stack frame space.

=== "Python"

    ```python title=""
    def function() -> int:
        # Perform certain operations
        return 0

    def loop(n: int):
        """Loop O(1)"""""
        for _ in range(n):
            function()

    def recur(n: int) -> int:
        """Recursion O(n)"""""
        if n == 1: return
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
        return recur(n - 1);
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
        return recur(n - 1);
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
      return recur(n - 1);
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
        return recur(n - 1);
    }
    ```

=== "Zig"

    ```zig title=""

    ```

## Common Types

Let the input data size be $n$ , the figure below shows the common types of space complexity (ordered from low to high).

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
\text{constant order} < \text{logarithmic order} < \text{linear order} < \text{square order} < \text{exponential order}
\end{aligned}
$$

![Common space complexity types](space_complexity.assets/space_complexity_common_types.png)

### Constant Order $O(1)$

Constant orders are common for constants, variables, and objects whose quantity is unrelated to the size of the input data $n$.

Note that memory occupied by initializing a variable or calling a function in a loop is freed when it enters the next loop, so there is no accumulation of occupied space and the space complexity remains $O(1)$ :

```src
[file]{space_complexity}-[class]{}-[func]{constant}
```

### Linear Order $O(N)$

Linear orders are commonly found in arrays, linked lists, stacks, queues, etc. where the number of elements is proportional to $n$:

```src
[file]{space_complexity}-[class]{}-[func]{linear}
```

As shown in the figure below, the depth of recursion for this function is $n$, which means that there are $n$ unreturned `linear_recur()` functions at the same time, using $O(n)$ size stack frame space:

```src
[file]{space_complexity}-[class]{}-[func]{linear_recur}
```

![Linear order space complexity generated by recursion function](space_complexity.assets/space_complexity_recursive_linear.png)

### Squared Order $O(N^2)$

The squared order is common in matrices and graphs, where the number of elements is squared with $n$:

```src
[file]{space_complexity}-[class]{}-[func]{quadratic}
```

As shown in the figure below, the recursion depth of this function is $n$ , and an array is initialized in each recursion function with lengths $n$, $n-1$, $\dots$, $2$, $1$ , and an average length of $n / 2$ , thus occupying $O(n^2)$ space overall:

```src
[file]{space_complexity}-[class]{}-[func]{quadratic_recur}
```

![Square-order space complexity generated by the recursion function](space_complexity.assets/space_complexity_recursive_quadratic.png)

### Exponential Order $O(2^N)$

Exponential order is common in binary trees. Looking at the figure below, a "full binary tree" of degree $n$ has $2^n - 1$ nodes, occupying $O(2^n)$ space:

```src
[file]{space_complexity}-[class]{}-[func]{build_tree}
```

![Exponential order space complexity generated by a full binary tree](space_complexity.assets/space_complexity_exponential.png)

### Logarithmic Order $O(\Log N)$

Logarithmic order is commonly used in divide and conquer algorithms. For example, in a merge sort, an array of length $n$ is input, and each round of recursion divides the array in half from its midpoint to form a recursion tree of height $\log n$, using $O(\log n)$ stack frame space.

Another example is to convert a number into a string, input a positive integer $n$ which has the number of bits $\log_{10} n + 1$, i.e., the corresponding length of the string is $\log_{10} n + 1$, so the space complexity is $O(\log_{10} n + 1) = O(\log n)$.

## Weighing Time And Space

Ideally, we would like to optimize both the time complexity and the space complexity of an algorithm. In practice, however, optimizing both time complexity and space complexity at the same time is usually very difficult.

**Reducing time complexity usually comes at the cost of increasing space complexity, and vice versa**. We refer to the idea of sacrificing memory space to increase the speed of an algorithm as "space for time"; the opposite is called "time for space".

The choice of thinking depends on what we value more. In most cases, time is more valuable than space, so "space for time" is usually the more common strategy. Of course, it is also important to control the space complexity in case of large amount of data.
