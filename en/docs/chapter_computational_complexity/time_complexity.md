# Time complexity

Time complexity is a concept used to measure how the run time of an algorithm increases with the size of the input data. Understanding time complexity is crucial for accurately assessing the efficiency of an algorithm.

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

## Assessing time growth trend

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

The following figure shows the time complexities of these three algorithms.

- Algorithm `A` has just one print operation, and its run time does not grow with $n$. Its time complexity is considered "constant order."
- Algorithm `B` involves a print operation looping $n$ times, and its run time grows linearly with $n$. Its time complexity is "linear order."
- Algorithm `C` has a print operation looping 1,000,000 times. Although it takes a long time, it is independent of the input data size $n$. Therefore, the time complexity of `C` is the same as `A`, which is "constant order."

![Time growth trend of algorithms a, b, and c](time_complexity.assets/time_complexity_simple_example.png)

Compared to directly counting the run time of an algorithm, what are the characteristics of time complexity analysis?

- **Time complexity effectively assesses algorithm efficiency**. For instance, algorithm `B` has linearly growing run time, which is slower than algorithm `A` when $n > 1$ and slower than `C` when $n > 1,000,000$. In fact, as long as the input data size $n$ is sufficiently large, a "constant order" complexity algorithm will always be better than a "linear order" one, demonstrating the essence of time growth trend.
- **Time complexity analysis is more straightforward**. Obviously, the running platform and the types of computational operations are irrelevant to the trend of run time growth. Therefore, in time complexity analysis, we can simply treat the execution time of all computational operations as the same "unit time," simplifying the "computational operation run time count" to a "computational operation count." This significantly reduces the complexity of estimation.
- **Time complexity has its limitations**. For example, although algorithms `A` and `C` have the same time complexity, their actual run times can be quite different. Similarly, even though algorithm `B` has a higher time complexity than `C`, it is clearly superior when the input data size $n$ is small. In these cases, it's difficult to judge the efficiency of algorithms based solely on time complexity. Nonetheless, despite these issues, complexity analysis remains the most effective and commonly used method for evaluating algorithm efficiency.

## Asymptotic upper bound

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

Since $T(n)$ is a linear function, its growth trend is linear, and therefore, its time complexity is of linear order, denoted as $O(n)$. This mathematical notation, known as "big-O notation," represents the "asymptotic upper bound" of the function $T(n)$.

In essence, time complexity analysis is about finding the asymptotic upper bound of the "number of operations $T(n)$". It has a precise mathematical definition.

!!! abstract "Asymptotic Upper Bound"

    If there exist positive real numbers $c$ and $n_0$ such that for all $n > n_0$, $T(n) \leq c \cdot f(n)$, then $f(n)$ is considered an asymptotic upper bound of $T(n)$, denoted as $T(n) = O(f(n))$.

As illustrated below, calculating the asymptotic upper bound involves finding a function $f(n)$ such that, as $n$ approaches infinity, $T(n)$ and $f(n)$ have the same growth order, differing only by a constant factor $c$.

![Asymptotic upper bound of a function](time_complexity.assets/asymptotic_upper_bound.png)

## Calculation method

While the concept of asymptotic upper bound might seem mathematically dense, you don't need to fully grasp it right away. Let's first understand the method of calculation, which can be practiced and comprehended over time.

Once $f(n)$ is determined, we obtain the time complexity $O(f(n))$. But how do we determine the asymptotic upper bound $f(n)$? This process generally involves two steps: counting the number of operations and determining the asymptotic upper bound.

### Step 1: counting the number of operations

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

### Step 2: determining the asymptotic upper bound

**The time complexity is determined by the highest order term in $T(n)$**. This is because, as $n$ approaches infinity, the highest order term dominates, rendering the influence of other terms negligible.

The following table illustrates examples of different operation counts and their corresponding time complexities. Some exaggerated values are used to emphasize that coefficients cannot alter the order of growth. When $n$ becomes very large, these constants become insignificant.

<p align="center"> Table: Time complexity for different operation counts </p>

