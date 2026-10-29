---
comments: true
---

# 2.3 &nbsp; 時間計算量

実行時間は、アルゴリズムの効率を直感的かつ正確に表します。コードの実行時間を正確に見積もるには、どうすればよいでしょうか。

1. **実行環境を決めます**。ハードウェア構成、プログラミング言語、システム環境などは、いずれも実行効率に影響します。
2. **各計算操作にかかる時間を見積もります**。たとえば、加算 `+` は 1 ns、乗算 `*` は 10 ns、出力 `print()` は 5 ns などです。
3. **コード内のすべての計算操作を数え**、その実行時間を合計して、全体の実行時間を求めます。

たとえば、次のコードで入力の大きさを $n$ とします。

=== "Python"

    ```python title=""
    # ある実行環境において
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # n 回繰り返す
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // ある実行環境において
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回繰り返す
        for (int i = 0; i < n; i++) {  // 1 ns
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // ある実行環境において
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回繰り返す
        for (int i = 0; i < n; i++) {  // 1 ns
            System.out.println(0);     // 5 ns
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // ある実行環境において
    void Algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回繰り返す
        for (int i = 0; i < n; i++) {  // 1 ns
            Console.WriteLine(0);      // 5 ns
        }
    }
    ```

=== "Go"

    ```go title=""
    // ある実行環境において
    func algorithm(n int) {
        a := 2     // 1 ns
        a = a + 1  // 1 ns
        a = a * 2  // 10 ns
        // n 回繰り返す
        for i := 0; i < n; i++ {  // 1 ns
            fmt.Println(a)        // 5 ns
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // ある実行環境において
    func algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // n 回繰り返す
        for _ in 0 ..< n { // 1 ns
            print(0) // 5 ns
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // ある実行環境において
    function algorithm(n) {
        var a = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // n 回繰り返す
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // ある実行環境において
    function algorithm(n: number): void {
        var a: number = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // n 回繰り返す
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // ある実行環境において
    void algorithm(int n) {
      int a = 2; // 1 ns
      a = a + 1; // 1 ns
      a = a * 2; // 10 ns
      // n 回繰り返す
      for (int i = 0; i < n; i++) { // 1 ns
        print(0); // 5 ns
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // ある実行環境において
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 ns
        a = a + 1;          // 1 ns
        a = a * 2;          // 10 ns
        // n 回繰り返す
        for _ in 0..n {     // 1 ns
            println!("{}", 0);  // 5 ns
        }
    }
    ```

=== "C"

    ```c title=""
    // ある実行環境において
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回繰り返す
        for (int i = 0; i < n; i++) {   // 1 ns
            printf("%d", 0);            // 5 ns
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // ある実行環境において
    fun algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // n 回繰り返す
        for (i in 0..<n) {  // 1 ns
            println(0)      // 5 ns
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # ある実行環境において
    def algorithm(n)
        a = 2       # 1 ns
        a = a + 1   # 1 ns
        a = a * 2   # 10 ns
        # n 回繰り返す
        (0...n).each do # 1 ns
            puts 0      # 5 ns
        end
    end
    ```

この方法では、実行時間は $(6n + 12)$ ns になります。

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

しかし実際には、**このように実行時間を積み上げる方法は、適切でも現実的でもありません**。まず、アルゴリズムはさまざまな環境で動くため、見積もりを特定の環境に結び付けたくありません。また、各操作の実行時間を知るのは難しく、見積もり自体が非常に困難になります。

## 2.3.1 &nbsp; 時間の増え方を調べる

時間計算量の解析で調べるのは、実行時間そのものではなく、**データ量が増えるにつれて実行時間がどのように増えるかです**。

「時間の増え方」は抽象的なので、例で理解しましょう。入力の大きさを $n$ とし、三つのアルゴリズム `A`、`B`、`C` を考えます。

