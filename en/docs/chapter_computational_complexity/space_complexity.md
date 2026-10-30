# Space complexity

<u>Space complexity</u> measures how an algorithm's memory use grows as the input gets larger. It is much like time complexity, with memory usage replacing runtime.

## Space used by an algorithm

The memory an algorithm uses during execution falls into these main categories.

- **Input space**: Stores the input data.
- **Temporary space**: Stores variables, objects, function contexts, and other working data.
- **Output space**: Stores the output data.

Space complexity generally counts temporary space plus output space.

Temporary space can be divided further into three parts.

- **Temporary data**: Constants, variables, objects, and other data used during execution.
- **Stack frames**: Context data for function calls. Each call creates a frame at the top of the stack, which is released when the function returns.
- **Instruction space**: Compiled program instructions, usually ignored in the analysis.

**We usually count temporary data, stack frames, and output data** when analyzing space complexity, as shown in the figure below.

![Space used by an algorithm](space_complexity.assets/space_types.png)

The corresponding code is:

=== "Python"

    ```python title=""
    class Node:
        """Class"""
        def __init__(self, x: int):
            self.val: int = x              # Node value
            self.next: Node | None = None  # Reference to the next node

    def function() -> int:
        """Function"""
        # Perform some operations...
        return 0

    def algorithm(n) -> int:  # Input data
        A = 0                 # Temporary data (constant, conventionally named in uppercase)
        b = 0                 # Temporary data (variable)
        node = Node(0)        # Temporary data (object)
        c = function()        # Stack frame (function call)
        return A + b + c      # Output data
    ```

=== "C++"

    ```cpp title=""
    /* Structure */
    struct Node {
        int val;
        Node *next;
        Node(int x) : val(x), next(nullptr) {}
    };

    /* Function */
    int func() {
        // Perform some operations...
        return 0;
    }

    int algorithm(int n) {        // Input data
        const int a = 0;          // Temporary data (constant)
        int b = 0;                // Temporary data (variable)
        Node* node = new Node(0); // Temporary data (object)
        int c = func();           // Stack frame (function call)
        return a + b + c;         // Output data
    }
    ```

=== "Java"

    ```java title=""
    /* Class */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }
    
    /* Function */
    int function() {
        // Perform some operations...
        return 0;
    }
    
    int algorithm(int n) {        // Input data
        final int a = 0;          // Temporary data (constant)
        int b = 0;                // Temporary data (variable)
        Node node = new Node(0);  // Temporary data (object)
        int c = function();       // Stack frame (function call)
        return a + b + c;         // Output data
    }
    ```

=== "C#"

    ```csharp title=""
    /* Class */
    class Node(int x) {
        int val = x;
        Node next;
    }

    /* Function */
    int Function() {
        // Perform some operations...
        return 0;
    }

    int Algorithm(int n) {        // Input data
        const int a = 0;          // Temporary data (constant)
        int b = 0;                // Temporary data (variable)
        Node node = new(0);       // Temporary data (object)
        int c = Function();       // Stack frame (function call)
        return a + b + c;         // Output data
    }
    ```

=== "Go"

    ```go title=""
    /* Structure */
    type node struct {
        val  int
        next *node
    }

    /* Create a node structure  */
    func newNode(val int) *node {
        return &node{val: val}
    }
    
    /* Function */
    func function() int {
        // Perform some operations...
        return 0
    }

    func algorithm(n int) int { // Input data
        const a = 0             // Temporary data (constant)
        b := 0                  // Temporary data (variable)
        newNode(0)              // Temporary data (object)
        c := function()         // Stack frame (function call)
        return a + b + c        // Output data
    }
    ```

=== "Swift"

    ```swift title=""
    /* Class */
    class Node {
        var val: Int
        var next: Node?

        init(x: Int) {
            val = x
        }
    }

    /* Function */
    func function() -> Int {
        // Perform some operations...
        return 0
    }

    func algorithm(n: Int) -> Int { // Input data
        let a = 0             // Temporary data (constant)
        var b = 0             // Temporary data (variable)
        let node = Node(x: 0) // Temporary data (object)
        let c = function()    // Stack frame (function call)
        return a + b + c      // Output data
    }
    ```

=== "JS"

    ```javascript title=""
    /* Class */
    class Node {
        val;
        next;
        constructor(val) {
            this.val = val === undefined ? 0 : val; // Node value
            this.next = null;                       // Reference to the next node
        }
    }

    /* Function */
    function constFunc() {
        // Perform some operations
        return 0;
    }

    function algorithm(n) {       // Input data
        const a = 0;              // Temporary data (constant)
        let b = 0;                // Temporary data (variable)
        const node = new Node(0); // Temporary data (object)
        const c = constFunc();    // Stack frame (function call)
        return a + b + c;         // Output data
    }
    ```

