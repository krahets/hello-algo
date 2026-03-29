# 時間計算量

実行時間はアルゴリズムの効率を直感的かつ正確に反映します。あるコードの実行時間を正確に見積もりたい場合、どのようにすればよいでしょうか？

1. **実行プラットフォームを特定する**。ハードウェア構成、プログラミング言語、システム環境などが含まれ、これらの要因はいずれもコードの実行効率に影響します。
2. **各種計算操作に必要な実行時間を評価する**。例えば加算 `+` には 1 ns 、乗算 `*` には 10 ns 、出力 `print()` には 5 ns などが必要です。
3. **コード中のすべての計算操作を数える**。そして各操作の実行時間を合計することで、実行時間を得ます。

例えば次のコードでは、入力データサイズを $n$ とします：

=== "Python"

    ```python title=""
    # ある実行プラットフォーム上で
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # n 回ループ
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // ある実行プラットフォーム上で
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回ループ
        for (int i = 0; i < n; i++) {  // 1 ns
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // ある実行プラットフォーム上で
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回ループ
        for (int i = 0; i < n; i++) {  // 1 ns
            System.out.println(0);     // 5 ns
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // ある実行プラットフォーム上で
    void Algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回ループ
        for (int i = 0; i < n; i++) {  // 1 ns
            Console.WriteLine(0);      // 5 ns
        }
    }
    ```

=== "Go"

    ```go title=""
    // ある実行プラットフォーム上で
    func algorithm(n int) {
        a := 2     // 1 ns
        a = a + 1  // 1 ns
        a = a * 2  // 10 ns
        // n 回ループ
        for i := 0; i < n; i++ {  // 1 ns
            fmt.Println(a)        // 5 ns
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // ある実行プラットフォーム上で
    func algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // n 回ループ
        for _ in 0 ..< n { // 1 ns
            print(0) // 5 ns
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // ある実行プラットフォーム上で
    function algorithm(n) {
        var a = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // n 回ループ
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // ある実行プラットフォーム上で
    function algorithm(n: number): void {
        var a: number = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // n 回ループ
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // ある実行プラットフォーム上で
    void algorithm(int n) {
      int a = 2; // 1 ns
      a = a + 1; // 1 ns
      a = a * 2; // 10 ns
      // n 回ループ
      for (int i = 0; i < n; i++) { // 1 ns
        print(0); // 5 ns
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // ある実行プラットフォーム上で
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 ns
        a = a + 1;          // 1 ns
        a = a * 2;          // 10 ns
        // n 回ループ
        for _ in 0..n {     // 1 ns
            println!("{}", 0);  // 5 ns
        }
    }
    ```

=== "C"

    ```c title=""
    // ある実行プラットフォーム上で
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // n 回ループ
        for (int i = 0; i < n; i++) {   // 1 ns
            printf("%d", 0);            // 5 ns
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // ある実行プラットフォーム上で
    fun algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // n 回ループ
        for (i in 0..<n) {  // 1 ns
            println(0)      // 5 ns
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # ある実行プラットフォーム上で
    def algorithm(n)
        a = 2       # 1 ns
        a = a + 1   # 1 ns
        a = a * 2   # 10 ns
        # n 回ループ
        (0...n).each do # 1 ns
            puts 0      # 5 ns
        end
    end
    ```

上記の方法に基づくと、アルゴリズムの実行時間は $(6n + 12)$ ns になります：

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

しかし実際には、**アルゴリズムの実行時間を統計的に求めることは合理的でも現実的でもありません**。まず、見積もり時間を実行プラットフォームに縛りたくありません。アルゴリズムはさまざまな異なるプラットフォームで動作する必要があるからです。次に、各種操作の実行時間を知ること自体が難しく、見積もりの難易度を大きく引き上げます。

## 実行時間の増加傾向を捉える

時間計算量の分析で扱うのはアルゴリズムの実行時間そのものではなく、**データ量が増えたときに実行時間がどう増加するかという傾向**です。