| Operation Count $T(n)$ | Time Complexity $O(f(n))$ |
| ---------------------- | ------------------------- |
| $100000$               | $O(1)$                    |
| $3n + 2$               | $O(n)$                    |
| $2n^2 + 3n + 2$        | $O(n^2)$                  |
| $n^3 + 10000n^2$       | $O(n^3)$                  |
| $2^n + 10000n^{10000}$ | $O(2^n)$                  |

## Common types of time complexity

Let's consider the input data size as $n$. The common types of time complexities are illustrated below, arranged from lowest to highest:

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
\text{Constant Order} < \text{Logarithmic Order} < \text{Linear Order} < \text{Linear-Logarithmic Order} < \text{Quadratic Order} < \text{Exponential Order} < \text{Factorial Order}
\end{aligned}
$$

![Common types of time complexity](time_complexity.assets/time_complexity_common_types.png)

### Constant order $O(1)$

Constant order means the number of operations is independent of the input data size $n$. In the following function, although the number of operations `size` might be large, the time complexity remains $O(1)$ as it's unrelated to $n$:

```src
[file]{time_complexity}-[class]{}-[func]{constant}
```

### Linear order $O(n)$

Linear order indicates the number of operations grows linearly with the input data size $n$. Linear order commonly appears in single-loop structures:

```src
[file]{time_complexity}-[class]{}-[func]{linear}
```

Operations like array traversal and linked list traversal have a time complexity of $O(n)$, where $n$ is the length of the array or list:

```src
[file]{time_complexity}-[class]{}-[func]{array_traversal}
```

It's important to note that **the input data size $n$ should be determined based on the type of input data**. For example, in the first example, $n$ represents the input data size, while in the second example, the length of the array $n$ is the data size.

### Quadratic order $O(n^2)$

Quadratic order means the number of operations grows quadratically with the input data size $n$. Quadratic order typically appears in nested loops, where both the outer and inner loops have a time complexity of $O(n)$, resulting in an overall complexity of $O(n^2)$:

```src
[file]{time_complexity}-[class]{}-[func]{quadratic}
```

The following image compares constant order, linear order, and quadratic order time complexities.

![Constant, linear, and quadratic order time complexities](time_complexity.assets/time_complexity_constant_linear_quadratic.png)

For instance, in bubble sort, the outer loop runs $n - 1$ times, and the inner loop runs $n-1$, $n-2$, ..., $2$, $1$ times, averaging $n / 2$ times, resulting in a time complexity of $O((n - 1) n / 2) = O(n^2)$:

```src
[file]{time_complexity}-[class]{}-[func]{bubble_sort}
```

### Exponential order $O(2^n)$

Biological "cell division" is a classic example of exponential order growth: starting with one cell, it becomes two after one division, four after two divisions, and so on, resulting in $2^n$ cells after $n$ divisions.

The following image and code simulate the cell division process, with a time complexity of $O(2^n)$:

```src
[file]{time_complexity}-[class]{}-[func]{exponential}
```

![Exponential order time complexity](time_complexity.assets/time_complexity_exponential.png)

In practice, exponential order often appears in recursive functions. For example, in the code below, it recursively splits into two halves, stopping after $n$ divisions:

```src
[file]{time_complexity}-[class]{}-[func]{exp_recur}
```

Exponential order growth is extremely rapid and is commonly seen in exhaustive search methods (brute force, backtracking, etc.). For large-scale problems, exponential order is unacceptable, often requiring dynamic programming or greedy algorithms as solutions.

### Logarithmic order $O(\log n)$

In contrast to exponential order, logarithmic order reflects situations where "the size is halved each round." Given an input data size $n$, since the size is halved each round, the number of iterations is $\log_2 n$, the inverse function of $2^n$.

The following image and code simulate the "halving each round" process, with a time complexity of $O(\log_2 n)$, commonly abbreviated as $O(\log n)$:

```src
[file]{time_complexity}-[class]{}-[func]{logarithmic}
```

![Logarithmic order time complexity](time_complexity.assets/time_complexity_logarithmic.png)

Like exponential order, logarithmic order also frequently appears in recursive functions. The code below forms a recursive tree of height $\log_2 n$:

```src
[file]{time_complexity}-[class]{}-[func]{log_recur}
```

