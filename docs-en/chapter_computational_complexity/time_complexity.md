---
comments: true
---

# 2.3 &nbsp; Time Complexity

Runtime can be a visual and accurate reflection of the efficiency of an algorithm. What should we do if we want to accurately predict the runtime of a piece of code?

1. **Determine the running platform**, including hardware configuration, programming language, system environment, etc., all of which affect the efficiency of the code.
2. **Evaluates the running time** required for various computational operations, e.g., the addition operation `+` takes 1 ns, the multiplication operation `*` takes 10 ns, the print operation `print()` takes 5 ns, and so on.
3. **Counts all the computational operations in the code** and sums the execution times of all the operations to get the runtime.

For example, in the following code, the input data size is $n$ :

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

Based on the above method, the algorithm running time can be obtained as $6n + 12$ ns :

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

In practice, however, **statistical algorithm runtimes are neither reasonable nor realistic**. First, we do not want to tie the estimation time to the operation platform, because the algorithm needs to run on a variety of different platforms. Second, it is difficult for us to be informed of the runtime of each operation, which makes the prediction process extremely difficult.

## 2.3.1 &nbsp; Trends In Statistical Time Growth

The time complexity analysis counts not the algorithm running time, **but the tendency of the algorithm running time to increase as the amount of data gets larger**.

The concept of "time-growing trend" is rather abstract, so let's try to understand it through an example. Suppose the size of the input data is $n$, and given three algorithmic functions `A`, `B` and `C`:

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

The Figure 2-7  shows the time complexity of the above three algorithmic functions.

- Algorithm `A` has only $1$ print operations, and the running time of the algorithm does not increase with $n$. We call the time complexity of this algorithm "constant order".
- The print operation in algorithm `B` requires $n$ cycles, and the running time of the algorithm increases linearly with $n$. The time complexity of this algorithm is called "linear order".
- The print operation in algorithm `C` requires $1000000$ loops, which is a long runtime, but it is independent of the size of the input data $n$. Therefore, the time complexity of `C` is the same as that of `A`, which is still of "constant order".

![Time growth trends for algorithms A, B and C](time_complexity.assets/time_complexity_simple_example.png){ class="animation-figure" }

<p align="center"> Figure 2-7 &nbsp; Time growth trends for algorithms A, B and C </p>

What are the characteristics of time complexity analysis compared to direct statistical algorithmic running time?

- The **time complexity can effectively evaluate the efficiency of an algorithm**. For example, the running time of algorithm `B` increases linearly and is slower than algorithm `A` for $n > 1$ and slower than algorithm `C` for $n > 1,000,000$. In fact, as long as the input data size $n$ is large enough, algorithms with "constant order" of complexity will always outperform algorithms with "linear order", which is exactly what the time complexity trend means.
- The **time complexity of the projection method is simpler**. Obviously, neither the running platform nor the type of computational operation is related to the growth trend of the running time of the algorithm. Therefore, in the time complexity analysis, we can simply consider the execution time of all computation operations as the same "unit time", and thus simplify the "statistics of the running time of computation operations" to the "statistics of the number of computation operations", which is the same as the "statistics of the number of computation operations". The difficulty of the estimation is greatly reduced by considering the execution time of all operations as the same "unit time".
- There are also some limitations of **time complexity**. For example, although algorithms `A` and `C` have the same time complexity, the actual running time varies greatly. Similarly, although the time complexity of algorithm `B` is higher than that of `C` , algorithm `B` significantly outperforms algorithm `C` when the size of the input data $n$ is small. In these cases, it is difficult to judge the efficiency of an algorithm based on time complexity alone. Of course, despite the above problems, complexity analysis is still the most effective and commonly used method to judge the efficiency of algorithms.

## 2.3.2 &nbsp; Functions Asymptotic Upper Bounds

Given a function with input size $n$:

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

Let the number of operations of the algorithm be a function of the size of the input data $n$, denoted as $T(n)$ , then the number of operations of the above function is:

$$
T(n) = 3 + 2n
$$

$T(n)$ is a primary function, which indicates that the trend of its running time growth is linear, and thus its time complexity is of linear order.

We denote the time complexity of the linear order as $O(n)$ , and this mathematical notation is called the "big $O$ notation big-$O$ notation", which denotes the "asymptotic upper bound" of the function $T(n)$.

Time complexity analysis is essentially the computation of asymptotic upper bounds on the "number of operations function $T(n)$", which has a clear mathematical definition.

!!! abstract "Function asymptotic upper bound"

    If there exists a positive real number $c$ and a real number $n_0$ such that $T(n) \leq c \cdot f(n)$ for all $n > n_0$ , then it can be argued that $f(n)$ gives an asymptotic upper bound on $T(n)$ , denoted as $T(n) = O(f(n))$ .