=== "TS"

    ```typescript title=""
    /* Class */
    class Node {
        val: number;
        next: Node | null;
        constructor(val?: number) {
            this.val = val === undefined ? 0 : val; // Node value
            this.next = null;                       // Reference to the next node
        }
    }

    /* Function */
    function constFunc(): number {
        // Perform some operations
        return 0;
    }

    function algorithm(n: number): number { // Input data
        const a = 0;                        // Temporary data (constant)
        let b = 0;                          // Temporary data (variable)
        const node = new Node(0);           // Temporary data (object)
        const c = constFunc();              // Stack frame (function call)
        return a + b + c;                   // Output data
    }
    ```

=== "Dart"

    ```dart title=""
    /* Class */
    class Node {
      int val;
      Node next;
      Node(this.val, [this.next]);
    }

    /* Function */
    int function() {
      // Perform some operations...
      return 0;
    }

    int algorithm(int n) {  // Input data
      const int a = 0;      // Temporary data (constant)
      int b = 0;            // Temporary data (variable)
      Node node = Node(0);  // Temporary data (object)
      int c = function();   // Stack frame (function call)
      return a + b + c;     // Output data
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    
    /* Structure */
    struct Node {
        val: i32,
        next: Option<Rc<RefCell<Node>>>,
    }

    /* Create a Node structure */
    impl Node {
        fn new(val: i32) -> Self {
            Self { val: val, next: None }
        }
    }

    /* Function */
    fn function() -> i32 {      
        // Perform some operations...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {       // Input data
        const a: i32 = 0;               // Temporary data (constant)
        let mut b = 0;                  // Temporary data (variable)
        let node = Node::new(0);        // Temporary data (object)
        let c = function();             // Stack frame (function call)
        return a + b + c;               // Output data
    }
    ```

=== "C"

    ```c title=""
    /* Function */
    int func() {
        // Perform some operations...
        return 0;
    }

    int algorithm(int n) { // Input data
        const int a = 0;   // Temporary data (constant)
        int b = 0;         // Temporary data (variable)
        int c = func();    // Stack frame (function call)
        return a + b + c;  // Output data
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Class */
    class Node(var _val: Int) {
        var next: Node? = null
    }

    /* Function */
    fun function(): Int {
        // Perform some operations...
        return 0
    }

    fun algorithm(n: Int): Int { // Input data
        val a = 0                // Temporary data (constant)
        var b = 0                // Temporary data (variable)
        val node = Node(0)       // Temporary data (object)
        val c = function()       // Stack frame (function call)
        return a + b + c         // Output data
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Class ###
    class Node
        attr_accessor :val      # Node value
        attr_accessor :next     # Reference to the next node

        def initialize(x)
            @val = x
        end
    end

    ### Function ###
    def function
        # Perform some operations...
        0
    end

    ### Algorithm ###
    def algorithm(n)        # Input data
        a = 0               # Temporary data (constant)
        b = 0               # Temporary data (variable)
        node = Node.new(0)  # Temporary data (object)
        c = function        # Stack frame (function call)
        a + b + c           # Output data
    end
    ```

## Deriving space complexity

The approach is much like time complexity analysis, except that we count memory used rather than operations performed.

Unlike time complexity, **we usually focus only on worst-case space complexity**. Memory is a hard requirement: enough must be available for every valid input.

In the following code, "worst case" has two meanings.

1. **The worst input**: When $n < 10$, space complexity is $O(1)$. When $n > 10$, initializing `nums` requires $O(n)$ space, so worst-case space complexity is $O(n)$.
2. **Peak memory during execution**: Before the final line, the program uses $O(1)$ space. Initializing `nums` raises usage to $O(n)$, so worst-case space complexity is $O(n)$.

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

**For recursive functions, remember to count stack frames**. Consider the following code:

