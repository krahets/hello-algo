# Time Complexity

Runtime can intuitively and accurately reflect the efficiency of an algorithm. But how can we accurately estimate the runtime of a code segment?

1. **Identify the Running Platform**: This includes hardware configurations, programming language, system environment, etc., as these factors influence the efficiency of code execution.
2. **Evaluate the Runtime of Various Computational Operations**: For instance, an addition operation `+` might take 1 ns, a multiplication operation `*` might take 10 ns, a print operation `print()` might take 5 ns, etc.
3. **Count All Computational Operations in the Code**: Then sum the execution times of all these operations to estimate the total runtime.

For example, consider the following code with input data size $n$ : 

=== "Python"

    ```python title=""
    # Under an operating platform
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # Cycle n times
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // Under a particular operating platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {  // 1 ns , every round i++ is executed
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // Under a particular operating platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {  // 1 ns , every round i++ is executed
            System.out.println(0);     // 5 ns
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // Under a particular operating platform
    void Algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {  // 1 ns , every round i++ is executed
            Console.WriteLine(0);      // 5 ns
        }
    }
    ```

=== "Go"

    ```go title=""
    // Under a particular operating platform
    func algorithm(n int) {
        a := 2     // 1 ns
        a = a + 1  // 1 ns
        a = a * 2  // 10 ns
        // Loop n times
        for i := 0; i < n; i++ {  // 1 ns
            fmt.Println(a)        // 5 ns
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // Under a particular operating platform
    func algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // Loop n times
        for _ in 0 ..< n { // 1 ns
            print(0) // 5 ns
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // Under a particular operating platform
    function algorithm(n) {
        var a = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // Loop n times
        for(let i = 0; i < n; i++) { // 1 ns , every round i++ is executed
            console.log(0); // 5 ns
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // Under a particular operating platform
    function algorithm(n: number): void {
        var a: number = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // Loop n times
        for(let i = 0; i < n; i++) { // 1 ns , every round i++ is executed
            console.log(0); // 5 ns
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // Under a particular operating platform
    void algorithm(int n) {
      int a = 2; // 1 ns
      a = a + 1; // 1 ns
      a = a * 2; // 10 ns
      // Loop n times
      for (int i = 0; i < n; i++) { // 1 ns , every round i++ is executed
        print(0); // 5 ns
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // Under a particular operating platform
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 ns
        a = a + 1;          // 1 ns
        a = a * 2;          // 10 ns
        // Loop n times
        for _ in 0..n {     // 1 ns for each round i++
            println!("{}", 0);  // 5 ns
        }
    }
    ```

=== "C"

    ```c title=""
    // Under a particular operating platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {   // 1 ns , every round i++ is executed
            printf("%d", 0);            // 5 ns
        }
    }
    ```

=== "Zig"

    ```zig title=""
    // Under a particular operating platform
    fn algorithm(n: usize) void {
        var a: i32 = 2; // 1 ns
        a += 1; // 1 ns
        a *= 2; // 10 ns
        // Loop n times
        for (0..n) |_| { // 1 ns
            std.debug.print("{}\n", .{0}); // 5 ns
        }
    }
    ```
Using the above approach, we could calculate the algorithm's runtime to be $6n+12$ ns:

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

However, in reality, **calculating an algorithm's runtime this way is neither practical nor reasonable**. Firstly, we don't want to tie our time estimates to a specific running platform, as algorithms need to run on a variety of platforms. Secondly, it’s difficult to know the exact runtime of each operation, which complicates the estimation process.

## Tracking Time Growth Trends

Time complexity analysis doesn't measure the exact runtime of an algorithm; **instead, it tracks the trend of how runtime grows as the data volume increases**.

The concept of "time growth trend" is somewhat abstract, so let's understand it through an example. Suppose the input data size is $n$, and consider three algorithm functions `A`, `B`, and `C`:

