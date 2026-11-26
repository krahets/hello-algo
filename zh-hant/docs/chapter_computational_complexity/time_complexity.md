---
comments: true
---

# 2.3 &nbsp; 時間複雜度

執行時間能直觀且準確地反映演算法的效率。如果想精確估算一段程式碼的執行時間，該怎麼做呢？

1. **確定執行平台**，包括硬體配置、程式語言與系統環境等，這些因素都會影響程式碼的執行效率。
2. **評估各項操作所需的執行時間**，例如加法 `+` 需要 1 ns、乘法 `*` 需要 10 ns、列印 `print()` 需要 5 ns 等。
3. **計算程式碼中所有的操作次數**，將每個操作耗用的時間加總，就能得到執行時間。

例如，在以下程式碼中，輸入資料大小為 $n$：

=== "Python"

    ```python title=""
    # 在某個執行平台上
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # 迴圈執行 n 次
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // 在某個執行平台上
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) {  // 1 ns
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // 在某個執行平台上
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) {  // 1 ns
            System.out.println(0);     // 5 ns
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // 在某個執行平台上
    void Algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) {  // 1 ns
            Console.WriteLine(0);      // 5 ns
        }
    }
    ```

=== "Go"

    ```go title=""
    // 在某個執行平台上
    func algorithm(n int) {
        a := 2     // 1 ns
        a = a + 1  // 1 ns
        a = a * 2  // 10 ns
        // 迴圈執行 n 次
        for i := 0; i < n; i++ {  // 1 ns
            fmt.Println(a)        // 5 ns
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // 在某個執行平台上
    func algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // 迴圈執行 n 次
        for _ in 0 ..< n { // 1 ns
            print(0) // 5 ns
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // 在某個執行平台上
    function algorithm(n) {
        var a = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // 迴圈執行 n 次
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // 在某個執行平台上
    function algorithm(n: number): void {
        var a: number = 2; // 1 ns
        a = a + 1; // 1 ns
        a = a * 2; // 10 ns
        // 迴圈執行 n 次
        for(let i = 0; i < n; i++) { // 1 ns
            console.log(0); // 5 ns
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // 在某個執行平台上
    void algorithm(int n) {
      int a = 2; // 1 ns
      a = a + 1; // 1 ns
      a = a * 2; // 10 ns
      // 迴圈執行 n 次
      for (int i = 0; i < n; i++) { // 1 ns
        print(0); // 5 ns
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // 在某個執行平台上
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 ns
        a = a + 1;          // 1 ns
        a = a * 2;          // 10 ns
        // 迴圈執行 n 次
        for _ in 0..n {     // 1 ns
            println!("{}", 0);  // 5 ns
        }
    }
    ```

=== "C"

    ```c title=""
    // 在某個執行平台上
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) {   // 1 ns
            printf("%d", 0);            // 5 ns
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // 在某個執行平台上
    fun algorithm(n: Int) {
        var a = 2 // 1 ns
        a = a + 1 // 1 ns
        a = a * 2 // 10 ns
        // 迴圈執行 n 次
        for (i in 0..<n) {  // 1 ns
            println(0)      // 5 ns
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # 在某個執行平台上
    def algorithm(n)
        a = 2       # 1 ns
        a = a + 1   # 1 ns
        a = a * 2   # 10 ns
        # 迴圈執行 n 次
        (0...n).each do # 1 ns
            puts 0      # 5 ns
        end
    end
    ```

按照上述方法，可算出演算法的執行時間為 $(6n + 12)$ ns：

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

但在實務上，**這樣計算演算法的執行時間既不合理，也不切實際**。首先，演算法需要在各種平台上執行，我們不希望估算的時間只適用於特定平台。其次，每種操作實際需要多少時間往往難以得知，也使估算格外困難。

## 2.3.1 &nbsp; 分析執行時間的成長趨勢

時間複雜度分析關心的並非演算法實際執行多久，**而是資料量增加時，執行時間如何成長**。

「時間的成長趨勢」有些抽象，我們用例子來理解。假設輸入資料大小為 $n$，有三個演算法 `A`、`B` 與 `C`：

