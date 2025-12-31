---
comments: true
---

# 2.3 &nbsp; Time Complexity

Runtime can intuitively and accurately reflect the efficiency of an algorithm. If we want to accurately estimate the runtime of a piece of code, how should we proceed?

1. **Determine the running platform**, including hardware configuration, programming language, system environment, etc., as these factors all affect code execution efficiency.
2. **Evaluate the runtime required for various computational operations**, for example, an addition operation `+` requires 1 ns, a multiplication operation `*` requires 10 ns, a print operation `print()` requires 5 ns, etc.
3. **Count all computational operations in the code**, and sum the execution times of all operations to obtain the runtime.

For example, in the following code, the input data size is $n$:

=== "Python"

    ```python title=""
    # On a certain running platform
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # Loop n times
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // On a certain running platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {  // 1 ns
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // On a certain running platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {  // 1 ns
            System.out.println(0);     // 5 ns
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // On a certain running platform
    void Algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {  // 1 ns
            Console.WriteLine(0);      // 5 ns
        }
    }
    ```

=== "Go"

    ```go title=""
    // On a certain running platform
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
    // On a certain running platform
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
    // On a certain running platform
    function algorithm(n) {
        var a = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // Loop n times
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // On a certain running platform
    function algorithm(n: number): void {
        var a: number = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // Loop n times
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // On a certain running platform
    void algorithm(int n) {
      int a = 2; // 1 ns
      a = a + 1; // 1 ns
      a = a * 2; // 10 ns
      // Loop n times
      for (int i = 0; i < n; i++) { // 1 ns
        print(0); // 5 ns
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // On a certain running platform
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 ns
        a = a + 1;          // 1 ns
        a = a * 2;          // 10 ns
        // Loop n times
        for _ in 0..n {     // 1 ns
            println!("{}", 0);  // 5 ns
        }
    }
    ```

=== "C"

    ```c title=""
    // On a certain running platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Loop n times
        for (int i = 0; i < n; i++) {   // 1 ns
            printf("%d", 0);            // 5 ns
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // On a certain running platform
    fun algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // Loop n times
        for (i in 0..<n) {  // 1 ns
            println(0)      // 5 ns
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # On a certain running platform
    def algorithm(n)
        a = 2       # 1 ns
        a = a + 1   # 1 ns
        a = a * 2   # 10 ns
        # Loop n times
        (0...n).each do # 1 ns
            puts 0      # 5 ns
        end
    end
    ```

According to the above method, the algorithm's runtime can be obtained as $(6n + 12)$ ns:

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

In reality, however, **counting an algorithm's runtime is neither reasonable nor realistic**. First, we do not want to tie the estimated time to the running platform, because algorithms need to run on various different platforms. Second, it is difficult to know the runtime of each type of operation, which brings great difficulty to the estimation process.

## 2.3.1 &nbsp; Counting Time Growth Trends

Time complexity analysis does not count the algorithm's runtime, **but rather counts the growth trend of the algorithm's runtime as the data volume increases**.

