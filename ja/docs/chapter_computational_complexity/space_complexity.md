---
comments: true
---

# 2.4 &nbsp; 空間計算量

<u>空間計算量（space complexity）</u>は、アルゴリズムが占有するメモリ空間がデータ量の増加に伴ってどのように増えるかを測る指標です。この概念は時間計算量と非常によく似ており、「実行時間」を「占有メモリ空間」に置き換えるだけです。

## 2.4.1 &nbsp; アルゴリズムに関連する空間

アルゴリズムが実行中に使用するメモリ空間には、主に次の種類があります。

- **入力空間**：アルゴリズムの入力データを格納するための空間。
- **一時空間**：アルゴリズムの実行中に使用する変数、オブジェクト、関数コンテキストなどのデータを格納するための空間。
- **出力空間**：アルゴリズムの出力データを格納するための空間。

一般に、空間計算量の集計範囲は「一時空間」と「出力空間」を合わせたものです。

一時空間はさらに三つに分けられます。

- **一時データ**：アルゴリズム実行中の各種定数、変数、オブジェクトなどを保存するための空間。
- **スタックフレーム空間**：呼び出された関数のコンテキストデータを保存するための空間。システムは関数を呼び出すたびにスタックの先頭にスタックフレームを作成し、関数が戻るとその空間を解放します。
- **命令空間**：コンパイル後のプログラム命令を保存するための空間で、実際の集計では通常無視されます。

プログラムの空間計算量を分析する際には、**通常、一時データ、スタックフレーム空間、出力データの三つを数えます**。以下の図に示すとおりです。

![アルゴリズムで使用される関連空間](space_complexity.assets/space_types.png){ class="animation-figure" }

<p align="center"> 図 2-15 &nbsp; アルゴリズムで使用される関連空間 </p>

関連するコードを以下に示します。

=== "Python"

    ```python title=""
    class Node:
        """クラス"""
        def __init__(self, x: int):
            self.val: int = x              # ノードの値
            self.next: Node | None = None  # 次のノードへの参照

    def function() -> int:
        """関数"""
        # いくつかの処理を実行...
        return 0

    def algorithm(n) -> int:  # 入力データ
        A = 0                 # 一時データ（定数。一般に大文字で表す）
        b = 0                 # 一時データ（変数）
        node = Node(0)        # 一時データ（オブジェクト）
        c = function()        # スタックフレーム空間（関数呼び出し）
        return A + b + c      # 出力データ
    ```

=== "C++"

    ```cpp title=""
    /* 構造体 */
    struct Node {
        int val;
        Node *next;
        Node(int x) : val(x), next(nullptr) {}
    };

    /* 関数 */
    int func() {
        // いくつかの処理を実行...
        return 0;
    }

    int algorithm(int n) {        // 入力データ
        const int a = 0;          // 一時データ（定数）
        int b = 0;                // 一時データ（変数）
        Node* node = new Node(0); // 一時データ（オブジェクト）
        int c = func();           // スタックフレーム空間（関数呼び出し）
        return a + b + c;         // 出力データ
    }
    ```

=== "Java"

    ```java title=""
    /* クラス */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }
    
    /* 関数 */
    int function() {
        // いくつかの処理を実行...
        return 0;
    }
    
    int algorithm(int n) {        // 入力データ
        final int a = 0;          // 一時データ（定数）
        int b = 0;                // 一時データ（変数）
        Node node = new Node(0);  // 一時データ（オブジェクト）
        int c = function();       // スタックフレーム空間（関数呼び出し）
        return a + b + c;         // 出力データ
    }
    ```

=== "C#"

    ```csharp title=""
    /* クラス */
    class Node(int x) {
        int val = x;
        Node next;
    }

    /* 関数 */
    int Function() {
        // いくつかの処理を実行...
        return 0;
    }

    int Algorithm(int n) {        // 入力データ
        const int a = 0;          // 一時データ（定数）
        int b = 0;                // 一時データ（変数）
        Node node = new(0);       // 一時データ（オブジェクト）
        int c = Function();       // スタックフレーム空間（関数呼び出し）
        return a + b + c;         // 出力データ
    }
    ```

=== "Go"

    ```go title=""
    /* 構造体 */
    type node struct {
        val  int
        next *node
    }

    /* node 構造体を作成 */
    func newNode(val int) *node {
        return &node{val: val}
    }
    
    /* 関数 */
    func function() int {
        // いくつかの処理を実行...
        return 0
    }

    func algorithm(n int) int { // 入力データ
        const a = 0             // 一時データ（定数）
        b := 0                  // 一時データ（変数）
        newNode(0)              // 一時データ（オブジェクト）
        c := function()         // スタックフレーム空間（関数呼び出し）
        return a + b + c        // 出力データ
    }
    ```

=== "Swift"

    ```swift title=""
    /* クラス */
    class Node {
        var val: Int
        var next: Node?

        init(x: Int) {
            val = x
        }
    }

    /* 関数 */
    func function() -> Int {
        // いくつかの処理を実行...
        return 0
    }

    func algorithm(n: Int) -> Int { // 入力データ
        let a = 0             // 一時データ（定数）
        var b = 0             // 一時データ（変数）
        let node = Node(x: 0) // 一時データ（オブジェクト）
        let c = function()    // スタックフレーム空間（関数呼び出し）
        return a + b + c      // 出力データ
    }
    ```