As shown in the Figure 2-8 , computing the asymptotic upper bound is a matter of finding a function $f(n)$ such that $T(n)$ and $f(n)$ are at the same growth level as $n$ tends to infinity, differing only by a multiple of the constant term $c$.

![asymptotic upper bound of function](time_complexity.assets/asymptotic_upper_bound.png){ class="animation-figure" }

<p align="center"> Figure 2-8 &nbsp; asymptotic upper bound of function </p>

## 2.3.3 &nbsp; Method Of Projection

Asymptotic upper bounds are a bit heavy on math, so don't worry if you feel you don't have a full solution. Because in practice, we only need to master the projection method, and the mathematical meaning can be gradually comprehended.

By definition, after determining $f(n)$, we can get the time complexity $O(f(n))$. So how to determine the asymptotic upper bound $f(n)$? The overall is divided into two steps: first count the number of operations, and then determine the asymptotic upper bound.

### 1. &nbsp; The First Step: Counting The Number Of Operations

For the code, it is sufficient to calculate from top to bottom line by line. However, since the constant term $c \cdot f(n)$ in the above $c \cdot f(n)$ can take any size, **the various coefficients and constant terms in the number of operations $T(n)$ can be ignored**. Based on this principle, the following counting simplification techniques can be summarized.

1. **Ignore the constant terms in $T(n)$**. Since none of them are related to $n$, they have no effect on the time complexity.
2. **omits all coefficients**. For example, loops $2n$ times, $5n + 1$ times, etc., can be simplified and notated as $n$ times because the coefficients before $n$ have no effect on the time complexity.
3. **Use multiplication** when loops are nested. The total number of operations is equal to the product of the number of operations of the outer and inner levels of the loop, and each level of the loop can still be nested by applying the techniques in points `1.` and `2.` respectively.

Given a function, we can use the above trick to count the number of operations.

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