「実行時間の増加傾向」という概念はやや抽象的なので、例を通して理解してみましょう。入力データサイズを $n$ とし、3 つのアルゴリズム `A`、`B`、`C` を考えます：

=== "Python"

    ```python title=""
    # アルゴリズム A の時間計算量：定数階
    def algorithm_A(n: int):
        print(0)
    # アルゴリズム B の時間計算量：線形階
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # アルゴリズム C の時間計算量：定数階
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

=== "C++"

    ```cpp title=""
    // アルゴリズム A の時間計算量：定数階
    void algorithm_A(int n) {
        cout << 0 << endl;
    }
    // アルゴリズム B の時間計算量：線形階
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            cout << 0 << endl;
        }
    }
    // アルゴリズム C の時間計算量：定数階
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            cout << 0 << endl;
        }
    }
    ```

=== "Java"

    ```java title=""
    // アルゴリズム A の時間計算量：定数階
    void algorithm_A(int n) {
        System.out.println(0);
    }
    // アルゴリズム B の時間計算量：線形階
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println(0);
        }
    }
    // アルゴリズム C の時間計算量：定数階
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            System.out.println(0);
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // アルゴリズム A の時間計算量：定数階
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }
    // アルゴリズム B の時間計算量：線形階
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // アルゴリズム C の時間計算量：定数階
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }
    ```

=== "Go"

    ```go title=""
    // アルゴリズム A の時間計算量：定数階
    func algorithm_A(n int) {
        fmt.Println(0)
    }
    // アルゴリズム B の時間計算量：線形階
    func algorithm_B(n int) {
        for i := 0; i < n; i++ {
            fmt.Println(0)
        }
    }
    // アルゴリズム C の時間計算量：定数階
    func algorithm_C(n int) {
        for i := 0; i < 1000000; i++ {
            fmt.Println(0)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // アルゴリズム A の時間計算量：定数階
    func algorithmA(n: Int) {
        print(0)
    }

    // アルゴリズム B の時間計算量：線形階
    func algorithmB(n: Int) {
        for _ in 0 ..< n {
            print(0)
        }
    }

    // アルゴリズム C の時間計算量：定数階
    func algorithmC(n: Int) {
        for _ in 0 ..< 1_000_000 {
            print(0)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // アルゴリズム A の時間計算量：定数階
    function algorithm_A(n) {
        console.log(0);
    }
    // アルゴリズム B の時間計算量：線形階
    function algorithm_B(n) {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // アルゴリズム C の時間計算量：定数階
    function algorithm_C(n) {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }

    ```

=== "TS"

    ```typescript title=""
    // アルゴリズム A の時間計算量：定数階
    function algorithm_A(n: number): void {
        console.log(0);
    }
    // アルゴリズム B の時間計算量：線形階
    function algorithm_B(n: number): void {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // アルゴリズム C の時間計算量：定数階
    function algorithm_C(n: number): void {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // アルゴリズム A の時間計算量：定数階
    void algorithmA(int n) {
      print(0);
    }
    // アルゴリズム B の時間計算量：線形階
    void algorithmB(int n) {
      for (int i = 0; i < n; i++) {
        print(0);
      }
    }
    // アルゴリズム C の時間計算量：定数階
    void algorithmC(int n) {
      for (int i = 0; i < 1000000; i++) {
        print(0);
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // アルゴリズム A の時間計算量：定数階
    fn algorithm_A(n: i32) {
        println!("{}", 0);
    }
    // アルゴリズム B の時間計算量：線形階
    fn algorithm_B(n: i32) {
        for _ in 0..n {
            println!("{}", 0);
        }
    }
    // アルゴリズム C の時間計算量：定数階
    fn algorithm_C(n: i32) {
        for _ in 0..1000000 {
            println!("{}", 0);
        }
    }
    ```

=== "C"

    ```c title=""
    // アルゴリズム A の時間計算量：定数階
    void algorithm_A(int n) {
        printf("%d", 0);
    }
    // アルゴリズム B の時間計算量：線形階
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            printf("%d", 0);
        }
    }
    // アルゴリズム C の時間計算量：定数階
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            printf("%d", 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // アルゴリズム A の時間計算量：定数階
    fun algoritm_A(n: Int) {
        println(0)
    }
    // アルゴリズム B の時間計算量：線形階
    fun algorithm_B(n: Int) {
        for (i in 0..<n){
            println(0)
        }
    }
    // アルゴリズム C の時間計算量：定数階
    fun algorithm_C(n: Int) {
        for (i in 0..<1000000) {
            println(0)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # アルゴリズム A の時間計算量：定数階
    def algorithm_A(n)
        puts 0
    end

    # アルゴリズム B の時間計算量：線形階
    def algorithm_B(n)
        (0...n).each { puts 0 }
    end

    # アルゴリズム C の時間計算量：定数階
    def algorithm_C(n)
        (0...1_000_000).each { puts 0 }
    end
    ```

以下の図は、上記 3 つのアルゴリズム関数の時間計算量を示しています。

- アルゴリズム `A` には出力操作が $1$ 回しかなく、実行時間は $n$ が大きくなっても増加しません。このアルゴリズムの時間計算量を「定数階」と呼びます。
- アルゴリズム `B` の出力操作は $n$ 回ループする必要があり、実行時間は $n$ の増加に対して線形に増加します。このアルゴリズムの時間計算量は「線形階」と呼ばれます。
- アルゴリズム `C` の出力操作は $1000000$ 回ループする必要があり、実行時間は長いものの、入力データサイズ $n$ とは無関係です。したがって `C` の時間計算量は `A` と同じく、依然として「定数階」です。

![アルゴリズム A、B、C の時間増加傾向](time_complexity.assets/time_complexity_simple_example.png)

アルゴリズムの実行時間を直接数える方法と比べて、時間計算量分析にはどのような特徴があるでしょうか？

- **時間計算量はアルゴリズム効率を有効に評価できます**。例えばアルゴリズム `B` の実行時間は線形に増加するため、$n > 1$ ではアルゴリズム `A` より遅く、$n > 1000000$ ではアルゴリズム `C` より遅くなります。実際、入力データサイズ $n$ が十分に大きければ、「定数階」のアルゴリズムは必ず「線形階」のアルゴリズムより優れます。これが実行時間の増加傾向の意味です。
- **時間計算量の見積もり方法はより簡潔です**。実行プラットフォームや計算操作の種類は、アルゴリズム実行時間の増加傾向とは無関係です。そのため時間計算量分析では、すべての計算操作の実行時間を同じ「単位時間」とみなしてよく、「計算操作の実行時間を数える」作業を「計算操作の個数を数える」作業へ簡略化できます。これにより見積もりの難易度は大きく下がります。
- **時間計算量には一定の限界もあります**。例えばアルゴリズム `A` と `C` の時間計算量は同じでも、実際の実行時間には大きな差があります。同様に、アルゴリズム `B` の時間計算量は `C` より高いものの、入力データサイズ $n$ が小さい場合にはアルゴリズム `B` のほうが明らかに優れます。このような場合、時間計算量だけでアルゴリズム効率の高低を判断するのは難しいことがあります。もっとも、こうした問題があっても、複雑度分析は依然としてアルゴリズム効率を評価する最も有効で一般的な方法です。

## 関数の漸近上界

入力サイズが $n$ の次の関数を考えます：

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # n 回ループ
        for i in range(n):  # +1
            print(0)        # +1
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // n 回ループ
        for (int i = 0; i < n; i++) { // +1（各反復で i ++ を実行）
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
        // n 回ループ
        for (int i = 0; i < n; i++) { // +1（各反復で i ++ を実行）
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
        // n 回ループ
        for (int i = 0; i < n; i++) {   // +1（各反復で i ++ を実行）
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
        // n 回ループ
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
        // n 回ループ
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
        // n 回ループ
        for(let i = 0; i < n; i++){ // +1（各反復で i ++ を実行）
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
        // n 回ループ
        for(let i = 0; i < n; i++){ // +1（各反復で i ++ を実行）
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
      // n 回ループ
      for (int i = 0; i < n; i++) { // +1（各反復で i ++ を実行）
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

        // n 回ループ
        for _ in 0..n { // +1（各反復で i ++ を実行）
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
        // n 回ループ
        for (int i = 0; i < n; i++) {   // +1（各反復で i ++ を実行）
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
        // n 回ループ
        for (i in 0..<n) { // +1（各反復で i ++ を実行）
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
        # n 回ループ
        (0...n).each do # +1
            puts 0      # +1
        end
    end
    ```

アルゴリズムの操作回数を入力データサイズ $n$ の関数とし、$T(n)$ と表すと、上の関数の操作回数は次のようになります：

$$
T(n) = 3 + 2n
$$

$T(n)$ は一次関数であり、実行時間の増加傾向が線形であることを示しています。したがってその時間計算量は線形階です。

線形階の時間計算量を $O(n)$ と表します。この数学記号は<u>ビッグ $O$ 記法（big-$O$ notation）</u>と呼ばれ、関数 $T(n)$ の<u>漸近上界（asymptotic upper bound）</u>を表します。

時間計算量の分析は本質的に「操作回数 $T(n)$」の漸近上界を求めることであり、明確な数学的定義があります。

!!! note "関数の漸近上界"

    正の実数 $c$ と実数 $n_0$ が存在し、すべての $n > n_0$ について $T(n) \leq c \cdot f(n)$ が成り立つならば、$f(n)$ は $T(n)$ の漸近上界の 1 つであるとみなせます。これを $T(n) = O(f(n))$ と記します。

下図のように、漸近上界を求めるとは関数 $f(n)$ を探すことであり、$n$ が無限大へ近づくときに $T(n)$ と $f(n)$ が同じ増加オーダーにあり、定数係数 $c$ だけが異なる状態を表します。

![関数の漸近上界](time_complexity.assets/asymptotic_upper_bound.png)

## 求め方

漸近上界はやや数学色が強い概念ですが、完全に理解できていなくても心配はいりません。まずは求め方を押さえ、実践を重ねる中で徐々にその数学的意味をつかめば十分です。

定義より、$f(n)$ が定まれば時間計算量 $O(f(n))$ が得られます。では、漸近上界 $f(n)$ をどのように決めればよいのでしょうか。大きく 2 段階あります。まず操作回数を数え、その後で漸近上界を判断します。

### 第 1 ステップ：操作回数を数える

コードについては、上から下へ 1 行ずつ数えれば十分です。しかし、前述の $c \cdot f(n)$ における定数係数 $c$ は任意に大きく取れるため、**操作回数 $T(n)$ に含まれるさまざまな係数や定数項は無視できます**。この原則から、次のような簡略化のコツが得られます。

1. **$T(n)$ 中の定数を無視する**。それらはすべて $n$ と無関係なので、時間計算量には影響しません。
2. **すべての係数を省略する**。例えば $2n$ 回や $5n + 1$ 回のループは、いずれも $n$ 回と簡略化できます。$n$ の前の係数は時間計算量に影響しないからです。
3. **ループが入れ子のときは乗算を使う**。総操作回数は外側のループと内側のループの操作回数の積に等しく、各ループ層には引き続き `1.` と `2.` のコツをそれぞれ適用できます。

次の関数では、上記のコツを使って操作回数を数えられます：

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0（コツ 1）
        a = a + n  # +0（コツ 1）
        # +n（コツ 2）
        for i in range(5 * n + 1):
            print(0)
        # +n*n（コツ 3）
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0（コツ 1）
        a = a + n;  // +0（コツ 1）
        // +n（コツ 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n（コツ 3）
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
        int a = 1;  // +0（コツ 1）
        a = a + n;  // +0（コツ 1）
        // +n（コツ 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n（コツ 3）
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
        int a = 1;  // +0（コツ 1）
        a = a + n;  // +0（コツ 1）
        // +n（コツ 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n（コツ 3）
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
        a := 1     // +0（コツ 1）
        a = a + n  // +0（コツ 1）
        // +n（コツ 2）
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n（コツ 3）
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
        var a = 1 // +0（コツ 1）
        a = a + n // +0（コツ 1）
        // +n（コツ 2）
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n（コツ 3）
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
        let a = 1;  // +0（コツ 1）
        a = a + n;  // +0（コツ 1）
        // +n（コツ 2）
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n（コツ 3）
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
        let a = 1;  // +0（コツ 1）
        a = a + n;  // +0（コツ 1）
        // +n（コツ 2）
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n（コツ 3）
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
      int a = 1; // +0（コツ 1）
      a = a + n; // +0（コツ 1）
      // +n（コツ 2）
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n（コツ 3）
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
        let mut a = 1;     // +0（コツ 1）
        a = a + n;        // +0（コツ 1）

        // +n（コツ 2）
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n（コツ 3）
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
        int a = 1;  // +0（コツ 1）
        a = a + n;  // +0（コツ 1）
        // +n（コツ 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n（コツ 3）
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
        var a = 1   // +0（コツ 1）
        a = a + n   // +0（コツ 1）
        // +n（コツ 2）
        for (i in 0..<5 * n + 1) {
            println(0)
        }
        // +n*n（コツ 3）
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
        a = 1       # +0（コツ 1）
        a = a + n   # +0（コツ 1）
        # +n（コツ 2）
        (0...(5 * n + 1)).each do { puts 0 }
        # +n*n（コツ 3）
        (0...(2 * n)).each do
            (0...(n + 1)).each do { puts 0 }
        end
    end
    ```

次の式は、上記のコツを使う前後の集計結果を示したもので、どちらから求めても時間計算量は $O(n^2)$ です。

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{厳密集計 (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{手抜き集計 (o.O)}
\end{aligned}
$$

### 第 2 ステップ：漸近上界を判断する

**時間計算量は $T(n)$ の最高次の項によって決まります**。これは、$n$ が無限大に近づくとき、最高次の項が支配的となり、他の項の影響は無視できるからです。

以下の表はその例です。いくつか極端な値を入れているのは、「係数では次数は変わらない」という結論を強調するためです。$n$ が無限大に近づくと、これらの定数は重要でなくなります。

<p align="center"> 表 <id> &nbsp; 異なる操作回数に対応する時間計算量 </p>

| 操作回数 $T(n)$        | 時間計算量 $O(f(n))$ |
| ---------------------- | -------------------- |
| $100000$               | $O(1)$               |
| $3n + 2$               | $O(n)$               |
| $2n^2 + 3n + 2$        | $O(n^2)$             |
| $n^3 + 10000n^2$       | $O(n^3)$             |
| $2^n + 10000n^{10000}$ | $O(2^n)$             |

## よくある種類

入力データサイズを $n$ とすると、よくある時間計算量の種類は次図のとおりです（小さい順に並べています）。

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
\text{定数階} < \text{対数階} < \text{線形階} < \text{線形対数階} < \text{平方階} < \text{指数階} < \text{階乗階}
\end{aligned}
$$

![よくある時間計算量の種類](time_complexity.assets/time_complexity_common_types.png)

### 定数階 $O(1)$

定数階の操作回数は入力データサイズ $n$ と無関係であり、$n$ が変化しても増減しません。

次の関数では、操作回数 `size` が大きい可能性はありますが、入力データサイズ $n$ とは無関係なので、時間計算量は依然として $O(1)$ です：

```src
[file]{time_complexity}-[class]{}-[func]{constant}
```

### 線形階 $O(n)$

線形階の操作回数は入力データサイズ $n$ に対して線形に増加します。線形階は通常、単一ループに現れます：

```src
[file]{time_complexity}-[class]{}-[func]{linear}
```

配列走査や連結リスト走査などの操作の時間計算量はいずれも $O(n)$ であり、ここでの $n$ は配列または連結リストの長さです：

```src
[file]{time_complexity}-[class]{}-[func]{array_traversal}
```

注意すべきなのは、**入力データサイズ $n$ は入力データの型に応じて具体的に定める必要がある**ということです。例えば 1 つ目の例では変数 $n$ が入力データサイズであり、2 つ目の例では配列長 $n$ がデータサイズです。

### 平方階 $O(n^2)$

平方階の操作回数は入力データサイズ $n$ に対して二乗のオーダーで増加します。平方階は通常、入れ子ループに現れ、外側のループと内側のループの時間計算量がともに $O(n)$ であるため、全体の時間計算量は $O(n^2)$ になります：

```src
[file]{time_complexity}-[class]{}-[func]{quadratic}
```

以下の図は、定数階・線形階・平方階の 3 種類の時間計算量を比較したものです。

![定数階、線形階、平方階の時間計算量](time_complexity.assets/time_complexity_constant_linear_quadratic.png)

バブルソートを例にとると、外側のループは $n - 1$ 回実行され、内側のループは $n-1$、$n-2$、$\dots$、$2$、$1$ 回実行され、平均すると $n / 2$ 回です。したがって時間計算量は $O((n - 1) n / 2) = O(n^2)$ となります：

```src
[file]{time_complexity}-[class]{}-[func]{bubble_sort}
```

### 指数階 $O(2^n)$

生物学における「細胞分裂」は指数階増加の典型例です。初期状態では細胞が $1$ 個あり、1 回分裂すると $2$ 個、2 回分裂すると $4$ 個となり、以下同様に、$n$ 回分裂すると $2^n$ 個の細胞になります。

以下の図とコードは細胞分裂の過程を模擬したもので、時間計算量は $O(2^n)$ です。なお、入力の $n$ は分裂回数を表し、戻り値 `count` は総分裂回数を表します。

```src
[file]{time_complexity}-[class]{}-[func]{exponential}
```

![指数階の時間計算量](time_complexity.assets/time_complexity_exponential.png)

実際のアルゴリズムでも、指数階は再帰関数によく現れます。例えば次のコードでは、再帰的に 2 つへ分岐し、$n$ 回分裂した後に停止します：

```src
[file]{time_complexity}-[class]{}-[func]{exp_recur}
```

指数階の増加は非常に速く、全探索法（ブルートフォース、バックトラッキングなど）によく見られます。データ規模が大きい問題では、指数階は受け入れられず、通常は動的計画法や貪欲法などを使って解く必要があります。

### 対数階 $O(\log n)$

指数階とは逆に、対数階は「各ラウンドで半分になる」状況を表します。入力データサイズを $n$ とすると、各ラウンドで半減するため、ループ回数は $\log_2 n$、すなわち $2^n$ の逆関数になります。

以下の図とコードは、「各ラウンドで半分になる」過程を模擬したもので、時間計算量は $O(\log_2 n)$、簡潔には $O(\log n)$ と書きます：

```src
[file]{time_complexity}-[class]{}-[func]{logarithmic}
```

![対数階の時間計算量](time_complexity.assets/time_complexity_logarithmic.png)

指数階と同様に、対数階も再帰関数によく現れます。次のコードは高さ $\log_2 n$ の再帰木を形成します：

```src
[file]{time_complexity}-[class]{}-[func]{log_recur}
```

対数階は分割統治に基づくアルゴリズムによく現れ、「1 つを複数に分ける」「複雑なものを単純化する」という考え方を体現しています。増加は緩やかで、定数階に次いで理想的な時間計算量です。

!!! tip "$O(\log n)$ の底は何か？"

    正確には、「$m$ 個に分ける」場合に対応する時間計算量は $O(\log_m n)$ です。そして対数の底の変換公式により、底が異なっても同値な時間計算量が得られます：

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    つまり、底 $m$ は複雑度に影響を与えずに変換できます。そのため通常は底 $m$ を省略し、対数階を単に $O(\log n)$ と記します。

### 線形対数階 $O(n \log n)$

線形対数階は入れ子ループによく現れ、2 層のループの時間計算量はそれぞれ $O(\log n)$ と $O(n)$ です。関連するコードは次のとおりです：

```src
[file]{time_complexity}-[class]{}-[func]{linear_log_recur}
```

下図は線形対数階がどのように生じるかを示しています。二分木の各層の操作総数はすべて $n$ であり、木全体は $\log_2 n + 1$ 層あるため、時間計算量は $O(n \log n)$ です。

![線形対数階の時間計算量](time_complexity.assets/time_complexity_logarithmic_linear.png)

主なソートアルゴリズムの時間計算量は通常 $O(n \log n)$ であり、例えばクイックソート、マージソート、ヒープソートなどがあります。

### 階乗階 $O(n!)$

階乗階は、数学における「全順列」の問題に対応します。互いに重複しない $n$ 個の要素が与えられたとき、そのすべての並べ方を求めると、通り数は次のようになります：

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

階乗は通常、再帰で実装されます。以下の図とコードのように、第 1 層では $n$ 個に分岐し、第 2 層では $n - 1$ 個に分岐し、以下同様に、第 $n$ 層で分岐が停止します：

```src
[file]{time_complexity}-[class]{}-[func]{factorial_recur}
```

![階乗階の時間計算量](time_complexity.assets/time_complexity_factorial.png)

注意すべき点として、$n \geq 4$ なら常に $n! > 2^n$ なので、階乗階は指数階よりもさらに速く増加し、$n$ が大きい場合にはやはり受け入れられません。

## 最悪・最良・平均時間計算量

**アルゴリズムの時間効率は固定ではなく、入力データの分布に左右されることが多いです**。長さ $n$ の配列 `nums` を考えます。`nums` は $1$ から $n$ までの数字で構成され、各数字は 1 回だけ現れます。ただし要素の順序はランダムにシャッフルされており、目標は要素 $1$ のインデックスを返すことです。ここから次の結論が得られます。

- `nums = [?, ?, ..., 1]`、つまり末尾の要素が $1$ の場合は、配列全体を最後まで走査する必要があり、**最悪時間計算量 $O(n)$** になります。
- `nums = [1, ?, ?, ...]`、つまり先頭要素が $1$ の場合は、配列がどれだけ長くてもそれ以上走査する必要がなく、**最良時間計算量 $\Omega(1)$** になります。

「最悪時間計算量」は関数の漸近上界に対応し、ビッグ $O$ 記法で表します。同様に、「最良時間計算量」は関数の漸近下界に対応し、$\Omega$ 記法で表します：

```src
[file]{worst_best_time_complexity}-[class]{}-[func]{find_one}
```

実際には、最良時間計算量を使うことはあまりありません。通常それが実現する確率はごく低く、誤解を招く可能性があるからです。**一方で最悪時間計算量はより実用的で、効率の安全側の目安を与えてくれる**ため、安心してアルゴリズムを使えます。

上の例から分かるように、最悪時間計算量と最良時間計算量は「特殊なデータ分布」でのみ現れ、その発生確率は低いことが多く、アルゴリズムの実行効率をそのまま正確に反映するわけではありません。それに対して、**平均時間計算量はランダム入力におけるアルゴリズムの実行効率を表せる**ため、$\Theta$ 記法で表します。

一部のアルゴリズムでは、ランダムなデータ分布における平均的な状況を比較的簡単に求められます。例えば上の例では、入力配列はシャッフルされているため、要素 $1$ が任意のインデックスに現れる確率は等しいです。したがってアルゴリズムの平均ループ回数は配列長の半分 $n / 2$ となり、平均時間計算量は $\Theta(n / 2) = \Theta(n)$ です。

しかし、より複雑なアルゴリズムでは、平均時間計算量を計算するのはしばしば困難です。データ分布に対する全体の数学的期待値を分析するのが難しいからです。そのような場合、通常は最悪時間計算量をアルゴリズム効率の評価基準として用います。

!!! question "なぜ $\Theta$ 記号をあまり見かけないのか？"

    おそらく $O$ 記号のほうが口にしやすいため、平均時間計算量を表すのにもよく使われます。ただし厳密には、この用法は正確ではありません。本書や他の資料で「平均時間計算量 $O(n)$」のような表現を見かけた場合は、そのまま $\Theta(n)$ と理解してください。