=== "JS"

    ```javascript title=""
    /* クラス */
    class Node {
        val;
        next;
        constructor(val) {
            this.val = val === undefined ? 0 : val; // ノードの値
            this.next = null;                       // 次のノードへの参照
        }
    }

    /* 関数 */
    function constFunc() {
        // いくつかの処理を実行
        return 0;
    }

    function algorithm(n) {       // 入力データ
        const a = 0;              // 一時データ（定数）
        let b = 0;                // 一時データ（変数）
        const node = new Node(0); // 一時データ（オブジェクト）
        const c = constFunc();    // スタックフレーム空間（関数呼び出し）
        return a + b + c;         // 出力データ
    }
    ```

=== "TS"

    ```typescript title=""
    /* クラス */
    class Node {
        val: number;
        next: Node | null;
        constructor(val?: number) {
            this.val = val === undefined ? 0 : val; // ノードの値
            this.next = null;                       // 次のノードへの参照
        }
    }

    /* 関数 */
    function constFunc(): number {
        // いくつかの処理を実行
        return 0;
    }

    function algorithm(n: number): number { // 入力データ
        const a = 0;                        // 一時データ（定数）
        let b = 0;                          // 一時データ（変数）
        const node = new Node(0);           // 一時データ（オブジェクト）
        const c = constFunc();              // スタックフレーム空間（関数呼び出し）
        return a + b + c;                   // 出力データ
    }
    ```

=== "Dart"

    ```dart title=""
    /* クラス */
    class Node {
      int val;
      Node next;
      Node(this.val, [this.next]);
    }

    /* 関数 */
    int function() {
      // いくつかの処理を実行...
      return 0;
    }

    int algorithm(int n) {  // 入力データ
      const int a = 0;      // 一時データ（定数）
      int b = 0;            // 一時データ（変数）
      Node node = Node(0);  // 一時データ（オブジェクト）
      int c = function();   // スタックフレーム空間（関数呼び出し）
      return a + b + c;     // 出力データ
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    
    /* 構造体 */
    struct Node {
        val: i32,
        next: Option<Rc<RefCell<Node>>>,
    }

    /* Node 構造体を作成 */
    impl Node {
        fn new(val: i32) -> Self {
            Self { val: val, next: None }
        }
    }

    /* 関数 */
    fn function() -> i32 {      
        // いくつかの処理を実行...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {       // 入力データ
        const a: i32 = 0;               // 一時データ（定数）
        let mut b = 0;                  // 一時データ（変数）
        let node = Node::new(0);        // 一時データ（オブジェクト）
        let c = function();             // スタックフレーム空間（関数呼び出し）
        return a + b + c;               // 出力データ
    }
    ```

=== "C"

    ```c title=""
    /* 関数 */
    int func() {
        // いくつかの処理を実行...
        return 0;
    }

    int algorithm(int n) { // 入力データ
        const int a = 0;   // 一時データ（定数）
        int b = 0;         // 一時データ（変数）
        int c = func();    // スタックフレーム空間（関数呼び出し）
        return a + b + c;  // 出力データ
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* クラス */
    class Node(var _val: Int) {
        var next: Node? = null
    }

    /* 関数 */
    fun function(): Int {
        // いくつかの処理を実行...
        return 0
    }

    fun algorithm(n: Int): Int { // 入力データ
        val a = 0                // 一時データ（定数）
        var b = 0                // 一時データ（変数）
        val node = Node(0)       // 一時データ（オブジェクト）
        val c = function()       // スタックフレーム空間（関数呼び出し）
        return a + b + c         // 出力データ
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### クラス ###
    class Node
        attr_accessor :val      # ノードの値
        attr_accessor :next     # 次のノードへの参照

        def initialize(x)
            @val = x
        end
    end

    ### 関数 ###
    def function
        # いくつかの処理を実行...
        0
    end

    ### アルゴリズム ###
    def algorithm(n)        # 入力データ
        a = 0               # 一時データ（定数）
        b = 0               # 一時データ（変数）
        node = Node.new(0)  # 一時データ（オブジェクト）
        c = function        # スタックフレーム空間（関数呼び出し）
        a + b + c           # 出力データ
    end
    ```

## 2.4.2 &nbsp; 推定方法

空間計算量の推定方法は時間計算量とおおむね同じで、数える対象を「操作回数」から「使用空間の大きさ」に変えるだけです。

ただし時間計算量と異なり、**通常は最悪空間計算量だけに注目します**。メモリ空間は厳格な要件であり、どの入力データに対しても十分なメモリを確保できることを保証しなければならないからです。

以下のコードを見ると、最悪空間計算量における「最悪」には二つの意味があります。

1. **最悪の入力データを基準にする**：$n < 10$ のとき空間計算量は $O(1)$ ですが、$n > 10$ のとき初期化される配列 `nums` が $O(n)$ の空間を占有するため、最悪空間計算量は $O(n)$ です。
2. **アルゴリズム実行中のメモリ使用量のピークを基準にする**：例えば、プログラムは最後の行を実行する前までは $O(1)$ の空間しか使いませんが、配列 `nums` を初期化するときには $O(n)$ の空間を占有するため、最悪空間計算量は $O(n)$ です。

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

**再帰関数では、スタックフレーム空間の集計に注意が必要です**。以下のコードを見てみましょう。

