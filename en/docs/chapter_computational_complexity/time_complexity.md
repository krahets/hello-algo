---
comments: true
---

# 2.3 &nbsp; Time complexity

Runtime gives a direct, accurate picture of an algorithm's efficiency. How might we predict the runtime of a piece of code precisely?

1. **Specify the execution platform**, including hardware, programming language, and system environment, all of which affect performance.
2. **Determine the time required by each operation**: for example, addition `+` might take 1 ns, multiplication `*` 10 ns, and `print()` 5 ns.
3. **Count every operation in the code** and sum their execution times to obtain the total runtime.

For example, consider the following code with input size $n$:

=== "Python"

    ```python title=""
    # On a particular execution platform
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # Repeat n times
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // On a particular execution platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Repeat n times
        for (int i = 0; i < n; i++) {  // 1 ns
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // On a particular execution platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Repeat n times
        for (int i = 0; i < n; i++) {  // 1 ns
            System.out.println(0);     // 5 ns
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // On a particular execution platform
    void Algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Repeat n times
        for (int i = 0; i < n; i++) {  // 1 ns
            Console.WriteLine(0);      // 5 ns
        }
    }
    ```

=== "Go"

    ```go title=""
    // On a particular execution platform
    func algorithm(n int) {
        a := 2     // 1 ns
        a = a + 1  // 1 ns
        a = a * 2  // 10 ns
        // Repeat n times
        for i := 0; i < n; i++ {  // 1 ns
            fmt.Println(a)        // 5 ns
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // On a particular execution platform
    func algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // Repeat n times
        for _ in 0 ..< n { // 1 ns
            print(0) // 5 ns
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // On a particular execution platform
    function algorithm(n) {
        var a = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // Repeat n times
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // On a particular execution platform
    function algorithm(n: number): void {
        var a: number = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // Repeat n times
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // On a particular execution platform
    void algorithm(int n) {
      int a = 2; // 1 ns
      a = a + 1; // 1 ns
      a = a * 2; // 10 ns
      // Repeat n times
      for (int i = 0; i < n; i++) { // 1 ns
        print(0); // 5 ns
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // On a particular execution platform
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 ns
        a = a + 1;          // 1 ns
        a = a * 2;          // 10 ns
        // Repeat n times
        for _ in 0..n {     // 1 ns
            println!("{}", 0);  // 5 ns
        }
    }
    ```

=== "C"

    ```c title=""
    // On a particular execution platform
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Repeat n times
        for (int i = 0; i < n; i++) {   // 1 ns
            printf("%d", 0);            // 5 ns
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // On a particular execution platform
    fun algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // Repeat n times
        for (i in 0..<n) {  // 1 ns
            println(0)      // 5 ns
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # On a particular execution platform
    def algorithm(n)
        a = 2       # 1 ns
        a = a + 1   # 1 ns
        a = a * 2   # 10 ns
        # Repeat n times
        (0...n).each do # 1 ns
            puts 0      # 5 ns
        end
    end
    ```

This gives a runtime of $(6n + 12)$ ns:

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

In practice, **calculating runtime this way is neither suitable nor realistic**. We do not want estimates tied to one platform, since algorithms run on many platforms. Also, the time taken by each operation is difficult to determine, making accurate prediction very hard.

## 2.3.1 &nbsp; Measuring growth in runtime

Time complexity analysis measures **how runtime grows as the input gets larger**, rather than the runtime itself.

To make this abstract idea concrete, consider three algorithms, `A`, `B`, and `C`, with input size $n$:

