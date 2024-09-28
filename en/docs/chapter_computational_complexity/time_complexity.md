---
comments: true
---

# 2.3 &nbsp; Time complexity

The runtime can intuitively assess the efficiency of an algorithm. How can we accurately estimate the runtime of a piece of an algorithm?

1. **Determining the Running Platform**: This includes hardware configuration, programming language, system environment, etc., all of which can affect the efficiency of code execution.
2. **Evaluating the Run Time for Various Computational Operations**: For instance, an addition operation `+` might take 1 ns, a multiplication operation `*` might take 10 ns, a print operation `print()` might take 5 ns, etc.
3. **Counting All the Computational Operations in the Code**: Summing the execution times of all these operations gives the total run time.

For example, consider the following code with an input size of $n$:

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

=== "Kotlin"

    ```kotlin title=""

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

Using the above method, the run time of the algorithm can be calculated as $(6n + 12)$ ns:

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

However, in practice, **counting the run time of an algorithm is neither practical nor reasonable**. First, we don't want to tie the estimated time to the running platform, as algorithms need to run on various platforms. Second, it's challenging to know the run time for each type of operation, making the estimation process difficult.

## 2.3.1 &nbsp; Assessing time growth trend

Time complexity analysis does not count the algorithm's run time, **but rather the growth trend of the run time as the data volume increases**.

Let's understand this concept of "time growth trend" with an example. Assume the input data size is $n$, and consider three algorithms `A`, `B`, and `C`:

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
        for _ in 0 ..< 1_000_000 {
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

=== "Kotlin"

    ```kotlin title=""

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

Figure 2-7 shows the time complexities of these three algorithms.

- Algorithm `A` has just one print operation, and its run time does not grow with $n$. Its time complexity is considered "constant order."
- Algorithm `B` involves a print operation looping $n$ times, and its run time grows linearly with $n$. Its time complexity is "linear order."
- Algorithm `C` has a print operation looping 1,000,000 times. Although it takes a long time, it is independent of the input data size $n$. Therefore, the time complexity of `C` is the same as `A`, which is "constant order."

![Time growth trend of algorithms a, b, and c](time_complexity.assets/time_complexity_simple_example.png){ class="animation-figure" }

<p align="center"> Figure 2-7 &nbsp; Time growth trend of algorithms a, b, and c </p>

Compared to directly counting the run time of an algorithm, what are the characteristics of time complexity analysis?

- **Time complexity effectively assesses algorithm efficiency**. For instance, algorithm `B` has linearly growing run time, which is slower than algorithm `A` when $n > 1$ and slower than `C` when $n > 1,000,000$. In fact, as long as the input data size $n$ is sufficiently large, a "constant order" complexity algorithm will always be better than a "linear order" one, demonstrating the essence of time growth trend.
- **Time complexity analysis is more straightforward**. Obviously, the running platform and the types of computational operations are irrelevant to the trend of run time growth. Therefore, in time complexity analysis, we can simply treat the execution time of all computational operations as the same "unit time," simplifying the "computational operation run time count" to a "computational operation count." This significantly reduces the complexity of estimation.
- **Time complexity has its limitations**. For example, although algorithms `A` and `C` have the same time complexity, their actual run times can be quite different. Similarly, even though algorithm `B` has a higher time complexity than `C`, it is clearly superior when the input data size $n$ is small. In these cases, it's difficult to judge the efficiency of algorithms based solely on time complexity. Nonetheless, despite these issues, complexity analysis remains the most effective and commonly used method for evaluating algorithm efficiency.

## 2.3.2 &nbsp; Asymptotic upper bound

Consider a function with an input size of $n$:

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