Logarithmic order is typical in algorithms based on the divide-and-conquer strategy, embodying the "split into many" and "simplify complex problems" approach. It's slow-growing and is the most ideal time complexity after constant order.

!!! tip "What is the base of $O(\log n)$?"

    Technically, "splitting into $m$" corresponds to a time complexity of $O(\log_m n)$. Using the logarithm base change formula, we can equate different logarithmic complexities:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    This means the base $m$ can be changed without affecting the complexity. Therefore, we often omit the base $m$ and simply denote logarithmic order as $O(\log n)$.

### Linear-logarithmic order $O(n \log n)$

Linear-logarithmic order often appears in nested loops, with the complexities of the two loops being $O(\log n)$ and $O(n)$ respectively. The related code is as follows:

```src
[file]{time_complexity}-[class]{}-[func]{linear_log_recur}
```

The image below demonstrates how linear-logarithmic order is generated. Each level of a binary tree has $n$ operations, and the tree has $\log_2 n + 1$ levels, resulting in a time complexity of $O(n \log n)$.

![Linear-logarithmic order time complexity](time_complexity.assets/time_complexity_logarithmic_linear.png)

Mainstream sorting algorithms typically have a time complexity of $O(n \log n)$, such as quicksort, mergesort, and heapsort.

### Factorial order $O(n!)$

Factorial order corresponds to the mathematical problem of "full permutation." Given $n$ distinct elements, the total number of possible permutations is:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Factorials are typically implemented using recursion. As shown in the image and code below, the first level splits into $n$ branches, the second level into $n - 1$ branches, and so on, stopping after the $n$th level:

```src
[file]{time_complexity}-[class]{}-[func]{factorial_recur}
```

![Factorial order time complexity](time_complexity.assets/time_complexity_factorial.png)

Note that factorial order grows even faster than exponential order; it's unacceptable for larger $n$ values.

## Worst, best, and average time complexities

**The time efficiency of an algorithm is often not fixed but depends on the distribution of the input data**. Assume we have an array `nums` of length $n$, consisting of numbers from $1$ to $n$, each appearing only once, but in a randomly shuffled order. The task is to return the index of the element $1$. We can draw the following conclusions:

- When `nums = [?, ?, ..., 1]`, that is, when the last element is $1$, it requires a complete traversal of the array, **achieving the worst-case time complexity of $O(n)$**.
- When `nums = [1, ?, ?, ...]`, that is, when the first element is $1$, no matter the length of the array, no further traversal is needed, **achieving the best-case time complexity of $\Omega(1)$**.

The "worst-case time complexity" corresponds to the asymptotic upper bound, denoted by the big $O$ notation. Correspondingly, the "best-case time complexity" corresponds to the asymptotic lower bound, denoted by $\Omega$:

```src
[file]{worst_best_time_complexity}-[class]{}-[func]{find_one}
```

It's important to note that the best-case time complexity is rarely used in practice, as it is usually only achievable under very low probabilities and might be misleading. **The worst-case time complexity is more practical as it provides a safety value for efficiency**, allowing us to confidently use the algorithm.

From the above example, it's clear that both the worst-case and best-case time complexities only occur under "special data distributions," which may have a small probability of occurrence and may not accurately reflect the algorithm's run efficiency. In contrast, **the average time complexity can reflect the algorithm's efficiency under random input data**, denoted by the $\Theta$ notation.

For some algorithms, we can simply estimate the average case under a random data distribution. For example, in the aforementioned example, since the input array is shuffled, the probability of element $1$ appearing at any index is equal. Therefore, the average number of loops for the algorithm is half the length of the array $n / 2$, giving an average time complexity of $\Theta(n / 2) = \Theta(n)$.

However, calculating the average time complexity for more complex algorithms can be quite difficult, as it's challenging to analyze the overall mathematical expectation under the data distribution. In such cases, we usually use the worst-case time complexity as the standard for judging the efficiency of the algorithm.

!!! question "Why is the $\Theta$ symbol rarely seen?"

    Possibly because the $O$ notation is more commonly spoken, it is often used to represent the average time complexity. However, strictly speaking, this practice is not accurate. In this book and other materials, if you encounter statements like "average time complexity $O(n)$", please understand it directly as $\Theta(n)$.