The concept of "time growth trend" is rather abstract; let us understand it through an example. Suppose the input data size is $n$, and given three algorithms `A`, `B`, and `C`:

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
    // Time complexity of algorithm A: constant order
    fun algoritm_A(n: Int) {
        println(0)
    }
    // Time complexity of algorithm B: linear order
    fun algorithm_B(n: Int) {
        for (i in 0..<n){
            println(0)
        }
    }
    // Time complexity of algorithm C: constant order
    fun algorithm_C(n: Int) {
        for (i in 0..<1000000) {
            println(0)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Time complexity of algorithm A: constant order
    def algorithm_A(n)
        puts 0
    end

    # Time complexity of algorithm B: linear order
    def algorithm_B(n)
        (0...n).each { puts 0 }
    end

    # Time complexity of algorithm C: constant order
    def algorithm_C(n)
        (0...1_000_000).each { puts 0 }
    end
    ```

Figure 2-7 shows the time complexity of the above three algorithm functions.

- Algorithm `A` has only $1$ print operation, and the algorithm's runtime does not grow as $n$ increases. We call the time complexity of this algorithm "constant order".
- In algorithm `B`, the print operation needs to loop $n$ times, and the algorithm's runtime grows linearly as $n$ increases. The time complexity of this algorithm is called "linear order".
- In algorithm `C`, the print operation needs to loop $1000000$ times. Although the runtime is very long, it is independent of the input data size $n$. Therefore, the time complexity of `C` is the same as `A`, still "constant order".

![Time growth trends of algorithms A, B, and C](time_complexity.assets/time_complexity_simple_example.png){ class="animation-figure" }

<p align="center"> Figure 2-7 &nbsp; Time growth trends of algorithms A, B, and C </p>

Compared to directly counting the algorithm's runtime, what are the characteristics of time complexity analysis?

- **Time complexity can effectively evaluate algorithm efficiency**. For example, the runtime of algorithm `B` grows linearly; when $n > 1$ it is slower than algorithm `A`, and when $n > 1000000$ it is slower than algorithm `C`. In fact, as long as the input data size $n$ is sufficiently large, an algorithm with "constant order" complexity will always be superior to one with "linear order" complexity, which is precisely the meaning of time growth trend.
- **The derivation method for time complexity is simpler**. Obviously, the running platform and the types of computational operations are both unrelated to the growth trend of the algorithm's runtime. Therefore, in time complexity analysis, we can simply treat the execution time of all computational operations as the same "unit time", thus simplifying "counting computational operation runtime" to "counting the number of computational operations", which greatly reduces the difficulty of estimation.
- **Time complexity also has certain limitations**. For example, although algorithms `A` and `C` have the same time complexity, their actual runtimes differ significantly. Similarly, although algorithm `B` has a higher time complexity than `C`, when the input data size $n$ is small, algorithm `B` is clearly superior to algorithm `C`. In such cases, it is often difficult to judge the efficiency of algorithms based solely on time complexity. Of course, despite the above issues, complexity analysis remains the most effective and commonly used method for evaluating algorithm efficiency.

## 2.3.2 &nbsp; Asymptotic Upper Bound of Functions

Given a function with input size $n$:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # Loop n times
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
        for (int i = 0; i < n; i++) { // +1 (i++ is executed each round)
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
        for (int i = 0; i < n; i++) { // +1 (i++ is executed each round)
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
        for (int i = 0; i < n; i++) {   // +1 (i++ is executed each round)
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
        for(let i = 0; i < n; i++){ // +1 (i++ is executed each round)
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
        for(let i = 0; i < n; i++){ // +1 (i++ is executed each round)
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
      for (int i = 0; i < n; i++) { // +1 (i++ is executed each round)
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
        for _ in 0..n { // +1 (i++ is executed each round)
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
        for (int i = 0; i < n; i++) {   // +1 (i++ is executed each round)
            printf("%d", 0);            // +1
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun algorithm(n: Int) {
        var a = 1 // +1
        a = a + 1 // +1
        a = a * 2 // +1
        // Loop n times
        for (i in 0..<n) { // +1 (i++ is executed each round)
            println(0) // +1
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    def algorithm(n)
        a = 1       # +1
        a = a + 1   # +1
        a = a * 2   # +1
        # Loop n times
        (0...n).each do # +1
            puts 0      # +1
        end
    end
    ```

Let the number of operations of the algorithm be a function of the input data size $n$, denoted as $T(n)$. Then the number of operations of the above function is:

$$
T(n) = 3 + 2n
$$

$T(n)$ is a linear function, indicating that its runtime growth trend is linear, and therefore its time complexity is linear order.

We denote the time complexity of linear order as $O(n)$. This mathematical symbol is called <u>big-$O$ notation</u>, representing the <u>asymptotic upper bound</u> of the function $T(n)$.

Time complexity analysis essentially calculates the asymptotic upper bound of "the number of operations $T(n)$", which has a clear mathematical definition.

!!! note "Asymptotic upper bound of functions"

    If there exist positive real numbers $c$ and $n_0$ such that for all $n > n_0$, we have $T(n) \leq c \cdot f(n)$, then $f(n)$ can be considered as an asymptotic upper bound of $T(n)$, denoted as $T(n) = O(f(n))$.

As shown in Figure 2-8, calculating the asymptotic upper bound is to find a function $f(n)$ such that when $n$ tends to infinity, $T(n)$ and $f(n)$ are at the same growth level, differing only by a constant coefficient $c$.

![Asymptotic upper bound of a function](time_complexity.assets/asymptotic_upper_bound.png){ class="animation-figure" }

<p align="center"> Figure 2-8 &nbsp; Asymptotic upper bound of a function </p>

## 2.3.3 &nbsp; Derivation Method

The asymptotic upper bound has a bit of mathematical flavor. If you feel you haven't fully understood it, don't worry. We can first master the derivation method, and gradually grasp its mathematical meaning through continuous practice.

According to the definition, after determining $f(n)$, we can obtain the time complexity $O(f(n))$. So how do we determine the asymptotic upper bound $f(n)$? Overall, it is divided into two steps: first count the number of operations, then determine the asymptotic upper bound.

### 1. &nbsp; Step 1: Count the Number of Operations

For code, count from top to bottom line by line. However, since the constant coefficient $c$ in $c \cdot f(n)$ above can be of any size, **coefficients and constant terms in the number of operations $T(n)$ can all be ignored**. According to this principle, the following counting simplification techniques can be summarized.

1. **Ignore constants in $T(n)$**. Because they are all independent of $n$, they do not affect time complexity.
2. **Omit all coefficients**. For example, looping $2n$ times, $5n + 1$ times, etc., can all be simplified as $n$ times, because the coefficient before $n$ does not affect time complexity.
3. **Use multiplication for nested loops**. The total number of operations equals the product of the number of operations in the outer and inner loops, with each layer of loop still able to apply techniques `1.` and `2.` separately.

Given a function, we can use the above techniques to count the number of operations:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0 (Technique 1)
        a = a + n  # +0 (Technique 1)
        # +n (Technique 2)
        for i in range(5 * n + 1):
            print(0)
        # +n*n (Technique 3)
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0 (Technique 1)
        a = a + n;  // +0 (Technique 1)
        // +n (Technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n (Technique 3)
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
        int a = 1;  // +0 (Technique 1)
        a = a + n;  // +0 (Technique 1)
        // +n (Technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n (Technique 3)
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
        int a = 1;  // +0 (Technique 1)
        a = a + n;  // +0 (Technique 1)
        // +n (Technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (Technique 3)
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
        a := 1     // +0 (Technique 1)
        a = a + n  // +0 (Technique 1)
        // +n (Technique 2)
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n (Technique 3)
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
        var a = 1 // +0 (Technique 1)
        a = a + n // +0 (Technique 1)
        // +n (Technique 2)
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n (Technique 3)
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
        let a = 1;  // +0 (Technique 1)
        a = a + n;  // +0 (Technique 1)
        // +n (Technique 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (Technique 3)
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
        let a = 1;  // +0 (Technique 1)
        a = a + n;  // +0 (Technique 1)
        // +n (Technique 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (Technique 3)
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
      int a = 1; // +0 (Technique 1)
      a = a + n; // +0 (Technique 1)
      // +n (Technique 2)
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n (Technique 3)
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
        let mut a = 1;     // +0 (Technique 1)
        a = a + n;        // +0 (Technique 1)

        // +n (Technique 2)
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n (Technique 3)
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
        int a = 1;  // +0 (Technique 1)
        a = a + n;  // +0 (Technique 1)
        // +n (Technique 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n (Technique 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                printf("%d", 0);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun algorithm(n: Int) {
        var a = 1   // +0 (Technique 1)
        a = a + n   // +0 (Technique 1)
        // +n (Technique 2)
        for (i in 0..<5 * n + 1) {
            println(0)
        }
        // +n*n (Technique 3)
        for (i in 0..<2 * n) {
            for (j in 0..<n + 1) {
                println(0)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    def algorithm(n)
        a = 1       # +0 (Technique 1)
        a = a + n   # +0 (Technique 1)
        # +n (Technique 2)
        (0...(5 * n + 1)).each do { puts 0 }
        # +n*n (Technique 3)
        (0...(2 * n)).each do
            (0...(n + 1)).each do { puts 0 }
        end
    end
    ```

The following formula shows the counting results before and after using the above techniques; both derive a time complexity of $O(n^2)$.

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{Complete count (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{Simplified count (o.O)}
\end{aligned}
$$

### 2. &nbsp; Step 2: Determine the Asymptotic Upper Bound

**Time complexity is determined by the highest-order term in $T(n)$**. This is because as $n$ tends to infinity, the highest-order term will play a dominant role, and the influence of other terms can be ignored.

Table 2-2 shows some examples, where some exaggerated values are used to emphasize the conclusion that "coefficients cannot shake the order". When $n$ tends to infinity, these constants become insignificant.

<p align="center"> Table 2-2 &nbsp; Time complexities corresponding to different numbers of operations </p>

<div class="center-table" markdown>

| Number of Operations $T(n)$ | Time Complexity $O(f(n))$ |
| ---------------------- | -------------------- |
| $100000$               | $O(1)$               |
| $3n + 2$               | $O(n)$               |
| $2n^2 + 3n + 2$        | $O(n^2)$             |
| $n^3 + 10000n^2$       | $O(n^3)$             |
| $2^n + 10000n^{10000}$ | $O(2^n)$             |

</div>

## 2.3.4 &nbsp; Common Types

Let the input data size be $n$. Common time complexity types are shown in Figure 2-9 (arranged in order from low to high).

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
\text{Constant order} < \text{Logarithmic order} < \text{Linear order} < \text{Linearithmic order} < \text{Quadratic order} < \text{Exponential order} < \text{Factorial order}
\end{aligned}
$$

![Common time complexity types](time_complexity.assets/time_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Figure 2-9 &nbsp; Common time complexity types </p>

### 1. &nbsp; Constant Order $O(1)$ {data-toc-label="1. &nbsp; Constant Order"}

The number of operations in constant order is independent of the input data size $n$, meaning it does not change as $n$ changes.

In the following function, although the number of operations `size` may be large, since it is independent of the input data size $n$, the time complexity remains $O(1)$:

=== "Python"

    ```python title="time_complexity.py"
    def constant(n: int) -> int:
        """Constant order"""
        count = 0
        size = 100000
        for _ in range(size):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Constant order */
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
    /* Constant order */
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
    /* Constant order */
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
    /* Constant order */
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
    /* Constant order */
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
    /* Constant order */
    function constant(n) {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Constant order */
    function constant(n: number): number {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Constant order */
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
    /* Constant order */
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
    /* Constant order */
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

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Constant order */
    fun constant(n: Int): Int {
        var count = 0
        val size = 100000
        for (i in 0..<size)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Constant time ###
    def constant(n)
      count = 0
      size = 100000

      (0...size).each { count += 1 }

      count
    end
    ```

### 2. &nbsp; Linear Order $O(n)$ {data-toc-label="2. &nbsp; Linear Order"}

The number of operations in linear order grows linearly relative to the input data size $n$. Linear order typically appears in single-layer loops:

=== "Python"

    ```python title="time_complexity.py"
    def linear(n: int) -> int:
        """Linear order"""
        count = 0
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linear order */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Linear order */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Linear order */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Linear order */
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
    /* Linear order */
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
    /* Linear order */
    function linear(n) {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Linear order */
    function linear(n: number): number {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Linear order */
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
    /* Linear order */
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
    /* Linear order */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Linear order */
    fun linear(n: Int): Int {
        var count = 0
        for (i in 0..<n)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Linear time ###
    def linear(n)
      count = 0
      (0...n).each { count += 1 }
      count
    end
    ```

Operations such as traversing arrays and traversing linked lists have a time complexity of $O(n)$, where $n$ is the length of the array or linked list:

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """Linear order (traversing array)"""
        count = 0
        # Number of iterations is proportional to the array length
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linear order (traversing array) */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // Number of iterations is proportional to the array length
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Linear order (traversing array) */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // Number of iterations is proportional to the array length
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Linear order (traversing array) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // Number of iterations is proportional to the array length
        foreach (int num in nums) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Linear order (traversing array) */
    func arrayTraversal(nums []int) int {
        count := 0
        // Number of iterations is proportional to the array length
        for range nums {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Linear order (traversing array) */
    func arrayTraversal(nums: [Int]) -> Int {
        var count = 0
        // Number of iterations is proportional to the array length
        for _ in nums {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Linear order (traversing array) */
    function arrayTraversal(nums) {
        let count = 0;
        // Number of iterations is proportional to the array length
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Linear order (traversing array) */
    function arrayTraversal(nums: number[]): number {
        let count = 0;
        // Number of iterations is proportional to the array length
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Linear order (traversing array) */
    int arrayTraversal(List<int> nums) {
      int count = 0;
      // Number of iterations is proportional to the array length
      for (var _num in nums) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Linear order (traversing array) */
    fn array_traversal(nums: &[i32]) -> i32 {
        let mut count = 0;
        // Number of iterations is proportional to the array length
        for _ in nums {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Linear order (traversing array) */
    int arrayTraversal(int *nums, int n) {
        int count = 0;
        // Number of iterations is proportional to the array length
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Linear order (traversing array) */
    fun arrayTraversal(nums: IntArray): Int {
        var count = 0
        // Number of iterations is proportional to the array length
        for (num in nums) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Linear time (array traversal) ###
    def array_traversal(nums)
      count = 0

      # Number of iterations is proportional to the array length
      for num in nums
        count += 1
      end

      count
    end
    ```

It is worth noting that **the input data size $n$ should be determined according to the type of input data**. For example, in the first example, the variable $n$ is the input data size; in the second example, the array length $n$ is the data size.

### 3. &nbsp; Quadratic Order $O(n^2)$ {data-toc-label="3. &nbsp; Quadratic Order"}

The number of operations in quadratic order grows quadratically relative to the input data size $n$. Quadratic order typically appears in nested loops, where both the outer and inner loops have a time complexity of $O(n)$, resulting in an overall time complexity of $O(n^2)$:

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """Quadratic order"""
        count = 0
        # Number of iterations is quadratically related to the data size n
        for i in range(n):
            for j in range(n):
                count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Exponential order */
    int quadratic(int n) {
        int count = 0;
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    int quadratic(int n) {
        int count = 0;
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    int Quadratic(int n) {
        int count = 0;
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    func quadratic(n int) int {
        count := 0
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    func quadratic(n: Int) -> Int {
        var count = 0
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    function quadratic(n) {
        let count = 0;
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    function quadratic(n: number): number {
        let count = 0;
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    int quadratic(int n) {
      int count = 0;
      // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    fn quadratic(n: i32) -> i32 {
        let mut count = 0;
        // Number of iterations is quadratically related to the data size n
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
    /* Exponential order */
    int quadratic(int n) {
        int count = 0;
        // Number of iterations is quadratically related to the data size n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Exponential order */
    fun quadratic(n: Int): Int {
        var count = 0
        // Number of iterations is quadratically related to the data size n
        for (i in 0..<n) {
            for (j in 0..<n) {
                count++
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Quadratic time ###
    def quadratic(n)
      count = 0

      # Number of iterations is quadratically related to the data size n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end
    ```

Figure 2-10 compares constant order, linear order, and quadratic order time complexities.

![Time complexities of constant, linear, and quadratic orders](time_complexity.assets/time_complexity_constant_linear_quadratic.png){ class="animation-figure" }

<p align="center"> Figure 2-10 &nbsp; Time complexities of constant, linear, and quadratic orders </p>

Taking bubble sort as an example, the outer loop executes $n - 1$ times, and the inner loop executes $n-1$, $n-2$, $\dots$, $2$, $1$ times, averaging $n / 2$ times, resulting in a time complexity of $O((n - 1) n / 2) = O(n^2)$:

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """Quadratic order (bubble sort)"""
        count = 0  # Counter
        # Outer loop: unsorted range is [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # Element swap includes 3 unit operations
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Quadratic order (bubble sort) */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Quadratic order (bubble sort) */
    int bubbleSort(int[] nums) {
        int count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Quadratic order (bubble sort) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Quadratic order (bubble sort) */
    func bubbleSort(nums []int) int {
        count := 0 // Counter
        // Outer loop: unsorted range is [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Swap nums[j] and nums[j + 1]
                    tmp := nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                    count += 3 // Element swap includes 3 unit operations
                }
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Quadratic order (bubble sort) */
    func bubbleSort(nums: inout [Int]) -> Int {
        var count = 0 // Counter
        // Outer loop: unsorted range is [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3 // Element swap includes 3 unit operations
                }
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Quadratic order (bubble sort) */
    function bubbleSort(nums) {
        let count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Quadratic order (bubble sort) */
    function bubbleSort(nums: number[]): number {
        let count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Quadratic order (bubble sort) */
    int bubbleSort(List<int> nums) {
      int count = 0; // Counter
      // Outer loop: unsorted range is [0, i]
      for (var i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (var j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Swap nums[j] and nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            count += 3; // Element swap includes 3 unit operations
          }
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Quadratic order (bubble sort) */
    fn bubble_sort(nums: &mut [i32]) -> i32 {
        let mut count = 0; // Counter

        // Outer loop: unsorted range is [0, i]
        for i in (1..nums.len()).rev() {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 unit operations
                }
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Quadratic order (bubble sort) */
    int bubbleSort(int *nums, int n) {
        int count = 0; // Counter
        // Outer loop: unsorted range is [0, i]
        for (int i = n - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Element swap includes 3 unit operations
                }
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Quadratic order (bubble sort) */
    fun bubbleSort(nums: IntArray): Int {
        var count = 0 // Counter
        // Outer loop: unsorted range is [0, i]
        for (i in nums.size - 1 downTo 1) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    count += 3 // Element swap includes 3 unit operations
                }
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Quadratic time (bubble sort) ###
    def bubble_sort(nums)
      count = 0  # Counter

      # Outer loop: unsorted range is [0, i]
      for i in (nums.length - 1).downto(0)
        # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Swap nums[j] and nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Element swap includes 3 unit operations
          end
        end
      end

      count
    end
    ```

### 4. &nbsp; Exponential Order $O(2^n)$ {data-toc-label="4. &nbsp; Exponential Order"}

Biological "cell division" is a typical example of exponential order growth: the initial state is $1$ cell, after one round of division it becomes $2$, after two rounds it becomes $4$, and so on; after $n$ rounds of division there are $2^n$ cells.

Figure 2-11 and the following code simulate the cell division process, with a time complexity of $O(2^n)$. Note that the input $n$ represents the number of division rounds, and the return value `count` represents the total number of divisions.

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """Exponential order (loop implementation)"""
        count = 0
        base = 1
        # Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Exponential order (loop implementation) */
    int exponential(int n) {
        int count = 0, base = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    int exponential(int n) {
        int count = 0, base = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    func exponential(n int) int {
        count, base := 0, 1
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    func exponential(n: Int) -> Int {
        var count = 0
        var base = 1
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    function exponential(n) {
        let count = 0,
            base = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    function exponential(n: number): number {
        let count = 0,
            base = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    int exponential(int n) {
      int count = 0, base = 1;
      // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    fn exponential(n: i32) -> i32 {
        let mut count = 0;
        let mut base = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential order (loop implementation) */
    int exponential(int n) {
        int count = 0;
        int bas = 1;
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
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

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Exponential order (loop implementation) */
    fun exponential(n: Int): Int {
        var count = 0
        var base = 1
        // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
        for (i in 0..<n) {
            for (j in 0..<base) {
                count++
            }
            base *= 2
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Exponential time (iterative) ###
    def exponential(n)
      count, base = 0, 1

      # Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end
    ```

![Time complexity of exponential order](time_complexity.assets/time_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Figure 2-11 &nbsp; Time complexity of exponential order </p>

In actual algorithms, exponential order often appears in recursive functions. For example, in the following code, it recursively splits in two, stopping after $n$ splits:

=== "Python"

    ```python title="time_complexity.py"
    def exp_recur(n: int) -> int:
        """Exponential order (recursive implementation)"""
        if n == 1:
            return 1
        return exp_recur(n - 1) + exp_recur(n - 1) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Exponential order (recursive implementation) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Exponential order (recursive implementation) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Exponential order (recursive implementation) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Exponential order (recursive implementation) */
    func expRecur(n int) int {
        if n == 1 {
            return 1
        }
        return expRecur(n-1) + expRecur(n-1) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Exponential order (recursive implementation) */
    func expRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Exponential order (recursive implementation) */
    function expRecur(n) {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Exponential order (recursive implementation) */
    function expRecur(n: number): number {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Exponential order (recursive implementation) */
    int expRecur(int n) {
      if (n == 1) return 1;
      return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Exponential order (recursive implementation) */
    fn exp_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        exp_recur(n - 1) + exp_recur(n - 1) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Exponential order (recursive implementation) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Exponential order (recursive implementation) */
    fun expRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return expRecur(n - 1) + expRecur(n - 1) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Exponential time (recursive) ###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end
    ```

Exponential order growth is very rapid and is common in exhaustive methods (brute force search, backtracking, etc.). For problems with large data scales, exponential order is unacceptable and typically requires dynamic programming or greedy algorithms to solve.

### 5. &nbsp; Logarithmic Order $O(\log n)$ {data-toc-label="5. &nbsp; Logarithmic Order"}

In contrast to exponential order, logarithmic order reflects the situation of "reducing to half each round". Let the input data size be $n$. Since it is reduced to half each round, the number of loops is $\log_2 n$, which is the inverse function of $2^n$.

Figure 2-12 and the following code simulate the process of "reducing to half each round", with a time complexity of $O(\log_2 n)$, abbreviated as $O(\log n)$:

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: int) -> int:
        """Logarithmic order (loop implementation)"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Logarithmic order (loop implementation) */
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
    /* Logarithmic order (loop implementation) */
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
    /* Logarithmic order (loop implementation) */
    int Logarithmic(int n) {
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
    /* Logarithmic order (loop implementation) */
    func logarithmic(n int) int {
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
    /* Logarithmic order (loop implementation) */
    func logarithmic(n: Int) -> Int {
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
    /* Logarithmic order (loop implementation) */
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
    /* Logarithmic order (loop implementation) */
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
    /* Logarithmic order (loop implementation) */
    int logarithmic(int n) {
      int count = 0;
      while (n > 1) {
        n = n ~/ 2;
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Logarithmic order (loop implementation) */
    fn logarithmic(mut n: i32) -> i32 {
        let mut count = 0;
        while n > 1 {
            n = n / 2;
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Logarithmic order (loop implementation) */
    int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Logarithmic order (loop implementation) */
    fun logarithmic(n: Int): Int {
        var n1 = n
        var count = 0
        while (n1 > 1) {
            n1 /= 2
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Logarithmic time (iterative) ###
    def logarithmic(n)
      count = 0

      while n > 1
        n /= 2
        count += 1
      end

      count
    end
    ```

![Time complexity of logarithmic order](time_complexity.assets/time_complexity_logarithmic.png){ class="animation-figure" }

<p align="center"> Figure 2-12 &nbsp; Time complexity of logarithmic order </p>

Like exponential order, logarithmic order also commonly appears in recursive functions. The following code forms a recursion tree of height $\log_2 n$:

=== "Python"

    ```python title="time_complexity.py"
    def log_recur(n: int) -> int:
        """Logarithmic order (recursive implementation)"""
        if n <= 1:
            return 0
        return log_recur(n / 2) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Logarithmic order (recursive implementation) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Logarithmic order (recursive implementation) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Logarithmic order (recursive implementation) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Logarithmic order (recursive implementation) */
    func logRecur(n int) int {
        if n <= 1 {
            return 0
        }
        return logRecur(n/2) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Logarithmic order (recursive implementation) */
    func logRecur(n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        return logRecur(n: n / 2) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Logarithmic order (recursive implementation) */
    function logRecur(n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Logarithmic order (recursive implementation) */
    function logRecur(n: number): number {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Logarithmic order (recursive implementation) */
    int logRecur(int n) {
      if (n <= 1) return 0;
      return logRecur(n ~/ 2) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Logarithmic order (recursive implementation) */
    fn log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 0;
        }
        log_recur(n / 2) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Logarithmic order (recursive implementation) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Logarithmic order (recursive implementation) */
    fun logRecur(n: Int): Int {
        if (n <= 1)
            return 0
        return logRecur(n / 2) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Logarithmic time (recursive) ###
    def log_recur(n)
      return 0 unless n > 1
      log_recur(n / 2) + 1
    end
    ```

Logarithmic order commonly appears in algorithms based on the divide-and-conquer strategy, embodying the algorithmic thinking of "dividing into many" and "simplifying complexity". It grows slowly and is the ideal time complexity second only to constant order.

!!! tip "What is the base of $O(\log n)$?"

    To be precise, "dividing into $m$" corresponds to a time complexity of $O(\log_m n)$. And through the logarithmic base change formula, we can obtain time complexities with different bases that are equal:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    That is to say, the base $m$ can be converted without affecting the complexity. Therefore, we usually omit the base $m$ and denote logarithmic order simply as $O(\log n)$.

### 6. &nbsp; Linearithmic Order $O(n \log n)$ {data-toc-label="6. &nbsp; Linearithmic Order"}

Linearithmic order commonly appears in nested loops, where the time complexities of the two layers of loops are $O(\log n)$ and $O(n)$ respectively. The relevant code is as follows:

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: int) -> int:
        """Linearithmic order"""
        if n <= 1:
            return 1
        # Divide into two, the scale of subproblems is reduced by half
        count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        # Current subproblem contains n operations
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linearithmic order */
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
    /* Linearithmic order */
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
    /* Linearithmic order */
    int LinearLogRecur(int n) {
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
    /* Linearithmic order */
    func linearLogRecur(n int) int {
        if n <= 1 {
            return 1
        }
        count := linearLogRecur(n/2) + linearLogRecur(n/2)
        for i := 0; i < n; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Linearithmic order */
    func linearLogRecur(n: Int) -> Int {
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
    /* Linearithmic order */
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
    /* Linearithmic order */
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
    /* Linearithmic order */
    int linearLogRecur(int n) {
      if (n <= 1) return 1;
      int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
      for (var i = 0; i < n; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Linearithmic order */
    fn linear_log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 1;
        }
        let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
        for _ in 0..n {
            count += 1;
        }
        return count;
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Linearithmic order */
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

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Linearithmic order */
    fun linearLogRecur(n: Int): Int {
        if (n <= 1)
            return 1
        var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
        for (i in 0..<n) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Linearithmic time ###
    def linear_log_recur(n)
      return 1 unless n > 1

      count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
      (0...n).each { count += 1 }

      count
    end
    ```

Figure 2-13 shows how linearithmic order is generated. Each level of the binary tree has a total of $n$ operations, and the tree has $\log_2 n + 1$ levels, resulting in a time complexity of $O(n \log n)$.

![Time complexity of linearithmic order](time_complexity.assets/time_complexity_logarithmic_linear.png){ class="animation-figure" }

<p align="center"> Figure 2-13 &nbsp; Time complexity of linearithmic order </p>

Mainstream sorting algorithms typically have a time complexity of $O(n \log n)$, such as quicksort, merge sort, and heap sort.

### 7. &nbsp; Factorial Order $O(n!)$ {data-toc-label="7. &nbsp; Factorial Order"}

Factorial order corresponds to the mathematical "permutation" problem. Given $n$ distinct elements, find all possible permutation schemes; the number of schemes is:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Factorials are typically implemented using recursion. As shown in Figure 2-14 and the following code, the first level splits into $n$ branches, the second level splits into $n - 1$ branches, and so on, until the $n$-th level when splitting stops:

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """Factorial order (recursive implementation)"""
        if n == 0:
            return 1
        count = 0
        # Split from 1 into n
        for _ in range(n):
            count += factorial_recur(n - 1)
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Factorial order (recursive implementation) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Split from 1 into n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Factorial order (recursive implementation) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Split from 1 into n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Factorial order (recursive implementation) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Split from 1 into n
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Factorial order (recursive implementation) */
    func factorialRecur(n int) int {
        if n == 0 {
            return 1
        }
        count := 0
        // Split from 1 into n
        for i := 0; i < n; i++ {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Factorial order (recursive implementation) */
    func factorialRecur(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var count = 0
        // Split from 1 into n
        for _ in 0 ..< n {
            count += factorialRecur(n: n - 1)
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Factorial order (recursive implementation) */
    function factorialRecur(n) {
        if (n === 0) return 1;
        let count = 0;
        // Split from 1 into n
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Factorial order (recursive implementation) */
    function factorialRecur(n: number): number {
        if (n === 0) return 1;
        let count = 0;
        // Split from 1 into n
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Factorial order (recursive implementation) */
    int factorialRecur(int n) {
      if (n == 0) return 1;
      int count = 0;
      // Split from 1 into n
      for (var i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Factorial order (recursive implementation) */
    fn factorial_recur(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let mut count = 0;
        // Split from 1 into n
        for _ in 0..n {
            count += factorial_recur(n - 1);
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Factorial order (recursive implementation) */
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

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Factorial order (recursive implementation) */
    fun factorialRecur(n: Int): Int {
        if (n == 0)
            return 1
        var count = 0
        // Split from 1 into n
        for (i in 0..<n) {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Factorial time (recursive) ###
    def factorial_recur(n)
      return 1 if n == 0

      count = 0
      # Split from 1 into n
      (0...n).each { count += factorial_recur(n - 1) }

      count
    end
    ```

![Time complexity of factorial order](time_complexity.assets/time_complexity_factorial.png){ class="animation-figure" }

<p align="center"> Figure 2-14 &nbsp; Time complexity of factorial order </p>

Note that because when $n \geq 4$ we always have $n! > 2^n$, factorial order grows faster than exponential order, and is also unacceptable for large $n$.

## 2.3.5 &nbsp; Worst, Best, and Average Time Complexities

**The time efficiency of an algorithm is often not fixed, but is related to the distribution of the input data**. Suppose we input an array `nums` of length $n$, where `nums` consists of numbers from $1$ to $n$, with each number appearing only once, but the element order is randomly shuffled. The task is to return the index of element $1$. We can draw the following conclusions.

- When `nums = [?, ?, ..., 1]`, i.e., when the last element is $1$, it requires a complete traversal of the array, **reaching worst-case time complexity $O(n)$**.
- When `nums = [1, ?, ?, ...]`, i.e., when the first element is $1$, no matter how long the array is, there is no need to continue traversing, **reaching best-case time complexity $\Omega(1)$**.

The "worst-case time complexity" corresponds to the function's asymptotic upper bound, denoted using big-$O$ notation. Correspondingly, the "best-case time complexity" corresponds to the function's asymptotic lower bound, denoted using $\Omega$ notation:

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """Generate an array with elements: 1, 2, ..., n, shuffled in order"""
        # Generate array nums =: 1, 2, 3, ..., n
        nums = [i for i in range(1, n + 1)]
        # Randomly shuffle array elements
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """Find the index of number 1 in array nums"""
        for i in range(len(nums)):
            # When element 1 is at the head of the array, best time complexity O(1) is achieved
            # When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Use system time to generate random seed
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // Randomly shuffle array elements
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* Find the index of number 1 in array nums */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
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
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Randomly shuffle array elements
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Find the index of number 1 in array nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    func randomNumbers(n int) []int {
        nums := make([]int, n)
        // Generate array nums = { 1, 2, 3, ..., n }
        for i := 0; i < n; i++ {
            nums[i] = i + 1
        }
        // Randomly shuffle array elements
        rand.Shuffle(len(nums), func(i, j int) {
            nums[i], nums[j] = nums[j], nums[i]
        })
        return nums
    }

    /* Find the index of number 1 in array nums */
    func findOne(nums []int) int {
        for i := 0; i < len(nums); i++ {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    func randomNumbers(n: Int) -> [Int] {
        // Generate array nums = { 1, 2, 3, ..., n }
        var nums = Array(1 ... n)
        // Randomly shuffle array elements
        nums.shuffle()
        return nums
    }

    /* Find the index of number 1 in array nums */
    func findOne(nums: [Int]) -> Int {
        for i in nums.indices {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    function randomNumbers(n) {
        const nums = Array(n);
        // Generate array nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle array elements
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* Find the index of number 1 in array nums */
    function findOne(nums) {
        for (let i = 0; i < nums.length; i++) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    function randomNumbers(n: number): number[] {
        const nums = Array(n);
        // Generate array nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle array elements
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* Find the index of number 1 in array nums */
    function findOne(nums: number[]): number {
        for (let i = 0; i < nums.length; i++) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    List<int> randomNumbers(int n) {
      final nums = List.filled(n, 0);
      // Generate array nums = { 1, 2, 3, ..., n }
      for (var i = 0; i < n; i++) {
        nums[i] = i + 1;
      }
      // Randomly shuffle array elements
      nums.shuffle();

      return nums;
    }

    /* Find the index of number 1 in array nums */
    int findOne(List<int> nums) {
      for (var i = 0; i < nums.length; i++) {
        // When element 1 is at the head of the array, best time complexity O(1) is achieved
        // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
        if (nums[i] == 1) return i;
      }

      return -1;
    }
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    fn random_numbers(n: i32) -> Vec<i32> {
        // Generate array nums = { 1, 2, 3, ..., n }
        let mut nums = (1..=n).collect::<Vec<i32>>();
        // Randomly shuffle array elements
        nums.shuffle(&mut thread_rng());
        nums
    }

    /* Find the index of number 1 in array nums */
    fn find_one(nums: &[i32]) -> Option<usize> {
        for i in 0..nums.len() {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if nums[i] == 1 {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    int *randomNumbers(int n) {
        // Allocate heap memory (create 1D variable-length array: n elements of type int)
        int *nums = (int *)malloc(n * sizeof(int));
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle array elements
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        return nums;
    }

    /* Find the index of number 1 in array nums */
    int findOne(int *nums, int n) {
        for (int i = 0; i < n; i++) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="worst_best_time_complexity.kt"
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    fun randomNumbers(n: Int): Array<Int?> {
        val nums = IntArray(n)
        // Generate array nums = { 1, 2, 3, ..., n }
        for (i in 0..<n) {
            nums[i] = i + 1
        }
        // Randomly shuffle array elements
        nums.shuffle()
        val res = arrayOfNulls<Int>(n)
        for (i in 0..<n) {
            res[i] = nums[i]
        }
        return res
    }

    /* Find the index of number 1 in array nums */
    fun findOne(nums: Array<Int?>): Int {
        for (i in nums.indices) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] == 1)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="worst_best_time_complexity.rb"
    ### Generate array with elements: 1, 2, ..., n, shuffled ###
    def random_numbers(n)
      # Generate array nums =: 1, 2, 3, ..., n
      nums = Array.new(n) { |i| i + 1 }
      # Randomly shuffle array elements
      nums.shuffle!
    end

    ### Find index of number 1 in array nums ###
    def find_one(nums)
      for i in 0...nums.length
        # When element 1 is at the head of the array, best time complexity O(1) is achieved
        # When element 1 is at the tail of the array, worst time complexity O(n) is achieved
        return i if nums[i] == 1
      end

      -1
    end
    ```

It is worth noting that we rarely use best-case time complexity in practice, because it can usually only be achieved with a very small probability and may be somewhat misleading. **The worst-case time complexity is more practical because it gives a safety value for efficiency**, allowing us to use the algorithm with confidence.

From the above example, we can see that both worst-case and best-case time complexities only occur under "special data distributions", which may have a very small probability of occurrence and may not truly reflect the algorithm's running efficiency. In contrast, **average time complexity can reflect the algorithm's running efficiency under random input data**, denoted using the $\Theta$ notation.

For some algorithms, we can simply derive the average case under random data distribution. For example, in the above example, since the input array is shuffled, the probability of element $1$ appearing at any index is equal, so the algorithm's average number of loops is half the array length $n / 2$, giving an average time complexity of $\Theta(n / 2) = \Theta(n)$.

But for more complex algorithms, calculating average time complexity is often quite difficult, because it is hard to analyze the overall mathematical expectation under data distribution. In this case, we usually use worst-case time complexity as the criterion for judging algorithm efficiency.

!!! question "Why is the $\Theta$ symbol rarely seen?"

    This may be because the $O$ symbol is too catchy, so we often use it to represent average time complexity. But strictly speaking, this practice is not standard. In this book and other materials, if you encounter expressions like "average time complexity $O(n)$", please understand it directly as $\Theta(n)$.