=== "Python"

    ```python title=""
    def function() -> int:
        # いくつかの処理を実行
        return 0

    def loop(n: int):
        """ループの空間計算量は O(1)"""
        for _ in range(n):
            function()

    def recur(n: int):
        """再帰の空間計算量は O(n)"""
        if n == 1:
            return
        return recur(n - 1)
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 再帰の空間計算量は O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Java"

    ```java title=""
    int function() {
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* 再帰の空間計算量は O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int Function() {
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    void Loop(int n) {
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    /* 再帰の空間計算量は O(n) */
    int Recur(int n) {
        if (n == 1) return 1;
        return Recur(n - 1);
    }
    ```

=== "Go"

    ```go title=""
    func function() int {
        // いくつかの処理を実行
        return 0
    }
    
    /* ループの空間計算量は O(1) */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
    
    /* 再帰の空間計算量は O(n) */
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
        // いくつかの処理を実行
        return 0
    }

    /* ループの空間計算量は O(1) */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* 再帰の空間計算量は O(n) */
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
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 再帰の空間計算量は O(n) */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TS"

    ```typescript title=""
    function constFunc(): number {
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 再帰の空間計算量は O(n) */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "Dart"

    ```dart title=""
    int function() {
      // いくつかの処理を実行
      return 0;
    }
    /* ループの空間計算量は O(1) */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* 再帰の空間計算量は O(n) */
    void recur(int n) {
      if (n == 1) return;
      recur(n - 1);
    }
    ```

=== "Rust"

    ```rust title=""
    fn function() -> i32 {
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    fn loop(n: i32) {
        for i in 0..n {
            function();
        }
    }
    /* 再帰の空間計算量は O(n) */
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
        // いくつかの処理を実行
        return 0;
    }
    /* ループの空間計算量は O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 再帰の空間計算量は O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun function(): Int {
        // いくつかの処理を実行
        return 0
    }
    /* ループの空間計算量は O(1) */
    fun loop(n: Int) {
        for (i in 0..<n) {
            function()
        }
    }
    /* 再帰の空間計算量は O(n) */
    fun recur(n: Int) {
        if (n == 1) return
        return recur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title=""
    def function
        # いくつかの処理を実行
        0
    end

    ### ループの空間計算量は O(1) ###
    def loop(n)
        (0...n).each { function }
    end

    ### 再帰の空間計算量は O(n) ###
    def recur(n)
        return if n == 1
        recur(n - 1)
    end
    ```

関数 `loop()` と `recur()` はどちらも時間計算量は $O(n)$ ですが、空間計算量は異なります。

- 関数 `loop()` はループの中で `function()` を $n$ 回呼び出しますが、各反復での `function()` は戻るたびにスタックフレーム空間が解放されるため、空間計算量は依然として $O(1)$ です。
- 再帰関数 `recur()` は実行中に未返却の `recur()` が同時に $n$ 個存在するため、$O(n)$ のスタックフレーム空間を占有します。

## 2.4.3 &nbsp; よくある型

入力データサイズを $n$ とすると、以下の図はよくある空間計算量の型を低い順から高い順に示しています。

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
& \text{定数階} < \text{対数階} < \text{線形階} < \text{平方階} < \text{指数階}
\end{aligned}
$$

![よくある空間計算量の型](space_complexity.assets/space_complexity_common_types.png){ class="animation-figure" }

<p align="center"> 図 2-16 &nbsp; よくある空間計算量の型 </p>

### 1. &nbsp; 定数階 $O(1)$ {data-toc-label="1. &nbsp; 定数階"}

定数階は、個数が入力データサイズ $n$ に依存しない定数、変数、オブジェクトなどによく現れます。

注意すべき点として、ループ内で変数を初期化したり関数を呼び出したりして使用されたメモリは、次の反復に入ると解放されるため、空間の占有は累積せず、空間計算量は依然として $O(1)$ です。

=== "Python"

    ```python title="space_complexity.py"
    def function() -> int:
        """関数"""
        # 何らかの処理を行う
        return 0

    def constant(n: int):
        """定数階"""
        # 定数、変数、オブジェクトは O(1) の空間を占める
        a = 0
        nums = [0] * 10000
        node = ListNode(0)
        # ループ内の変数は O(1) の空間を占める
        for _ in range(n):
            c = 0
        # ループ内の関数は O(1) の空間を占める
        for _ in range(n):
            function()
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 関数 */
    int func() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    void constant(int n) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        const int a = 0;
        int b = 0;
        vector<int> nums(10000);
        ListNode node(0);
        // ループ内の変数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 関数 */
    int function() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    void constant(int n) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // ループ内の変数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 関数 */
    int Function() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    void Constant(int n) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // ループ内の変数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 関数 */
    func function() int {
        // いくつかの操作を実行...
        return 0
    }

    /* 定数階 */
    func spaceConstant(n int) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        const a = 0
        b := 0
        nums := make([]int, 10000)
        node := newNode(0)
        // ループ内の変数は O(1) の空間を占める
        var c int
        for i := 0; i < n; i++ {
            c = 0
        }
        // ループ内の関数は O(1) の空間を占める
        for i := 0; i < n; i++ {
            function()
        }
        b += 0
        c += 0
        nums[0] = 0
        node.val = 0
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 関数 */
    @discardableResult
    func function() -> Int {
        // 何らかの処理を行う
        return 0
    }

    /* 定数階 */
    func constant(n: Int) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        let a = 0
        var b = 0
        let nums = Array(repeating: 0, count: 10000)
        let node = ListNode(x: 0)
        // ループ内の変数は O(1) の空間を占める
        for _ in 0 ..< n {
            let c = 0
        }
        // ループ内の関数は O(1) の空間を占める
        for _ in 0 ..< n {
            function()
        }
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 関数 */
    function constFunc() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    function constant(n) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // ループ内の変数は O(1) の空間を占める
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 関数 */
    function constFunc(): number {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    function constant(n: number): void {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // ループ内の変数は O(1) の空間を占める
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 関数 */
    int function() {
      // 何らかの処理を行う
      return 0;
    }

    /* 定数階 */
    void constant(int n) {
      // 定数、変数、オブジェクトは O(1) の空間を占める
      final int a = 0;
      int b = 0;
      List<int> nums = List.filled(10000, 0);
      ListNode node = ListNode(0);
      // ループ内の変数は O(1) の空間を占める
      for (var i = 0; i < n; i++) {
        int c = 0;
      }
      // ループ内の関数は O(1) の空間を占める
      for (var i = 0; i < n; i++) {
        function();
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 関数 */
    fn function() -> i32 {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    #[allow(unused)]
    fn constant(n: i32) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        const A: i32 = 0;
        let b = 0;
        let nums = vec![0; 10000];
        let node = ListNode::new(0);
        // ループ内の変数は O(1) の空間を占める
        for i in 0..n {
            let c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for i in 0..n {
            function();
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 関数 */
    int func() {
        // 何らかの処理を行う
        return 0;
    }

    /* 定数階 */
    void constant(int n) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        const int a = 0;
        int b = 0;
        int nums[1000];
        ListNode *node = newListNode(0);
        free(node);
        // ループ内の変数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の空間を占める
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 関数 */
    fun function(): Int {
        // 何らかの処理を行う
        return 0
    }

    /* 定数階 */
    fun constant(n: Int) {
        // 定数、変数、オブジェクトは O(1) の空間を占める
        val a = 0
        var b = 0
        val nums = Array(10000) { 0 }
        val node = ListNode(0)
        // ループ内の変数は O(1) の空間を占める
        for (i in 0..<n) {
            val c = 0
        }
        // ループ内の関数は O(1) の空間を占める
        for (i in 0..<n) {
            function()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 関数 ###
    def function
      # 何らかの処理を行う
      0
    end

    ### 定数階 ###
    def constant(n)
      # 定数、変数、オブジェクトは O(1) の空間を占める
      a = 0
      nums = [0] * 10000
      node = ListNode.new

      # ループ内の変数は O(1) の空間を占める
      (0...n).each { c = 0 }
      # ループ内の関数は O(1) の空間を占める
      (0...n).each { function }
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20%23%20%E4%BD%95%E3%82%89%E3%81%8B%E3%81%AE%E5%87%A6%E7%90%86%E3%82%92%E8%A1%8C%E3%81%86%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%AE%9A%E6%95%B0%E9%9A%8E%22%22%22%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E3%80%81%E5%A4%89%E6%95%B0%E3%80%81%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%20O%281%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E5%8D%A0%E3%82%81%E3%82%8B%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E5%A4%89%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E5%8D%A0%E3%82%81%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E9%96%A2%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E5%8D%A0%E3%82%81%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E9%9A%8E%0A%20%20%20%20constant%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20%23%20%E4%BD%95%E3%82%89%E3%81%8B%E3%81%AE%E5%87%A6%E7%90%86%E3%82%92%E8%A1%8C%E3%81%86%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%AE%9A%E6%95%B0%E9%9A%8E%22%22%22%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E3%80%81%E5%A4%89%E6%95%B0%E3%80%81%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%20O%281%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E5%8D%A0%E3%82%81%E3%82%8B%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E5%A4%89%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E5%8D%A0%E3%82%81%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E9%96%A2%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E5%8D%A0%E3%82%81%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E9%9A%8E%0A%20%20%20%20constant%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 2. &nbsp; 線形階 $O(n)$ {data-toc-label="2. &nbsp; 線形階"}

線形階は、要素数が $n$ に比例する配列、連結リスト、スタック、キューなどによく現れます。

=== "Python"

    ```python title="space_complexity.py"
    def linear(n: int):
        """線形階"""
        # 長さ n のリストは O(n) の空間を使用
        nums = [0] * n
        # 長さ n のハッシュテーブルは O(n) の空間を使用
        hmap = dict[int, str]()
        for i in range(n):
            hmap[i] = str(i)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 線形階 */
    void linear(int n) {
        // 長さ n の配列は O(n) の空間を使用
        vector<int> nums(n);
        // 長さ n のリストは O(n) の空間を使用
        vector<ListNode> nodes;
        for (int i = 0; i < n; i++) {
            nodes.push_back(ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        unordered_map<int, string> map;
        for (int i = 0; i < n; i++) {
            map[i] = to_string(i);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 線形階 */
    void linear(int n) {
        // 長さ n の配列は O(n) の空間を使用
        int[] nums = new int[n];
        // 長さ n のリストは O(n) の空間を使用
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 線形階 */
    void Linear(int n) {
        // 長さ n の配列は O(n) の空間を使用
        int[] nums = new int[n];
        // 長さ n のリストは O(n) の空間を使用
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 線形階 */
    func spaceLinear(n int) {
        // 長さ n の配列は O(n) の空間を使用
        _ = make([]int, n)
        // 長さ n のリストは O(n) の空間を使用
        var nodes []*node
        for i := 0; i < n; i++ {
            nodes = append(nodes, newNode(i))
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        m := make(map[int]string, n)
        for i := 0; i < n; i++ {
            m[i] = strconv.Itoa(i)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 線形階 */
    func linear(n: Int) {
        // 長さ n の配列は O(n) の空間を使用
        let nums = Array(repeating: 0, count: n)
        // 長さ n のリストは O(n) の空間を使用
        let nodes = (0 ..< n).map { ListNode(x: $0) }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 線形階 */
    function linear(n) {
        // 長さ n の配列は O(n) の空間を使用
        const nums = new Array(n);
        // 長さ n のリストは O(n) の空間を使用
        const nodes = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 線形階 */
    function linear(n: number): void {
        // 長さ n の配列は O(n) の空間を使用
        const nums = new Array(n);
        // 長さ n のリストは O(n) の空間を使用
        const nodes: ListNode[] = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 線形階 */
    void linear(int n) {
      // 長さ n の配列は O(n) の空間を使用
      List<int> nums = List.filled(n, 0);
      // 長さ n のリストは O(n) の空間を使用
      List<ListNode> nodes = [];
      for (var i = 0; i < n; i++) {
        nodes.add(ListNode(i));
      }
      // 長さ n のハッシュテーブルは O(n) の空間を使用
      Map<int, String> map = HashMap();
      for (var i = 0; i < n; i++) {
        map.putIfAbsent(i, () => i.toString());
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 線形階 */
    #[allow(unused)]
    fn linear(n: i32) {
        // 長さ n の配列は O(n) の空間を使用
        let mut nums = vec![0; n as usize];
        // 長さ n のリストは O(n) の空間を使用
        let mut nodes = Vec::new();
        for i in 0..n {
            nodes.push(ListNode::new(i))
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        let mut map = HashMap::new();
        for i in 0..n {
            map.insert(i, i.to_string());
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* ハッシュテーブル */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // uthash.h を用いて実装
    } HashTable;

    /* 線形階 */
    void linear(int n) {
        // 長さ n の配列は O(n) の空間を使用
        int *nums = malloc(sizeof(int) * n);
        free(nums);

        // 長さ n のリストは O(n) の空間を使用
        ListNode **nodes = malloc(sizeof(ListNode *) * n);
        for (int i = 0; i < n; i++) {
            nodes[i] = newListNode(i);
        }
        // メモリを解放する
        for (int i = 0; i < n; i++) {
            free(nodes[i]);
        }
        free(nodes);

        // 長さ n のハッシュテーブルは O(n) の空間を使用
        HashTable *h = NULL;
        for (int i = 0; i < n; i++) {
            HashTable *tmp = malloc(sizeof(HashTable));
            tmp->key = i;
            tmp->val = i;
            HASH_ADD_INT(h, key, tmp);
        }

        // メモリを解放する
        HashTable *curr, *tmp;
        HASH_ITER(hh, h, curr, tmp) {
            HASH_DEL(h, curr);
            free(curr);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 線形階 */
    fun linear(n: Int) {
        // 長さ n の配列は O(n) の空間を使用
        val nums = Array(n) { 0 }
        // 長さ n のリストは O(n) の空間を使用
        val nodes = mutableListOf<ListNode>()
        for (i in 0..<n) {
            nodes.add(ListNode(i))
        }
        // 長さ n のハッシュテーブルは O(n) の空間を使用
        val map = mutableMapOf<Int, String>()
        for (i in 0..<n) {
            map[i] = i.toString()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 線形階 ###
    def linear(n)
      # 長さ n のリストは O(n) の空間を使用
      nums = Array.new(n, 0)

      # 長さ n のハッシュテーブルは O(n) の空間を使用
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E9%9A%8E%22%22%22%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E4%BD%BF%E7%94%A8%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AF%20O%28n%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E4%BD%BF%E7%94%A8%0A%20%20%20%20hmap%20%3D%20dict%5Bint%2C%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E9%9A%8E%0A%20%20%20%20linear%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E9%9A%8E%22%22%22%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E4%BD%BF%E7%94%A8%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AF%20O%28n%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E4%BD%BF%E7%94%A8%0A%20%20%20%20hmap%20%3D%20dict%5Bint%2C%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E9%9A%8E%0A%20%20%20%20linear%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

以下の図に示すように、この関数の再帰の深さは $n$ であり、同時に $n$ 個の未返却 `linear_recur()` 関数が存在するため、$O(n)$ のスタックフレーム空間を使用します。

=== "Python"

    ```python title="space_complexity.py"
    def linear_recur(n: int):
        """線形時間（再帰実装）"""
        print("再帰 n =", n)
        if n == 1:
            return
        linear_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 線形時間（再帰実装） */
    void linearRecur(int n) {
        cout << "再帰 n = " << n << endl;
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 線形時間（再帰実装） */
    void linearRecur(int n) {
        System.out.println("再帰 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 線形時間（再帰実装） */
    void LinearRecur(int n) {
        Console.WriteLine("再帰 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 線形時間（再帰実装） */
    func spaceLinearRecur(n int) {
        fmt.Println("再帰 n =", n)
        if n == 1 {
            return
        }
        spaceLinearRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 線形時間（再帰実装） */
    func linearRecur(n: Int) {
        print("再帰 n = \(n)")
        if n == 1 {
            return
        }
        linearRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 線形時間（再帰実装） */
    function linearRecur(n) {
        console.log(`再帰 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 線形時間（再帰実装） */
    function linearRecur(n: number): void {
        console.log(`再帰 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 線形時間（再帰実装） */
    void linearRecur(int n) {
      print('再帰 n = $n');
      if (n == 1) return;
      linearRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 線形時間（再帰実装） */
    fn linear_recur(n: i32) {
        println!("再帰 n = {}", n);
        if n == 1 {
            return;
        };
        linear_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 線形時間（再帰実装） */
    void linearRecur(int n) {
        printf("再帰 n = %d\r\n", n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 線形時間（再帰実装） */
    fun linearRecur(n: Int) {
        println("再帰 n = $n")
        if (n == 1)
            return
        linearRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 線形階 ###
    def linear(n)
      # 長さ n のリストは O(n) の空間を使用
      nums = Array.new(n, 0)

      # 長さ n のハッシュテーブルは O(n) の空間を使用
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end

    # ## 線形階（再帰実装）###
    def linear_recur(n)
      puts "再帰 n = #{n}"
      return if n == 1
      linear_recur(n - 1)
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E6%99%82%E9%96%93%EF%BC%88%E5%86%8D%E5%B8%B0%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20print%28%22%E5%86%8D%E5%B8%B0%20n%20%3D%22%2C%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E9%9A%8E%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E6%99%82%E9%96%93%EF%BC%88%E5%86%8D%E5%B8%B0%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20print%28%22%E5%86%8D%E5%B8%B0%20n%20%3D%22%2C%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E9%9A%8E%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

![再帰関数が生み出す線形階の空間計算量](space_complexity.assets/space_complexity_recursive_linear.png){ class="animation-figure" }

<p align="center"> 図 2-17 &nbsp; 再帰関数が生み出す線形階の空間計算量 </p>

### 3. &nbsp; 平方階 $O(n^2)$ {data-toc-label="3. &nbsp; 平方階"}

平方階は、要素数が $n$ の二乗に比例する行列やグラフによく現れます。

=== "Python"

    ```python title="space_complexity.py"
    def quadratic(n: int):
        """二乗階"""
        # 二次元リストは O(n^2) の空間を使用
        num_matrix = [[0] * n for _ in range(n)]
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 二乗階 */
    void quadratic(int n) {
        // 二次元リストは O(n^2) の空間を使用
        vector<vector<int>> numMatrix;
        for (int i = 0; i < n; i++) {
            vector<int> tmp;
            for (int j = 0; j < n; j++) {
                tmp.push_back(0);
            }
            numMatrix.push_back(tmp);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 二乗階 */
    void quadratic(int n) {
        // 行列は O(n^2) の空間を使用する
        int[][] numMatrix = new int[n][n];
        // 二次元リストは O(n^2) の空間を使用
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 二乗階 */
    void Quadratic(int n) {
        // 行列は O(n^2) の空間を使用する
        int[,] numMatrix = new int[n, n];
        // 二次元リストは O(n^2) の空間を使用
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 二乗階 */
    func spaceQuadratic(n int) {
        // 行列は O(n^2) の空間を使用する
        numMatrix := make([][]int, n)
        for i := 0; i < n; i++ {
            numMatrix[i] = make([]int, n)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 二乗階 */
    func quadratic(n: Int) {
        // 二次元リストは O(n^2) の空間を使用
        let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 二乗階 */
    function quadratic(n) {
        // 行列は O(n^2) の空間を使用する
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 二次元リストは O(n^2) の空間を使用
        const numList = [];
        for (let i = 0; i < n; i++) {
            const tmp = [];
            for (let j = 0; j < n; j++) {
                tmp.push(0);
            }
            numList.push(tmp);
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 二乗階 */
    function quadratic(n: number): void {
        // 行列は O(n^2) の空間を使用する
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 二次元リストは O(n^2) の空間を使用
        const numList = [];
        for (let i = 0; i < n; i++) {
            const tmp = [];
            for (let j = 0; j < n; j++) {
                tmp.push(0);
            }
            numList.push(tmp);
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 二乗階 */
    void quadratic(int n) {
      // 行列は O(n^2) の空間を使用する
      List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
      // 二次元リストは O(n^2) の空間を使用
      List<List<int>> numList = [];
      for (var i = 0; i < n; i++) {
        List<int> tmp = [];
        for (int j = 0; j < n; j++) {
          tmp.add(0);
        }
        numList.add(tmp);
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 二乗階 */
    #[allow(unused)]
    fn quadratic(n: i32) {
        // 行列は O(n^2) の空間を使用する
        let num_matrix = vec![vec![0; n as usize]; n as usize];
        // 二次元リストは O(n^2) の空間を使用
        let mut num_list = Vec::new();
        for i in 0..n {
            let mut tmp = Vec::new();
            for j in 0..n {
                tmp.push(0);
            }
            num_list.push(tmp);
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 二乗階 */
    void quadratic(int n) {
        // 二次元リストは O(n^2) の空間を使用
        int **numMatrix = malloc(sizeof(int *) * n);
        for (int i = 0; i < n; i++) {
            int *tmp = malloc(sizeof(int) * n);
            for (int j = 0; j < n; j++) {
                tmp[j] = 0;
            }
            numMatrix[i] = tmp;
        }

        // メモリを解放する
        for (int i = 0; i < n; i++) {
            free(numMatrix[i]);
        }
        free(numMatrix);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 二乗階 */
    fun quadratic(n: Int) {
        // 行列は O(n^2) の空間を使用する
        val numMatrix = arrayOfNulls<Array<Int>?>(n)
        // 二次元リストは O(n^2) の空間を使用
        val numList = mutableListOf<MutableList<Int>>()
        for (i in 0..<n) {
            val tmp = mutableListOf<Int>()
            for (j in 0..<n) {
                tmp.add(0)
            }
            numList.add(tmp)
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 平方階 ###
    def quadratic(n)
      # 二次元リストは O(n^2) の空間を使用
      Array.new(n) { Array.new(n, 0) }
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 387px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E4%B9%97%E9%9A%8E%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E5%85%83%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%5E2%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E4%BD%BF%E7%94%A8%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E4%B9%97%E9%9A%8E%0A%20%20%20%20quadratic%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E4%B9%97%E9%9A%8E%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E5%85%83%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%5E2%29%20%E3%81%AE%E7%A9%BA%E9%96%93%E3%82%92%E4%BD%BF%E7%94%A8%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E4%B9%97%E9%9A%8E%0A%20%20%20%20quadratic%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

以下の図に示すように、この関数の再帰の深さは $n$ であり、各再帰関数の中で長さがそれぞれ $n$、$n-1$、$\dots$、$2$、$1$ の配列を初期化しています。平均長は $n / 2$ なので、全体では $O(n^2)$ の空間を占有します。

=== "Python"

    ```python title="space_complexity.py"
    def quadratic_recur(n: int) -> int:
        """二次時間（再帰実装）"""
        if n <= 0:
            return 0
        # 配列 nums の長さは n, n-1, ..., 2, 1
        nums = [0] * n
        return quadratic_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 二次時間（再帰実装） */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        vector<int> nums(n);
        cout << "再帰 n = " << n << " における nums の長さ = " << nums.size() << endl;
        return quadraticRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 二次時間（再帰実装） */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 配列 nums の長さは n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("再帰 n = " + n + " における nums の長さ = " + nums.length);
        return quadraticRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 二次時間（再帰実装） */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("再帰 n = " + n + " における nums の長さ = " + nums.Length);
        return QuadraticRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 二次時間（再帰実装） */
    func spaceQuadraticRecur(n int) int {
        if n <= 0 {
            return 0
        }
        nums := make([]int, n)
        fmt.Printf("再帰 n = %d における nums の長さ = %d \n", n, len(nums))
        return spaceQuadraticRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 二次時間（再帰実装） */
    @discardableResult
    func quadraticRecur(n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        // 配列 nums の長さは n, n-1, ..., 2, 1
        let nums = Array(repeating: 0, count: n)
        print("再帰 n = \(n) における nums の長さ = \(nums.count)")
        return quadraticRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 二次時間（再帰実装） */
    function quadraticRecur(n) {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`再帰 n = ${n} における nums の長さ = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 二次時間（再帰実装） */
    function quadraticRecur(n: number): number {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`再帰 n = ${n} における nums の長さ = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 二次時間（再帰実装） */
    int quadraticRecur(int n) {
      if (n <= 0) return 0;
      List<int> nums = List.filled(n, 0);
      print('再帰 n = $n における nums の長さ = ${nums.length}');
      return quadraticRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 二次時間（再帰実装） */
    fn quadratic_recur(n: i32) -> i32 {
        if n <= 0 {
            return 0;
        };
        // 配列 nums の長さは n, n-1, ..., 2, 1
        let nums = vec![0; n as usize];
        println!("再帰 n = {} における nums の長さ = {}", n, nums.len());
        return quadratic_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 二次時間（再帰実装） */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        int *nums = malloc(sizeof(int) * n);
        printf("再帰 n = %d における nums の長さ = %d\r\n", n, n);
        int res = quadraticRecur(n - 1);
        free(nums);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 二次時間（再帰実装） */
    tailrec fun quadraticRecur(n: Int): Int {
        if (n <= 0)
            return 0
        // 配列 nums の長さは n, n-1, ..., 2, 1
        val nums = Array(n) { 0 }
        println("再帰 n = $n における nums の長さ = ${nums.size}")
        return quadraticRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 平方階 ###
    def quadratic(n)
      # 二次元リストは O(n^2) の空間を使用
      Array.new(n) { Array.new(n, 0) }
    end

    # ## 平方階（再帰実装）###
    def quadratic_recur(n)
      return 0 unless n > 0

      # 配列 nums の長さは n, n-1, ..., 2, 1
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E6%99%82%E9%96%93%EF%BC%88%E5%86%8D%E5%B8%B0%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%20nums%20%E3%81%AE%E9%95%B7%E3%81%95%E3%81%AF%20n%2C%20n-1%2C%20...%2C%202%2C%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E4%B9%97%E9%9A%8E%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E6%99%82%E9%96%93%EF%BC%88%E5%86%8D%E5%B8%B0%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%20nums%20%E3%81%AE%E9%95%B7%E3%81%95%E3%81%AF%20n%2C%20n-1%2C%20...%2C%202%2C%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E4%B9%97%E9%9A%8E%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

![再帰関数が生み出す平方階の空間計算量](space_complexity.assets/space_complexity_recursive_quadratic.png){ class="animation-figure" }

<p align="center"> 図 2-18 &nbsp; 再帰関数が生み出す平方階の空間計算量 </p>

### 4. &nbsp; 指数階 $O(2^n)$ {data-toc-label="4. &nbsp; 指数階"}

指数階は二分木によく現れます。以下の図を見ると、高さが $n$ の「満二分木」のノード数は $2^n - 1$ であり、$O(2^n)$ の空間を占有します。

=== "Python"

    ```python title="space_complexity.py"
    def build_tree(n: int) -> TreeNode | None:
        """指数時間（完全二分木の構築）"""
        if n == 0:
            return None
        root = TreeNode(0)
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
        return root
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 指数時間（完全二分木の構築） */
    TreeNode *buildTree(int n) {
        if (n == 0)
            return nullptr;
        TreeNode *root = new TreeNode(0);
        root->left = buildTree(n - 1);
        root->right = buildTree(n - 1);
        return root;
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 指数時間（完全二分木の構築） */
    TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 指数時間（完全二分木の構築） */
    TreeNode? BuildTree(int n) {
        if (n == 0) return null;
        TreeNode root = new(0) {
            left = BuildTree(n - 1),
            right = BuildTree(n - 1)
        };
        return root;
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 指数時間（完全二分木の構築） */
    func buildTree(n int) *TreeNode {
        if n == 0 {
            return nil
        }
        root := NewTreeNode(0)
        root.Left = buildTree(n - 1)
        root.Right = buildTree(n - 1)
        return root
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 指数時間（完全二分木の構築） */
    func buildTree(n: Int) -> TreeNode? {
        if n == 0 {
            return nil
        }
        let root = TreeNode(x: 0)
        root.left = buildTree(n: n - 1)
        root.right = buildTree(n: n - 1)
        return root
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 指数時間（完全二分木の構築） */
    function buildTree(n) {
        if (n === 0) return null;
        const root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 指数時間（完全二分木の構築） */
    function buildTree(n: number): TreeNode | null {
        if (n === 0) return null;
        const root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 指数時間（完全二分木の構築） */
    TreeNode? buildTree(int n) {
      if (n == 0) return null;
      TreeNode root = TreeNode(0);
      root.left = buildTree(n - 1);
      root.right = buildTree(n - 1);
      return root;
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 指数時間（完全二分木の構築） */
    fn build_tree(n: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if n == 0 {
            return None;
        };
        let root = TreeNode::new(0);
        root.borrow_mut().left = build_tree(n - 1);
        root.borrow_mut().right = build_tree(n - 1);
        return Some(root);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 指数時間（完全二分木の構築） */
    TreeNode *buildTree(int n) {
        if (n == 0)
            return NULL;
        TreeNode *root = newTreeNode(0);
        root->left = buildTree(n - 1);
        root->right = buildTree(n - 1);
        return root;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 指数時間（完全二分木の構築） */
    fun buildTree(n: Int): TreeNode? {
        if (n == 0)
            return null
        val root = TreeNode(0)
        root.left = buildTree(n - 1)
        root.right = buildTree(n - 1)
        return root
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 平方階 ###
    def quadratic(n)
      # 二次元リストは O(n^2) の空間を使用
      Array.new(n) { Array.new(n, 0) }
    end

    # ## 平方階（再帰実装）###
    def quadratic_recur(n)
      return 0 unless n > 0

      # 配列 nums の長さは n, n-1, ..., 2, 1
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end

    # ## 指数階（満二分木を構築）###
    def build_tree(n)
      return if n == 0

      TreeNode.new.tap do |root|
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E6%99%82%E9%96%93%EF%BC%88%E5%AE%8C%E5%85%A8%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E6%A7%8B%E7%AF%89%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E6%99%82%E9%96%93%EF%BC%88%E5%AE%8C%E5%85%A8%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E6%A7%8B%E7%AF%89%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%B5%E3%82%A4%E3%82%BA%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

![満二分木が生み出す指数階の空間計算量](space_complexity.assets/space_complexity_exponential.png){ class="animation-figure" }

<p align="center"> 図 2-19 &nbsp; 満二分木が生み出す指数階の空間計算量 </p>

### 5. &nbsp; 対数階 $O(\log n)$ {data-toc-label="5. &nbsp; 対数階"}

対数階は分割統治アルゴリズムによく現れます。例えばマージソートでは、長さ $n$ の配列を入力として、各再帰で配列を中央から二つに分割するため、高さ $\log n$ の再帰木が形成され、$O(\log n)$ のスタックフレーム空間を使用します。

また、数値を文字列に変換する場合を考えると、正の整数 $n$ の桁数は $\lfloor \log_{10} n \rfloor + 1$ であり、対応する文字列長も $\lfloor \log_{10} n \rfloor + 1$ です。したがって空間計算量は $O(\log_{10} n + 1) = O(\log n)$ となります。

## 2.4.4 &nbsp; 時間と空間のトレードオフ

理想的には、アルゴリズムの時間計算量と空間計算量の両方を最適にしたいところです。しかし実際には、この二つを同時に最適化するのは通常きわめて困難です。

**時間計算量を下げるには、通常、空間計算量を増やす代償が必要であり、その逆も同様です**。メモリ空間を犠牲にして実行速度を上げる考え方を「空間を時間と引き換えにする」と呼び、その逆を「時間を空間と引き換えにする」と呼びます。

どちらの考え方を選ぶかは、何をより重視するかによって決まります。多くの場合、空間より時間のほうが貴重なので、「空間を時間と引き換えにする」戦略のほうが一般的です。もちろん、データ量が非常に大きい場合には、空間計算量を抑えることも同じくらい重要です。