The following equations show the statistical results before and after using the above technique, both of which were introduced with a time complexity of $O(n^2)$ .

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{complete statistics (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{Lazy Stats (o.O)}
\end{aligned}
$$

### 2. &nbsp; Step 2: Judging The Asymptotic Upper Bounds

**The time complexity is determined by the highest order term in the polynomial $T(n)$**. This is because as $n$ tends to infinity, the highest order term will play a dominant role and the effects of all other terms can be ignored.

The Table 2-2  shows some examples, some of which have exaggerated values to emphasize the conclusion that "the coefficients can't touch the order". As $n$ tends to infinity, these constants become irrelevant.

<p align="center"> Table 2-2 &nbsp; Time complexity corresponding to different number of operations </p>

<div class="center-table" markdown>

| number of operations $T(n)$ | time complexity $O(f(n))$ |
| --------------------------- | ------------------------- |
| $100000$                    | $O(1)$                    |
| $3n + 2$                    | $O(n)$                    |
| $2n^2 + 3n + 2$             | $O(n^2)$                  |
| $n^3 + 10000n^2$            | $O(n^3)$                  |
| $2^n + 10000n^{10000}$      | $O(2^n)$                  |

</div>

## 2.3.4 &nbsp; Common Types

Let the input data size be $n$ , the common types of time complexity are shown in the Figure 2-9  (in descending order).

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
\text{constant order} < \text{logarithmic order} < \text{linear order} < \text{linear logarithmic order} < \text{square order} < \text{exponential order} < \text{multiplication order}
\end{aligned}
$$

![Common time complexity types](time_complexity.assets/time_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Figure 2-9 &nbsp; Common time complexity types </p>

### 1. &nbsp; Constant Order $O(1)$

The number of operations of the constant order is independent of the input data size $n$, i.e., it does not change with $n$.

In the following function, although the number of operations `size` may be large, the time complexity is still $O(1)$ because it is independent of the input data size $n$ :

=== "Python"

    ```python title="time_complexity.py"
    def constant(n: int) -> int:
        """常数阶"""
        count = 0
        size = 100000
        for _ in range(size):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 常数阶 */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 常数阶 */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 常数阶 */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 常数阶 */
    func constant(n int) int {
        count := 0
        size := 100000
        for i := 0; i < size; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 常数阶 */
    func constant(n: Int) -> Int {
        var count = 0
        let size = 100_000
        for _ in 0 ..< size {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 常数阶 */
    function constant(n) {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 常数阶 */
    function constant(n: number): number {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 常数阶 */
    int constant(int n) {
      int count = 0;
      int size = 100000;
      for (var i = 0; i < size; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 常数阶 */
    fn constant(n: i32) -> i32 {
        _ = n;
        let mut count = 0;
        let size = 100_000;
        for _ in 0..size {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 常数阶 */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        int i = 0;
        for (int i = 0; i < size; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 常数阶
    fn constant(n: i32) i32 {
        _ = n;
        var count: i32 = 0;
        const size: i32 = 100_000;
        var i: i32 = 0;
        while(i<size) : (i += 1) {
            count += 1;
        }
        return count;
    }
    ```

### 2. &nbsp; Linear Order $O(N)$

The number of operations in a linear order grows in linear steps relative to the input data size $n$. Linear orders are usually found in single level loops:

=== "Python"

    ```python title="time_complexity.py"
    def linear(n: int) -> int:
        """线性阶"""
        count = 0
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 线性阶 */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 线性阶 */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 线性阶 */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 线性阶 */
    func linear(n int) int {
        count := 0
        for i := 0; i < n; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 线性阶 */
    func linear(n: Int) -> Int {
        var count = 0
        for _ in 0 ..< n {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 线性阶 */
    function linear(n) {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 线性阶 */
    function linear(n: number): number {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 线性阶 */
    int linear(int n) {
      int count = 0;
      for (var i = 0; i < n; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 线性阶 */
    fn linear(n: i32) -> i32 {
        let mut count = 0;
        for _ in 0..n {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 线性阶 */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 线性阶
    fn linear(n: i32) i32 {
        var count: i32 = 0;
        var i: i32 = 0;
        while (i < n) : (i += 1) {
            count += 1;
        }
        return count;
    }
    ```

The time complexity of operations such as traversing an array and traversing a linked list is $O(n)$ , where $n$ is the length of the array or linked list:

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """线性阶（遍历数组）"""
        count = 0
        # 循环次数与数组长度成正比
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 线性阶（遍历数组） */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // 循环次数与数组长度成正比
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 线性阶（遍历数组） */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // 循环次数与数组长度成正比
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 线性阶（遍历数组） */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // 循环次数与数组长度成正比
        foreach (int num in nums) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 线性阶（遍历数组） */
    func arrayTraversal(nums []int) int {
        count := 0
        // 循环次数与数组长度成正比
        for range nums {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 线性阶（遍历数组） */
    func arrayTraversal(nums: [Int]) -> Int {
        var count = 0
        // 循环次数与数组长度成正比
        for _ in nums {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 线性阶（遍历数组） */
    function arrayTraversal(nums) {
        let count = 0;
        // 循环次数与数组长度成正比
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 线性阶（遍历数组） */
    function arrayTraversal(nums: number[]): number {
        let count = 0;
        // 循环次数与数组长度成正比
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 线性阶（遍历数组） */
    int arrayTraversal(List<int> nums) {
      int count = 0;
      // 循环次数与数组长度成正比
      for (var _num in nums) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 线性阶（遍历数组） */
    fn array_traversal(nums: &[i32]) -> i32 {
        let mut count = 0;
        // 循环次数与数组长度成正比
        for _ in nums {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 线性阶（遍历数组） */
    int arrayTraversal(int *nums, int n) {
        int count = 0;
        // 循环次数与数组长度成正比
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 线性阶（遍历数组）
    fn arrayTraversal(nums: []i32) i32 {
        var count: i32 = 0;
        // 循环次数与数组长度成正比
        for (nums) |_| {
            count += 1;
        }
        return count;
    }
    ```

It is worth noting that **Input data size $n$ needs to be determined specifically** according to the type of input data. For example, in the first example, the variable $n$ is the input data size; in the second example, the array length $n$ is the data size.

### 3. &nbsp; Squared Order $O(N^2)$

The number of operations in the square order grows in square steps with respect to the size of the input data $n$. The squared order is usually found in nested loops, where both the outer and inner levels are $O(n)$ and therefore overall $O(n^2)$:

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """平方阶"""
        count = 0
        # 循环次数与数组长度成平方关系
        for i in range(n):
            for j in range(n):
                count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 平方阶 */
    int quadratic(int n) {
        int count = 0;
        // 循环次数与数组长度成平方关系
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 平方阶 */
    int quadratic(int n) {
        int count = 0;
        // 循环次数与数组长度成平方关系
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 平方阶 */
    int Quadratic(int n) {
        int count = 0;
        // 循环次数与数组长度成平方关系
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 平方阶 */
    func quadratic(n int) int {
        count := 0
        // 循环次数与数组长度成平方关系
        for i := 0; i < n; i++ {
            for j := 0; j < n; j++ {
                count++
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 平方阶 */
    func quadratic(n: Int) -> Int {
        var count = 0
        // 循环次数与数组长度成平方关系
        for _ in 0 ..< n {
            for _ in 0 ..< n {
                count += 1
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 平方阶 */
    function quadratic(n) {
        let count = 0;
        // 循环次数与数组长度成平方关系
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 平方阶 */
    function quadratic(n: number): number {
        let count = 0;
        // 循环次数与数组长度成平方关系
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 平方阶 */
    int quadratic(int n) {
      int count = 0;
      // 循环次数与数组长度成平方关系
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          count++;
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 平方阶 */
    fn quadratic(n: i32) -> i32 {
        let mut count = 0;
        // 循环次数与数组长度成平方关系
        for _ in 0..n {
            for _ in 0..n {
                count += 1;
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 平方阶 */
    int quadratic(int n) {
        int count = 0;
        // 循环次数与数组长度成平方关系
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 平方阶
    fn quadratic(n: i32) i32 {
        var count: i32 = 0;
        var i: i32 = 0;
        // 循环次数与数组长度成平方关系
        while (i < n) : (i += 1) {
            var j: i32 = 0;
            while (j < n) : (j += 1) {
                count += 1;
            }
        }
        return count;
    }
    ```

The Figure 2-10  compares the three time complexities of constant order, linear order and squared order.

![Time complexity of constant, linear and quadratic orders](time_complexity.assets/time_complexity_constant_linear_quadratic.png){ class="animation-figure" }

<p align="center"> Figure 2-10 &nbsp; Time complexity of constant, linear and quadratic orders </p>

Taking bubble sort as an example, the outer loop executes $n - 1$ times, and the inner loop executes $n-1$, $n-2$, $\dots$, $2$, $1$ times, which averages out to $n / 2$ times, resulting in a time complexity of $O((n - 1) n / 2) = O(n^2)$ .

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """平方阶（冒泡排序）"""
        count = 0  # 计数器
        # 外循环：未排序区间为 [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # 交换 nums[j] 与 nums[j + 1]
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # 元素交换包含 3 个单元操作
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 平方阶（冒泡排序） */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // 计数器
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 平方阶（冒泡排序） */
    int bubbleSort(int[] nums) {
        int count = 0; // 计数器
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 平方阶（冒泡排序） */
    int BubbleSort(int[] nums) {
        int count = 0;  // 计数器
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端 
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 平方阶（冒泡排序） */
    func bubbleSort(nums []int) int {
        count := 0 // 计数器
        // 外循环：未排序区间为 [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    tmp := nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                    count += 3 // 元素交换包含 3 个单元操作
                }
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 平方阶（冒泡排序） */
    func bubbleSort(nums: inout [Int]) -> Int {
        var count = 0 // 计数器
        // 外循环：未排序区间为 [0, i]
        for i in stride(from: nums.count - 1, to: 0, by: -1) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端 
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3 // 元素交换包含 3 个单元操作
                }
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 平方阶（冒泡排序） */
    function bubbleSort(nums) {
        let count = 0; // 计数器
        // 外循环：未排序区间为 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 平方阶（冒泡排序） */
    function bubbleSort(nums: number[]): number {
        let count = 0; // 计数器
        // 外循环：未排序区间为 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 平方阶（冒泡排序） */
    int bubbleSort(List<int> nums) {
      int count = 0; // 计数器
      // 外循环：未排序区间为 [0, i]
      for (var i = nums.length - 1; i > 0; i--) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (var j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // 交换 nums[j] 与 nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            count += 3; // 元素交换包含 3 个单元操作
          }
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 平方阶（冒泡排序） */
    fn bubble_sort(nums: &mut [i32]) -> i32 {
        let mut count = 0; // 计数器
        // 外循环：未排序区间为 [0, i]
        for i in (1..nums.len()).rev() {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端 
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交换包含 3 个单元操作
                }
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 平方阶（冒泡排序） */
    int bubbleSort(int *nums, int n) {
        int count = 0; // 计数器
        // 外循环：未排序区间为 [0, i]
        for (int i = n - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 平方阶（冒泡排序）
    fn bubbleSort(nums: []i32) i32 {
        var count: i32 = 0;  // 计数器 
        // 外循环：未排序区间为 [0, i]
        var i: i32 = @as(i32, @intCast(nums.len)) - 1;
        while (i > 0) : (i -= 1) {
            var j: usize = 0;
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端 
            while (j < i) : (j += 1) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    var tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3;  // 元素交换包含 3 个单元操作
                }
            }
        }
        return count;
    }
    ```

## 2.3.5 &nbsp; Exponential Order $O(2^N)$

Cell division in biology is a typical example of exponential growth: the initial state is $1$ cells, after one round of division it becomes $2$, after two rounds of division it becomes $4$, and so on, after $n$ rounds of division there are $2^n$ cells.

The Figure 2-11  and the following code simulate the process of cell division with a time complexity of $O(2^n)$ .

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """指数阶（循环实现）"""
        count = 0
        base = 1
        # 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 指数阶（循环实现） */
    int exponential(int n) {
        int count = 0, base = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 指数阶（循环实现） */
    int exponential(int n) {
        int count = 0, base = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 指数阶（循环实现） */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 指数阶（循环实现）*/
    func exponential(n int) int {
        count, base := 0, 1
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for i := 0; i < n; i++ {
            for j := 0; j < base; j++ {
                count++
            }
            base *= 2
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 指数阶（循环实现） */
    func exponential(n: Int) -> Int {
        var count = 0
        var base = 1
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for _ in 0 ..< n {
            for _ in 0 ..< base {
                count += 1
            }
            base *= 2
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 指数阶（循环实现） */
    function exponential(n) {
        let count = 0,
            base = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 指数阶（循环实现） */
    function exponential(n: number): number {
        let count = 0,
            base = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 指数阶（循环实现） */
    int exponential(int n) {
      int count = 0, base = 1;
      // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
      for (var i = 0; i < n; i++) {
        for (var j = 0; j < base; j++) {
          count++;
        }
        base *= 2;
      }
      // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 指数阶（循环实现） */
    fn exponential(n: i32) -> i32 {
        let mut count = 0;
        let mut base = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for _ in 0..n {
            for _ in 0..base {
                count += 1
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 指数阶（循环实现） */
    int exponential(int n) {
        int count = 0;
        int bas = 1;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 指数阶（循环实现）
    fn exponential(n: i32) i32 {
        var count: i32 = 0;
        var bas: i32 = 1;
        var i: i32 = 0;
        // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        while (i < n) : (i += 1) {
            var j: i32 = 0;
            while (j < bas) : (j += 1) {
                count += 1;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

![time complexity of exponential order](time_complexity.assets/time_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Figure 2-11 &nbsp; time complexity of exponential order </p>

In practical algorithms, exponential orders are often found in recursion functions. For example, in the following code, it recursively splits in two and stops after $n$ splits:

=== "Python"

    ```python title="time_complexity.py"
    def exp_recur(n: int) -> int:
        """指数阶（递归实现）"""
        if n == 1:
            return 1
        return exp_recur(n - 1) + exp_recur(n - 1) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 指数阶（递归实现） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 指数阶（递归实现） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 指数阶（递归实现） */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 指数阶（递归实现）*/
    func expRecur(n int) int {
        if n == 1 {
            return 1
        }
        return expRecur(n-1) + expRecur(n-1) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 指数阶（递归实现） */
    func expRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 指数阶（递归实现） */
    function expRecur(n) {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 指数阶（递归实现） */
    function expRecur(n: number): number {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 指数阶（递归实现） */
    int expRecur(int n) {
      if (n == 1) return 1;
      return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 指数阶（递归实现） */
    fn exp_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        exp_recur(n - 1) + exp_recur(n - 1) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 指数阶（递归实现） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 指数阶（递归实现）
    fn expRecur(n: i32) i32 {
        if (n == 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

Exponential order grows very rapidly and is more common in exhaustive methods (brute force search, backtracking, etc.). For problems with large data sizes, exponential order is unacceptable and usually requires the use of algorithms such as dynamic programming or greedy algorithms to solve.

### 1. &nbsp; Logarithmic Order $O(\Log N)$

In contrast to the exponential order, the logarithmic order reflects the "each round is reduced to half" case. Let the input data size be $n$, and since each round is reduced to half, the number of loops is $\log_2 n$, which is the inverse function of $2^n$.

The Figure 2-12  and the code below simulate the process of "reducing each round to half" with a time complexity of $O(\log_2 n)$, which is abbreviated as $O(\log n)$.

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: float) -> int:
        """对数阶（循环实现）"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 对数阶（循环实现） */
    int logarithmic(float n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 对数阶（循环实现） */
    int logarithmic(float n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 对数阶（循环实现） */
    int Logarithmic(float n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 对数阶（循环实现）*/
    func logarithmic(n float64) int {
        count := 0
        for n > 1 {
            n = n / 2
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 对数阶（循环实现） */
    func logarithmic(n: Double) -> Int {
        var count = 0
        var n = n
        while n > 1 {
            n = n / 2
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 对数阶（循环实现） */
    function logarithmic(n) {
        let count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 对数阶（循环实现） */
    function logarithmic(n: number): number {
        let count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 对数阶（循环实现） */
    int logarithmic(num n) {
      int count = 0;
      while (n > 1) {
        n = n / 2;
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 对数阶（循环实现） */
    fn logarithmic(mut n: f32) -> i32 {
        let mut count = 0;
        while n > 1.0 {
            n = n / 2.0;
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 对数阶（循环实现） */
    int logarithmic(float n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 对数阶（循环实现）
    fn logarithmic(n: f32) i32 {
        var count: i32 = 0;
        var n_var = n;
        while (n_var > 1)
        {
            n_var = n_var / 2;
            count +=1;
        }
        return count;
    }
    ```

![time complexity of logarithmic order](time_complexity.assets/time_complexity_logarithmic.png){ class="animation-figure" }

<p align="center"> Figure 2-12 &nbsp; time complexity of logarithmic order </p>

Similar to the exponential order, the logarithmic order is often found in recursion functions. The following code forms a recursion tree of height $\log_2 n$:

=== "Python"

    ```python title="time_complexity.py"
    def log_recur(n: float) -> int:
        """对数阶（递归实现）"""
        if n <= 1:
            return 0
        return log_recur(n / 2) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 对数阶（递归实现） */
    int logRecur(float n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 对数阶（递归实现） */
    int logRecur(float n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 对数阶（递归实现） */
    int LogRecur(float n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 对数阶（递归实现）*/
    func logRecur(n float64) int {
        if n <= 1 {
            return 0
        }
        return logRecur(n/2) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 对数阶（递归实现） */
    func logRecur(n: Double) -> Int {
        if n <= 1 {
            return 0
        }
        return logRecur(n: n / 2) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 对数阶（递归实现） */
    function logRecur(n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 对数阶（递归实现） */
    function logRecur(n: number): number {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 对数阶（递归实现） */
    int logRecur(num n) {
      if (n <= 1) return 0;
      return logRecur(n / 2) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 对数阶（递归实现） */
    fn log_recur(n: f32) -> i32 {
        if n <= 1.0 {
            return 0;
        }
        log_recur(n / 2.0) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 对数阶（递归实现） */
    int logRecur(float n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 对数阶（递归实现）
    fn logRecur(n: f32) i32 {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

Logarithmic order is often found in algorithms based on the divide and conquer strategy, which reflects the algorithmic ideas of "dividing one into many" and "simplifying the complexity into simplicity". It grows slowly and is the second most desirable time complexity after constant order.

!!! tip "What is the base of $O(\log n)$?"

    To be precise, the corresponding time complexity of "one divided into $m$" is $O(\log_m n)$ . And by using the logarithmic permutation formula, we can get equal time complexity with different bases:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    That is, the base $m$ can be converted without affecting the complexity. Therefore we usually omit the base $m$ and write the logarithmic order directly as $O(\log n)$.

### 2. &nbsp; Linear Logarithmic Order $O(N \Log N)$

The linear logarithmic order is often found in nested loops, and the time complexity of the two levels of loops is $O(\log n)$ and $O(n)$ respectively. The related code is as follows:

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: float) -> int:
        """线性对数阶"""
        if n <= 1:
            return 1
        count: int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 线性对数阶 */
    int linearLogRecur(float n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 线性对数阶 */
    int linearLogRecur(float n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 线性对数阶 */
    int LinearLogRecur(float n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 线性对数阶 */
    func linearLogRecur(n float64) int {
        if n <= 1 {
            return 1
        }
        count := linearLogRecur(n/2) + linearLogRecur(n/2)
        for i := 0.0; i < n; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 线性对数阶 */
    func linearLogRecur(n: Double) -> Int {
        if n <= 1 {
            return 1
        }
        var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
        for _ in stride(from: 0, to: n, by: 1) {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 线性对数阶 */
    function linearLogRecur(n) {
        if (n <= 1) return 1;
        let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (let i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 线性对数阶 */
    function linearLogRecur(n: number): number {
        if (n <= 1) return 1;
        let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (let i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 线性对数阶 */
    int linearLogRecur(num n) {
      if (n <= 1) return 1;
      int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
      for (var i = 0; i < n; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 线性对数阶 */
    fn linear_log_recur(n: f32) -> i32 {
        if n <= 1.0 {
            return 1;
        }
        let mut count = linear_log_recur(n / 2.0) + linear_log_recur(n / 2.0);
        for _ in 0 ..n as i32 {
            count += 1;
        }
        return count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 线性对数阶 */
    int linearLogRecur(float n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 线性对数阶
    fn linearLogRecur(n: f32) i32 {
        if (n <= 1) return 1;
        var count: i32 = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        var i: f32 = 0;
        while (i < n) : (i += 1) {
            count += 1;
        }
        return count;
    }
    ```

The Figure 2-13  shows how the linear logarithmic order is generated. The total number of operations at each level of the binary tree is $n$ , and the tree has a total of $\log_2 n + 1$ levels, resulting in a time complexity of $O(n\log n)$ .

![Time complexity of linear logarithmic order](time_complexity.assets/time_complexity_logarithmic_linear.png){ class="animation-figure" }

<p align="center"> Figure 2-13 &nbsp; Time complexity of linear logarithmic order </p>

Mainstream sorting algorithms typically have a time complexity of $O(n \log n)$ , such as quick sort, merge sort, heap sort, etc.

### 3. &nbsp; The Factorial Order $O(N!)$

The factorial order corresponds to the mathematical "permutations problem". Given $n$ elements that do not repeat each other, find all possible permutations of them, the number of permutations being:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Factorials are usually implemented using recursion. As shown in the Figure 2-14  and in the code below, the first level splits $n$, the second level splits $n - 1$, and so on, until the splitting stops at the $n$th level:

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """阶乘阶（递归实现）"""
        if n == 0:
            return 1
        count = 0
        # 从 1 个分裂出 n 个
        for _ in range(n):
            count += factorial_recur(n - 1)
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 阶乘阶（递归实现） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 从 1 个分裂出 n 个
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 阶乘阶（递归实现） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 从 1 个分裂出 n 个
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 阶乘阶（递归实现） */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 从 1 个分裂出 n 个
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 阶乘阶（递归实现） */
    func factorialRecur(n int) int {
        if n == 0 {
            return 1
        }
        count := 0
        // 从 1 个分裂出 n 个
        for i := 0; i < n; i++ {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 阶乘阶（递归实现） */
    func factorialRecur(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var count = 0
        // 从 1 个分裂出 n 个
        for _ in 0 ..< n {
            count += factorialRecur(n: n - 1)
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 阶乘阶（递归实现） */
    function factorialRecur(n) {
        if (n === 0) return 1;
        let count = 0;
        // 从 1 个分裂出 n 个
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 阶乘阶（递归实现） */
    function factorialRecur(n: number): number {
        if (n === 0) return 1;
        let count = 0;
        // 从 1 个分裂出 n 个
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 阶乘阶（递归实现） */
    int factorialRecur(int n) {
      if (n == 0) return 1;
      int count = 0;
      // 从 1 个分裂出 n 个
      for (var i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 阶乘阶（递归实现） */
    fn factorial_recur(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let mut count = 0;
        // 从 1 个分裂出 n 个
        for _ in 0..n {
            count += factorial_recur(n - 1);
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 阶乘阶（递归实现） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    // 阶乘阶（递归实现）
    fn factorialRecur(n: i32) i32 {
        if (n == 0) return 1;
        var count: i32 = 0;
        var i: i32 = 0;
        // 从 1 个分裂出 n 个
        while (i < n) : (i += 1) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

![Time complexity of the factorial order](time_complexity.assets/time_complexity_factorial.png){ class="animation-figure" }

<p align="center"> Figure 2-14 &nbsp; Time complexity of the factorial order </p>

Note that since there is always $n! > 2^n$ when $n \geq 4$, the factorial order grows faster than the exponential order, and is also unacceptable when $n$ is large.

## 2.3.6 &nbsp; Worst, Best, Average Time Complexity

**The time efficiency of algorithms is often not fixed, but is related to the distribution of the input data**. Suppose an array `nums` of length $n$ is input, where `nums` consists of numbers from $1$ to $n$, each of which occurs only once; however, the order of the elements is randomly upset, and the goal of the task is to return the index of element $1$. We can draw the following conclusion.

- When `nums = [? , ? , ... , 1]` , i.e., when the end element is $1$, a complete traversal of the array is required, **to reach the worst time complexity $O(n)$** .
- When `nums = [1, ? , ? , ...]` , i.e., when the first element is $1$ , there is no need to continue traversing the array no matter how long it is, **reaching the optimal time complexity $\Omega(1)$** .

The "worst time complexity" corresponds to the asymptotic upper bound of the function and is denoted by the large $O$ notation. Correspondingly, the "optimal time complexity" corresponds to the asymptotic lower bound of the function and is denoted in $\Omega$ notation:

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱"""
        # 生成数组 nums =: 1, 2, 3, ..., n
        nums = [i for i in range(1, n + 1)]
        # 随机打乱数组元素
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """查找数组 nums 中数字 1 所在索引"""
        for i in range(len(nums)):
            # 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            # 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 使用系统时间生成随机种子
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // 随机打乱数组元素
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 随机打乱数组元素
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 随机打乱数组元素
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    func randomNumbers(n int) []int {
        nums := make([]int, n)
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for i := 0; i < n; i++ {
            nums[i] = i + 1
        }
        // 随机打乱数组元素
        rand.Shuffle(len(nums), func(i, j int) {
            nums[i], nums[j] = nums[j], nums[i]
        })
        return nums
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    func findOne(nums []int) int {
        for i := 0; i < len(nums); i++ {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    func randomNumbers(n: Int) -> [Int] {
        // 生成数组 nums = { 1, 2, 3, ..., n }
        var nums = Array(1 ... n)
        // 随机打乱数组元素
        nums.shuffle()
        return nums
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    func findOne(nums: [Int]) -> Int {
        for i in nums.indices {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    function randomNumbers(n) {
        const nums = Array(n);
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 随机打乱数组元素
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    function findOne(nums) {
        for (let i = 0; i < nums.length; i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    function randomNumbers(n: number): number[] {
        const nums = Array(n);
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 随机打乱数组元素
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    function findOne(nums: number[]): number {
        for (let i = 0; i < nums.length; i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    List<int> randomNumbers(int n) {
      final nums = List.filled(n, 0);
      // 生成数组 nums = { 1, 2, 3, ..., n }
      for (var i = 0; i < n; i++) {
        nums[i] = i + 1;
      }
      // 随机打乱数组元素
      nums.shuffle();

      return nums;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    int findOne(List<int> nums) {
      for (var i = 0; i < nums.length; i++) {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if (nums[i] == 1) return i;
      }

      return -1;
    }
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    fn random_numbers(n: i32) -> Vec<i32> {
        // 生成数组 nums = { 1, 2, 3, ..., n }
        let mut nums = (1..=n).collect::<Vec<i32>>();
        // 随机打乱数组元素
        nums.shuffle(&mut thread_rng());
        nums
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    fn find_one(nums: &[i32]) -> Option<usize> {
        for i in 0..nums.len() {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if nums[i] == 1 {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    /* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
    int *randomNumbers(int n) {
        // 分配堆区内存（创建一维可变长数组：数组中元素数量为 n ，元素类型为 int ）
        int *nums = (int *)malloc(n * sizeof(int));
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 随机打乱数组元素
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        return nums;
    }

    /* 查找数组 nums 中数字 1 所在索引 */
    int findOne(int *nums, int n) {
        for (int i = 0; i < n; i++) {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Zig"

    ```zig title="worst_best_time_complexity.zig"
    // 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱
    fn randomNumbers(comptime n: usize) [n]i32 {
        var nums: [n]i32 = undefined;
        // 生成数组 nums = { 1, 2, 3, ..., n }
        for (&nums, 0..) |*num, i| {
            num.* = @as(i32, @intCast(i)) + 1;
        }
        // 随机打乱数组元素
        const rand = std.crypto.random;
        rand.shuffle(i32, &nums);
        return nums;
    }

    // 查找数组 nums 中数字 1 所在索引
    fn findOne(nums: []i32) i32 {
        for (nums, 0..) |num, i| {
            // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (num == 1) return @intCast(i);
        }
        return -1;
    }
    ```

It is worth stating that we rarely use the optimal time complexity in practice because it is usually only attainable with a small probability and may be somewhat misleading. **whereas the worst time complexity is more practical because it gives a safe value for efficiency and allows us to use the algorithm with confidence**.

From the above examples, it can be seen that the worst or best time complexity only occurs in "special data distributions", and the probability of these cases may be very small, which does not truly reflect the efficiency of the algorithm. In contrast, **the average time complexity of can reflect the efficiency of the algorithm under random input data**, which is denoted by the $\Theta$ notation.

For some algorithms, we can simply derive the average case under a random data distribution. For example, in the above example, since the input array is scrambled, the probability of an element $1$ appearing at any index is equal, so the average number of loops of the algorithm is half of the length of the array $n / 2$ , and the average time complexity is $\Theta(n / 2) = \Theta(n)$ .

However, for more complex algorithms, calculating the average time complexity is often difficult because it is hard to analyze the overall mathematical expectation given the data distribution. In this case, we usually use the worst time complexity as a criterion for the efficiency of the algorithm.

!!! question "Why do you rarely see the $\Theta$ symbol?"

    Perhaps because the $O$ symbol is so catchy, we often use it to denote average time complexity. However, this practice is not standardized in the strict sense. In this book and other sources, if you encounter a statement like "average time complexity $O(n)$", please understand it as $\Theta(n)$.