=== "Kotlin"

    ```kotlin title=""

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

Given a function that represents the number of operations of an algorithm as a function of the input size $n$, denoted as $T(n)$, consider the following example:

$$
T(n) = 3 + 2n
$$

Since $T(n)$ is a linear function, its growth trend is linear, and therefore, its time complexity is of linear order, denoted as $O(n)$. This mathematical notation, known as <u>big-O notation</u>, represents the <u>asymptotic upper bound</u> of the function $T(n)$.

In essence, time complexity analysis is about finding the asymptotic upper bound of the "number of operations $T(n)$". It has a precise mathematical definition.

!!! note "Asymptotic Upper Bound"

    If there exist positive real numbers $c$ and $n_0$ such that for all $n > n_0$, $T(n) \leq c \cdot f(n)$, then $f(n)$ is considered an asymptotic upper bound of $T(n)$, denoted as $T(n) = O(f(n))$.

As shown in Figure 2-8, calculating the asymptotic upper bound involves finding a function $f(n)$ such that, as $n$ approaches infinity, $T(n)$ and $f(n)$ have the same growth order, differing only by a constant factor $c$.

![Asymptotic upper bound of a function](time_complexity.assets/asymptotic_upper_bound.png){ class="animation-figure" }

<p align="center"> Figure 2-8 &nbsp; Asymptotic upper bound of a function </p>

## 2.3.3 &nbsp; Calculation method

While the concept of asymptotic upper bound might seem mathematically dense, you don't need to fully grasp it right away. Let's first understand the method of calculation, which can be practiced and comprehended over time.

Once $f(n)$ is determined, we obtain the time complexity $O(f(n))$. But how do we determine the asymptotic upper bound $f(n)$? This process generally involves two steps: counting the number of operations and determining the asymptotic upper bound.

### 1. &nbsp; Step 1: counting the number of operations

This step involves going through the code line by line. However, due to the presence of the constant $c$ in $c \cdot f(n)$, **all coefficients and constant terms in $T(n)$ can be ignored**. This principle allows for simplification techniques in counting operations.

1. **Ignore constant terms in $T(n)$**, as they do not affect the time complexity being independent of $n$.
2. **Omit all coefficients**. For example, looping $2n$, $5n + 1$ times, etc., can be simplified to $n$ times since the coefficient before $n$ does not impact the time complexity.
3. **Use multiplication for nested loops**. The total number of operations equals the product of the number of operations in each loop, applying the simplification techniques from points 1 and 2 for each loop level.

Given a function, we can use these techniques to count operations:

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

=== "Kotlin"

    ```kotlin title=""

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