=== "Python"

    ```python title=""
    # 演算法 A 的時間複雜度：常數階
    def algorithm_A(n: int):
        print(0)
    # 演算法 B 的時間複雜度：線性階
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # 演算法 C 的時間複雜度：常數階
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

=== "C++"

    ```cpp title=""
    // 演算法 A 的時間複雜度：常數階
    void algorithm_A(int n) {
        cout << 0 << endl;
    }
    // 演算法 B 的時間複雜度：線性階
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            cout << 0 << endl;
        }
    }
    // 演算法 C 的時間複雜度：常數階
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            cout << 0 << endl;
        }
    }
    ```

=== "Java"

    ```java title=""
    // 演算法 A 的時間複雜度：常數階
    void algorithm_A(int n) {
        System.out.println(0);
    }
    // 演算法 B 的時間複雜度：線性階
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println(0);
        }
    }
    // 演算法 C 的時間複雜度：常數階
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            System.out.println(0);
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // 演算法 A 的時間複雜度：常數階
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }
    // 演算法 B 的時間複雜度：線性階
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // 演算法 C 的時間複雜度：常數階
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }
    ```

=== "Go"

    ```go title=""
    // 演算法 A 的時間複雜度：常數階
    func algorithm_A(n int) {
        fmt.Println(0)
    }
    // 演算法 B 的時間複雜度：線性階
    func algorithm_B(n int) {
        for i := 0; i < n; i++ {
            fmt.Println(0)
        }
    }
    // 演算法 C 的時間複雜度：常數階
    func algorithm_C(n int) {
        for i := 0; i < 1000000; i++ {
            fmt.Println(0)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // 演算法 A 的時間複雜度：常數階
    func algorithmA(n: Int) {
        print(0)
    }

    // 演算法 B 的時間複雜度：線性階
    func algorithmB(n: Int) {
        for _ in 0 ..< n {
            print(0)
        }
    }

    // 演算法 C 的時間複雜度：常數階
    func algorithmC(n: Int) {
        for _ in 0 ..< 1_000_000 {
            print(0)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // 演算法 A 的時間複雜度：常數階
    function algorithm_A(n) {
        console.log(0);
    }
    // 演算法 B 的時間複雜度：線性階
    function algorithm_B(n) {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // 演算法 C 的時間複雜度：常數階
    function algorithm_C(n) {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }

    ```

=== "TS"

    ```typescript title=""
    // 演算法 A 的時間複雜度：常數階
    function algorithm_A(n: number): void {
        console.log(0);
    }
    // 演算法 B 的時間複雜度：線性階
    function algorithm_B(n: number): void {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // 演算法 C 的時間複雜度：常數階
    function algorithm_C(n: number): void {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // 演算法 A 的時間複雜度：常數階
    void algorithmA(int n) {
      print(0);
    }
    // 演算法 B 的時間複雜度：線性階
    void algorithmB(int n) {
      for (int i = 0; i < n; i++) {
        print(0);
      }
    }
    // 演算法 C 的時間複雜度：常數階
    void algorithmC(int n) {
      for (int i = 0; i < 1000000; i++) {
        print(0);
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // 演算法 A 的時間複雜度：常數階
    fn algorithm_A(n: i32) {
        println!("{}", 0);
    }
    // 演算法 B 的時間複雜度：線性階
    fn algorithm_B(n: i32) {
        for _ in 0..n {
            println!("{}", 0);
        }
    }
    // 演算法 C 的時間複雜度：常數階
    fn algorithm_C(n: i32) {
        for _ in 0..1000000 {
            println!("{}", 0);
        }
    }
    ```

=== "C"

    ```c title=""
    // 演算法 A 的時間複雜度：常數階
    void algorithm_A(int n) {
        printf("%d", 0);
    }
    // 演算法 B 的時間複雜度：線性階
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            printf("%d", 0);
        }
    }
    // 演算法 C 的時間複雜度：常數階
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            printf("%d", 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // 演算法 A 的時間複雜度：常數階
    fun algorithm_A(n: Int) {
        println(0)
    }
    // 演算法 B 的時間複雜度：線性階
    fun algorithm_B(n: Int) {
        for (i in 0..<n){
            println(0)
        }
    }
    // 演算法 C 的時間複雜度：常數階
    fun algorithm_C(n: Int) {
        for (i in 0..<1000000) {
            println(0)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # 演算法 A 的時間複雜度：常數階
    def algorithm_A(n)
        puts 0
    end

    # 演算法 B 的時間複雜度：線性階
    def algorithm_B(n)
        (0...n).each { puts 0 }
    end

    # 演算法 C 的時間複雜度：常數階
    def algorithm_C(n)
        (0...1_000_000).each { puts 0 }
    end
    ```

圖 2-7 呈現這三個演算法的時間複雜度。

- 演算法 `A` 只進行 $1$ 次列印，執行時間不隨 $n$ 增加而成長。我們稱這個演算法的時間複雜度為「常數階」。
- 演算法 `B` 在迴圈中列印 $n$ 次，執行時間隨 $n$ 增加而線性成長，時間複雜度稱為「線性階」。
- 演算法 `C` 在迴圈中列印 $1000000$ 次。雖然耗時很久，執行時間卻與輸入資料大小 $n$ 無關，因此 `C` 與 `A` 的時間複雜度相同，都是「常數階」。

![演算法 A、B 與 C 的執行時間成長趨勢](time_complexity.assets/time_complexity_simple_example.svg){ class="animation-figure" }

<p align="center"> 圖 2-7 &nbsp; 演算法 A、B 與 C 的執行時間成長趨勢 </p>

和直接計算演算法的執行時間相比，時間複雜度分析有什麼特色呢？

- **時間複雜度能有效評估演算法的效率**。例如，演算法 `B` 的執行時間線性成長，在 $n > 1$ 時比演算法 `A` 慢，在 $n > 1000000$ 時比演算法 `C` 慢。事實上，只要輸入資料大小 $n$ 夠大，常數階演算法就一定比線性階演算法快，這正是成長趨勢的意義。
- **時間複雜度的推算較簡便**。執行平台與操作類型都不影響演算法執行時間的成長趨勢。因此，在分析時間複雜度時，我們可以把每一項操作所需的時間都視為相同的「單位時間」。這樣一來，只要計算操作次數，就無須逐一計算各項操作的執行時間，估算也容易得多。
- **時間複雜度也有其限制**。例如，演算法 `A` 與 `C` 的時間複雜度相同，實際耗時卻相差很大。同樣地，雖然演算法 `B` 的時間複雜度高於 `C`，但輸入資料大小 $n$ 較小時，演算法 `B` 明顯優於演算法 `C`。在這些情況下，往往很難只憑時間複雜度判斷效率高低。即便如此，複雜度分析仍是評估演算法效率最有效、也最常用的方法。

## 2.3.2 &nbsp; 函數的漸近上界

給定以下函式，其輸入大小為 $n$：

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # 迴圈執行 n 次
        for i in range(n):  # +1
            print(0)        # +1
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) { // +1（每次迴圈都會執行 i ++）
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
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) { // +1（每次迴圈都會執行 i ++）
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
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) {   // +1（每次迴圈都會執行 i ++）
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
        // 迴圈執行 n 次
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
        // 迴圈執行 n 次
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
        // 迴圈執行 n 次
        for(let i = 0; i < n; i++){ // +1（每次迴圈都會執行 i ++）
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
        // 迴圈執行 n 次
        for(let i = 0; i < n; i++){ // +1（每次迴圈都會執行 i ++）
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
      // 迴圈執行 n 次
      for (int i = 0; i < n; i++) { // +1（每次迴圈都會執行 i ++）
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

        // 迴圈執行 n 次
        for _ in 0..n { // +1（每次迴圈都會執行 i ++）
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
        // 迴圈執行 n 次
        for (int i = 0; i < n; i++) {   // +1（每次迴圈都會執行 i ++）
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
        // 迴圈執行 n 次
        for (i in 0..<n) { // +1（每次迴圈都會執行 i ++）
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
        # 迴圈執行 n 次
        (0...n).each do # +1
            puts 0      # +1
        end
    end
    ```

設演算法的操作次數是輸入資料大小 $n$ 的函數，記為 $T(n)$。上述函式的操作次數為：

$$
T(n) = 3 + 2n
$$

$T(n)$ 是一次函數，表示執行時間呈線性成長，因此時間複雜度為線性階。

線性階的時間複雜度記為 $O(n)$。這種數學記法稱為<u>大 $O$ 記號（big-$O$ notation）</u>，表示函數 $T(n)$ 的<u>漸近上界（asymptotic upper bound）</u>。

分析時間複雜度，實質上就是求「操作次數 $T(n)$」的漸近上界。漸近上界有明確的數學定義。

!!! note "函數的漸近上界"

    若存在正實數 $c$ 與實數 $n_0$，使所有 $n > n_0$ 都滿足 $T(n) \leq c \cdot f(n)$，則 $f(n)$ 是 $T(n)$ 的一個漸近上界，記為 $T(n) = O(f(n))$。

如圖 2-8 所示，求漸近上界，就是尋找一個函數 $f(n)$，使 $n$ 趨近無窮大時，$T(n)$ 與 $f(n)$ 有相同的成長階數，只差一個常數係數 $c$。

![函數的漸近上界](time_complexity.assets/asymptotic_upper_bound.svg){ class="animation-figure" }

<p align="center"> 圖 2-8 &nbsp; 函數的漸近上界 </p>

## 2.3.3 &nbsp; 推算方法

漸近上界的數學定義乍看有些難懂，不必急著完全掌握。我們可以先學會怎麼推算，再透過練習逐漸理解它的數學意義。

根據定義，確定 $f(n)$ 後，就能得到時間複雜度 $O(f(n))$。該如何確定漸近上界 $f(n)$ 呢？可分成兩個步驟：先計算操作次數，再判斷漸近上界。

### 1. &nbsp; 第一步：計算操作次數

我們可以從上到下，逐行計算程式碼的操作次數。不過，上述 $c \cdot f(n)$ 中的常數係數 $c$ 可以任取大小，**因此可以忽略操作次數 $T(n)$ 中的各項係數與常數項**。根據這項原則，可以用以下技巧簡化計數。

1. **忽略 $T(n)$ 中的常數項**。這些項與 $n$ 無關，不影響時間複雜度。
2. **省略所有係數**。例如，執行 $2n$ 次或 $5n + 1$ 次迴圈，都可以簡記為 $n$ 次，因為 $n$ 前面的係數不影響時間複雜度。
3. **遇到巢狀迴圈時使用乘法**。總操作次數等於外層迴圈與內層迴圈的操作次數相乘。各層迴圈仍可分別套用第 `1.` 點與第 `2.` 點的技巧。

對於以下函式，我們可以用這些技巧計算操作次數：

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0（技巧 1）
        a = a + n  # +0（技巧 1）
        # +n（技巧 2）
        for i in range(5 * n + 1):
            print(0)
        # +n*n（技巧 3）
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
        // +n（技巧 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n（技巧 3）
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
        int a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
        // +n（技巧 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n（技巧 3）
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
        int a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
        // +n（技巧 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n（技巧 3）
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
        a := 1     // +0（技巧 1）
        a = a + n  // +0（技巧 1）
        // +n（技巧 2）
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n（技巧 3）
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
        var a = 1 // +0（技巧 1）
        a = a + n // +0（技巧 1）
        // +n（技巧 2）
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n（技巧 3）
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
        let a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
        // +n（技巧 2）
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n（技巧 3）
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
        let a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
        // +n（技巧 2）
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n（技巧 3）
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
      int a = 1; // +0（技巧 1）
      a = a + n; // +0（技巧 1）
      // +n（技巧 2）
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n（技巧 3）
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
        let mut a = 1;     // +0（技巧 1）
        a = a + n;        // +0（技巧 1）

        // +n（技巧 2）
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n（技巧 3）
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
        int a = 1;  // +0（技巧 1）
        a = a + n;  // +0（技巧 1）
        // +n（技巧 2）
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n（技巧 3）
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
        var a = 1   // +0（技巧 1）
        a = a + n   // +0（技巧 1）
        // +n（技巧 2）
        for (i in 0..<5 * n + 1) {
            println(0)
        }
        // +n*n（技巧 3）
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
        a = 1       # +0（技巧 1）
        a = a + n   # +0（技巧 1）
        # +n（技巧 2）
        (0...(5 * n + 1)).each { puts 0 }
        # +n*n（技巧 3）
        (0...(2 * n)).each do
            (0...(n + 1)).each { puts 0 }
        end
    end
    ```

下列公式列出簡化前後的計數結果，兩者推算出的時間複雜度都是 $O(n^2)$。

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{完整計數 (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{偷懶計數 (o.O)}
\end{aligned}
$$

### 2. &nbsp; 第二步：判斷漸近上界

**時間複雜度由 $T(n)$ 中階數最高的項決定**。這是因為當 $n$ 趨近無窮大時，最高階項會主導成長趨勢，其他項的影響可以忽略。

表 2-2 列出幾個例子，刻意使用一些誇張的數字來強調「係數無法改變階數」。當 $n$ 趨近無窮大時，這些常數的影響就微不足道了。

<p align="center"> 表 2-2 &nbsp; 不同操作次數對應的時間複雜度 </p>

<div class="center-table" markdown>

| 操作次數 $T(n)$        | 時間複雜度 $O(f(n))$ |
| ---------------------- | -------------------- |
| $100000$               | $O(1)$               |
| $3n + 2$               | $O(n)$               |
| $2n^2 + 3n + 2$        | $O(n^2)$             |
| $n^3 + 10000n^2$       | $O(n^3)$             |
| $2^n + 10000n^{10000}$ | $O(2^n)$             |

</div>

## 2.3.4 &nbsp; 常見類型

設輸入資料大小為 $n$，常見的時間複雜度如圖 2-9 所示，依成長速度由低到高排列。

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
& \text{常數階} < \text{對數階} < \text{線性階} < \text{線性對數階} < \text{平方階} < \text{指數階} < \text{階乘階}
\end{aligned}
$$

![常見的時間複雜度類型](time_complexity.assets/time_complexity_common_types.svg){ class="animation-figure" }

<p align="center"> 圖 2-9 &nbsp; 常見的時間複雜度類型 </p>

### 1. &nbsp; 常數階 $O(1)$ {data-toc-label="1. &nbsp; 常數階"}

常數階的操作次數與輸入資料大小 $n$ 無關，不會隨 $n$ 改變。

以下函式的操作次數 `size` 雖然可能很大，但與輸入資料大小 $n$ 無關，因此時間複雜度仍為 $O(1)$：

=== "Python"

    ```python title="time_complexity.py"
    def constant(n: int) -> int:
        """常數階"""
        count = 0
        size = 100000
        for _ in range(size):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 常數階 */
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
    /* 常數階 */
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
    /* 常數階 */
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
    /* 常數階 */
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
    /* 常數階 */
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
    /* 常數階 */
    function constant(n) {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 常數階 */
    function constant(n: number): number {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 常數階 */
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
    /* 常數階 */
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
    /* 常數階 */
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
    /* 常數階 */
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
    ### 常數階 ###
    def constant(n)
      count = 0
      size = 100000

      (0...size).each { count += 1 }

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B8%B8%E6%95%B8%E9%9A%8E%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22%E5%B8%B8%E6%95%B8%E9%9A%8E%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B8%B8%E6%95%B8%E9%9A%8E%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22%E5%B8%B8%E6%95%B8%E9%9A%8E%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 線性階 $O(n)$ {data-toc-label="2. &nbsp; 線性階"}

線性階的操作次數隨輸入資料大小 $n$ 線性成長。這種情況常出現在單層迴圈中：

=== "Python"

    ```python title="time_complexity.py"
    def linear(n: int) -> int:
        """線性階"""
        count = 0
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 線性階 */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 線性階 */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 線性階 */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 線性階 */
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
    /* 線性階 */
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
    /* 線性階 */
    function linear(n) {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 線性階 */
    function linear(n: number): number {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 線性階 */
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
    /* 線性階 */
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
    /* 線性階 */
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
    /* 線性階 */
    fun linear(n: Int): Int {
        var count = 0
        for (i in 0..<n)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 線性階 ###
    def linear(n)
      count = 0
      (0...n).each { count += 1 }
      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E6%80%A7%E9%9A%8E%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E6%80%A7%E9%9A%8E%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E6%80%A7%E9%9A%8E%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E6%80%A7%E9%9A%8E%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

走訪陣列或鏈結串列的時間複雜度都是 $O(n)$，其中 $n$ 是陣列或鏈結串列的長度：

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """線性階（走訪陣列）"""
        count = 0
        # 迴圈次數與陣列長度成正比
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 線性階（走訪陣列） */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // 迴圈次數與陣列長度成正比
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 線性階（走訪陣列） */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // 迴圈次數與陣列長度成正比
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 線性階（走訪陣列） */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // 迴圈次數與陣列長度成正比
        foreach (int num in nums) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 線性階（走訪陣列） */
    func arrayTraversal(nums []int) int {
        count := 0
        // 迴圈次數與陣列長度成正比
        for range nums {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 線性階（走訪陣列） */
    func arrayTraversal(nums: [Int]) -> Int {
        var count = 0
        // 迴圈次數與陣列長度成正比
        for _ in nums {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 線性階（走訪陣列） */
    function arrayTraversal(nums) {
        let count = 0;
        // 迴圈次數與陣列長度成正比
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 線性階（走訪陣列） */
    function arrayTraversal(nums: number[]): number {
        let count = 0;
        // 迴圈次數與陣列長度成正比
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 線性階（走訪陣列） */
    int arrayTraversal(List<int> nums) {
      int count = 0;
      // 迴圈次數與陣列長度成正比
      for (var _num in nums) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 線性階（走訪陣列） */
    fn array_traversal(nums: &[i32]) -> i32 {
        let mut count = 0;
        // 迴圈次數與陣列長度成正比
        for _ in nums {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 線性階（走訪陣列） */
    int arrayTraversal(int *nums, int n) {
        int count = 0;
        // 迴圈次數與陣列長度成正比
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 線性階（走訪陣列） */
    fun arrayTraversal(nums: IntArray): Int {
        var count = 0
        // 迴圈次數與陣列長度成正比
        for (num in nums) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 線性階（走訪陣列）###
    def array_traversal(nums)
      count = 0

      # 迴圈次數與陣列長度成正比
      for num in nums
        count += 1
      end

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E6%80%A7%E9%9A%8E%EF%BC%88%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%AC%A1%E6%95%B8%E8%88%87%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%E6%88%90%E6%AD%A3%E6%AF%94%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E6%80%A7%E9%9A%8E%EF%BC%88%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E6%80%A7%E9%9A%8E%EF%BC%88%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%AC%A1%E6%95%B8%E8%88%87%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%E6%88%90%E6%AD%A3%E6%AF%94%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E6%80%A7%E9%9A%8E%EF%BC%88%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

請留意，**輸入資料大小 $n$ 的定義取決於輸入資料的類型**。例如，第一個例子用變數 $n$ 表示輸入資料大小，第二個例子則以陣列長度 $n$ 表示資料大小。

### 3. &nbsp; 平方階 $O(n^2)$ {data-toc-label="3. &nbsp; 平方階"}

平方階的操作次數隨輸入資料大小 $n$ 的平方成長。這種情況常見於巢狀迴圈：外層與內層迴圈的時間複雜度各為 $O(n)$，整體的時間複雜度因此為 $O(n^2)$：

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """平方階"""
        count = 0
        # 迴圈次數正比於資料大小 n 的平方
        for i in range(n):
            for j in range(n):
                count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 平方階 */
    int quadratic(int n) {
        int count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    int quadratic(int n) {
        int count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    int Quadratic(int n) {
        int count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    func quadratic(n int) int {
        count := 0
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    func quadratic(n: Int) -> Int {
        var count = 0
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    function quadratic(n) {
        let count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    function quadratic(n: number): number {
        let count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    int quadratic(int n) {
      int count = 0;
      // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    fn quadratic(n: i32) -> i32 {
        let mut count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    int quadratic(int n) {
        int count = 0;
        // 迴圈次數正比於資料大小 n 的平方
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
    /* 平方階 */
    fun quadratic(n: Int): Int {
        var count = 0
        // 迴圈次數正比於資料大小 n 的平方
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
    ### 平方階 ###
    def quadratic(n)
      count = 0

      # 迴圈次數正比於資料大小 n 的平方
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%9A%8E%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%AC%A1%E6%95%B8%E6%AD%A3%E6%AF%94%E6%96%BC%E8%B3%87%E6%96%99%E5%A4%A7%E5%B0%8F%20n%20%E7%9A%84%E5%B9%B3%E6%96%B9%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22%E5%B9%B3%E6%96%B9%E9%9A%8E%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%9A%8E%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%AC%A1%E6%95%B8%E6%AD%A3%E6%AF%94%E6%96%BC%E8%B3%87%E6%96%99%E5%A4%A7%E5%B0%8F%20n%20%E7%9A%84%E5%B9%B3%E6%96%B9%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22%E5%B9%B3%E6%96%B9%E9%9A%8E%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 2-10 比較常數階、線性階與平方階三種時間複雜度。

![常數階、線性階與平方階的時間複雜度](time_complexity.assets/time_complexity_constant_linear_quadratic.svg){ class="animation-figure" }

<p align="center"> 圖 2-10 &nbsp; 常數階、線性階與平方階的時間複雜度 </p>

以氣泡排序為例，外層迴圈執行 $n - 1$ 次，內層迴圈依序執行 $n-1$、$n-2$、$\dots$、$2$、$1$ 次，平均為 $n / 2$ 次，因此時間複雜度為 $O((n - 1) n / 2) = O(n^2)$：

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """平方階（氣泡排序）"""
        count = 0  # 計數器
        # 外層迴圈：未排序區間為 [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # 交換 nums[j] 與 nums[j + 1]
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # 交換元素需 3 個基本操作
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 平方階（氣泡排序） */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 平方階（氣泡排序） */
    int bubbleSort(int[] nums) {
        int count = 0; // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 平方階（氣泡排序） */
    int BubbleSort(int[] nums) {
        int count = 0;  // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 平方階（氣泡排序） */
    func bubbleSort(nums []int) int {
        count := 0 // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    tmp := nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                    count += 3 // 交換元素需 3 個基本操作
                }
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 平方階（氣泡排序） */
    func bubbleSort(nums: inout [Int]) -> Int {
        var count = 0 // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3 // 交換元素需 3 個基本操作
                }
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 平方階（氣泡排序） */
    function bubbleSort(nums) {
        let count = 0; // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 平方階（氣泡排序） */
    function bubbleSort(nums: number[]): number {
        let count = 0; // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 平方階（氣泡排序） */
    int bubbleSort(List<int> nums) {
      int count = 0; // 計數器
      // 外層迴圈：未排序區間為 [0, i]
      for (var i = nums.length - 1; i > 0; i--) {
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for (var j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // 交換 nums[j] 與 nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            count += 3; // 交換元素需 3 個基本操作
          }
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 平方階（氣泡排序） */
    fn bubble_sort(nums: &mut [i32]) -> i32 {
        let mut count = 0; // 計數器

        // 外層迴圈：未排序區間為 [0, i]
        for i in (1..nums.len()).rev() {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 平方階（氣泡排序） */
    int bubbleSort(int *nums, int n) {
        int count = 0; // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (int i = n - 1; i > 0; i--) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // 交換元素需 3 個基本操作
                }
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 平方階（氣泡排序） */
    fun bubbleSort(nums: IntArray): Int {
        var count = 0 // 計數器
        // 外層迴圈：未排序區間為 [0, i]
        for (i in nums.size - 1 downTo 1) {
            // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    count += 3 // 交換元素需 3 個基本操作
                }
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 平方階（氣泡排序）###
    def bubble_sort(nums)
      count = 0  # 計數器

      # 外層迴圈：未排序區間為 [0, i]
      for i in (nums.length - 1).downto(0)
        # 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for j in 0...i
          if nums[j] > nums[j + 1]
            # 交換 nums[j] 與 nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # 交換元素需 3 個基本操作
          end
        end
      end

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%9A%8E%EF%BC%88%E6%B0%A3%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20%E8%A8%88%E6%95%B8%E5%99%A8%0A%20%20%20%20%23%20%E5%A4%96%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E8%97%89%E7%94%B1%E4%BA%A4%E6%8F%9B%EF%BC%8C%E5%B0%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%20%5B0,%20i%5D%20%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E7%A7%BB%E8%87%B3%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%20nums%5Bj%5D%20%E8%88%87%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%E9%9C%80%203%20%E5%80%8B%E5%9F%BA%E6%9C%AC%E6%93%8D%E4%BD%9C%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n,%200,%20-1%29%5D%20%20%23%20%5Bn,%20n-1,%20...,%202,%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E5%B9%B3%E6%96%B9%E9%9A%8E%EF%BC%88%E6%B0%A3%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B9%B3%E6%96%B9%E9%9A%8E%EF%BC%88%E6%B0%A3%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20%E8%A8%88%E6%95%B8%E5%99%A8%0A%20%20%20%20%23%20%E5%A4%96%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E8%97%89%E7%94%B1%E4%BA%A4%E6%8F%9B%EF%BC%8C%E5%B0%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%20%5B0,%20i%5D%20%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E7%A7%BB%E8%87%B3%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%20nums%5Bj%5D%20%E8%88%87%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%E9%9C%80%203%20%E5%80%8B%E5%9F%BA%E6%9C%AC%E6%93%8D%E4%BD%9C%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n,%200,%20-1%29%5D%20%20%23%20%5Bn,%20n-1,%20...,%202,%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E5%B9%B3%E6%96%B9%E9%9A%8E%EF%BC%88%E6%B0%A3%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 4. &nbsp; 指數階 $O(2^n)$ {data-toc-label="4. &nbsp; 指數階"}

生物學中的「細胞分裂」是指數成長的典型例子。最初有 $1$ 個細胞，分裂一輪後變成 $2$ 個，兩輪後變成 $4$ 個，以此類推，分裂 $n$ 輪後有 $2^n$ 個細胞。

圖 2-11 與以下程式碼模擬細胞分裂的過程，時間複雜度為 $O(2^n)$。請留意，輸入 $n$ 是分裂的輪數，回傳值 `count` 是累計的分裂次數。

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """指數階（迴圈實作）"""
        count = 0
        base = 1
        # 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 指數階（迴圈實作） */
    int exponential(int n) {
        int count = 0, base = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    int exponential(int n) {
        int count = 0, base = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作）*/
    func exponential(n int) int {
        count, base := 0, 1
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    func exponential(n: Int) -> Int {
        var count = 0
        var base = 1
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    function exponential(n) {
        let count = 0,
            base = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    function exponential(n: number): number {
        let count = 0,
            base = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    int exponential(int n) {
      int count = 0, base = 1;
      // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    fn exponential(n: i32) -> i32 {
        let mut count = 0;
        let mut base = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    int exponential(int n) {
        int count = 0;
        int bas = 1;
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    /* 指數階（迴圈實作） */
    fun exponential(n: Int): Int {
        var count = 0
        var base = 1
        // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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
    ### 指數階（迴圈實作）###
    def exponential(n)
      count, base = 0, 1

      # 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20%E7%B4%B0%E8%83%9E%E6%AF%8F%E8%BC%AA%E4%B8%80%E5%88%86%E7%82%BA%E4%BA%8C%EF%BC%8C%E5%BD%A2%E6%88%90%E6%95%B8%E5%88%97%201,%202,%204,%208,%20...,%202%5E%28n-1%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20%E7%B4%B0%E8%83%9E%E6%AF%8F%E8%BC%AA%E4%B8%80%E5%88%86%E7%82%BA%E4%BA%8C%EF%BC%8C%E5%BD%A2%E6%88%90%E6%95%B8%E5%88%97%201,%202,%204,%208,%20...,%202%5E%28n-1%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

![指數階的時間複雜度](time_complexity.assets/time_complexity_exponential.svg){ class="animation-figure" }

<p align="center"> 圖 2-11 &nbsp; 指數階的時間複雜度 </p>

在實際的演算法中，指數階常出現在遞迴函式裡。例如，以下程式碼在遞迴過程中一分為二，分裂 $n$ 次後停止：

=== "Python"

    ```python title="time_complexity.py"
    def exp_recur(n: int) -> int:
        """指數階（遞迴實作）"""
        if n == 1:
            return 1
        return exp_recur(n - 1) + exp_recur(n - 1) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 指數階（遞迴實作） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 指數階（遞迴實作） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 指數階（遞迴實作） */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 指數階（遞迴實作）*/
    func expRecur(n int) int {
        if n == 1 {
            return 1
        }
        return expRecur(n-1) + expRecur(n-1) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 指數階（遞迴實作） */
    func expRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 指數階（遞迴實作） */
    function expRecur(n) {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 指數階（遞迴實作） */
    function expRecur(n: number): number {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 指數階（遞迴實作） */
    int expRecur(int n) {
      if (n == 1) return 1;
      return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 指數階（遞迴實作） */
    fn exp_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        exp_recur(n - 1) + exp_recur(n - 1) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 指數階（遞迴實作） */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 指數階（遞迴實作） */
    fun expRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return expRecur(n - 1) + expRecur(n - 1) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 指數階（遞迴實作）###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22%E6%8C%87%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

指數階成長非常快，常見於窮舉法，例如暴力搜尋與回溯。當資料規模較大時，指數階的耗時令人難以接受，通常需要改用動態規劃或貪婪演算法等方法求解。

### 5. &nbsp; 對數階 $O(\log n)$ {data-toc-label="5. &nbsp; 對數階"}

和指數階的變化方向相反，對數階反映「每一輪都減半」的情況。設輸入資料大小為 $n$，每一輪減半，所需的迴圈次數就是 $\log_2 n$，也就是 $2^n$ 的反函數。

圖 2-12 與以下程式碼模擬每一輪減半的過程，時間複雜度為 $O(\log_2 n)$，簡記為 $O(\log n)$：

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: int) -> int:
        """對數階（迴圈實作）"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作）*/
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    /* 對數階（迴圈實作） */
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
    ### 對數階（迴圈實作）###
    def logarithmic(n)
      count = 0

      while n > 1
        n /= 2
        count += 1
      end

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20/%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20/%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E8%BF%B4%E5%9C%88%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

![對數階的時間複雜度](time_complexity.assets/time_complexity_logarithmic.svg){ class="animation-figure" }

<p align="center"> 圖 2-12 &nbsp; 對數階的時間複雜度 </p>

和指數階一樣，對數階也常見於遞迴函式。以下程式碼形成一棵高度為 $\log_2 n$ 的遞迴樹：

=== "Python"

    ```python title="time_complexity.py"
    def log_recur(n: int) -> int:
        """對數階（遞迴實作）"""
        if n <= 1:
            return 0
        return log_recur(n / 2) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 對數階（遞迴實作） */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 對數階（遞迴實作） */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 對數階（遞迴實作） */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 對數階（遞迴實作）*/
    func logRecur(n int) int {
        if n <= 1 {
            return 0
        }
        return logRecur(n/2) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 對數階（遞迴實作） */
    func logRecur(n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        return logRecur(n: n / 2) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 對數階（遞迴實作） */
    function logRecur(n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 對數階（遞迴實作） */
    function logRecur(n: number): number {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 對數階（遞迴實作） */
    int logRecur(int n) {
      if (n <= 1) return 0;
      return logRecur(n ~/ 2) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 對數階（遞迴實作） */
    fn log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 0;
        }
        log_recur(n / 2) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 對數階（遞迴實作） */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* 對數階（遞迴實作） */
    fun logRecur(n: Int): Int {
        if (n <= 1)
            return 0
        return logRecur(n / 2) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 對數階（遞迴實作）###
    def log_recur(n)
      return 0 unless n > 1
      log_recur(n / 2) + 1
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20/%202%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20/%202%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

對數階常見於採用分治策略的演算法，展現了「一分為多」與「化繁為簡」的想法。對數成長緩慢，是僅次於常數階的理想時間複雜度。

!!! tip "$O(\log n)$ 的底數是多少？"

    精確來說，「一分為 $m$」對應的時間複雜度是 $O(\log_m n)$。利用對數換底公式，可以得到底數不同、複雜度相同的表示方式：

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    也就是說，更換底數 $m$ 不影響複雜度。因此，通常可以省略底數 $m$，將對數階直接記為 $O(\log n)$。

### 6. &nbsp; 線性對數階 $O(n \log n)$ {data-toc-label="6. &nbsp; 線性對數階"}

線性對數階常見於巢狀迴圈，其中兩層迴圈的時間複雜度分別為 $O(\log n)$ 與 $O(n)$。相關程式碼如下：

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: int) -> int:
        """線性對數階"""
        if n <= 1:
            return 1
        # 一分為二，每個子問題的規模減半
        count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        # 目前的子問題包含 n 個操作
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    /* 線性對數階 */
    function linearLogRecur(n) {
        if (n <= 1) return 1;
        const half = Math.floor(n / 2);
        let count = linearLogRecur(half) + linearLogRecur(half);
        for (let i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 線性對數階 */
    function linearLogRecur(n: number): number {
        if (n <= 1) return 1;
        const half = Math.floor(n / 2);
        let count = linearLogRecur(half) + linearLogRecur(half);
        for (let i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    /* 線性對數階 */
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
    ### 線性對數階 ###
    def linear_log_recur(n)
      return 1 unless n > 1

      count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
      (0...n).each { count += 1 }

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E6%80%A7%E5%B0%8D%E6%95%B8%E9%9A%8E%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20//%202%29%20%2B%20linear_log_recur%28n%20//%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E6%80%A7%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E6%80%A7%E5%B0%8D%E6%95%B8%E9%9A%8E%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20//%202%29%20%2B%20linear_log_recur%28n%20//%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22%E7%B7%9A%E6%80%A7%E5%B0%8D%E6%95%B8%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 2-13 呈現線性對數階的由來。這棵二元樹每一層的操作總數都是 $n$，整棵樹共有 $\log_2 n + 1$ 層，因此時間複雜度為 $O(n \log n)$。

![線性對數階的時間複雜度](time_complexity.assets/time_complexity_logarithmic_linear.svg){ class="animation-figure" }

<p align="center"> 圖 2-13 &nbsp; 線性對數階的時間複雜度 </p>

常見的排序演算法，其時間複雜度通常為 $O(n \log n)$，例如快速排序、合併排序與堆積排序。

### 7. &nbsp; 階乘階 $O(n!)$ {data-toc-label="7. &nbsp; 階乘階"}

階乘階對應數學上列舉「所有排列」的問題。給定 $n$ 個互不重複的元素，要列出所有可能的排列，其總數為：

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

階乘階的演算法通常以遞迴實作。如圖 2-14 與程式碼所示，第一層分出 $n$ 個分支，下一層各分出 $n - 1$ 個分支，依此類推，直到第 $n$ 層才停止分支：

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """階乘階（遞迴實作）"""
        if n == 0:
            return 1
        count = 0
        # 1 個呼叫分為 n 個
        for _ in range(n):
            count += factorial_recur(n - 1)
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* 階乘階（遞迴實作） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 1 個呼叫分為 n 個
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* 階乘階（遞迴實作） */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // 1 個呼叫分為 n 個
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* 階乘階（遞迴實作） */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // 1 個呼叫分為 n 個
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* 階乘階（遞迴實作） */
    func factorialRecur(n int) int {
        if n == 0 {
            return 1
        }
        count := 0
        // 1 個呼叫分為 n 個
        for i := 0; i < n; i++ {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* 階乘階（遞迴實作） */
    func factorialRecur(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var count = 0
        // 1 個呼叫分為 n 個
        for _ in 0 ..< n {
            count += factorialRecur(n: n - 1)
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* 階乘階（遞迴實作） */
    function factorialRecur(n) {
        if (n === 0) return 1;
        let count = 0;
        // 1 個呼叫分為 n 個
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* 階乘階（遞迴實作） */
    function factorialRecur(n: number): number {
        if (n === 0) return 1;
        let count = 0;
        // 1 個呼叫分為 n 個
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* 階乘階（遞迴實作） */
    int factorialRecur(int n) {
      if (n == 0) return 1;
      int count = 0;
      // 1 個呼叫分為 n 個
      for (var i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* 階乘階（遞迴實作） */
    fn factorial_recur(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let mut count = 0;
        // 1 個呼叫分為 n 個
        for _ in 0..n {
            count += factorial_recur(n - 1);
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* 階乘階（遞迴實作） */
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
    /* 階乘階（遞迴實作） */
    fun factorialRecur(n: Int): Int {
        if (n == 0)
            return 1
        var count = 0
        // 1 個呼叫分為 n 個
        for (i in 0..<n) {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### 階乘階（遞迴實作）###
    def factorial_recur(n)
      return 1 if n == 0

      count = 0
      # 1 個呼叫分為 n 個
      (0...n).each { count += factorial_recur(n - 1) }

      count
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E4%B9%98%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%201%20%E5%80%8B%E5%91%BC%E5%8F%AB%E5%88%86%E7%82%BA%20n%20%E5%80%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22%E9%9A%8E%E4%B9%98%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E4%B9%98%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%201%20%E5%80%8B%E5%91%BC%E5%8F%AB%E5%88%86%E7%82%BA%20n%20%E5%80%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22%E8%BC%B8%E5%85%A5%E8%A6%8F%E6%A8%A1%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22%E9%9A%8E%E4%B9%98%E9%9A%8E%EF%BC%88%E9%81%9E%E8%BF%B4%E5%AF%A6%E4%BD%9C%EF%BC%89%E7%9A%84%E6%93%8D%E4%BD%9C%E6%AC%A1%E6%95%B8%20%3D%22,%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

![階乘階的時間複雜度](time_complexity.assets/time_complexity_factorial.svg){ class="animation-figure" }

<p align="center"> 圖 2-14 &nbsp; 階乘階的時間複雜度 </p>

請留意，當 $n \geq 4$ 時，$n! > 2^n$ 恆成立，因此階乘階的成長比指數階更快。當 $n$ 較大時，這樣的耗時同樣令人難以接受。

## 2.3.5 &nbsp; 最差、最佳與平均時間複雜度

**演算法的時間效率往往會隨輸入資料的分布而改變**。假設輸入一個長度為 $n$ 的陣列 `nums`，`nums` 由 $1$ 到 $n$ 的數字組成，每個數字只出現一次，元素順序已隨機打亂。我們的任務是回傳元素 $1$ 的索引。由此可得到以下結論。

- 當 `nums = [?, ?, ..., 1]`，也就是最後一個元素為 $1$ 時，必須走訪整個陣列，**達到最差時間複雜度 $O(n)$**。
- 當 `nums = [1, ?, ?, ...]`，也就是第一個元素為 $1$ 時，無論陣列多長，都不需要繼續走訪，**達到最佳時間複雜度 $\Omega(1)$**。

「最差時間複雜度」對應函數的漸近上界，以大 $O$ 記號表示。相應地，「最佳時間複雜度」對應函數的漸近下界，以 $\Omega$ 記號表示：

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """建立含有 1, 2, ..., n 的陣列，並打亂順序"""
        # 建立陣列 nums = 1, 2, 3, ..., n
        nums = [i for i in range(1, n + 1)]
        # 隨機打亂陣列元素
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """在陣列 nums 中尋找數字 1 的索引"""
        for i in range(len(nums)):
            # 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            # 若 1 在陣列末端，最差時間複雜度為 O(n)
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 以系統時間產生亂數種子
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // 隨機打亂陣列元素
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 隨機打亂陣列元素
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 隨機打亂陣列元素
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    func randomNumbers(n int) []int {
        nums := make([]int, n)
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for i := 0; i < n; i++ {
            nums[i] = i + 1
        }
        // 隨機打亂陣列元素
        rand.Shuffle(len(nums), func(i, j int) {
            nums[i], nums[j] = nums[j], nums[i]
        })
        return nums
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    func findOne(nums []int) int {
        for i := 0; i < len(nums); i++ {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    func randomNumbers(n: Int) -> [Int] {
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        var nums = Array(1 ... n)
        // 隨機打亂陣列元素
        nums.shuffle()
        return nums
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    func findOne(nums: [Int]) -> Int {
        for i in nums.indices {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    function randomNumbers(n) {
        const nums = Array(n);
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 隨機打亂陣列元素
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    function findOne(nums) {
        for (let i = 0; i < nums.length; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    function randomNumbers(n: number): number[] {
        const nums = Array(n);
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 隨機打亂陣列元素
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    function findOne(nums: number[]): number {
        for (let i = 0; i < nums.length; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    List<int> randomNumbers(int n) {
      final nums = List.filled(n, 0);
      // 建立陣列 nums = { 1, 2, 3, ..., n }
      for (var i = 0; i < n; i++) {
        nums[i] = i + 1;
      }
      // 隨機打亂陣列元素
      nums.shuffle();

      return nums;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    int findOne(List<int> nums) {
      for (var i = 0; i < nums.length; i++) {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if (nums[i] == 1) return i;
      }

      return -1;
    }
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    fn random_numbers(n: i32) -> Vec<i32> {
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        let mut nums = (1..=n).collect::<Vec<i32>>();
        // 隨機打亂陣列元素
        nums.shuffle(&mut thread_rng());
        nums
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    fn find_one(nums: &[i32]) -> Option<usize> {
        for i in 0..nums.len() {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if nums[i] == 1 {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    int *randomNumbers(int n) {
        // 在堆積區配置記憶體（建立一維變長陣列，內含 n 個 int 型別的元素）
        int *nums = (int *)malloc(n * sizeof(int));
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 隨機打亂陣列元素
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        return nums;
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    int findOne(int *nums, int n) {
        for (int i = 0; i < n; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="worst_best_time_complexity.kt"
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    fun randomNumbers(n: Int): Array<Int?> {
        val nums = IntArray(n)
        // 建立陣列 nums = { 1, 2, 3, ..., n }
        for (i in 0..<n) {
            nums[i] = i + 1
        }
        // 隨機打亂陣列元素
        nums.shuffle()
        val res = arrayOfNulls<Int>(n)
        for (i in 0..<n) {
            res[i] = nums[i]
        }
        return res
    }

    /* 在陣列 nums 中尋找數字 1 的索引 */
    fun findOne(nums: Array<Int?>): Int {
        for (i in nums.indices) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="worst_best_time_complexity.rb"
    ### 建立含有 1, 2, ..., n 的陣列，並打亂順序 ###
    def random_numbers(n)
      # 建立陣列 nums = 1, 2, 3, ..., n
      nums = Array.new(n) { |i| i + 1 }
      # 隨機打亂陣列元素
      nums.shuffle!
    end

    ### 在陣列 nums 中尋找數字 1 的索引 ###
    def find_one(nums)
      for i in 0...nums.length
        # 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        # 若 1 在陣列末端，最差時間複雜度為 O(n)
        return i if nums[i] == 1
      end

      -1
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E7%AB%8B%E5%90%AB%E6%9C%89%201,%202,%20...,%20n%20%E7%9A%84%E9%99%A3%E5%88%97%EF%BC%8C%E4%B8%A6%E6%89%93%E4%BA%82%E9%A0%86%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E9%99%A3%E5%88%97%20nums%20%3D%201,%202,%203,%20...,%20n%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281,%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E9%9A%A8%E6%A9%9F%E6%89%93%E4%BA%82%E9%99%A3%E5%88%97%E5%85%83%E7%B4%A0%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E9%99%A3%E5%88%97%20nums%20%E4%B8%AD%E5%B0%8B%E6%89%BE%E6%95%B8%E5%AD%97%201%20%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%201%20%E5%9C%A8%E9%99%A3%E5%88%97%E9%96%8B%E9%A0%AD%EF%BC%8C%E6%9C%80%E4%BD%B3%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%281%29%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%201%20%E5%9C%A8%E9%99%A3%E5%88%97%E6%9C%AB%E7%AB%AF%EF%BC%8C%E6%9C%80%E5%B7%AE%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%29%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5Cn%E9%99%A3%E5%88%97%20%5B%201,%202,%20...,%20n%20%5D%20%E6%89%93%E4%BA%82%E9%A0%86%E5%BA%8F%E5%BE%8C%20%3D%22,%20nums%29%0A%20%20%20%20print%28%22%E6%95%B8%E5%AD%97%201%20%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E7%AB%8B%E5%90%AB%E6%9C%89%201,%202,%20...,%20n%20%E7%9A%84%E9%99%A3%E5%88%97%EF%BC%8C%E4%B8%A6%E6%89%93%E4%BA%82%E9%A0%86%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E9%99%A3%E5%88%97%20nums%20%3D%201,%202,%203,%20...,%20n%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281,%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E9%9A%A8%E6%A9%9F%E6%89%93%E4%BA%82%E9%99%A3%E5%88%97%E5%85%83%E7%B4%A0%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9C%A8%E9%99%A3%E5%88%97%20nums%20%E4%B8%AD%E5%B0%8B%E6%89%BE%E6%95%B8%E5%AD%97%201%20%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%201%20%E5%9C%A8%E9%99%A3%E5%88%97%E9%96%8B%E9%A0%AD%EF%BC%8C%E6%9C%80%E4%BD%B3%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%281%29%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%201%20%E5%9C%A8%E9%99%A3%E5%88%97%E6%9C%AB%E7%AB%AF%EF%BC%8C%E6%9C%80%E5%B7%AE%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%29%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5Cn%E9%99%A3%E5%88%97%20%5B%201,%202,%20...,%20n%20%5D%20%E6%89%93%E4%BA%82%E9%A0%86%E5%BA%8F%E5%BE%8C%20%3D%22,%20nums%29%0A%20%20%20%20print%28%22%E6%95%B8%E5%AD%97%201%20%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

實務上很少使用最佳時間複雜度，因為出現最佳情況的機率通常很低，用來判斷效率可能造成誤解。**最差時間複雜度更實用，因為它給出了保守的效能界限**，讓我們可以放心使用演算法。

從上例可以看出，最差與最佳時間複雜度都只出現在特定的資料分布下。這些情況可能很少出現，難以如實反映演算法的執行效率。相較之下，**平均時間複雜度能呈現演算法在隨機輸入下的執行效率**，以 $\Theta$ 記號表示。

有些演算法在隨機資料分布下的平均表現很容易推算。以上例來說，輸入陣列已隨機打亂，因此元素 $1$ 出現在各個索引的機率相同。平均迴圈次數是陣列長度的一半 $n / 2$，平均時間複雜度為 $\Theta(n / 2) = \Theta(n)$。

但對較複雜的演算法來說，要根據資料分布算出整體的期望值並不容易，因此平均時間複雜度往往很難計算。這時我們通常以最差時間複雜度作為評估效率的標準。

!!! question "為什麼很少看到 $\Theta$ 記號？"

    也許是因為 $O$ 記號念起來太順口，我們也常用它表示平均時間複雜度。嚴格來說，這種寫法並不規範。在本書或其他資料中，若看到「平均時間複雜度 $O(n)$」這類說法，請直接理解為 $\Theta(n)$。