=== "Python"

    ```python title=""
    # Algorithm A: constant time complexity
    def algorithm_A(n: int):
        print(0)
    # Algorithm B: linear time complexity
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # Algorithm C: constant time complexity
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

=== "C++"

    ```cpp title=""
    // Algorithm A: constant time complexity
    void algorithm_A(int n) {
        cout << 0 << endl;
    }
    // Algorithm B: linear time complexity
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            cout << 0 << endl;
        }
    }
    // Algorithm C: constant time complexity
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            cout << 0 << endl;
        }
    }
    ```

=== "Java"

    ```java title=""
    // Algorithm A: constant time complexity
    void algorithm_A(int n) {
        System.out.println(0);
    }
    // Algorithm B: linear time complexity
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println(0);
        }
    }
    // Algorithm C: constant time complexity
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            System.out.println(0);
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // Algorithm A: constant time complexity
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }
    // Algorithm B: linear time complexity
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // Algorithm C: constant time complexity
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }
    ```

=== "Go"

    ```go title=""
    // Algorithm A: constant time complexity
    func algorithm_A(n int) {
        fmt.Println(0)
    }
    // Algorithm B: linear time complexity
    func algorithm_B(n int) {
        for i := 0; i < n; i++ {
            fmt.Println(0)
        }
    }
    // Algorithm C: constant time complexity
    func algorithm_C(n int) {
        for i := 0; i < 1000000; i++ {
            fmt.Println(0)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // Algorithm A: constant time complexity
    func algorithmA(n: Int) {
        print(0)
    }

    // Algorithm B: linear time complexity
    func algorithmB(n: Int) {
        for _ in 0 ..< n {
            print(0)
        }
    }

    // Algorithm C: constant time complexity
    func algorithmC(n: Int) {
        for _ in 0 ..< 1_000_000 {
            print(0)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // Algorithm A: constant time complexity
    function algorithm_A(n) {
        console.log(0);
    }
    // Algorithm B: linear time complexity
    function algorithm_B(n) {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // Algorithm C: constant time complexity
    function algorithm_C(n) {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }

    ```

=== "TS"

    ```typescript title=""
    // Algorithm A: constant time complexity
    function algorithm_A(n: number): void {
        console.log(0);
    }
    // Algorithm B: linear time complexity
    function algorithm_B(n: number): void {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // Algorithm C: constant time complexity
    function algorithm_C(n: number): void {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // Algorithm A: constant time complexity
    void algorithmA(int n) {
      print(0);
    }
    // Algorithm B: linear time complexity
    void algorithmB(int n) {
      for (int i = 0; i < n; i++) {
        print(0);
      }
    }
    // Algorithm C: constant time complexity
    void algorithmC(int n) {
      for (int i = 0; i < 1000000; i++) {
        print(0);
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // Algorithm A: constant time complexity
    fn algorithm_A(n: i32) {
        println!("{}", 0);
    }
    // Algorithm B: linear time complexity
    fn algorithm_B(n: i32) {
        for _ in 0..n {
            println!("{}", 0);
        }
    }
    // Algorithm C: constant time complexity
    fn algorithm_C(n: i32) {
        for _ in 0..1000000 {
            println!("{}", 0);
        }
    }
    ```

=== "C"

    ```c title=""
    // Algorithm A: constant time complexity
    void algorithm_A(int n) {
        printf("%d", 0);
    }
    // Algorithm B: linear time complexity
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            printf("%d", 0);
        }
    }
    // Algorithm C: constant time complexity
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            printf("%d", 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // Algorithm A: constant time complexity
    fun algoritm_A(n: Int) {
        println(0)
    }
    // Algorithm B: linear time complexity
    fun algorithm_B(n: Int) {
        for (i in 0..<n){
            println(0)
        }
    }
    // Algorithm C: constant time complexity
    fun algorithm_C(n: Int) {
        for (i in 0..<1000000) {
            println(0)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Algorithm A: constant time complexity
    def algorithm_A(n)
        puts 0
    end

    # Algorithm B: linear time complexity
    def algorithm_B(n)
        (0...n).each { puts 0 }
    end

    # Algorithm C: constant time complexity
    def algorithm_C(n)
        (0...1_000_000).each { puts 0 }
    end
    ```

Figure 2-7 shows their time complexities.

- Algorithm `A` performs $1$ print operation. Its runtime does not grow with $n$, so it has constant time complexity.
- Algorithm `B` prints $n$ times. Its runtime grows linearly with $n$, so it has linear time complexity.
- Algorithm `C` prints $1000000$ times. It may take a long time, but that time is independent of input size $n$. Its complexity is therefore constant, like `A`.

![Runtime growth of algorithms A, B, and C](time_complexity.assets/time_complexity_simple_example.png){ class="animation-figure" }

<p align="center"> Figure 2-7 &nbsp; Runtime growth of algorithms A, B, and C </p>

How does time complexity analysis differ from calculating runtime directly?

- **Time complexity evaluates efficiency effectively**. Algorithm `B` grows linearly, becoming slower than `A` when $n > 1$ and slower than `C` when $n > 1000000$. With sufficiently large input size $n$, a constant-time algorithm will outperform a linear-time one. This is what a growth trend tells us.
- **Time complexity is easier to derive**. The execution platform and kinds of elementary operations do not determine the growth trend. We can treat each elementary operation as taking the same unit of time, reducing runtime estimation to operation counting and greatly simplifying analysis.
- **Time complexity has limitations**. Algorithms `A` and `C` have the same complexity but very different runtimes. Although `B` has higher complexity than `C`, it is much faster for small $n$. Complexity alone may not settle such comparisons. Even so, it remains the most effective and widely used way to evaluate algorithm efficiency.

## 2.3.2 &nbsp; Asymptotic upper bounds

Consider this function with input size $n$:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # Repeat n times
        for i in range(n):  # +1
            print(0)        # +1
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Repeat n times
        for (int i = 0; i < n; i++) { // +1 (i ++ executes each iteration)
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
        // Repeat n times
        for (int i = 0; i < n; i++) { // +1 (i ++ executes each iteration)
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
        // Repeat n times
        for (int i = 0; i < n; i++) {   // +1 (i ++ executes each iteration)
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
        // Repeat n times
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
        // Repeat n times
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
        // Repeat n times
        for(let i = 0; i < n; i++){ // +1 (i ++ executes each iteration)
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
        // Repeat n times
        for(let i = 0; i < n; i++){ // +1 (i ++ executes each iteration)
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
      // Repeat n times
      for (int i = 0; i < n; i++) { // +1 (i ++ executes each iteration)
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

        // Repeat n times
        for _ in 0..n { // +1 (i ++ executes each iteration)
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
        // Repeat n times
        for (int i = 0; i < n; i++) {   // +1 (i ++ executes each iteration)
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
        // Repeat n times
        for (i in 0..<n) { // +1 (i ++ executes each iteration)
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
        # Repeat n times
        (0...n).each do # +1
            puts 0      # +1
        end
    end
    ```

Let $T(n)$ be the operation count as a function of input size $n$. For the function above:

$$
T(n) = 3 + 2n
$$

Since $T(n)$ is a first-degree function, runtime grows linearly, giving linear time complexity.

We write linear time complexity as $O(n)$. This is called <u>big-$O$ notation</u>, and it gives an <u>asymptotic upper bound</u> on $T(n)$.

Time complexity analysis essentially finds an asymptotic upper bound on the operation count $T(n)$. It has a precise mathematical definition.

!!! note "Asymptotic upper bound"

    If a positive real constant $c$ and a real number $n_0$ exist such that $T(n) \leq c \cdot f(n)$ for all $n > n_0$, then $f(n)$ is an asymptotic upper bound on $T(n)$, written $T(n) = O(f(n))$.

As shown in Figure 2-8, we seek a function $f(n)$ such that, as $n$ tends to infinity, $T(n)$ and $f(n)$ have the same order of growth, differing only by a constant factor $c$.

![Asymptotic upper bound of a function](time_complexity.assets/asymptotic_upper_bound.png){ class="animation-figure" }

<p align="center"> Figure 2-8 &nbsp; Asymptotic upper bound of a function </p>

## 2.3.3 &nbsp; How to derive time complexity

The mathematics of asymptotic bounds may feel unfamiliar. Do not worry if it is not fully clear yet: learn the practical method first, and its meaning will become clearer with practice.

Once we identify $f(n)$, the time complexity is $O(f(n))$. Finding the asymptotic upper bound $f(n)$ takes two steps: count operations, then determine the bound.

### 1. &nbsp; Step 1: Count operations

We can count code operations line by line. Since the constant factor $c$ in $c \cdot f(n)$ may be arbitrarily large, **coefficients and constant terms in $T(n)$ can be ignored**. This gives three useful shortcuts.

1. **Ignore constant terms in $T(n)$**. They are independent of $n$ and do not affect complexity.
2. **Drop coefficients**. For example, $2n$ or $5n + 1$ iterations can be counted simply as $n$, because the coefficient of $n$ does not affect complexity.
3. **Multiply for nested loops**. Multiply the outer and inner iteration counts, applying shortcuts `1.` and `2.` to each level.

We can apply these shortcuts to the following function:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0 (shortcut 1)
        a = a + n  # +0 (shortcut 1)
        # +n (shortcut 2)
        for i in range(5 * n + 1):
            print(0)
        # +n*n (shortcut 3)
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0 (shortcut 1)
        a = a + n;  // +0 (shortcut 1)
        // +n (shortcut 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n (shortcut 3)
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
        int a = 1;  // +0 (shortcut 1)
        a = a + n;  // +0 (shortcut 1)
        // +n (shortcut 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n (shortcut 3)
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
        int a = 1;  // +0 (shortcut 1)
        a = a + n;  // +0 (shortcut 1)
        // +n (shortcut 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (shortcut 3)
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
        a := 1     // +0 (shortcut 1)
        a = a + n  // +0 (shortcut 1)
        // +n (shortcut 2)
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n (shortcut 3)
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
        var a = 1 // +0 (shortcut 1)
        a = a + n // +0 (shortcut 1)
        // +n (shortcut 2)
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n (shortcut 3)
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
        let a = 1;  // +0 (shortcut 1)
        a = a + n;  // +0 (shortcut 1)
        // +n (shortcut 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (shortcut 3)
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
        let a = 1;  // +0 (shortcut 1)
        a = a + n;  // +0 (shortcut 1)
        // +n (shortcut 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (shortcut 3)
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
      int a = 1; // +0 (shortcut 1)
      a = a + n; // +0 (shortcut 1)
      // +n (shortcut 2)
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n (shortcut 3)
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
        let mut a = 1;     // +0 (shortcut 1)
        a = a + n;        // +0 (shortcut 1)

        // +n (shortcut 2)
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n (shortcut 3)
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
        int a = 1;  // +0 (shortcut 1)
        a = a + n;  // +0 (shortcut 1)
        // +n (shortcut 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n (shortcut 3)
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
        var a = 1   // +0 (shortcut 1)
        a = a + n   // +0 (shortcut 1)
        // +n (shortcut 2)
        for (i in 0..<5 * n + 1) {
            println(0)
        }
        // +n*n (shortcut 3)
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
        a = 1       # +0 (shortcut 1)
        a = a + n   # +0 (shortcut 1)
        # +n (shortcut 2)
        (0...(5 * n + 1)).each do { puts 0 }
        # +n*n (shortcut 3)
        (0...(2 * n)).each do
            (0...(n + 1)).each do { puts 0 }
        end
    end
    ```

The formulas below compare full and simplified counts. Both give time complexity $O(n^2)$.

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{Full count (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{Shortcut count (o.O)}
\end{aligned}
$$

### 2. &nbsp; Step 2: Determine the asymptotic upper bound

**The highest-order term in $T(n)$ determines time complexity**. As $n$ tends to infinity, that term dominates, and the others become negligible.

Table 2-2 includes deliberately extreme coefficients to emphasize that coefficients cannot overcome growth order. As $n$ tends to infinity, those constants become insignificant.

<p align="center"> Table 2-2 &nbsp; Operation counts and their time complexities </p>

<div class="center-table" markdown>

| Operation count $T(n)$        | Time complexity $O(f(n))$ |
| ---------------------- | -------------------- |
| $100000$               | $O(1)$               |
| $3n + 2$               | $O(n)$               |
| $2n^2 + 3n + 2$        | $O(n^2)$             |
| $n^3 + 10000n^2$       | $O(n^3)$             |
| $2^n + 10000n^{10000}$ | $O(2^n)$             |

</div>

## 2.3.4 &nbsp; Common complexity classes

For input size $n$, common time complexities are shown below in increasing order of growth.

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
& \text{Constant} < \text{Logarithmic} < \text{Linear} < \text{Linearithmic} < \text{Quadratic} < \text{Exponential} < \text{Factorial}
\end{aligned}
$$

![Common time complexity classes](time_complexity.assets/time_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Figure 2-9 &nbsp; Common time complexity classes </p>

### 1. &nbsp; Constant time $O(1)$ {data-toc-label="1. &nbsp; Constant time"}

A constant operation count is independent of input size $n$: changing $n$ does not change the count.

In the following function, `size` may be large, but it is independent of input size $n$, so the time complexity remains $O(1)$:

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
    /* Constant complexity */
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
    /* Constant complexity */
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
    /* Constant complexity */
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
    /* Constant complexity */
    function constant(n) {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Constant complexity */
    function constant(n: number): number {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Constant complexity */
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
    /* Constant complexity */
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
    /* Constant complexity */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Constant complexity */
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
    ### Constant complexity ###
    def constant(n)
      count = 0
      size = 100000

      (0...size).each { count += 1 }

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Constant%20complexity%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20constant%20complexity%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Constant%20complexity%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20constant%20complexity%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Linear time $O(n)$ {data-toc-label="2. &nbsp; Linear time"}

A linear operation count grows proportionally to input size $n$. It commonly appears in a single loop:

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
    /* Linear complexity */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Linear complexity */
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
    /* Linear complexity */
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
    /* Linear complexity */
    function linear(n) {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Linear complexity */
    function linear(n: number): number {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Linear complexity */
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
    /* Linear complexity */
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
    /* Linear complexity */
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
    /* Linear complexity */
    fun linear(n: Int): Int {
        var count = 0
        for (i in 0..<n)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Linear complexity ###
    def linear(n)
      count = 0
      (0...n).each { count += 1 }
      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Linear%20complexity%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20linear%20complexity%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Linear%20complexity%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20linear%20complexity%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Traversing an array or linked list takes $O(n)$ time, where $n$ is its length:

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """Linear complexity (array traversal)"""
        count = 0
        # The number of iterations is proportional to the array length
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linear complexity (array traversal) */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // The number of iterations is proportional to the array length
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Linear complexity (array traversal) */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // The number of iterations is proportional to the array length
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Linear complexity (array traversal) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // The number of iterations is proportional to the array length
        foreach (int num in nums) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Linear complexity (array traversal) */
    func arrayTraversal(nums []int) int {
        count := 0
        // The number of iterations is proportional to the array length
        for range nums {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Linear complexity (array traversal) */
    func arrayTraversal(nums: [Int]) -> Int {
        var count = 0
        // The number of iterations is proportional to the array length
        for _ in nums {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Linear complexity (array traversal) */
    function arrayTraversal(nums) {
        let count = 0;
        // The number of iterations is proportional to the array length
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Linear complexity (array traversal) */
    function arrayTraversal(nums: number[]): number {
        let count = 0;
        // The number of iterations is proportional to the array length
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Linear complexity (array traversal) */
    int arrayTraversal(List<int> nums) {
      int count = 0;
      // The number of iterations is proportional to the array length
      for (var _num in nums) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Linear complexity (array traversal) */
    fn array_traversal(nums: &[i32]) -> i32 {
        let mut count = 0;
        // The number of iterations is proportional to the array length
        for _ in nums {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Linear complexity (array traversal) */
    int arrayTraversal(int *nums, int n) {
        int count = 0;
        // The number of iterations is proportional to the array length
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Linear complexity (array traversal) */
    fun arrayTraversal(nums: IntArray): Int {
        var count = 0
        // The number of iterations is proportional to the array length
        for (num in nums) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Linear complexity (array traversal)###
    def array_traversal(nums)
      count = 0

      # The number of iterations is proportional to the array length
      for num in nums
        count += 1
      end

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Linear%20complexity%20%28array%20traversal%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20The%20number%20of%20iterations%20is%20proportional%20to%20the%20array%20length%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20linear%20complexity%20%28array%20traversal%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Linear%20complexity%20%28array%20traversal%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20The%20number%20of%20iterations%20is%20proportional%20to%20the%20array%20length%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20linear%20complexity%20%28array%20traversal%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

**The meaning of input size $n$ depends on the input type**. In the first example, it is the variable $n$; in the second, it is the array length $n$.

### 3. &nbsp; Quadratic time $O(n^2)$ {data-toc-label="3. &nbsp; Quadratic time"}

A quadratic operation count grows with the square of input size $n$. It commonly appears in nested loops where both levels take $O(n)$ time, giving $O(n^2)$ overall:

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """Quadratic complexity"""
        count = 0
        # The number of iterations is proportional to the square of the input size n
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
        // The number of iterations is proportional to the square of the input size n
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
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    int Quadratic(int n) {
        int count = 0;
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    func quadratic(n int) int {
        count := 0
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    func quadratic(n: Int) -> Int {
        var count = 0
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    function quadratic(n) {
        let count = 0;
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    function quadratic(n: number): number {
        let count = 0;
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    int quadratic(int n) {
      int count = 0;
      // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    fn quadratic(n: i32) -> i32 {
        let mut count = 0;
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    int quadratic(int n) {
        int count = 0;
        // The number of iterations is proportional to the square of the input size n
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
    /* Quadratic complexity */
    fun quadratic(n: Int): Int {
        var count = 0
        // The number of iterations is proportional to the square of the input size n
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
    ### Quadratic complexity ###
    def quadratic(n)
      count = 0

      # The number of iterations is proportional to the square of the input size n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Quadratic%20complexity%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20The%20number%20of%20iterations%20is%20proportional%20to%20the%20square%20of%20the%20input%20size%20n%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20quadratic%20complexity%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Quadratic%20complexity%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20The%20number%20of%20iterations%20is%20proportional%20to%20the%20square%20of%20the%20input%20size%20n%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20quadratic%20complexity%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 2-10 compares constant, linear, and quadratic time complexity.

![Constant, linear, and quadratic time complexity](time_complexity.assets/time_complexity_constant_linear_quadratic.png){ class="animation-figure" }

<p align="center"> Figure 2-10 &nbsp; Constant, linear, and quadratic time complexity </p>

In bubble sort, for example, the outer loop runs $n - 1$ times, while the inner loop runs $n-1$, $n-2$, $\dots$, $2$, and $1$ times, averaging $n / 2$. The resulting complexity is $O((n - 1) n / 2) = O(n^2)$:

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """Quadratic complexity (bubble sort)"""
        count = 0  # Counter
        # Outer loop: the unsorted range is [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # Swapping two elements takes 3 elementary operations
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Quadratic complexity (bubble sort) */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // Counter
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
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
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Quadratic complexity (bubble sort) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Counter
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Quadratic complexity (bubble sort) */
    func bubbleSort(nums []int) int {
        count := 0 // Counter
        // Outer loop: the unsorted range is [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Swap nums[j] and nums[j + 1]
                    tmp := nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                    count += 3 // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Quadratic complexity (bubble sort) */
    func bubbleSort(nums: inout [Int]) -> Int {
        var count = 0 // Counter
        // Outer loop: the unsorted range is [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3 // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Quadratic complexity (bubble sort) */
    function bubbleSort(nums) {
        let count = 0; // Counter
        // Outer loop: the unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Quadratic complexity (bubble sort) */
    function bubbleSort(nums: number[]): number {
        let count = 0; // Counter
        // Outer loop: the unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Quadratic complexity (bubble sort) */
    int bubbleSort(List<int> nums) {
      int count = 0; // Counter
      // Outer loop: the unsorted range is [0, i]
      for (var i = nums.length - 1; i > 0; i--) {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for (var j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Swap nums[j] and nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            count += 3; // Swapping two elements takes 3 elementary operations
          }
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Quadratic complexity (bubble sort) */
    fn bubble_sort(nums: &mut [i32]) -> i32 {
        let mut count = 0; // Counter

        // Outer loop: the unsorted range is [0, i]
        for i in (1..nums.len()).rev() {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
                }
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Quadratic complexity (bubble sort) */
    int bubbleSort(int *nums, int n) {
        int count = 0; // Counter
        // Outer loop: the unsorted range is [0, i]
        for (int i = n - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Quadratic complexity (bubble sort) */
    fun bubbleSort(nums: IntArray): Int {
        var count = 0 // Counter
        // Outer loop: the unsorted range is [0, i]
        for (i in nums.size - 1 downTo 1) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    count += 3 // Swapping two elements takes 3 elementary operations
                }
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Quadratic complexity (bubble sort)###
    def bubble_sort(nums)
      count = 0  # Counter

      # Outer loop: the unsorted range is [0, i]
      for i in (nums.length - 1).downto(0)
        # Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Swap nums[j] and nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Swapping two elements takes 3 elementary operations
          end
        end
      end

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Quadratic%20complexity%20%28bubble%20sort%29%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20Counter%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20move%20the%20largest%20element%20in%20the%20unsorted%20range%20%5B0,%20i%5D%20to%20its%20right%20end%20through%20swaps%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20nums%5Bj%5D%20and%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20Swapping%20two%20elements%20takes%203%20elementary%20operations%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n,%200,%20-1%29%5D%20%20%23%20%5Bn,%20n-1,%20...,%202,%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22Operation%20count%20for%20quadratic%20complexity%20%28bubble%20sort%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Quadratic%20complexity%20%28bubble%20sort%29%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20Counter%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20move%20the%20largest%20element%20in%20the%20unsorted%20range%20%5B0,%20i%5D%20to%20its%20right%20end%20through%20swaps%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20nums%5Bj%5D%20and%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20Swapping%20two%20elements%20takes%203%20elementary%20operations%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n,%200,%20-1%29%5D%20%20%23%20%5Bn,%20n-1,%20...,%202,%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22Operation%20count%20for%20quadratic%20complexity%20%28bubble%20sort%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 4. &nbsp; Exponential time $O(2^n)$ {data-toc-label="4. &nbsp; Exponential time"}

Cell division is a classic example of exponential growth. Starting with $1$ cell, one round produces $2$, two rounds produce $4$, and after $n$ rounds there are $2^n$ cells.

The figure and code below simulate cell division in $O(2^n)$ time. The input $n$ is the number of rounds, while the returned `count` is the total number of individual divisions.

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """Exponential complexity (iterative implementation)"""
        count = 0
        base = 1
        # Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Exponential complexity (iterative implementation) */
    int exponential(int n) {
        int count = 0, base = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    int exponential(int n) {
        int count = 0, base = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation)*/
    func exponential(n int) int {
        count, base := 0, 1
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    func exponential(n: Int) -> Int {
        var count = 0
        var base = 1
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    function exponential(n) {
        let count = 0,
            base = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    function exponential(n: number): number {
        let count = 0,
            base = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    int exponential(int n) {
      int count = 0, base = 1;
      // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    fn exponential(n: i32) -> i32 {
        let mut count = 0;
        let mut base = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    int exponential(int n) {
        int count = 0;
        int bas = 1;
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    /* Exponential complexity (iterative implementation) */
    fun exponential(n: Int): Int {
        var count = 0
        var base = 1
        // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    ### Exponential complexity (iterative implementation)###
    def exponential(n)
      count, base = 0, 1

      # Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Exponential%20complexity%20%28iterative%20implementation%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20Each%20cell%20divides%20into%20two%20per%20round,%20giving%20the%20sequence%201,%202,%204,%208,%20...,%202%5E%28n-1%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20exponential%20complexity%20%28iterative%20implementation%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Exponential%20complexity%20%28iterative%20implementation%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20Each%20cell%20divides%20into%20two%20per%20round,%20giving%20the%20sequence%201,%202,%204,%208,%20...,%202%5E%28n-1%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20exponential%20complexity%20%28iterative%20implementation%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

![Exponential time complexity](time_complexity.assets/time_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Figure 2-11 &nbsp; Exponential time complexity </p>

Exponential time often appears in recursive algorithms. The following function branches into two calls at each level, stopping after $n$ levels:

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
    /* Exponential complexity (recursive implementation) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Exponential complexity (recursive implementation)*/
    func expRecur(n int) int {
        if n == 1 {
            return 1
        }
        return expRecur(n-1) + expRecur(n-1) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Exponential complexity (recursive implementation) */
    func expRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Exponential complexity (recursive implementation) */
    function expRecur(n) {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Exponential complexity (recursive implementation) */
    function expRecur(n: number): number {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Exponential complexity (recursive implementation) */
    int expRecur(int n) {
      if (n == 1) return 1;
      return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Exponential complexity (recursive implementation) */
    fn exp_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        exp_recur(n - 1) + exp_recur(n - 1) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Exponential complexity (recursive implementation) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Exponential complexity (recursive implementation) */
    fun expRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return expRecur(n - 1) + expRecur(n - 1) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Exponential complexity (recursive implementation)###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Exponential%20complexity%20%28recursive%20implementation%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20exponential%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Exponential%20complexity%20%28recursive%20implementation%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20exponential%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Exponential growth is very rapid and common in exhaustive approaches such as brute-force search and backtracking. It is unacceptable for large inputs, which usually require approaches such as dynamic programming or greedy algorithms.

### 5. &nbsp; Logarithmic time $O(\log n)$ {data-toc-label="5. &nbsp; Logarithmic time"}

Logarithmic growth corresponds to repeatedly halving a quantity, the reverse of exponential growth. Starting with input size $n$, halving each round gives $\log_2 n$ iterations, the inverse of $2^n$.

The figure and code below simulate repeated halving, taking $O(\log_2 n)$ time, usually written $O(\log n)$:

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: int) -> int:
        """Logarithmic complexity (iterative implementation)"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation)*/
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    /* Logarithmic complexity (iterative implementation) */
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
    ### Logarithmic complexity (iterative implementation)###
    def logarithmic(n)
      count = 0

      while n > 1
        n /= 2
        count += 1
      end

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Logarithmic%20complexity%20%28iterative%20implementation%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20/%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20logarithmic%20complexity%20%28iterative%20implementation%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Logarithmic%20complexity%20%28iterative%20implementation%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20/%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20logarithmic%20complexity%20%28iterative%20implementation%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

![Logarithmic time complexity](time_complexity.assets/time_complexity_logarithmic.png){ class="animation-figure" }

<p align="center"> Figure 2-12 &nbsp; Logarithmic time complexity </p>

Like exponential growth, logarithmic growth often occurs in recursion. The following code produces a recursion tree of height $\log_2 n$:

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
    /* Logarithmic complexity (recursive implementation) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Logarithmic complexity (recursive implementation)*/
    func logRecur(n int) int {
        if n <= 1 {
            return 0
        }
        return logRecur(n/2) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Logarithmic complexity (recursive implementation) */
    func logRecur(n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        return logRecur(n: n / 2) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Logarithmic complexity (recursive implementation) */
    function logRecur(n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Logarithmic complexity (recursive implementation) */
    function logRecur(n: number): number {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Logarithmic complexity (recursive implementation) */
    int logRecur(int n) {
      if (n <= 1) return 0;
      return logRecur(n ~/ 2) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Logarithmic complexity (recursive implementation) */
    fn log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 0;
        }
        log_recur(n / 2) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Logarithmic complexity (recursive implementation) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Logarithmic complexity (recursive implementation) */
    fun logRecur(n: Int): Int {
        if (n <= 1)
            return 0
        return logRecur(n / 2) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Logarithmic complexity (recursive implementation)###
    def log_recur(n)
      return 0 unless n > 1
      log_recur(n / 2) + 1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Logarithmic%20complexity%20%28recursive%20implementation%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20/%202%29%20%2B%201%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20logarithmic%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Logarithmic%20complexity%20%28recursive%20implementation%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20/%202%29%20%2B%201%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20logarithmic%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Logarithmic time often arises in divide-and-conquer algorithms, reflecting the idea of dividing a problem into smaller, simpler parts. It grows slowly and is highly desirable, second only to constant time among these classes.

!!! tip "What is the base of $O(\log n)$?"

    More precisely, reducing the size by a factor of $m$ gives $O(\log_m n)$. The change-of-base formula shows that different fixed bases yield the same complexity:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    Thus, changing the base $m$ does not affect the complexity. We usually omit $m$ and simply write $O(\log n)$.

### 6. &nbsp; Linearithmic time $O(n \log n)$ {data-toc-label="6. &nbsp; Linearithmic time"}

Linearithmic time often appears when one level of a nested process takes $O(\log n)$ and another takes $O(n)$. An example follows:

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: int) -> int:
        """Linearithmic complexity"""
        if n <= 1:
            return 1
        # Split into two subproblems, each half the original size
        count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        # The current subproblem includes n operations
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    /* Linearithmic complexity */
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
    ### Linearithmic complexity ###
    def linear_log_recur(n)
      return 1 unless n > 1

      count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
      (0...n).each { count += 1 }

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Linearithmic%20complexity%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20//%202%29%20%2B%20linear_log_recur%28n%20//%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20linearithmic%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Linearithmic%20complexity%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20//%202%29%20%2B%20linear_log_recur%28n%20//%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20linearithmic%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 2-13 shows how linearithmic growth arises. Each level of the binary tree performs $n$ operations, and there are $\log_2 n + 1$ levels, giving $O(n \log n)$ time.

![Linearithmic time complexity](time_complexity.assets/time_complexity_logarithmic_linear.png){ class="animation-figure" }

<p align="center"> Figure 2-13 &nbsp; Linearithmic time complexity </p>

Common sorting algorithms, including quick sort, merge sort, and heap sort, typically take $O(n \log n)$ time.

### 7. &nbsp; Factorial time $O(n!)$ {data-toc-label="7. &nbsp; Factorial time"}

Factorial growth arises when generating every permutation of $n$ distinct elements. The number of permutations is:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Algorithms with factorial time complexity are usually implemented recursively. As the figure and code below show, each call creates $n$ branches at the first level, $n - 1$ at the second, and so on until level $n$:

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """Factorial complexity (recursive implementation)"""
        if n == 0:
            return 1
        count = 0
        # Split one problem into n subproblems
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
        // Split one problem into n subproblems
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
        // Split one problem into n subproblems
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Factorial complexity (recursive implementation) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Split one problem into n subproblems
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Factorial complexity (recursive implementation) */
    func factorialRecur(n int) int {
        if n == 0 {
            return 1
        }
        count := 0
        // Split one problem into n subproblems
        for i := 0; i < n; i++ {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Factorial complexity (recursive implementation) */
    func factorialRecur(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var count = 0
        // Split one problem into n subproblems
        for _ in 0 ..< n {
            count += factorialRecur(n: n - 1)
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Factorial complexity (recursive implementation) */
    function factorialRecur(n) {
        if (n === 0) return 1;
        let count = 0;
        // Split one problem into n subproblems
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Factorial complexity (recursive implementation) */
    function factorialRecur(n: number): number {
        if (n === 0) return 1;
        let count = 0;
        // Split one problem into n subproblems
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Factorial complexity (recursive implementation) */
    int factorialRecur(int n) {
      if (n == 0) return 1;
      int count = 0;
      // Split one problem into n subproblems
      for (var i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Factorial complexity (recursive implementation) */
    fn factorial_recur(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let mut count = 0;
        // Split one problem into n subproblems
        for _ in 0..n {
            count += factorial_recur(n - 1);
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Factorial complexity (recursive implementation) */
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
    /* Factorial complexity (recursive implementation) */
    fun factorialRecur(n: Int): Int {
        if (n == 0)
            return 1
        var count = 0
        // Split one problem into n subproblems
        for (i in 0..<n) {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Factorial complexity (recursive implementation)###
    def factorial_recur(n)
      return 1 if n == 0

      count = 0
      # Split one problem into n subproblems
      (0...n).each { count += factorial_recur(n - 1) }

      count
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Factorial%20complexity%20%28recursive%20implementation%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Split%20one%20problem%20into%20n%20subproblems%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20factorial%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Factorial%20complexity%20%28recursive%20implementation%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20Split%20one%20problem%20into%20n%20subproblems%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22Input%20size%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22Operation%20count%20for%20factorial%20complexity%20%28recursive%20implementation%29%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

![Factorial time complexity](time_complexity.assets/time_complexity_factorial.png){ class="animation-figure" }

<p align="center"> Figure 2-14 &nbsp; Factorial time complexity </p>

Since $n! > 2^n$ whenever $n \geq 4$, factorial growth is faster than exponential growth and is also unacceptable for large $n$.

## 2.3.5 &nbsp; Worst-case, best-case, and average-case time complexity

**An algorithm's efficiency often depends on how its input data is arranged**. Suppose `nums` is an array of length $n$ containing every integer from $1$ through $n$ exactly once in a random order. The task is to return the index of $1$. We can conclude the following.

- If `nums = [?, ?, ..., 1]`, with $1$ last, we must traverse the whole array, **giving worst-case time complexity $O(n)$**.
- If `nums = [1, ?, ?, ...]`, with $1$ first, no further traversal is needed regardless of array length, **giving best-case time complexity $\Omega(1)$**.

Worst-case time complexity corresponds to an asymptotic upper bound, expressed with big-$O$ notation. Best-case time complexity corresponds to an asymptotic lower bound, expressed with $\Omega$:

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """Generate an array containing 1, 2, ..., n in shuffled order"""
        # Generate the array nums = 1, 2, 3, ..., n
        nums = [i for i in range(1, n + 1)]
        # Randomly shuffle the array elements
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """Find the index of the number 1 in array nums"""
        for i in range(len(nums)):
            # When 1 is at the start of the array, the best-case time complexity is O(1)
            # When 1 is at the end of the array, the worst-case time complexity is O(n)
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Use the system time to generate a random seed
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // Randomly shuffle the array elements
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* Find the index of the number 1 in array nums */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle the array elements
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Find the index of the number 1 in array nums */
    int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Randomly shuffle the array elements
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Find the index of the number 1 in array nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    func randomNumbers(n int) []int {
        nums := make([]int, n)
        // Generate the array nums = { 1, 2, 3, ..., n }
        for i := 0; i < n; i++ {
            nums[i] = i + 1
        }
        // Randomly shuffle the array elements
        rand.Shuffle(len(nums), func(i, j int) {
            nums[i], nums[j] = nums[j], nums[i]
        })
        return nums
    }

    /* Find the index of the number 1 in array nums */
    func findOne(nums []int) int {
        for i := 0; i < len(nums); i++ {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    func randomNumbers(n: Int) -> [Int] {
        // Generate the array nums = { 1, 2, 3, ..., n }
        var nums = Array(1 ... n)
        // Randomly shuffle the array elements
        nums.shuffle()
        return nums
    }

    /* Find the index of the number 1 in array nums */
    func findOne(nums: [Int]) -> Int {
        for i in nums.indices {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    function randomNumbers(n) {
        const nums = Array(n);
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle the array elements
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* Find the index of the number 1 in array nums */
    function findOne(nums) {
        for (let i = 0; i < nums.length; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    function randomNumbers(n: number): number[] {
        const nums = Array(n);
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle the array elements
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* Find the index of the number 1 in array nums */
    function findOne(nums: number[]): number {
        for (let i = 0; i < nums.length; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    List<int> randomNumbers(int n) {
      final nums = List.filled(n, 0);
      // Generate the array nums = { 1, 2, 3, ..., n }
      for (var i = 0; i < n; i++) {
        nums[i] = i + 1;
      }
      // Randomly shuffle the array elements
      nums.shuffle();

      return nums;
    }

    /* Find the index of the number 1 in array nums */
    int findOne(List<int> nums) {
      for (var i = 0; i < nums.length; i++) {
        // When 1 is at the start of the array, the best-case time complexity is O(1)
        // When 1 is at the end of the array, the worst-case time complexity is O(n)
        if (nums[i] == 1) return i;
      }

      return -1;
    }
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    fn random_numbers(n: i32) -> Vec<i32> {
        // Generate the array nums = { 1, 2, 3, ..., n }
        let mut nums = (1..=n).collect::<Vec<i32>>();
        // Randomly shuffle the array elements
        nums.shuffle(&mut thread_rng());
        nums
    }

    /* Find the index of the number 1 in array nums */
    fn find_one(nums: &[i32]) -> Option<usize> {
        for i in 0..nums.len() {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if nums[i] == 1 {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    int *randomNumbers(int n) {
        // Allocate heap memory for a one-dimensional array of n int elements
        int *nums = (int *)malloc(n * sizeof(int));
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle the array elements
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        return nums;
    }

    /* Find the index of the number 1 in array nums */
    int findOne(int *nums, int n) {
        for (int i = 0; i < n; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="worst_best_time_complexity.kt"
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    fun randomNumbers(n: Int): Array<Int?> {
        val nums = IntArray(n)
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (i in 0..<n) {
            nums[i] = i + 1
        }
        // Randomly shuffle the array elements
        nums.shuffle()
        val res = arrayOfNulls<Int>(n)
        for (i in 0..<n) {
            res[i] = nums[i]
        }
        return res
    }

    /* Find the index of the number 1 in array nums */
    fun findOne(nums: Array<Int?>): Int {
        for (i in nums.indices) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="worst_best_time_complexity.rb"
    ### Generate an array containing 1, 2, ..., n in shuffled order ###
    def random_numbers(n)
      # Generate the array nums = 1, 2, 3, ..., n
      nums = Array.new(n) { |i| i + 1 }
      # Randomly shuffle the array elements
      nums.shuffle!
    end

    ### Find the index of the number 1 in array nums ###
    def find_one(nums)
      for i in 0...nums.length
        # When 1 is at the start of the array, the best-case time complexity is O(1)
        # When 1 is at the end of the array, the worst-case time complexity is O(n)
        return i if nums[i] == 1
      end

      -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22Generate%20an%20array%20containing%201,%202,%20...,%20n%20in%20shuffled%20order%22%22%22%0A%20%20%20%20%23%20Generate%20the%20array%20nums%20%3D%201,%202,%203,%20...,%20n%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281,%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20Randomly%20shuffle%20the%20array%20elements%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20the%20index%20of%20the%20number%201%20in%20array%20nums%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20When%201%20is%20at%20the%20start%20of%20the%20array,%20the%20best-case%20time%20complexity%20is%20O%281%29%0A%20%20%20%20%20%20%20%20%23%20When%201%20is%20at%20the%20end%20of%20the%20array,%20the%20worst-case%20time%20complexity%20is%20O%28n%29%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5CnArray%20%5B%201,%202,%20...,%20n%20%5D%20after%20shuffling%20%3D%22,%20nums%29%0A%20%20%20%20print%28%22The%20index%20of%20the%20number%201%20is%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22Generate%20an%20array%20containing%201,%202,%20...,%20n%20in%20shuffled%20order%22%22%22%0A%20%20%20%20%23%20Generate%20the%20array%20nums%20%3D%201,%202,%203,%20...,%20n%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281,%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20Randomly%20shuffle%20the%20array%20elements%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20the%20index%20of%20the%20number%201%20in%20array%20nums%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20When%201%20is%20at%20the%20start%20of%20the%20array,%20the%20best-case%20time%20complexity%20is%20O%281%29%0A%20%20%20%20%20%20%20%20%23%20When%201%20is%20at%20the%20end%20of%20the%20array,%20the%20worst-case%20time%20complexity%20is%20O%28n%29%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5CnArray%20%5B%201,%202,%20...,%20n%20%5D%20after%20shuffling%20%3D%22,%20nums%29%0A%20%20%20%20print%28%22The%20index%20of%20the%20number%201%20is%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Best-case complexity is rarely used in practice because it may occur only with low probability and can be misleading. **Worst-case complexity is more useful because it gives a safe performance bound**, allowing us to use the algorithm with confidence.

In this example, both the worst and best cases occur only for particular arrangements, perhaps with low probability, and may not reflect ordinary performance. **Average-case complexity describes performance on random inputs** and is expressed with $\Theta$.

For some algorithms, the average case is easy to derive. In the example above, $1$ is equally likely to occur at any index in the shuffled array. The average number of iterations is half the array length, $n / 2$, giving $\Theta(n / 2) = \Theta(n)$.

For more complex algorithms, average-case complexity can be difficult to calculate because the overall expectation under the input distribution is hard to derive. In such cases, we usually judge efficiency by worst-case complexity.

!!! question "Why is $\Theta$ rarely seen?"

    Perhaps because $O$ is so familiar, it is often used for average-case complexity too. Strictly speaking, this usage is not standard. In this book and other resources, read a statement such as "average-case time complexity $O(n)$" as $\Theta(n)$.