The formula below shows the counting results before and after simplification, both leading to a time complexity of $O(n^2)$:

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{Complete Count (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{Simplified Count (o.O)}
\end{aligned}
$$

### 2. &nbsp; Step 2: determining the asymptotic upper bound

**The time complexity is determined by the highest order term in $T(n)$**. This is because, as $n$ approaches infinity, the highest order term dominates, rendering the influence of other terms negligible.

The following table illustrates examples of different operation counts and their corresponding time complexities. Some exaggerated values are used to emphasize that coefficients cannot alter the order of growth. When $n$ becomes very large, these constants become insignificant.

<p align="center"> Table: Time complexity for different operation counts </p>

<div class="center-table" markdown>

| Operation Count $T(n)$ | Time Complexity $O(f(n))$ |
| ---------------------- | ------------------------- |
| $100000$               | $O(1)$                    |
| $3n + 2$               | $O(n)$                    |
| $2n^2 + 3n + 2$        | $O(n^2)$                  |
| $n^3 + 10000n^2$       | $O(n^3)$                  |
| $2^n + 10000n^{10000}$ | $O(2^n)$                  |

</div>

## 2.3.4 &nbsp; Common types of time complexity

Let's consider the input data size as $n$. The common types of time complexities are shown in Figure 2-9, arranged from lowest to highest:

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
& \text{Constant} < \text{Log} < \text{Linear} < \text{Linear-Log} < \text{Quadratic} < \text{Exp} < \text{Factorial}
\end{aligned}
$$

![Common types of time complexity](time_complexity.assets/time_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Figure 2-9 &nbsp; Common types of time complexity </p>

### 1. &nbsp; Constant order $O(1)$ {data-toc-label="1. &nbsp; Constant order"}

Constant order means the number of operations is independent of the input data size $n$. In the following function, although the number of operations `size` might be large, the time complexity remains $O(1)$ as it's unrelated to $n$:

=== "Python"

    ```python title="time_complexity.py"
    def constant(n: int) -> int:
        """Constant complexity"""
        count = 0
        size = 100000
        for _ in range(size):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Constant complexity */
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
    /* Constant complexity */
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
    [class]{time_complexity}-[func]{Constant}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{constant}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{constant}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{constant}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{constant}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{constant}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{constant}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{constant}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{constant}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{constant}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{constant}
    ```

### 2. &nbsp; Linear order $O(n)$ {data-toc-label="2. &nbsp; Linear order"}

Linear order indicates the number of operations grows linearly with the input data size $n$. Linear order commonly appears in single-loop structures:

=== "Python"

    ```python title="time_complexity.py"
    def linear(n: int) -> int:
        """Linear complexity"""
        count = 0
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linear complexity */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Linear complexity */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    [class]{time_complexity}-[func]{Linear}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{linear}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{linear}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{linear}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{linear}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{linear}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{linear}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{linear}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{linear}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{linear}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{linear}
    ```

Operations like array traversal and linked list traversal have a time complexity of $O(n)$, where $n$ is the length of the array or list:

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """Linear complexity (traversing an array)"""
        count = 0
        # Loop count is proportional to the length of the array
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linear complexity (traversing an array) */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // Loop count is proportional to the length of the array
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Linear complexity (traversing an array) */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // Loop count is proportional to the length of the array
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    [class]{time_complexity}-[func]{ArrayTraversal}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{arrayTraversal}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{arrayTraversal}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{arrayTraversal}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{arrayTraversal}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{arrayTraversal}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{array_traversal}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{arrayTraversal}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{arrayTraversal}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{array_traversal}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{arrayTraversal}
    ```

It's important to note that **the input data size $n$ should be determined based on the type of input data**. For example, in the first example, $n$ represents the input data size, while in the second example, the length of the array $n$ is the data size.

### 3. &nbsp; Quadratic order $O(n^2)$ {data-toc-label="3. &nbsp; Quadratic order"}

Quadratic order means the number of operations grows quadratically with the input data size $n$. Quadratic order typically appears in nested loops, where both the outer and inner loops have a time complexity of $O(n)$, resulting in an overall complexity of $O(n^2)$:

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """Quadratic complexity"""
        count = 0
        # Loop count is squared in relation to the data size n
        for i in range(n):
            for j in range(n):
                count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Quadratic complexity */
    int quadratic(int n) {
        int count = 0;
        // Loop count is squared in relation to the data size n
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
    /* Quadratic complexity */
    int quadratic(int n) {
        int count = 0;
        // Loop count is squared in relation to the data size n
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
    [class]{time_complexity}-[func]{Quadratic}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{quadratic}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{quadratic}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{quadratic}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{quadratic}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{quadratic}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{quadratic}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{quadratic}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{quadratic}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{quadratic}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{quadratic}
    ```

Figure 2-10 compares constant order, linear order, and quadratic order time complexities.

![Constant, linear, and quadratic order time complexities](time_complexity.assets/time_complexity_constant_linear_quadratic.png){ class="animation-figure" }

<p align="center"> Figure 2-10 &nbsp; Constant, linear, and quadratic order time complexities </p>

For instance, in bubble sort, the outer loop runs $n - 1$ times, and the inner loop runs $n-1$, $n-2$, ..., $2$, $1$ times, averaging $n / 2$ times, resulting in a time complexity of $O((n - 1) n / 2) = O(n^2)$:

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """Quadratic complexity (bubble sort)"""
        count = 0  # Counter
        # Outer loop: unsorted range is [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # Element swap includes 3 individual operations
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Quadratic complexity (bubble sort) */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 individual operations
                }
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Quadratic complexity (bubble sort) */
    int bubbleSort(int[] nums) {
        int count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 individual operations
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    [class]{time_complexity}-[func]{BubbleSort}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{bubbleSort}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{bubbleSort}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{bubbleSort}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{bubbleSort}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{bubbleSort}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{bubble_sort}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{bubbleSort}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{bubbleSort}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{bubble_sort}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{bubbleSort}
    ```

### 4. &nbsp; Exponential order $O(2^n)$ {data-toc-label="4. &nbsp; Exponential order"}

Biological "cell division" is a classic example of exponential order growth: starting with one cell, it becomes two after one division, four after two divisions, and so on, resulting in $2^n$ cells after $n$ divisions.

Figure 2-11 and code simulate the cell division process, with a time complexity of $O(2^n)$:

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """Exponential complexity (loop implementation)"""
        count = 0
        base = 1
        # Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Exponential complexity (loop implementation) */
    int exponential(int n) {
        int count = 0, base = 1;
        // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (loop implementation) */
    int exponential(int n) {
        int count = 0, base = 1;
        // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    [class]{time_complexity}-[func]{Exponential}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{exponential}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{exponential}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{exponential}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{exponential}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{exponential}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{exponential}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{exponential}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{exponential}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{exponential}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{exponential}
    ```

![Exponential order time complexity](time_complexity.assets/time_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Figure 2-11 &nbsp; Exponential order time complexity </p>

In practice, exponential order often appears in recursive functions. For example, in the code below, it recursively splits into two halves, stopping after $n$ divisions:

=== "Python"

    ```python title="time_complexity.py"
    def exp_recur(n: int) -> int:
        """Exponential complexity (recursive implementation)"""
        if n == 1:
            return 1
        return exp_recur(n - 1) + exp_recur(n - 1) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Exponential complexity (recursive implementation) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Exponential complexity (recursive implementation) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    [class]{time_complexity}-[func]{ExpRecur}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{expRecur}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{expRecur}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{expRecur}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{expRecur}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{expRecur}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{exp_recur}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{expRecur}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{expRecur}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{exp_recur}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{expRecur}
    ```

Exponential order growth is extremely rapid and is commonly seen in exhaustive search methods (brute force, backtracking, etc.). For large-scale problems, exponential order is unacceptable, often requiring dynamic programming or greedy algorithms as solutions.

### 5. &nbsp; Logarithmic order $O(\log n)$ {data-toc-label="5. &nbsp; Logarithmic order"}

In contrast to exponential order, logarithmic order reflects situations where "the size is halved each round." Given an input data size $n$, since the size is halved each round, the number of iterations is $\log_2 n$, the inverse function of $2^n$.

Figure 2-12 and code simulate the "halving each round" process, with a time complexity of $O(\log_2 n)$, commonly abbreviated as $O(\log n)$:

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: int) -> int:
        """Logarithmic complexity (loop implementation)"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Logarithmic complexity (loop implementation) */
    int logarithmic(int n) {
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
    /* Logarithmic complexity (loop implementation) */
    int logarithmic(int n) {
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
    [class]{time_complexity}-[func]{Logarithmic}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{logarithmic}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{logarithmic}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{logarithmic}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{logarithmic}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{logarithmic}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{logarithmic}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{logarithmic}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{logarithmic}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{logarithmic}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{logarithmic}
    ```

![Logarithmic order time complexity](time_complexity.assets/time_complexity_logarithmic.png){ class="animation-figure" }

<p align="center"> Figure 2-12 &nbsp; Logarithmic order time complexity </p>

Like exponential order, logarithmic order also frequently appears in recursive functions. The code below forms a recursive tree of height $\log_2 n$:

=== "Python"

    ```python title="time_complexity.py"
    def log_recur(n: int) -> int:
        """Logarithmic complexity (recursive implementation)"""
        if n <= 1:
            return 0
        return log_recur(n / 2) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Logarithmic complexity (recursive implementation) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Logarithmic complexity (recursive implementation) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    [class]{time_complexity}-[func]{LogRecur}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{logRecur}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{logRecur}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{logRecur}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{logRecur}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{logRecur}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{log_recur}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{logRecur}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{logRecur}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{log_recur}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{logRecur}
    ```

Logarithmic order is typical in algorithms based on the divide-and-conquer strategy, embodying the "split into many" and "simplify complex problems" approach. It's slow-growing and is the most ideal time complexity after constant order.

!!! tip "What is the base of $O(\log n)$?"

    Technically, "splitting into $m$" corresponds to a time complexity of $O(\log_m n)$. Using the logarithm base change formula, we can equate different logarithmic complexities:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    This means the base $m$ can be changed without affecting the complexity. Therefore, we often omit the base $m$ and simply denote logarithmic order as $O(\log n)$.

### 6. &nbsp; Linear-logarithmic order $O(n \log n)$ {data-toc-label="6. &nbsp; Linear-logarithmic order"}

Linear-logarithmic order often appears in nested loops, with the complexities of the two loops being $O(\log n)$ and $O(n)$ respectively. The related code is as follows:

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: int) -> int:
        """Linear logarithmic complexity"""
        if n <= 1:
            return 1
        count: int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linear logarithmic complexity */
    int linearLogRecur(int n) {
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
    /* Linear logarithmic complexity */
    int linearLogRecur(int n) {
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
    [class]{time_complexity}-[func]{LinearLogRecur}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{linearLogRecur}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{linearLogRecur}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{linearLogRecur}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{linearLogRecur}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{linearLogRecur}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{linear_log_recur}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{linearLogRecur}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{linearLogRecur}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{linear_log_recur}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{linearLogRecur}
    ```

Figure 2-13 demonstrates how linear-logarithmic order is generated. Each level of a binary tree has $n$ operations, and the tree has $\log_2 n + 1$ levels, resulting in a time complexity of $O(n \log n)$.

![Linear-logarithmic order time complexity](time_complexity.assets/time_complexity_logarithmic_linear.png){ class="animation-figure" }

<p align="center"> Figure 2-13 &nbsp; Linear-logarithmic order time complexity </p>

Mainstream sorting algorithms typically have a time complexity of $O(n \log n)$, such as quicksort, mergesort, and heapsort.

### 7. &nbsp; Factorial order $O(n!)$ {data-toc-label="7. &nbsp; Factorial order"}

Factorial order corresponds to the mathematical problem of "full permutation." Given $n$ distinct elements, the total number of possible permutations is:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Factorials are typically implemented using recursion. As shown in the code and Figure 2-14, the first level splits into $n$ branches, the second level into $n - 1$ branches, and so on, stopping after the $n$th level:

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """Factorial complexity (recursive implementation)"""
        if n == 0:
            return 1
        count = 0
        # From 1 split into n
        for _ in range(n):
            count += factorial_recur(n - 1)
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Factorial complexity (recursive implementation) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // From 1 split into n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Factorial complexity (recursive implementation) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // From 1 split into n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    [class]{time_complexity}-[func]{FactorialRecur}
    ```

=== "Go"

    ```go title="time_complexity.go"
    [class]{}-[func]{factorialRecur}
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    [class]{}-[func]{factorialRecur}
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    [class]{}-[func]{factorialRecur}
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    [class]{}-[func]{factorialRecur}
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    [class]{}-[func]{factorialRecur}
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    [class]{}-[func]{factorial_recur}
    ```

=== "C"

    ```c title="time_complexity.c"
    [class]{}-[func]{factorialRecur}
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    [class]{}-[func]{factorialRecur}
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    [class]{}-[func]{factorial_recur}
    ```

=== "Zig"

    ```zig title="time_complexity.zig"
    [class]{}-[func]{factorialRecur}
    ```

![Factorial order time complexity](time_complexity.assets/time_complexity_factorial.png){ class="animation-figure" }

<p align="center"> Figure 2-14 &nbsp; Factorial order time complexity </p>

Note that factorial order grows even faster than exponential order; it's unacceptable for larger $n$ values.

## 2.3.5 &nbsp; Worst, best, and average time complexities

**The time efficiency of an algorithm is often not fixed but depends on the distribution of the input data**. Assume we have an array `nums` of length $n$, consisting of numbers from $1$ to $n$, each appearing only once, but in a randomly shuffled order. The task is to return the index of the element $1$. We can draw the following conclusions:

- When `nums = [?, ?, ..., 1]`, that is, when the last element is $1$, it requires a complete traversal of the array, **achieving the worst-case time complexity of $O(n)$**.
- When `nums = [1, ?, ?, ...]`, that is, when the first element is $1$, no matter the length of the array, no further traversal is needed, **achieving the best-case time complexity of $\Omega(1)$**.

The "worst-case time complexity" corresponds to the asymptotic upper bound, denoted by the big $O$ notation. Correspondingly, the "best-case time complexity" corresponds to the asymptotic lower bound, denoted by $\Omega$:

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """Generate an array with elements: 1, 2, ..., n, order shuffled"""
        # Generate array nums =: 1, 2, 3, ..., n
        nums = [i for i in range(1, n + 1)]
        # Randomly shuffle array elements
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """Find the index of number 1 in array nums"""
        for i in range(len(nums)):
            # When element 1 is at the start of the array, achieve best time complexity O(1)
            # When element 1 is at the end of the array, achieve worst time complexity O(n)
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Generate a random seed using system time
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // Randomly shuffle array elements
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* Find the index of number 1 in array nums */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // When element 1 is at the start of the array, achieve best time complexity O(1)
            // When element 1 is at the end of the array, achieve worst time complexity O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
    int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle array elements
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Find the index of number 1 in array nums */
    int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // When element 1 is at the start of the array, achieve best time complexity O(1)
            // When element 1 is at the end of the array, achieve worst time complexity O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    [class]{worst_best_time_complexity}-[func]{RandomNumbers}

    [class]{worst_best_time_complexity}-[func]{FindOne}
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    [class]{}-[func]{random_numbers}

    [class]{}-[func]{find_one}
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "Kotlin"

    ```kotlin title="worst_best_time_complexity.kt"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

=== "Ruby"

    ```ruby title="worst_best_time_complexity.rb"
    [class]{}-[func]{random_numbers}

    [class]{}-[func]{find_one}
    ```

=== "Zig"

    ```zig title="worst_best_time_complexity.zig"
    [class]{}-[func]{randomNumbers}

    [class]{}-[func]{findOne}
    ```

It's important to note that the best-case time complexity is rarely used in practice, as it is usually only achievable under very low probabilities and might be misleading. **The worst-case time complexity is more practical as it provides a safety value for efficiency**, allowing us to confidently use the algorithm.

From the above example, it's clear that both the worst-case and best-case time complexities only occur under "special data distributions," which may have a small probability of occurrence and may not accurately reflect the algorithm's run efficiency. In contrast, **the average time complexity can reflect the algorithm's efficiency under random input data**, denoted by the $\Theta$ notation.

For some algorithms, we can simply estimate the average case under a random data distribution. For example, in the aforementioned example, since the input array is shuffled, the probability of element $1$ appearing at any index is equal. Therefore, the average number of loops for the algorithm is half the length of the array $n / 2$, giving an average time complexity of $\Theta(n / 2) = \Theta(n)$.

However, calculating the average time complexity for more complex algorithms can be quite difficult, as it's challenging to analyze the overall mathematical expectation under the data distribution. In such cases, we usually use the worst-case time complexity as the standard for judging the efficiency of the algorithm.

!!! question "Why is the $\Theta$ symbol rarely seen?"

    Possibly because the $O$ notation is more commonly spoken, it is often used to represent the average time complexity. However, strictly speaking, this practice is not accurate. In this book and other materials, if you encounter statements like "average time complexity $O(n)$", please understand it directly as $\Theta(n)$.