=== "Python"

    ```python title=""
    def function() -> int:
        # Perform some operations
        return 0

    def loop(n: int):
        """The loop uses O(1) space"""
        for _ in range(n):
            function()

    def recur(n: int):
        """The recursion uses O(n) space"""
        if n == 1:
            return
        return recur(n - 1)
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* The recursion uses O(n) space */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Java"

    ```java title=""
    int function() {
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* The recursion uses O(n) space */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int Function() {
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    void Loop(int n) {
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    /* The recursion uses O(n) space */
    int Recur(int n) {
        if (n == 1) return 1;
        return Recur(n - 1);
    }
    ```

=== "Go"

    ```go title=""
    func function() int {
        // Perform some operations
        return 0
    }
    
    /* The loop uses O(1) space */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
    
    /* The recursion uses O(n) space */
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
        // Perform some operations
        return 0
    }

    /* The loop uses O(1) space */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* The recursion uses O(n) space */
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
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* The recursion uses O(n) space */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TS"

    ```typescript title=""
    function constFunc(): number {
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* The recursion uses O(n) space */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "Dart"

    ```dart title=""
    int function() {
      // Perform some operations
      return 0;
    }
    /* The loop uses O(1) space */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* The recursion uses O(n) space */
    void recur(int n) {
      if (n == 1) return;
      recur(n - 1);
    }
    ```

=== "Rust"

    ```rust title=""
    fn function() -> i32 {
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    fn loop(n: i32) {
        for i in 0..n {
            function();
        }
    }
    /* The recursion uses O(n) space */
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
        // Perform some operations
        return 0;
    }
    /* The loop uses O(1) space */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* The recursion uses O(n) space */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun function(): Int {
        // Perform some operations
        return 0
    }
    /* The loop uses O(1) space */
    fun loop(n: Int) {
        for (i in 0..<n) {
            function()
        }
    }
    /* The recursion uses O(n) space */
    fun recur(n: Int) {
        if (n == 1) return
        return recur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title=""
    def function
        # Perform some operations
        0
    end

    ### The loop uses O(1) space ###
    def loop(n)
        (0...n).each { function }
    end

    ### The recursion uses O(n) space ###
    def recur(n)
        return if n == 1
        recur(n - 1)
    end
    ```

Both `loop()` and `recur()` take $O(n)$ time, but their space complexities differ.

- `loop()` calls `function()` $n$ times. Each call returns and releases its stack frame before the next iteration, so space complexity remains $O(1)$.
- During `recur()`, $n$ calls can remain active at once, using $O(n)$ space for stack frames.

## Common complexity classes

For input size $n$, the figure below shows common space complexities in increasing order of growth.

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
& \text{Constant} < \text{Logarithmic} < \text{Linear} < \text{Quadratic} < \text{Exponential}
\end{aligned}
$$

![Common space complexity classes](space_complexity.assets/space_complexity_common_types.png)

### Constant space $O(1)$

Constant space commonly occurs when the number of constants, variables, and objects is independent of input size $n$.

Memory for variables initialized or functions called within a loop is released by the next iteration, so it does not accumulate. Space complexity remains $O(1)$:

```src
[file]{space_complexity}-[class]{}-[func]{constant}
```

### Linear space $O(n)$

Linear space commonly occurs in arrays, linked lists, stacks, and queues whose element counts are proportional to $n$:

```src
[file]{space_complexity}-[class]{}-[func]{linear}
```

As shown in the figure below, this function has recursion depth $n$, with $n$ active calls to `linear_recur()` at once, using $O(n)$ space for stack frames:

```src
[file]{space_complexity}-[class]{}-[func]{linear_recur}
```

![Linear space complexity from recursion](space_complexity.assets/space_complexity_recursive_linear.png)

### Quadratic space $O(n^2)$

Quadratic space commonly occurs in matrices and graphs whose element counts grow with the square of $n$:

```src
[file]{space_complexity}-[class]{}-[func]{quadratic}
```

As shown in the figure below, the recursion depth is $n$, and each call initializes an array. Their lengths are $n$, $n-1$, $\dots$, $2$, and $1$, averaging $n / 2$, so total space is $O(n^2)$:

```src
[file]{space_complexity}-[class]{}-[func]{quadratic_recur}
```

![Quadratic space complexity from recursion](space_complexity.assets/space_complexity_recursive_quadratic.png)

### Exponential space $O(2^n)$

Exponential space commonly occurs in binary trees. In the figure below, a perfect binary tree with $n$ levels contains $2^n - 1$ nodes and uses $O(2^n)$ space:

```src
[file]{space_complexity}-[class]{}-[func]{build_tree}
```

![Exponential space used by a perfect binary tree](space_complexity.assets/space_complexity_exponential.png)

### Logarithmic space $O(\log n)$

Logarithmic space often appears in divide-and-conquer algorithms. For example, merge sort splits an array of length $n$ in half at each recursive step, producing a recursion tree of height $\log n$ and using $O(\log n)$ space for stack frames.

Another example is converting a number to a string. A positive integer $n$ has $\lfloor \log_{10} n \rfloor + 1$ digits, giving a string of length $\lfloor \log_{10} n \rfloor + 1$. The space complexity is therefore $O(\log_{10} n + 1) = O(\log n)$.

## Balancing time and space

Ideally, we would minimize both time and space complexity. In practice, optimizing both simultaneously is usually difficult.

**Reducing time complexity often increases space complexity, and vice versa**. Using more memory to run faster is called trading space for time; accepting slower execution to use less memory is trading time for space.

The choice depends on which resource matters more. Time is usually more valuable than space, so trading space for time is common. For very large datasets, however, keeping space complexity under control is also crucial.