=== "Python"

    ```python title=""
    # アルゴリズム A の時間計算量：定数のオーダー
    def algorithm_A(n: int):
        print(0)
    # アルゴリズム B の時間計算量：線形のオーダー
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # アルゴリズム C の時間計算量：定数のオーダー
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

=== "C++"

    ```cpp title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    void algorithm_A(int n) {
        cout << 0 << endl;
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            cout << 0 << endl;
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            cout << 0 << endl;
        }
    }
    ```

=== "Java"

    ```java title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    void algorithm_A(int n) {
        System.out.println(0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println(0);
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            System.out.println(0);
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }
    ```

=== "Go"

    ```go title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    func algorithm_A(n int) {
        fmt.Println(0)
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    func algorithm_B(n int) {
        for i := 0; i < n; i++ {
            fmt.Println(0)
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    func algorithm_C(n int) {
        for i := 0; i < 1000000; i++ {
            fmt.Println(0)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    func algorithmA(n: Int) {
        print(0)
    }

    // アルゴリズム B の時間計算量：線形のオーダー
    func algorithmB(n: Int) {
        for _ in 0 ..< n {
            print(0)
        }
    }

    // アルゴリズム C の時間計算量：定数のオーダー
    func algorithmC(n: Int) {
        for _ in 0 ..< 1_000_000 {
            print(0)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    function algorithm_A(n) {
        console.log(0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    function algorithm_B(n) {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    function algorithm_C(n) {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }

    ```

=== "TS"

    ```typescript title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    function algorithm_A(n: number): void {
        console.log(0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    function algorithm_B(n: number): void {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    function algorithm_C(n: number): void {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    void algorithmA(int n) {
      print(0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    void algorithmB(int n) {
      for (int i = 0; i < n; i++) {
        print(0);
      }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    void algorithmC(int n) {
      for (int i = 0; i < 1000000; i++) {
        print(0);
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    fn algorithm_A(n: i32) {
        println!("{}", 0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    fn algorithm_B(n: i32) {
        for _ in 0..n {
            println!("{}", 0);
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    fn algorithm_C(n: i32) {
        for _ in 0..1000000 {
            println!("{}", 0);
        }
    }
    ```

=== "C"

    ```c title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    void algorithm_A(int n) {
        printf("%d", 0);
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            printf("%d", 0);
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            printf("%d", 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // アルゴリズム A の時間計算量：定数のオーダー
    fun algoritm_A(n: Int) {
        println(0)
    }
    // アルゴリズム B の時間計算量：線形のオーダー
    fun algorithm_B(n: Int) {
        for (i in 0..<n){
            println(0)
        }
    }
    // アルゴリズム C の時間計算量：定数のオーダー
    fun algorithm_C(n: Int) {
        for (i in 0..<1000000) {
            println(0)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # アルゴリズム A の時間計算量：定数のオーダー
    def algorithm_A(n)
        puts 0
    end

    # アルゴリズム B の時間計算量：線形のオーダー
    def algorithm_B(n)
        (0...n).each { puts 0 }
    end

    # アルゴリズム C の時間計算量：定数のオーダー
    def algorithm_C(n)
        (0...1_000_000).each { puts 0 }
    end
    ```

図 2-7 に、この三つのアルゴリズムの時間計算量を示します。

- `A` には出力操作が $1$ 回だけあり、$n$ が増えても実行時間は増えません。この時間計算量を「定数のオーダー」と呼びます。
- `B` は出力を $n$ 回繰り返し、$n$ の増加に対して実行時間が線形に増えます。この時間計算量を「線形のオーダー」と呼びます。
- `C` は出力を $1000000$ 回繰り返します。実行時間は長いものの、入力の大きさ $n$ とは無関係です。そのため、`C` の時間計算量は `A` と同じ「定数のオーダー」です。

![アルゴリズム A、B、C の実行時間の増え方](time_complexity.assets/time_complexity_simple_example.png){ class="animation-figure" }

<p align="center"> 図 2-7 &nbsp; アルゴリズム A、B、C の実行時間の増え方 </p>

実行時間を直接数える方法と比べ、時間計算量の解析にはどのような特徴があるでしょうか。

- **効率を有効に評価できます**。たとえば `B` は線形に時間が増え、$n > 1$ では `A` より、$n > 1000000$ では `C` より遅くなります。入力の大きさ $n$ が十分に大きければ、定数のオーダーのアルゴリズムは線形のオーダーより必ず有利になります。これが時間の増え方という意味です。
- **見積もり方が簡単です**。実行環境や計算操作の種類は、実行時間の増え方には関係しません。そのため、各操作の時間を同じ「単位時間」とみなし、「操作にかかる時間の集計」を「操作回数の集計」に置き換えられ、見積もりが大幅に簡単になります。
- **一定の限界もあります**。`A` と `C` は同じ時間計算量でも、実際の時間は大きく異なります。また、`B` は `C` より計算量が大きくても、入力の大きさ $n$ が小さければ、明らかに `C` より速くなります。このような場合、計算量だけでは効率を判断しにくくなります。それでも計算量の解析は、効率を評価する最も有効で一般的な方法です。

## 2.3.2 &nbsp; 関数の漸近上界

入力の大きさが $n$ の関数を考えます。

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # n 回繰り返す
        for i in range(n):  # +1
            print(0)        # +1
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // n 回繰り返す
        for (int i = 0; i < n; i++) { // +1（毎回 i ++ を実行）
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
        // n 回繰り返す
        for (int i = 0; i < n; i++) { // +1（毎回 i ++ を実行）
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
        // n 回繰り返す
        for (int i = 0; i < n; i++) {   // +1（毎回 i ++ を実行）
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
        // n 回繰り返す
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
        // n 回繰り返す
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
        // n 回繰り返す
        for(let i = 0; i < n; i++){ // +1（毎回 i ++ を実行）
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
        // n 回繰り返す
        for(let i = 0; i < n; i++){ // +1（毎回 i ++ を実行）
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
      // n 回繰り返す
      for (int i = 0; i < n; i++) { // +1（毎回 i ++ を実行）
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

        // n 回繰り返す
        for _ in 0..n { // +1（毎回 i ++ を実行）
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
        // n 回繰り返す
        for (int i = 0; i < n; i++) {   // +1（毎回 i ++ を実行）
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
        // n 回繰り返す
        for (i in 0..<n) { // +1（毎回 i ++ を実行）
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
        # n 回繰り返す
        (0...n).each do # +1
            puts 0      # +1
        end
    end
    ```

操作回数を入力の大きさ $n$ の関数 $T(n)$ とすると、上の関数では次のようになります。

$$
T(n) = 3 + 2n
$$

$T(n)$ は一次関数なので、実行時間は線形に増え、時間計算量は線形のオーダーです。

線形の時間計算量を $O(n)$ と書きます。この数学記号を<u>ビッグ $O$ 記法（big-$O$ notation）</u>といい、関数 $T(n)$ の<u>漸近上界（asymptotic upper bound）</u>を表します。

時間計算量の解析は、本質的には「操作回数 $T(n)$」の漸近上界を求めることで、明確な数学的定義があります。

!!! note "関数の漸近上界"

    正の実数 $c$ と実数 $n_0$ が存在し、すべての $n > n_0$ に対して $T(n) \leq c \cdot f(n)$ が成り立つとき、$f(n)$ は $T(n)$ の漸近上界を与えるといい、$T(n) = O(f(n))$ と書きます。

図 2-8 のように、漸近上界を求めるとは、$n$ が無限大に近づくとき、$T(n)$ と $f(n)$ が同じ増加のオーダーとなり、定数係数 $c$ だけ異なるような関数 $f(n)$ を探すことです。

![関数の漸近上界](time_complexity.assets/asymptotic_upper_bound.png){ class="animation-figure" }

<p align="center"> 図 2-8 &nbsp; 関数の漸近上界 </p>

## 2.3.3 &nbsp; 見積もり方

漸近上界は数学的なので、完全に理解できなくても心配はいりません。まず見積もり方を身に付け、実践しながら数学的な意味を理解していきましょう。

定義によれば、$f(n)$ が決まれば時間計算量 $O(f(n))$ が得られます。では、漸近上界 $f(n)$ はどう決めるのでしょうか。大きく二つの手順、操作回数の集計と漸近上界の判定で行います。

### 1. &nbsp; 手順 1：操作回数を数える

コードを上から下へ、行ごとに数えれば求められます。ただし、$c \cdot f(n)$ の定数係数 $c$ は任意の大きさにできるため、**操作回数 $T(n)$ の係数や定数項は無視できます**。この原則から、数え方を簡単にする次の工夫が得られます。

1. **$T(n)$ の定数を無視します**。定数は $n$ と無関係なので、時間計算量に影響しません。
2. **すべての係数を省略します**。たとえば $2n$ 回や $5n + 1$ 回のループは、$n$ 回と簡略化できます。$n$ の前の係数は時間計算量に影響しないためです。
3. **入れ子のループでは掛け算を使います**。総操作回数は、外側と内側の操作回数の積です。各ループには、それぞれ手順 `1.` と `2.` の工夫を適用できます。

これらの工夫を使って、次の関数の操作回数を数えます。

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0（工夫 1）
        a = a + n  # +0（工夫 1）
        # +n（工夫 2）
        for i in range(5 * n + 1):
            print(0)
        # +n*n（工夫 3）
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0（工夫 1）
        a = a + n;  // +0（工夫 1）
        // +n（工夫 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n（工夫 3）
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
        int a = 1;  // +0（工夫 1）
        a = a + n;  // +0（工夫 1）
        // +n（工夫 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n（工夫 3）
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
        int a = 1;  // +0（工夫 1）
        a = a + n;  // +0（工夫 1）
        // +n（工夫 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n（工夫 3）
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
        a := 1     // +0（工夫 1）
        a = a + n  // +0（工夫 1）
        // +n（工夫 2）
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n（工夫 3）
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
        var a = 1 // +0（工夫 1）
        a = a + n // +0（工夫 1）
        // +n（工夫 2）
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n（工夫 3）
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
        let a = 1;  // +0（工夫 1）
        a = a + n;  // +0（工夫 1）
        // +n（工夫 2）
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n（工夫 3）
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
        let a = 1;  // +0（工夫 1）
        a = a + n;  // +0（工夫 1）
        // +n（工夫 2）
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n（工夫 3）
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
      int a = 1; // +0（工夫 1）
      a = a + n; // +0（工夫 1）
      // +n（工夫 2）
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n（工夫 3）
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
        let mut a = 1;     // +0（工夫 1）
        a = a + n;        // +0（工夫 1）

        // +n（工夫 2）
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n（工夫 3）
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
        int a = 1;  // +0（工夫 1）
        a = a + n;  // +0（工夫 1）
        // +n（工夫 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n（工夫 3）
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
        var a = 1   // +0（工夫 1）
        a = a + n   // +0（工夫 1）
        // +n（工夫 2）
        for (i in 0..<5 * n + 1) {
            println(0)
        }
        // +n*n（工夫 3）
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
        a = 1       # +0（工夫 1）
        a = a + n   # +0（工夫 1）
        # +n（工夫 2）
        (0...(5 * n + 1)).each do { puts 0 }
        # +n*n（工夫 3）
        (0...(2 * n)).each do
            (0...(n + 1)).each do { puts 0 }
        end
    end
    ```

次の式は、工夫を使う前と後の集計結果です。どちらからも、時間計算量 $O(n^2)$ が得られます。

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{すべて数える (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{手間を省いて数える (o.O)}
\end{aligned}
$$

### 2. &nbsp; 手順 2：漸近上界を求める

**時間計算量は、$T(n)$ の最も高い次数の項で決まります**。$n$ が無限大に近づくと、その項が支配的になり、ほかの項の影響を無視できるためです。

表 2-2 にいくつかの例を示します。一部の大きな値は、「係数はオーダーを変えられない」ことを強調するためです。$n$ が無限大に近づくと、これらの定数は重要でなくなります。

<p align="center"> 表 2-2 &nbsp; 操作回数と時間計算量の対応 </p>

<div class="center-table" markdown>

| 操作回数 $T(n)$        | 時間計算量 $O(f(n))$ |
| ---------------------- | -------------------- |
| $100000$               | $O(1)$               |
| $3n + 2$               | $O(n)$               |
| $2n^2 + 3n + 2$        | $O(n^2)$             |
| $n^3 + 10000n^2$       | $O(n^3)$             |
| $2^n + 10000n^{10000}$ | $O(2^n)$             |

</div>

## 2.3.4 &nbsp; 代表的な種類

入力の大きさを $n$ とすると、代表的な時間計算量は図 2-9 のとおりです。小さい順に並べています。

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
& \text{定数} < \text{対数} < \text{線形} < \text{線形対数} < \text{二乗} < \text{指数} < \text{階乗}
\end{aligned}
$$

![代表的な時間計算量](time_complexity.assets/time_complexity_common_types.png){ class="animation-figure" }

<p align="center"> 図 2-9 &nbsp; 代表的な時間計算量 </p>

### 1. &nbsp; 定数のオーダー $O(1)$ {data-toc-label="1. &nbsp; 定数のオーダー"}

定数のオーダーでは、操作回数は入力の大きさ $n$ に依存せず、$n$ が変わっても変化しません。

次の関数では、操作回数 `size` が大きくても、入力の大きさ $n$ と無関係なので、時間計算量は $O(1)$ です。

=== "Python"

    ```python title="time_complexity.py"
    def constant(n: int) -> int:
        """定数オーダー"""
        count = 0
        size = 100000
        for _ in range(size):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    /* 定数オーダー */
    function constant(n) {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 定数オーダー */
    function constant(n: number): number {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    /* 定数オーダー */
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
    ### 定数オーダー ###
    def constant(n)
      count = 0
      size = 100000

      (0...size).each { count += 1 }

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; 線形のオーダー $O(n)$ {data-toc-label="2. &nbsp; 線形のオーダー"}

線形のオーダーでは、操作回数は入力の大きさ $n$ に対して線形に増えます。通常、1 重のループで現れます。

=== "Python"

    ```python title="time_complexity.py"
    def linear(n: int) -> int:
        """線形オーダー"""
        count = 0
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 線形オーダー */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 線形オーダー */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 線形オーダー */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 線形オーダー */
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
    /* 線形オーダー */
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
    /* 線形オーダー */
    function linear(n) {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 線形オーダー */
    function linear(n: number): number {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 線形オーダー */
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
    /* 線形オーダー */
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
    /* 線形オーダー */
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
    /* 線形オーダー */
    fun linear(n: Int): Int {
        var count = 0
        for (i in 0..<n)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 線形オーダー ###
    def linear(n)
      count = 0
      (0...n).each { count += 1 }
      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

配列や連結リストの走査も、時間計算量は $O(n)$ です。ここで $n$ は配列や連結リストの長さです。

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """線形オーダー（配列の走査）"""
        count = 0
        # ループの回数は配列の長さに比例する
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 線形オーダー（配列の走査） */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // ループの回数は配列の長さに比例する
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 線形オーダー（配列の走査） */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // ループの回数は配列の長さに比例する
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 線形オーダー（配列の走査） */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // ループの回数は配列の長さに比例する
        foreach (int num in nums) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 線形オーダー（配列の走査） */
    func arrayTraversal(nums []int) int {
        count := 0
        // ループの回数は配列の長さに比例する
        for range nums {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 線形オーダー（配列の走査） */
    func arrayTraversal(nums: [Int]) -> Int {
        var count = 0
        // ループの回数は配列の長さに比例する
        for _ in nums {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 線形オーダー（配列の走査） */
    function arrayTraversal(nums) {
        let count = 0;
        // ループの回数は配列の長さに比例する
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 線形オーダー（配列の走査） */
    function arrayTraversal(nums: number[]): number {
        let count = 0;
        // ループの回数は配列の長さに比例する
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 線形オーダー（配列の走査） */
    int arrayTraversal(List<int> nums) {
      int count = 0;
      // ループの回数は配列の長さに比例する
      for (var _num in nums) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 線形オーダー（配列の走査） */
    fn array_traversal(nums: &[i32]) -> i32 {
        let mut count = 0;
        // ループの回数は配列の長さに比例する
        for _ in nums {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 線形オーダー（配列の走査） */
    int arrayTraversal(int *nums, int n) {
        int count = 0;
        // ループの回数は配列の長さに比例する
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 線形オーダー（配列の走査） */
    fun arrayTraversal(nums: IntArray): Int {
        var count = 0
        // ループの回数は配列の長さに比例する
        for (num in nums) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 線形オーダー（配列の走査）###
    def array_traversal(nums)
      count = 0

      # ループの回数は配列の長さに比例する
      for num in nums
        count += 1
      end

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E9%85%8D%E5%88%97%E3%81%AE%E8%B5%B0%E6%9F%BB%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E5%9B%9E%E6%95%B0%E3%81%AF%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%81%AB%E6%AF%94%E4%BE%8B%E3%81%99%E3%82%8B%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E9%85%8D%E5%88%97%E3%81%AE%E8%B5%B0%E6%9F%BB%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E9%85%8D%E5%88%97%E3%81%AE%E8%B5%B0%E6%9F%BB%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E5%9B%9E%E6%95%B0%E3%81%AF%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%81%AB%E6%AF%94%E4%BE%8B%E3%81%99%E3%82%8B%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E9%85%8D%E5%88%97%E3%81%AE%E8%B5%B0%E6%9F%BB%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

**入力の大きさ $n$ が何を表すかは、入力の種類に応じて決める必要があります**。最初の例では変数 $n$ 自体が入力の大きさで、2 番目の例では配列の長さ $n$ が入力の大きさです。

### 3. &nbsp; 二乗のオーダー $O(n^2)$ {data-toc-label="3. &nbsp; 二乗のオーダー"}

二乗のオーダーでは、操作回数は入力の大きさ $n$ の二乗に比例して増えます。入れ子のループでよく現れ、外側と内側がそれぞれ $O(n)$ なら、全体は $O(n^2)$ です。

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """二次オーダー"""
        count = 0
        # ループの回数はデータの大きさ n の二乗に比例する
        for i in range(n):
            for j in range(n):
                count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 二次オーダー */
    int quadratic(int n) {
        int count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    int quadratic(int n) {
        int count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    int Quadratic(int n) {
        int count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    func quadratic(n int) int {
        count := 0
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    func quadratic(n: Int) -> Int {
        var count = 0
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    function quadratic(n) {
        let count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    function quadratic(n: number): number {
        let count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    int quadratic(int n) {
      int count = 0;
      // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    fn quadratic(n: i32) -> i32 {
        let mut count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    int quadratic(int n) {
        int count = 0;
        // ループの回数はデータの大きさ n の二乗に比例する
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
    /* 二次オーダー */
    fun quadratic(n: Int): Int {
        var count = 0
        // ループの回数はデータの大きさ n の二乗に比例する
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
    ### 二次オーダー ###
    def quadratic(n)
      count = 0

      # ループの回数はデータの大きさ n の二乗に比例する
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E5%9B%9E%E6%95%B0%E3%81%AF%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%E3%81%AE%E4%BA%8C%E4%B9%97%E3%81%AB%E6%AF%94%E4%BE%8B%E3%81%99%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E5%9B%9E%E6%95%B0%E3%81%AF%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%E3%81%AE%E4%BA%8C%E4%B9%97%E3%81%AB%E6%AF%94%E4%BE%8B%E3%81%99%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-10 で、定数、線形、二乗の三つの時間計算量を比較します。

![定数、線形、二乗の時間計算量](time_complexity.assets/time_complexity_constant_linear_quadratic.png){ class="animation-figure" }

<p align="center"> 図 2-10 &nbsp; 定数、線形、二乗の時間計算量 </p>

バブルソートでは、外側のループが $n - 1$ 回、内側が $n-1$、$n-2$、$\dots$、$2$、$1$ 回、平均 $n / 2$ 回実行されます。したがって、時間計算量は $O((n - 1) n / 2) = O(n^2)$ です。

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """二次オーダー（バブルソート）"""
        count = 0  # カウンタ
        # 外側のループ：未ソート区間は [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # nums[j] と nums[j + 1] を交換する
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # 要素の交換は 3 回の単位操作からなる
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 二次オーダー（バブルソート） */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 二次オーダー（バブルソート） */
    int bubbleSort(int[] nums) {
        int count = 0; // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 二次オーダー（バブルソート） */
    int BubbleSort(int[] nums) {
        int count = 0;  // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 二次オーダー（バブルソート） */
    func bubbleSort(nums []int) int {
        count := 0 // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // nums[j] と nums[j + 1] を交換する
                    tmp := nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                    count += 3 // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 二次オーダー（バブルソート） */
    func bubbleSort(nums: inout [Int]) -> Int {
        var count = 0 // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // nums[j] と nums[j + 1] を交換する
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3 // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 二次オーダー（バブルソート） */
    function bubbleSort(nums) {
        let count = 0; // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 二次オーダー（バブルソート） */
    function bubbleSort(nums: number[]): number {
        let count = 0; // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 二次オーダー（バブルソート） */
    int bubbleSort(List<int> nums) {
      int count = 0; // カウンタ
      // 外側のループ：未ソート区間は [0, i]
      for (var i = nums.length - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (var j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // nums[j] と nums[j + 1] を交換する
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            count += 3; // 要素の交換は 3 回の単位操作からなる
          }
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 二次オーダー（バブルソート） */
    fn bubble_sort(nums: &mut [i32]) -> i32 {
        let mut count = 0; // カウンタ

        // 外側のループ：未ソート区間は [0, i]
        for i in (1..nums.len()).rev() {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // nums[j] と nums[j + 1] を交換する
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 二次オーダー（バブルソート） */
    int bubbleSort(int *nums, int n) {
        int count = 0; // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (int i = n - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 二次オーダー（バブルソート） */
    fun bubbleSort(nums: IntArray): Int {
        var count = 0 // カウンタ
        // 外側のループ：未ソート区間は [0, i]
        for (i in nums.size - 1 downTo 1) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    count += 3 // 要素の交換は 3 回の単位操作からなる
                }
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 二次オーダー（バブルソート）###
    def bubble_sort(nums)
      count = 0  # カウンタ

      # 外側のループ：未ソート区間は [0, i]
      for i in (nums.length - 1).downto(0)
        # 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for j in 0...i
          if nums[j] > nums[j + 1]
            # nums[j] と nums[j + 1] を交換する
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # 要素の交換は 3 回の単位操作からなる
          end
        end
      end

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20%E3%82%AB%E3%82%A6%E3%83%B3%E3%82%BF%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%20%5B0,%20i%5D%20%E3%81%AE%E6%9C%80%E5%A4%A7%E8%A6%81%E7%B4%A0%E3%82%92%E5%8C%BA%E9%96%93%E3%81%AE%E5%8F%B3%E7%AB%AF%E3%81%AB%E7%A7%BB%E3%81%99%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20nums%5Bj%5D%20%E3%81%A8%20nums%5Bj%20%2B%201%5D%20%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AE%E4%BA%A4%E6%8F%9B%E3%81%AF%203%20%E5%9B%9E%E3%81%AE%E5%8D%98%E4%BD%8D%E6%93%8D%E4%BD%9C%E3%81%8B%E3%82%89%E3%81%AA%E3%82%8B%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n,%200,%20-1%29%5D%20%20%23%20%5Bn,%20n-1,%20...,%202,%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20%E3%82%AB%E3%82%A6%E3%83%B3%E3%82%BF%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%20%5B0,%20i%5D%20%E3%81%AE%E6%9C%80%E5%A4%A7%E8%A6%81%E7%B4%A0%E3%82%92%E5%8C%BA%E9%96%93%E3%81%AE%E5%8F%B3%E7%AB%AF%E3%81%AB%E7%A7%BB%E3%81%99%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20nums%5Bj%5D%20%E3%81%A8%20nums%5Bj%20%2B%201%5D%20%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AE%E4%BA%A4%E6%8F%9B%E3%81%AF%203%20%E5%9B%9E%E3%81%AE%E5%8D%98%E4%BD%8D%E6%93%8D%E4%BD%9C%E3%81%8B%E3%82%89%E3%81%AA%E3%82%8B%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n,%200,%20-1%29%5D%20%20%23%20%5Bn,%20n-1,%20...,%202,%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 4. &nbsp; 指数のオーダー $O(2^n)$ {data-toc-label="4. &nbsp; 指数のオーダー"}

生物の「細胞分裂」は、指数的な増加の典型例です。最初に $1$ 個の細胞があり、1 回分裂すると $2$ 個、2 回では $4$ 個となり、$n$ 回後には $2^n$ 個になります。

図 2-11 と次のコードは細胞分裂を模擬しており、時間計算量は $O(2^n)$ です。入力 $n$ は分裂するラウンド数、戻り値 `count` は分裂の総回数を表します。

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """指数オーダー（ループによる実装）"""
        count = 0
        base = 1
        # 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 指数オーダー（ループによる実装） */
    int exponential(int n) {
        int count = 0, base = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    int exponential(int n) {
        int count = 0, base = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装）*/
    func exponential(n int) int {
        count, base := 0, 1
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    func exponential(n: Int) -> Int {
        var count = 0
        var base = 1
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    function exponential(n) {
        let count = 0,
            base = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    function exponential(n: number): number {
        let count = 0,
            base = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    int exponential(int n) {
      int count = 0, base = 1;
      // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    fn exponential(n: i32) -> i32 {
        let mut count = 0;
        let mut base = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    int exponential(int n) {
        int count = 0;
        int bas = 1;
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    /* 指数オーダー（ループによる実装） */
    fun exponential(n: Int): Int {
        var count = 0
        var base = 1
        // 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
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
    ### 指数オーダー（ループによる実装）###
    def exponential(n)
      count, base = 0, 1

      # 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20%E5%90%84%E5%9B%9E%E3%81%A7%E7%B4%B0%E8%83%9E%E3%81%8C%202%20%E3%81%A4%E3%81%AB%E5%88%86%E8%A3%82%E3%81%97%E3%80%81%E6%95%B0%E5%88%97%201,%202,%204,%208,%20...,%202%5E%28n-1%29%20%E3%82%92%E5%BD%A2%E6%88%90%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20%E5%90%84%E5%9B%9E%E3%81%A7%E7%B4%B0%E8%83%9E%E3%81%8C%202%20%E3%81%A4%E3%81%AB%E5%88%86%E8%A3%82%E3%81%97%E3%80%81%E6%95%B0%E5%88%97%201,%202,%204,%208,%20...,%202%5E%28n-1%29%20%E3%82%92%E5%BD%A2%E6%88%90%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![指数の時間計算量](time_complexity.assets/time_complexity_exponential.png){ class="animation-figure" }

<p align="center"> 図 2-11 &nbsp; 指数の時間計算量 </p>

実際のアルゴリズムでは、指数のオーダーは再帰関数によく現れます。次のコードは、再帰的に二つに分かれ、$n$ 回分岐したら止まります。

=== "Python"

    ```python title="time_complexity.py"
    def exp_recur(n: int) -> int:
        """指数オーダー（再帰による実装）"""
        if n == 1:
            return 1
        return exp_recur(n - 1) + exp_recur(n - 1) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 指数オーダー（再帰による実装） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 指数オーダー（再帰による実装） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 指数オーダー（再帰による実装） */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 指数オーダー（再帰による実装）*/
    func expRecur(n int) int {
        if n == 1 {
            return 1
        }
        return expRecur(n-1) + expRecur(n-1) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 指数オーダー（再帰による実装） */
    func expRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 指数オーダー（再帰による実装） */
    function expRecur(n) {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 指数オーダー（再帰による実装） */
    function expRecur(n: number): number {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 指数オーダー（再帰による実装） */
    int expRecur(int n) {
      if (n == 1) return 1;
      return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 指数オーダー（再帰による実装） */
    fn exp_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        exp_recur(n - 1) + exp_recur(n - 1) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 指数オーダー（再帰による実装） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 指数オーダー（再帰による実装） */
    fun expRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return expRecur(n - 1) + expRecur(n - 1) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 指数オーダー（再帰による実装）###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

指数のオーダーは非常に速く増え、全探索やバックトラッキングなどの総当たり法によく現れます。大規模な問題では許容できないため、通常は動的計画法や貪欲法などを使う必要があります。

### 5. &nbsp; 対数のオーダー $O(\log n)$ {data-toc-label="5. &nbsp; 対数のオーダー"}

指数とは逆に、対数のオーダーは「毎回半分に縮む」場合を表します。入力の大きさを $n$ とすると、毎回半分になるため、ループ回数は $\log_2 n$、すなわち $2^n$ の逆関数になります。

図 2-12 と次のコードは「毎回半分にする」過程を模擬しています。時間計算量は $O(\log_2 n)$、略して $O(\log n)$ です。

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: int) -> int:
        """対数オーダー（ループによる実装）"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装）*/
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    /* 対数オーダー（ループによる実装） */
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
    ### 対数オーダー（ループによる実装）###
    def logarithmic(n)
      count = 0

      while n > 1
        n /= 2
        count += 1
      end

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20/%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20/%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![対数の時間計算量](time_complexity.assets/time_complexity_logarithmic.png){ class="animation-figure" }

<p align="center"> 図 2-12 &nbsp; 対数の時間計算量 </p>

指数と同様、対数のオーダーも再帰関数によく現れます。次のコードは、高さ $\log_2 n$ の再帰木を作ります。

=== "Python"

    ```python title="time_complexity.py"
    def log_recur(n: int) -> int:
        """対数オーダー（再帰による実装）"""
        if n <= 1:
            return 0
        return log_recur(n / 2) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 対数オーダー（再帰による実装） */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 対数オーダー（再帰による実装） */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 対数オーダー（再帰による実装） */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 対数オーダー（再帰による実装）*/
    func logRecur(n int) int {
        if n <= 1 {
            return 0
        }
        return logRecur(n/2) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 対数オーダー（再帰による実装） */
    func logRecur(n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        return logRecur(n: n / 2) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 対数オーダー（再帰による実装） */
    function logRecur(n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 対数オーダー（再帰による実装） */
    function logRecur(n: number): number {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 対数オーダー（再帰による実装） */
    int logRecur(int n) {
      if (n <= 1) return 0;
      return logRecur(n ~/ 2) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 対数オーダー（再帰による実装） */
    fn log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 0;
        }
        log_recur(n / 2) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 対数オーダー（再帰による実装） */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 対数オーダー（再帰による実装） */
    fun logRecur(n: Int): Int {
        if (n <= 1)
            return 0
        return logRecur(n / 2) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 対数オーダー（再帰による実装）###
    def log_recur(n)
      return 0 unless n > 1
      log_recur(n / 2) + 1
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20/%202%29%20%2B%201%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20/%202%29%20%2B%201%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

対数のオーダーは、分割統治のアルゴリズムによく現れ、「一つを複数に分ける」「複雑なものを単純にする」という考え方を表します。増加が遅く、定数のオーダーに次いで理想的な時間計算量です。

!!! tip "$O(\log n)$ の底は何ですか？"

    厳密には、「$m$ 分の 1 にする」場合の時間計算量は $O(\log_m n)$ です。底の変換公式を使えば、異なる底でも同じ時間計算量になることがわかります。

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    つまり、底 $m$ は計算量を変えずに変換できます。そのため通常は底 $m$ を省き、対数のオーダーを $O(\log n)$ と書きます。

### 6. &nbsp; 線形対数のオーダー $O(n \log n)$ {data-toc-label="6. &nbsp; 線形対数のオーダー"}

線形対数のオーダーは、二つのループの時間計算量がそれぞれ $O(\log n)$ と $O(n)$ の入れ子の処理によく現れます。関連するコードを次に示します。

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: int) -> int:
        """線形対数オーダー"""
        if n <= 1:
            return 1
        # 2 つに分割し、部分問題の大きさを半分にする
        count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        # 現在の部分問題には n 回の操作が含まれる
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    /* 線形対数オーダー */
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
    ### 線形対数オーダー ###
    def linear_log_recur(n)
      return 1 unless n > 1

      count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
      (0...n).each { count += 1 }

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20//%202%29%20%2B%20linear_log_recur%28n%20//%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E5%BD%A2%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20//%202%29%20%2B%20linear_log_recur%28n%20//%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E5%BD%A2%E5%AF%BE%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-13 に、線形対数のオーダーが生じる仕組みを示します。二分木の各層の総操作回数は $n$ で、層数は $\log_2 n + 1$ なので、時間計算量は $O(n \log n)$ です。

![線形対数の時間計算量](time_complexity.assets/time_complexity_logarithmic_linear.png){ class="animation-figure" }

<p align="center"> 図 2-13 &nbsp; 線形対数の時間計算量 </p>

クイックソート、マージソート、ヒープソートなど、主要なソートの時間計算量は通常 $O(n \log n)$ です。

### 7. &nbsp; 階乗のオーダー $O(n!)$ {data-toc-label="7. &nbsp; 階乗のオーダー"}

階乗のオーダーは、数学の「順列列挙」問題に対応します。互いに異なる $n$ 個の要素のすべての並べ方を求めると、その数は次のようになります。

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

階乗のオーダーの処理は、通常、再帰で実装します。図 2-14 と次のコードでは、最初の層で $n$ 個、次の層で $n - 1$ 個に分岐し、これを第 $n$ 層まで続けます。

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """階乗オーダー（再帰による実装）"""
        if n == 0:
            return 1
        count = 0
        # 1 個から n 個に分裂する
        for _ in range(n):
            count += factorial_recur(n - 1)
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 階乗オーダー（再帰による実装） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 1 個から n 個に分裂する
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 階乗オーダー（再帰による実装） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 1 個から n 個に分裂する
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 階乗オーダー（再帰による実装） */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 1 個から n 個に分裂する
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 階乗オーダー（再帰による実装） */
    func factorialRecur(n int) int {
        if n == 0 {
            return 1
        }
        count := 0
        // 1 個から n 個に分裂する
        for i := 0; i < n; i++ {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 階乗オーダー（再帰による実装） */
    func factorialRecur(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var count = 0
        // 1 個から n 個に分裂する
        for _ in 0 ..< n {
            count += factorialRecur(n: n - 1)
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 階乗オーダー（再帰による実装） */
    function factorialRecur(n) {
        if (n === 0) return 1;
        let count = 0;
        // 1 個から n 個に分裂する
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 階乗オーダー（再帰による実装） */
    function factorialRecur(n: number): number {
        if (n === 0) return 1;
        let count = 0;
        // 1 個から n 個に分裂する
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 階乗オーダー（再帰による実装） */
    int factorialRecur(int n) {
      if (n == 0) return 1;
      int count = 0;
      // 1 個から n 個に分裂する
      for (var i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 階乗オーダー（再帰による実装） */
    fn factorial_recur(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let mut count = 0;
        // 1 個から n 個に分裂する
        for _ in 0..n {
            count += factorial_recur(n - 1);
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 階乗オーダー（再帰による実装） */
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
    /* 階乗オーダー（再帰による実装） */
    fun factorialRecur(n: Int): Int {
        if (n == 0)
            return 1
        var count = 0
        // 1 個から n 個に分裂する
        for (i in 0..<n) {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 階乗オーダー（再帰による実装）###
    def factorial_recur(n)
      return 1 if n == 0

      count = 0
      # 1 個から n 個に分裂する
      (0...n).each { count += factorial_recur(n - 1) }

      count
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E4%B9%97%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%201%20%E5%80%8B%E3%81%8B%E3%82%89%20n%20%E5%80%8B%E3%81%AB%E5%88%86%E8%A3%82%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22%E9%9A%8E%E4%B9%97%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E4%B9%97%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%201%20%E5%80%8B%E3%81%8B%E3%82%89%20n%20%E5%80%8B%E3%81%AB%E5%88%86%E8%A3%82%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22%E9%9A%8E%E4%B9%97%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%E3%81%AE%E6%93%8D%E4%BD%9C%E5%9B%9E%E6%95%B0%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![階乗の時間計算量](time_complexity.assets/time_complexity_factorial.png){ class="animation-figure" }

<p align="center"> 図 2-14 &nbsp; 階乗の時間計算量 </p>

$n \geq 4$ なら常に $n! > 2^n$ なので、階乗は指数より速く増えます。したがって、$n$ が大きい場合には、これも許容できません。

## 2.3.5 &nbsp; 最悪・最良・平均時間計算量

**アルゴリズムの時間効率は一定とは限らず、入力データの分布によって変わります**。長さ $n$ の配列 `nums` に、$1$ から $n$ の数が一つずつ、ランダムな順に入っているとします。要素 $1$ のインデックスを返す問題を考えると、次のことがわかります。

- `nums = [?, ?, ..., 1]`、つまり末尾が $1$ なら、配列全体を走査するため、**最悪時間計算量 $O(n)$ になります**。
- `nums = [1, ?, ?, ...]`、つまり先頭が $1$ なら、配列がどれほど長くても、それ以上走査する必要がなく、**最良時間計算量 $\Omega(1)$ になります**。

「最悪時間計算量」は関数の漸近上界に対応し、ビッグ $O$ 記法で表します。対応する「最良時間計算量」は漸近下界で、$\Omega$ 記法を使います。

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """要素が 1, 2, ..., n で、順序をシャッフルした配列を生成する"""
        # 配列 nums =: 1, 2, 3, ..., n を生成する
        nums = [i for i in range(1, n + 1)]
        # 配列の要素をランダムに並べ替える
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """配列 nums 内で数値 1 のインデックスを探索する"""
        for i in range(len(nums)):
            # 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            # 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // システム時刻を使って乱数のシードを生成する
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // 配列の要素をランダムに並べ替える
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 配列の要素をランダムに並べ替える
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 配列の要素をランダムに並べ替える
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    func randomNumbers(n int) []int {
        nums := make([]int, n)
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for i := 0; i < n; i++ {
            nums[i] = i + 1
        }
        // 配列の要素をランダムに並べ替える
        rand.Shuffle(len(nums), func(i, j int) {
            nums[i], nums[j] = nums[j], nums[i]
        })
        return nums
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    func findOne(nums []int) int {
        for i := 0; i < len(nums); i++ {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    func randomNumbers(n: Int) -> [Int] {
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        var nums = Array(1 ... n)
        // 配列の要素をランダムに並べ替える
        nums.shuffle()
        return nums
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    func findOne(nums: [Int]) -> Int {
        for i in nums.indices {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    function randomNumbers(n) {
        const nums = Array(n);
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 配列の要素をランダムに並べ替える
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    function findOne(nums) {
        for (let i = 0; i < nums.length; i++) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    function randomNumbers(n: number): number[] {
        const nums = Array(n);
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 配列の要素をランダムに並べ替える
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    function findOne(nums: number[]): number {
        for (let i = 0; i < nums.length; i++) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    List<int> randomNumbers(int n) {
      final nums = List.filled(n, 0);
      // 配列 nums = { 1, 2, 3, ..., n } を生成する
      for (var i = 0; i < n; i++) {
        nums[i] = i + 1;
      }
      // 配列の要素をランダムに並べ替える
      nums.shuffle();

      return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    int findOne(List<int> nums) {
      for (var i = 0; i < nums.length; i++) {
        // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
        if (nums[i] == 1) return i;
      }

      return -1;
    }
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    fn random_numbers(n: i32) -> Vec<i32> {
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        let mut nums = (1..=n).collect::<Vec<i32>>();
        // 配列の要素をランダムに並べ替える
        nums.shuffle(&mut thread_rng());
        nums
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    fn find_one(nums: &[i32]) -> Option<usize> {
        for i in 0..nums.len() {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if nums[i] == 1 {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    int *randomNumbers(int n) {
        // ヒープ領域を確保する（要素数 n 、要素型 int の一次元可変長配列を作成する）
        int *nums = (int *)malloc(n * sizeof(int));
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 配列の要素をランダムに並べ替える
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        return nums;
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    int findOne(int *nums, int n) {
        for (int i = 0; i < n; i++) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="worst_best_time_complexity.kt"
    /* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
    fun randomNumbers(n: Int): Array<Int?> {
        val nums = IntArray(n)
        // 配列 nums = { 1, 2, 3, ..., n } を生成する
        for (i in 0..<n) {
            nums[i] = i + 1
        }
        // 配列の要素をランダムに並べ替える
        nums.shuffle()
        val res = arrayOfNulls<Int>(n)
        for (i in 0..<n) {
            res[i] = nums[i]
        }
        return res
    }

    /* 配列 nums 内で数値 1 のインデックスを探索する */
    fun findOne(nums: Array<Int?>): Int {
        for (i in nums.indices) {
            // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
            if (nums[i] == 1)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="worst_best_time_complexity.rb"
    ### 要素が 1, 2, ..., n で、順序をシャッフルした配列を生成する ###
    def random_numbers(n)
      # 配列 nums =: 1, 2, 3, ..., n を生成する
      nums = Array.new(n) { |i| i + 1 }
      # 配列の要素をランダムに並べ替える
      nums.shuffle!
    end

    ### 配列 nums 内で数値 1 のインデックスを探索する ###
    def find_one(nums)
      for i in 0...nums.length
        # 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
        # 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
        return i if nums[i] == 1
      end

      -1
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%81%8C%201,%202,%20...,%20n%20%E3%81%A7%E3%80%81%E9%A0%86%E5%BA%8F%E3%82%92%E3%82%B7%E3%83%A3%E3%83%83%E3%83%95%E3%83%AB%E3%81%97%E3%81%9F%E9%85%8D%E5%88%97%E3%82%92%E7%94%9F%E6%88%90%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%20nums%20%3D%3A%201,%202,%203,%20...,%20n%20%E3%82%92%E7%94%9F%E6%88%90%E3%81%99%E3%82%8B%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281,%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%A9%E3%83%B3%E3%83%80%E3%83%A0%E3%81%AB%E4%B8%A6%E3%81%B9%E6%9B%BF%E3%81%88%E3%82%8B%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%85%8D%E5%88%97%20nums%20%E5%86%85%E3%81%A7%E6%95%B0%E5%80%A4%201%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%201%20%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%81%AB%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E6%9C%80%E8%89%AF%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%20O%281%29%20%E3%81%A8%E3%81%AA%E3%82%8B%0A%20%20%20%20%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%201%20%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%AB%E5%B0%BE%E3%81%AB%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E6%9C%80%E6%82%AA%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%20O%28n%29%20%E3%81%A8%E3%81%AA%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5Cn%E9%85%8D%E5%88%97%20%5B%201,%202,%20...,%20n%20%5D%20%E3%82%92%E3%82%B7%E3%83%A3%E3%83%83%E3%83%95%E3%83%AB%E3%81%97%E3%81%9F%E7%B5%90%E6%9E%9C%20%3D%22,%20nums%29%0A%20%20%20%20print%28%22%E6%95%B0%E5%80%A4%201%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%81%8C%201,%202,%20...,%20n%20%E3%81%A7%E3%80%81%E9%A0%86%E5%BA%8F%E3%82%92%E3%82%B7%E3%83%A3%E3%83%83%E3%83%95%E3%83%AB%E3%81%97%E3%81%9F%E9%85%8D%E5%88%97%E3%82%92%E7%94%9F%E6%88%90%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%20nums%20%3D%3A%201,%202,%203,%20...,%20n%20%E3%82%92%E7%94%9F%E6%88%90%E3%81%99%E3%82%8B%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281,%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%A9%E3%83%B3%E3%83%80%E3%83%A0%E3%81%AB%E4%B8%A6%E3%81%B9%E6%9B%BF%E3%81%88%E3%82%8B%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%85%8D%E5%88%97%20nums%20%E5%86%85%E3%81%A7%E6%95%B0%E5%80%A4%201%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%201%20%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%81%AB%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E6%9C%80%E8%89%AF%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%20O%281%29%20%E3%81%A8%E3%81%AA%E3%82%8B%0A%20%20%20%20%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%201%20%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%AB%E5%B0%BE%E3%81%AB%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E6%9C%80%E6%82%AA%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%20O%28n%29%20%E3%81%A8%E3%81%AA%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5Cn%E9%85%8D%E5%88%97%20%5B%201,%202,%20...,%20n%20%5D%20%E3%82%92%E3%82%B7%E3%83%A3%E3%83%83%E3%83%95%E3%83%AB%E3%81%97%E3%81%9F%E7%B5%90%E6%9E%9C%20%3D%22,%20nums%29%0A%20%20%20%20print%28%22%E6%95%B0%E5%80%A4%201%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

実際には、最良時間計算量はあまり使いません。通常、ごく低い確率でしか起こらず、誤解を招くことがあるためです。**最悪時間計算量の方が実用的であり、効率の安全な目安を与えてくれる**ので、安心してアルゴリズムを使えます。

上の例から、最悪と最良は「特殊なデータ分布」でしか現れず、その確率が低い場合は実際の効率を十分に反映しないとわかります。一方、**平均時間計算量は、ランダムな入力での実行効率を表し**、$\Theta$ 記法を使います。

一部のアルゴリズムでは、ランダムな分布での平均を簡単に求められます。上の例では配列がランダムに並んでおり、$1$ がどの位置にある確率も等しいので、平均ループ回数は配列の長さの半分 $n / 2$ です。平均時間計算量は $\Theta(n / 2) = \Theta(n)$ になります。

複雑なアルゴリズムでは、データの分布全体での期待値を求めにくく、平均時間計算量の計算は難しくなります。その場合は通常、最悪時間計算量を効率の基準にします。

!!! question "$\Theta$ 記号をあまり見かけないのはなぜですか？"

    $O$ 記号が広く親しまれているためか、平均時間計算量にもよく使われます。ただし、厳密にはこの使い方は正式なものではありません。本書やほかの資料で「平均時間計算量 $O(n)$」という表現を見たら、$\Theta(n)$ と読み替えてください。