=== "Python"

    ```python title=""
    # Time complexity of algorithm A: constant order
    def algorithm_A(n: int):
        print(0)
    # Time complexity of algorithm B: linear order
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # Time complexity of algorithm C: constant order
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

=== "C++"

    ```cpp title=""
    // Time complexity of algorithm A: constant order
    void algorithm_A(int n) {
        cout << 0 << endl;
    }
    // Time complexity of algorithm B: linear order
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            cout << 0 << endl;
        }
    }
    // Time complexity of algorithm C: constant order
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            cout << 0 << endl;
        }
    }
    ```

=== "Java"

    ```java title=""
    // Time complexity of algorithm A: constant order
    void algorithm_A(int n) {
        System.out.println(0);
    }
    // Time complexity of algorithm B: linear order
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println(0);
        }
    }
    // Time complexity of algorithm C: constant order
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            System.out.println(0);
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // Time complexity of algorithm A: constant order
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }
    // Time complexity of algorithm B: linear order
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // Time complexity of algorithm C: constant order
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }
    ```

=== "Go"

    ```go title=""
    // Time complexity of algorithm A: constant order
    func algorithm_A(n int) {
        fmt.Println(0)
    }
    // Time complexity of algorithm B: linear order
    func algorithm_B(n int) {
        for i := 0; i < n; i++ {
            fmt.Println(0)
        }
    }
    // Time complexity of algorithm C: constant order
    func algorithm_C(n int) {
        for i := 0; i < 1000000; i++ {
            fmt.Println(0)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // Time complexity of algorithm A: constant order
    func algorithmA(n: Int) {
        print(0)
    }

    // Time complexity of algorithm B: linear order
    func algorithmB(n: Int) {
        for _ in 0 ..< n {
            print(0)
        }
    }

    // Time complexity of algorithm C: constant order
    func algorithmC(n: Int) {
        for _ in 0 ..< 1000000 {
            print(0)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // Time complexity of algorithm A: constant order
    function algorithm_A(n) {
        console.log(0);
    }
    // Time complexity of algorithm B: linear order
    function algorithm_B(n) {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // Time complexity of algorithm C: constant order
    function algorithm_C(n) {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }

    ```

=== "TS"

    ```typescript title=""
    // Time complexity of algorithm A: constant order
    function algorithm_A(n: number): void {
        console.log(0);
    }
    // Time complexity of algorithm B: linear order
    function algorithm_B(n: number): void {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // Time complexity of algorithm C: constant order
    function algorithm_C(n: number): void {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // Time complexity of algorithm A: constant order
    void algorithmA(int n) {
      print(0);
    }
    // Time complexity of algorithm B: linear order
    void algorithmB(int n) {
      for (int i = 0; i < n; i++) {
        print(0);
      }
    }
    // Time complexity of algorithm C: constant order
    void algorithmC(int n) {
      for (int i = 0; i < 1000000; i++) {
        print(0);
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // Time complexity of algorithm A: constant order
    fn algorithm_A(n: i32) {
        println!("{}", 0);
    }
    // Time complexity of algorithm B: linear order
    fn algorithm_B(n: i32) {
        for _ in 0..n {
            println!("{}", 0);
        }
    }
    // Time complexity of algorithm C: constant order
    fn algorithm_C(n: i32) {
        for _ in 0..1000000 {
            println!("{}", 0);
        }
    }
    ```

=== "C"

    ```c title=""
    // Time complexity of algorithm A: constant order
    void algorithm_A(int n) {
        printf("%d", 0);
    }
    // Time complexity of algorithm B: linear order
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            printf("%d", 0);
        }
    }
    // Time complexity of algorithm C: constant order
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            printf("%d", 0);
        }
    }
    ```

=== "Zig"

    ```zig title=""
    // Time complexity of algorithm A: constant order
    fn algorithm_A(n: usize) void {
        _ = n;
        std.debug.print("{}\n", .{0});
    }
    // Time complexity of algorithm B: linear order
    fn algorithm_B(n: i32) void {
        for (0..n) |_| {
            std.debug.print("{}\n", .{0});
        }
    }
    // Time complexity of algorithm C: constant order
    fn algorithm_C(n: i32) void {
        _ = n;
        for (0..1000000) |_| {
            std.debug.print("{}\n", .{0});
        }
    }
    ```

Figure 2-7 illustrates the time complexities of these three algorithm functions.

- Algorithm `A` involves only $1$ print operation. Its runtime does not increase as $n$ grows. We classify this algorithm's time complexity as "constant order."
- Algorithm `B` requires a print operation to loop $n$ times. Its runtime grows linearly as $n$ increases, making its time complexity "linear order."
- Algorithm `C` needs to loop the print operation $1000000$ times. Although its runtime is lengthy, it is independent of the input data size $n$. Thus, the time complexity of `C` is the same as `A`, still "constant order."

![Time growth trends for algorithms A, B and C](time_complexity.assets/time_complexity_simple_example.png)
<p align="center">Figure 2-7: Time Complexity of Algorithm Functions A, B, and C</p>

What are the characteristics of time complexity analysis compared to directly measuring algorithm runtime?

- **Effective Evaluation of Algorithm Efficiency**: For instance, Algorithm `B`'s runtime grows linearly. It is slower than Algorithm `A` when $n > 1$ and slower than Algorithm `C` when $n > 1,000,000$. In fact, as long as the input data size $n$ is sufficiently large, an algorithm with "constant order" complexity will always be superior to one with "linear order" complexity. This illustrates the meaning conveyed by the trend of time growth.
- **Simpler Estimation Approach**: Clearly, the running platform and types of computational operations are irrelevant to the trend of runtime growth. Thus, in time complexity analysis, we can simply treat the execution time of all computational operations as the same "unit time." This approach simplifies the estimation process from "counting the execution times of operations" to "counting the number of operations", significantly reducing the difficulty of estimation.
- **Limitations of Time Complexity Analysis**: While time complexity offers valuable insights, it has its constraints. For instance, even though Algorithms `A` and `C` have the same time complexity, their actual runtimes can vary significantly. Similarly, even though Algorithm `B` has a higher time complexity than `C`, it is clearly superior when the input data size is small. In these cases, it's difficult to judge the efficiency of algorithms solely based on their time complexity. Nevertheless, despite these issues, complexity analysis remains the most effective and commonly used method for assessing algorithm efficiency.

## Asymptotic Upper Bound of a Function

Consider a function with an input size $n$:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # Cycle n times
        for i in range(n):  # +1
            print(0)        # +1
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Loop n times
        for (int i = 0; i < n; i++) { // +1 (execute i ++ every round)
            cout << 0 << endl;    // +1
        }
    }
    ```

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Loop n times
        for (int i = 0; i < n; i++) { // +1 (execute i ++ every round)
            System.out.println(0);    // +1
        }
    }
    ```

=== "C#"

    ```csharp title=""
    void Algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Loop n times
        for (int i = 0; i < n; i++) {   // +1 (execute i ++ every round)
            Console.WriteLine(0);   // +1
        }
    }
    ```

=== "Go"

    ```go title=""
    func algorithm(n int) {
        a := 1      // +1
        a = a + 1   // +1
        a = a * 2   // +1
        // Loop n times
        for i := 0; i < n; i++ {   // +1
            fmt.Println(a)         // +1
        }
    }
    ```

=== "Swift"

    ```swift title=""
    func algorithm(n: Int) {
        var a = 1 // +1
        a = a + 1 // +1
        a = a * 2 // +1
        // Loop n times
        for _ in 0 ..< n { // +1
            print(0) // +1
        }
    }
    ```

=== "JS"

    ```javascript title=""
    function algorithm(n) {
        var a = 1; // +1
        a += 1; // +1
        a *= 2; // +1
        // Loop n times
        for(let i = 0; i < n; i++){ // +1 (execute i ++ every round)
            console.log(0); // +1
        }
    }
    ```

=== "TS"

    ```typescript title=""
    function algorithm(n: number): void{
        var a: number = 1; // +1
        a += 1; // +1
        a *= 2; // +1
        // Loop n times
        for(let i = 0; i < n; i++){ // +1 (execute i ++ every round)
            console.log(0); // +1
        }
    }
    ```

=== "Dart"

    ```dart title=""
    void algorithm(int n) {
      int a = 1; // +1
      a = a + 1; // +1
      a = a * 2; // +1
      // Loop n times
      for (int i = 0; i < n; i++) { // +1 (execute i ++ every round)
        print(0); // +1
      }
    }
    ```

=== "Rust"

    ```rust title=""
    fn algorithm(n: i32) {
        let mut a = 1;   // +1
        a = a + 1;      // +1
        a = a * 2;      // +1

        // Loop n times
        for _ in 0..n { // +1 (execute i ++ every round)
            println!("{}", 0); // +1
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Loop n times
        for (int i = 0; i < n; i++) {   // +1 (execute i ++ every round)
            printf("%d", 0);            // +1
        }
    } 
    ```

=== "Zig"

    ```zig title=""
    fn algorithm(n: usize) void {
        var a: i32 = 1; // +1
        a += 1; // +1
        a *= 2; // +1
        // Loop n times
        for (0..n) |_| { // +1 (execute i ++ every round)
            std.debug.print("{}\n", .{0}); // +1
        }
    }
    ```

Suppose the number of operations of the algorithm is a function of the input data size $n$, denoted as $T(n)$. Then, the operation count for the above function is:

$$
T(n) = 3 + 2n
$$

Since $T(n)$ is a linear function, indicating that its runtime trend is linear, its time complexity is of linear order.

We denote linear order time complexity as $O(n)$, a mathematical symbol known as "Big $O$ notation." It represents the "asymptotic upper bound" of the function $T(n)$.

Essentially, time complexity analysis calculates the asymptotic upper bound of the "operation count function $T(n)$" and has a precise mathematical definition.

!!! abstract "Asymptotic Upper Bound"

    If there exists a positive real number $c$ and a real number $n_0$ such that for all $n > n_0$, it holds that $T(n) \leq c \cdot f(n)$, then we can consider $f(n)$ to provide an asymptotic upper bound for $T(n)$, denoted as $T(n) = O(f(n))$.

As illustrated in Figure 2-8, calculating the asymptotic upper bound involves finding a function $f(n)$ such that, as $n$ approaches infinity, $T(n)$ and $f(n)$ are of the same order of growth, differing only by a constant factor $c$.

![asymptotic upper bound of function](time_complexity.assets/asymptotic_upper_bound.png)
<p align="center">Figure 2-8: Asymptotic Upper Bound of a Function</p>

## Estimation Approach

The concept of the asymptotic upper bound might seem mathematically dense, but don’t worry if you don’t fully grasp it yet. In practical applications, understanding the estimation approach is enough to gradually comprehend its mathematical significance.

Once $f(n)$ is determined according to the definition, we can derive the time complexity $O(f(n))$. So, how do we determine the asymptotic upper bound $f(n)$? It generally involves two steps: first, counting the number of operations, and then determining the asymptotic upper bound.

### First Step: Counting the Number of Operations

Analyze the code line by line from top to bottom. However, since the constant $c$ in $c \cdot f(n)$ can be any size, **various coefficients and constants in $T(n)$ can be disregarded**. Based on this principle, we can summarize the following simplification techniques for counting:

1. **Ignore constant terms in $T(n)$**. Since they are unrelated to $n$ and do not impact time complexity.
2. **Omit all coefficients**. For example, looping $2n$ times or $5n + 1$ times can be simplified to $n$ times, as the coefficients before $n$ have no impact on time complexity.
3. **Multiply when dealing with nested loops**. The total number of operations equals the product of the number of operations in the outer and inner loops, and each loop can still apply the first and second techniques separately.

Given a function, we can use these techniques to count the number of operations.

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0 (trick 1)
        a = a + n  # +0 (trick 1)
        # +n (technique 2)
        for i in range(5 * n + 1):
            print(0)
        # +n*n (technique 3)
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0 (trick 1)
        a = a + n;  // +0 (trick 1)
        // +n (technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n (technique 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                cout << 0 << endl;
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 1;  // +0 (trick 1)
        a = a + n;  // +0 (trick 1)
        // +n (technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n (technique 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                System.out.println(0);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    void Algorithm(int n) {
        int a = 1;  // +0 (trick 1)
        a = a + n;  // +0 (trick 1)
        // +n (technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (technique 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    func algorithm(n int) {
        a := 1     // +0 (trick 1)
        a = a + n  // +0 (trick 1)
        // +n (technique 2)
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n (technique 3)
        for i := 0; i < 2 * n; i++ {
            for j := 0; j < n + 1; j++ {
                fmt.Println(0)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    func algorithm(n: Int) {
        var a = 1 // +0 (trick 1)
        a = a + n // +0 (trick 1)
        // +n (technique 2)
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n (technique 3)
        for _ in 0 ..< (2 * n) {
            for _ in 0 ..< (n + 1) {
                print(0)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    function algorithm(n) {
        let a = 1;  // +0 (trick 1)
        a = a + n;  // +0 (trick 1)
        // +n (technique 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (technique 3)
        for (let i = 0; i < 2 * n; i++) {
            for (let j = 0; j < n + 1; j++) {
                console.log(0);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    function algorithm(n: number): void {
        let a = 1;  // +0 (trick 1)
        a = a + n;  // +0 (trick 1)
        // +n (technique 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (technique 3)
        for (let i = 0; i < 2 * n; i++) {
            for (let j = 0; j < n + 1; j++) {
                console.log(0);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    void algorithm(int n) {
      int a = 1; // +0 (trick 1)
      a = a + n; // +0 (trick 1)
      // +n (technique 2)
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n (technique 3)
      for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
          print(0);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    fn algorithm(n: i32) {
        let mut a = 1;     // +0 (trick 1)
        a = a + n;        // +0 (trick 1)

        // +n (technique 2)
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n (technique 3)
        for i in 0..(2 * n) {
            for j in 0..(n + 1) {
                println!("{}", 0);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 1;  // +0 (trick 1)
        a = a + n;  // +0 (trick 1)
        // +n (technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n (technique 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                printf("%d", 0);
            }
        }
    }
    ```

=== "Zig"

    ```zig title=""
    fn algorithm(n: usize) void {
        var a: i32 = 1;     // +0 (trick 1)
        a = a + @as(i32, @intCast(n));        // +0 (trick 1)

        // +n (technique 2)
        for(0..(5 * n + 1)) |_| {
            std.debug.print("{}\n", .{0});
        }

        // +n*n (technique 3)
        for(0..(2 * n)) |_| {
            for(0..(n + 1)) |_| {
                std.debug.print("{}\n", .{0});
            }
        }
    }
    ```

The following formula shows the counting results before and after using these techniques, both leading to the same time complexity of $O(n^2)$.

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{Comprehensive Counting (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{Shortcut Counting (o.O)}
\end{aligned}
$$

### Second Step: Determining the Asymptotic Upper Bound

**The time complexity of a polynomial T(n) is determined by its highest-order term**. This is because, as $n$ approaches infinity, the highest-order term becomes dominant, and the influence of other terms can be disregarded.

Table 2-2 shows some examples, including some exaggerated values to emphasize the conclusion that "coefficients do not alter the order." When $n$ becomes infinitely large, these constants become insignificant.

<p align="center"> Table <2-2> &nbsp; Time Complexities for Different Operation Counts </p>

| Operation Count $T(n)$ | Time Complexity $O(f(n))$ |
| --------------------------- | ------------------------- |
| $100000$                    | $O(1)$                    |
| $3n + 2$                    | $O(n)$                    |
| $2n^2 + 3n + 2$             | $O(n^2)$                  |
| $n^3 + 10000n^2$            | $O(n^3)$                  |
| $2^n + 10000n^{10000}$      | $O(2^n)$                  |

## Common Types

With the input data size denoted as $n$, common types of time complexities are shown in Figure 2-9, arranged in ascending order of complexity:

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
\text{Constant Order} < \text{Logarithmic Order} < \text{Linear Order} < \text{Linear-Logarithmic Order} < \text{Quadratic Order} < \text{Exponential Order} < \text{Factorial Order}
\end{aligned}
$$

![Common time complexity types](time_complexity.assets/time_complexity_common_types.png)
<p align="center">Figure 2-9: Common Types of Time Complexity</p>

### Constant Order $O(1)$

In constant order complexity, the number of operations is independent of the size of the input data $n$; it does not change as $n$ varies.

In the following function, although the operation count `size` may be large, since it is unrelated to the input data size $n$, the time complexity remains $O(1)$ :

```src
[file]{time_complexity}-[class]{}-[func]{constant}
```

### Linear Order $O(N)$

In linear order complexity, the number of operations grows linearly relative to the input data size $n$. Linear order often appears in single-layer loops:

```src
[file]{time_complexity}-[class]{}-[func]{linear}
```

Operations like traversing an array or a linked list have a time complexity of $O(n)$, where $n$ is the length of the array or list:

```src
[file]{time_complexity}-[class]{}-[func]{array_traversal}
```

It's important to note that **the size of the input data $n$ should be determined based on the type of input**. For instance, in the first example, the variable $n$ represents the size of the input data; in the second example, the length of the array $n$ is the data size.

### Quadratic Order $O(N^2)$

The number of operations in a quadratic order increases as the square of the input data size $n$. This typically occurs in nested loops, where both the outer and inner loops are $O(n)$, leading to an overall complexity of $O(n^2)$:

```src
[file]{time_complexity}-[class]{}-[func]{quadratic}
```

Figure 2-10 compares the constant, linear, and quadratic orders of time complexity.

![Time complexity of constant, linear and quadratic orders](time_complexity.assets/time_complexity_constant_linear_quadratic.png)
<p align="center">Figure 2-10: Time Complexity of Constant, Linear, and Quadratic Orders</p>

For example, in bubble sort, the outer loop runs $n - 1$ times, and the inner loop runs $n-1$, $n-2$, $\dots$, $2$, $1$ times on average, which is about $n / 2$ times, making the time complexity $O((n - 1) n / 2) = O(n^2)$.

```src
[file]{time_complexity}-[class]{}-[func]{bubble_sort}
```

## Exponential Order $O(2^N)$

A classic example of exponential order growth is biological "cell division": starting with $1$ cell, it divides into $2$ cells after one round, $4$ cells after two rounds, and so on, resulting in $2^n$ cells after $n$ rounds.

Figure 2-11 and the following code simulate the cell division process, with a time complexity of $O(2^n)$.

```src
[file]{time_complexity}-[class]{}-[func]{exponential}
```

![time complexity of exponential order](time_complexity.assets/time_complexity_exponential.png)
<p align="center">Figure 2-11: Time Complexity of Exponential Order</p>

In practical algorithms, exponential order often appears in recursive functions. For example, in the following code, the function recursively splits in two, stopping after $n$ divisions:

```src
[file]{time_complexity}-[class]{}-[func]{exp_recur}
```

Exponential growth is very rapid and commonly seen in exhaustive methods (brute-force search, backtracking, etc.). For large-scale data, exponential order is not feasible, and algorithms like dynamic programming or greedy methods are typically employed instead.

### Logarithmic Order $O(\Log N)$

Contrasting with exponential order, logarithmic order reflects a "halving each round" scenario. If the input data size is $n$, and it halves every round, the number of loops is $\log_2 n$, which is the inverse function of $2^n$.

Figure 2-12 and the following code simulate the "halving each round" process, with a time complexity of $O(\log_2 n)$, commonly simplified to $O(\log n)$.

```src
[file]{time_complexity}-[class]{}-[func]{logarithmic}
```

![time complexity of logarithmic order](time_complexity.assets/time_complexity_logarithmic.png)
<p align="center">Figure 2-12: Time Complexity of Logarithmic Order</p>

Similar to exponential order, logarithmic order also often appears in recursive functions. The following code forms a recursive tree with a height of $\log_2 n$:

```src
[file]{time_complexity}-[class]{}-[func]{log_recur}
```

Logarithmic order is typically found in "divide and conquer" algorithms and embodies the principle of "splitting into many" and "simplifying the complex." It is a slowly growing order, second only to constant order in desirability.

!!! tip "What is the base of $O(\log n)$?"

    Strictly speaking, a "split into $m$ parts" corresponds to a time complexity of $O(\log_m n)$. However, using the logarithm base change formula, we find equivalent time complexities with different bases:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    This means the base $m$ can be changed without affecting the complexity. Therefore, we usually omit the base $m$ and simply denote logarithmic order as $O(\log n)$.

### Linear-Logarithmic Order $O(N \Log N)$

Linear-logarithmic order often occurs in nested loops, with the time complexities of the two layers being $O(\log n)$ and $O(n)$, respectively. Related code is as follows:

```src
[file]{time_complexity}-[class]{}-[func]{linear_log_recur}
```

Figure 2-13 illustrates the formation of linear-logarithmic order. In a binary tree, each layer has $n$ operations, and the tree has $\log_2 n + 1$ layers, so the time complexity is $O(n\log n)$.

![Time complexity of linear logarithmic order](time_complexity.assets/time_complexity_logarithmic_linear.png)
<p align="center">Figure 2-13: Time Complexity of Linear-Logarithmic Order</p>

The time complexity of mainstream sorting algorithms is often $O(n \log n)$, including quicksort, merge sort, heap sort, and others.

### Factorial Order $O(N!)$

Factorial order corresponds to the mathematical concept of “full permutation.” Given $n$ distinct elements, the number of possible permutations is:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Factorial is typically implemented using recursion. As shown in Figure 2-14 and the following code, the first layer splits into $n$ parts, the second layer into $n - 1$ parts, and so on, stopping after $n$ layers:

```src
[file]{time_complexity}-[class]{}-[func]{factorial_recur}
```

![Time complexity of the factorial order](time_complexity.assets/time_complexity_factorial.png)
<p align="center">Figure 2-14: Time Complexity of Factorial Order</p>

Note that because $n! > 2^n$ for $n \geq 4$, factorial order grows faster than exponential order and is also unacceptable for large $n$.

## Worst, Best, and Average Time Complexity

**The time efficiency of an algorithm often varies and depends on the distribution of the input data**. Suppose we have an array `nums` of length $n$, composed of numbers from $1$ to $n$, each appearing only once but in a random order, and the task is to return the index of the element $1$. We can draw the following conclusions:

- When `nums = [? , ? , ... , 1]`, i.e., when the last element is $1$, it necessitates traversing the entire array, **leading to the worst-case time complexity of $O(n)$**.
- When `nums = [1, ? , ? , ...]`, i.e., when the first element is $1$, there's no need for further traversal regardless of array length, **achieving the best-case time complexity**.

The "worst-case time complexity" corresponds to the asymptotic upper bound, represented by the Big $O$ notation. Correspondingly, the "best-case time complexity" relates to the asymptotic lower bound, denoted by the $\Omega$ notation. 

```src
[file]{worst_best_time_complexity}-[class]{}-[func]{find_one}
```

It's important to note that best-case time complexity is seldom used in practice, as it usually represents an outcome that occurs under a very small probability, which can be misleading. **The worst-case time complexity is more practical, as it provides a "safe" efficiency level, ensuring the reliable use of the algorithm**.

From the example, it's clear that worst or best-case time complexities only occur in "special data distributions," which may have a low probability and don't truly reflect the algorithm's efficiency. In contrast, **the average time complexity reveals the algorithm's efficiency with random input data** and is denoted by the $\Theta$ notation.

For some algorithms, we can straightforwardly calculate the average case under random data distribution. For instance, in the previous example, since the input array is shuffled, the probability of element $1$ appearing at any index is equal, making the average number of iterations half the array's length $n / 2$, resulting in an average time complexity of $\Theta(n / 2) = \Theta(n)$.

However, calculating the average time complexity for more complex algorithms is often challenging due to the difficulty in analyzing the overall mathematical expectations under data distributions. In these cases, the worst-case time complexity is commonly used as the standard for assessing algorithm efficiency.

!!! question "Why is the $\Theta$ Symbol Rarely Seen?"

    Possibly due to the prevalence and ease of use of the Big $O$ notation, it is often used to represent average time complexity. However, strictly speaking, this usage is not accurate. In this book and other materials, if you come across expressions like "average time complexity $O(n)$", they should be interpreted as $\Theta(n)$.
