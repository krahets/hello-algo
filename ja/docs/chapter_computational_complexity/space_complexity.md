---
comments: true
---

# 2.4 &nbsp; 空間計算量

<u>空間計算量（space complexity）</u>は、データ量が増えるにつれて、アルゴリズムのメモリ使用量がどのように増えるかを測ります。時間計算量とよく似ており、「実行時間」を「メモリ使用量」に置き換えた概念です。

## 2.4.1 &nbsp; アルゴリズムに関わる空間

実行中に使うメモリ空間は、主に次の種類に分かれます。

- **入力空間**：入力データを保存します。
- **一時空間**：実行中の変数、オブジェクト、関数の実行状態などを保存します。
- **出力空間**：出力データを保存します。

通常、空間計算量には「一時空間」と「出力空間」を含めます。

一時空間は、さらに三つに分けられます。

- **一時データ**：実行中の定数、変数、オブジェクトなどを保存します。
- **スタックフレーム**：呼び出した関数の実行状態を保存します。関数を呼ぶたびにスタックの先頭にフレームが作られ、戻ると解放されます。
- **命令空間**：コンパイルされた命令を保存します。実際の集計では通常、無視します。

プログラムの空間計算量では、図 2-15 のように、**通常は一時データ、スタックフレーム、出力データの三つを数えます**。

![アルゴリズムが使う空間](space_complexity.assets/space_types.png){ class="animation-figure" }

<p align="center"> 図 2-15 &nbsp; アルゴリズムが使う空間 </p>

関連するコードを次に示します。

=== "Python"

    ```python title=""
    class Node:
        """クラス"""
        def __init__(self, x: int):
            self.val: int = x              # ノードの値
            self.next: Node | None = None  # 次のノードへの参照

    def function() -> int:
        """関数"""
        # 何らかの処理を実行...
        return 0

    def algorithm(n) -> int:  # 入力データ
        A = 0                 # 一時データ（定数、通常は大文字で表す）
        b = 0                 # 一時データ（変数）
        node = Node(0)        # 一時データ（オブジェクト）
        c = function()        # スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行...
        return 0;
    }

    int algorithm(int n) {        // 入力データ
        const int a = 0;          // 一時データ（定数）
        int b = 0;                // 一時データ（変数）
        Node* node = new Node(0); // 一時データ（オブジェクト）
        int c = func();           // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行...
        return 0;
    }
    
    int algorithm(int n) {        // 入力データ
        final int a = 0;          // 一時データ（定数）
        int b = 0;                // 一時データ（変数）
        Node node = new Node(0);  // 一時データ（オブジェクト）
        int c = function();       // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行...
        return 0;
    }

    int Algorithm(int n) {        // 入力データ
        const int a = 0;          // 一時データ（定数）
        int b = 0;                // 一時データ（変数）
        Node node = new(0);       // 一時データ（オブジェクト）
        int c = Function();       // スタックフレーム（関数呼び出し）
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

    /* node 構造体を作成  */
    func newNode(val int) *node {
        return &node{val: val}
    }
    
    /* 関数 */
    func function() int {
        // 何らかの処理を実行...
        return 0
    }

    func algorithm(n int) int { // 入力データ
        const a = 0             // 一時データ（定数）
        b := 0                  // 一時データ（変数）
        newNode(0)              // 一時データ（オブジェクト）
        c := function()         // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行...
        return 0
    }

    func algorithm(n: Int) -> Int { // 入力データ
        let a = 0             // 一時データ（定数）
        var b = 0             // 一時データ（変数）
        let node = Node(x: 0) // 一時データ（オブジェクト）
        let c = function()    // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行
        return 0;
    }

    function algorithm(n) {       // 入力データ
        const a = 0;              // 一時データ（定数）
        let b = 0;                // 一時データ（変数）
        const node = new Node(0); // 一時データ（オブジェクト）
        const c = constFunc();    // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行
        return 0;
    }

    function algorithm(n: number): number { // 入力データ
        const a = 0;                        // 一時データ（定数）
        let b = 0;                          // 一時データ（変数）
        const node = new Node(0);           // 一時データ（オブジェクト）
        const c = constFunc();              // スタックフレーム（関数呼び出し）
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
      // 何らかの処理を実行...
      return 0;
    }

    int algorithm(int n) {  // 入力データ
      const int a = 0;      // 一時データ（定数）
      int b = 0;            // 一時データ（変数）
      Node node = Node(0);  // 一時データ（オブジェクト）
      int c = function();   // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {       // 入力データ
        const a: i32 = 0;               // 一時データ（定数）
        let mut b = 0;                  // 一時データ（変数）
        let node = Node::new(0);        // 一時データ（オブジェクト）
        let c = function();             // スタックフレーム（関数呼び出し）
        return a + b + c;               // 出力データ
    }
    ```

=== "C"

    ```c title=""
    /* 関数 */
    int func() {
        // 何らかの処理を実行...
        return 0;
    }

    int algorithm(int n) { // 入力データ
        const int a = 0;   // 一時データ（定数）
        int b = 0;         // 一時データ（変数）
        int c = func();    // スタックフレーム（関数呼び出し）
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
        // 何らかの処理を実行...
        return 0
    }

    fun algorithm(n: Int): Int { // 入力データ
        val a = 0                // 一時データ（定数）
        var b = 0                // 一時データ（変数）
        val node = Node(0)       // 一時データ（オブジェクト）
        val c = function()       // スタックフレーム（関数呼び出し）
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
        # 何らかの処理を実行...
        0
    end

    ### アルゴリズム ###
    def algorithm(n)        # 入力データ
        a = 0               # 一時データ（定数）
        b = 0               # 一時データ（変数）
        node = Node.new(0)  # 一時データ（オブジェクト）
        c = function        # スタックフレーム（関数呼び出し）
        a + b + c           # 出力データ
    end
    ```

## 2.4.2 &nbsp; 見積もり方

空間計算量の見積もり方は時間計算量とほぼ同じで、数える対象を「操作回数」から「使う空間の大きさ」に変えます。

ただし時間計算量と異なり、**通常は最悪空間計算量だけに注目します**。メモリ容量は必ず満たすべき要件であり、どの入力でも十分なメモリを確保できるようにする必要があるためです。

次のコードでは、「最悪」には二つの意味があります。

1. **最悪の入力を基準にする**：$n < 10$ なら $O(1)$ ですが、$n > 10$ なら配列 `nums` が $O(n)$ の空間を使うため、最悪空間計算量は $O(n)$ です。
2. **実行中の最大メモリ使用量を基準にする**：たとえば、最後の行の実行前は $O(1)$ ですが、配列 `nums` を初期化すると $O(n)$ の空間を使うため、最悪空間計算量は $O(n)$ です。

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

**再帰関数では、スタックフレームを数え忘れないよう注意が必要です**。次のコードを見てください。

=== "Python"

    ```python title=""
    def function() -> int:
        # 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
      // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        // 何らかの処理を実行
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
        # 何らかの処理を実行
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

関数 `loop()` と `recur()` の時間計算量はどちらも $O(n)$ ですが、空間計算量は異なります。

- `loop()` は `function()` を $n$ 回呼びますが、毎回戻ってスタックフレームを解放するため、空間計算量は $O(1)$ のままです。
- 再帰関数 `recur()` では、戻っていない `recur()` が同時に $n$ 個存在するため、スタックフレームに $O(n)$ の空間を使います。

## 2.4.3 &nbsp; 代表的な種類

入力の大きさを $n$ とし、代表的な空間計算量を小さい順に図 2-16 に示します。

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
& \text{定数} < \text{対数} < \text{線形} < \text{二乗} < \text{指数}
\end{aligned}
$$

![代表的な空間計算量](space_complexity.assets/space_complexity_common_types.png){ class="animation-figure" }

<p align="center"> 図 2-16 &nbsp; 代表的な空間計算量 </p>

### 1. &nbsp; 定数のオーダー $O(1)$ {data-toc-label="1. &nbsp; 定数のオーダー"}

定数のオーダーは、入力の大きさ $n$ によって個数が変わらない定数、変数、オブジェクトによく見られます。

ループ内の変数の初期化や関数呼び出しで使ったメモリは、次の反復に入ると解放され、累積しないため、空間計算量は $O(1)$ のままです。

=== "Python"

    ```python title="space_complexity.py"
    def function() -> int:
        """関数"""
        # 何らかの処理を実行する
        return 0

    def constant(n: int):
        """定数オーダー"""
        # 定数、変数、オブジェクトは O(1) の領域を使用する
        a = 0
        nums = [0] * 10000
        node = ListNode(0)
        # ループ内の変数は O(1) の領域を使用する
        for _ in range(n):
            c = 0
        # ループ内の関数は O(1) の領域を使用する
        for _ in range(n):
            function()
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 関数 */
    int func() {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    void constant(int n) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        const int a = 0;
        int b = 0;
        vector<int> nums(10000);
        ListNode node(0);
        // ループ内の変数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 関数 */
    int function() {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    void constant(int n) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // ループ内の変数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 関数 */
    int Function() {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    void Constant(int n) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // ループ内の変数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 関数 */
    func function() int {
        // 何らかの処理を実行する...
        return 0
    }

    /* 定数オーダー */
    func spaceConstant(n int) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        const a = 0
        b := 0
        nums := make([]int, 10000)
        node := newNode(0)
        // ループ内の変数は O(1) の領域を使用する
        var c int
        for i := 0; i < n; i++ {
            c = 0
        }
        // ループ内の関数は O(1) の領域を使用する
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
        // 何らかの処理を実行する
        return 0
    }

    /* 定数オーダー */
    func constant(n: Int) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        let a = 0
        var b = 0
        let nums = Array(repeating: 0, count: 10000)
        let node = ListNode(x: 0)
        // ループ内の変数は O(1) の領域を使用する
        for _ in 0 ..< n {
            let c = 0
        }
        // ループ内の関数は O(1) の領域を使用する
        for _ in 0 ..< n {
            function()
        }
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 関数 */
    function constFunc() {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    function constant(n) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // ループ内の変数は O(1) の領域を使用する
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 関数 */
    function constFunc(): number {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    function constant(n: number): void {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // ループ内の変数は O(1) の領域を使用する
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 関数 */
    int function() {
      // 何らかの処理を実行する
      return 0;
    }

    /* 定数オーダー */
    void constant(int n) {
      // 定数、変数、オブジェクトは O(1) の領域を使用する
      final int a = 0;
      int b = 0;
      List<int> nums = List.filled(10000, 0);
      ListNode node = ListNode(0);
      // ループ内の変数は O(1) の領域を使用する
      for (var i = 0; i < n; i++) {
        int c = 0;
      }
      // ループ内の関数は O(1) の領域を使用する
      for (var i = 0; i < n; i++) {
        function();
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 関数 */
    fn function() -> i32 {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    #[allow(unused)]
    fn constant(n: i32) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        const A: i32 = 0;
        let b = 0;
        let nums = vec![0; 10000];
        let node = ListNode::new(0);
        // ループ内の変数は O(1) の領域を使用する
        for i in 0..n {
            let c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for i in 0..n {
            function();
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 関数 */
    int func() {
        // 何らかの処理を実行する
        return 0;
    }

    /* 定数オーダー */
    void constant(int n) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        const int a = 0;
        int b = 0;
        int nums[1000];
        ListNode *node = newListNode(0);
        free(node);
        // ループ内の変数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // ループ内の関数は O(1) の領域を使用する
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 関数 */
    fun function(): Int {
        // 何らかの処理を実行する
        return 0
    }

    /* 定数オーダー */
    fun constant(n: Int) {
        // 定数、変数、オブジェクトは O(1) の領域を使用する
        val a = 0
        var b = 0
        val nums = Array(10000) { 0 }
        val node = ListNode(0)
        // ループ内の変数は O(1) の領域を使用する
        for (i in 0..<n) {
            val c = 0
        }
        // ループ内の関数は O(1) の領域を使用する
        for (i in 0..<n) {
            function()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 関数 ###
    def function
      # 何らかの処理を実行する
      0
    end

    ### 定数オーダー ###
    def constant(n)
      # 定数、変数、オブジェクトは O(1) の領域を使用する
      a = 0
      nums = [0] * 10000
      node = ListNode.new

      # ループ内の変数は O(1) の領域を使用する
      (0...n).each { c = 0 }
      # ループ内の関数は O(1) の領域を使用する
      (0...n).each { function }
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20%23%20%E4%BD%95%E3%82%89%E3%81%8B%E3%81%AE%E5%87%A6%E7%90%86%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E3%80%81%E5%A4%89%E6%95%B0%E3%80%81%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%20O%281%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E5%A4%89%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E9%96%A2%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20constant%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20%23%20%E4%BD%95%E3%82%89%E3%81%8B%E3%81%AE%E5%87%A6%E7%90%86%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E3%80%81%E5%A4%89%E6%95%B0%E3%80%81%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%20O%281%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E5%A4%89%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E5%86%85%E3%81%AE%E9%96%A2%E6%95%B0%E3%81%AF%20O%281%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E5%AE%9A%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20constant%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; 線形のオーダー $O(n)$ {data-toc-label="2. &nbsp; 線形のオーダー"}

線形のオーダーは、要素数が $n$ に比例する配列、連結リスト、スタック、キューなどによく見られます。

=== "Python"

    ```python title="space_complexity.py"
    def linear(n: int):
        """線形オーダー"""
        # 長さ n のリストは O(n) の領域を使用する
        nums = [0] * n
        # 長さ n のハッシュテーブルは O(n) の領域を使用する
        hmap = dict[int, str]()
        for i in range(n):
            hmap[i] = str(i)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 線形オーダー */
    void linear(int n) {
        // 長さ n の配列は O(n) の領域を使用する
        vector<int> nums(n);
        // 長さ n のリストは O(n) の領域を使用する
        vector<ListNode> nodes;
        for (int i = 0; i < n; i++) {
            nodes.push_back(ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        unordered_map<int, string> map;
        for (int i = 0; i < n; i++) {
            map[i] = to_string(i);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 線形オーダー */
    void linear(int n) {
        // 長さ n の配列は O(n) の領域を使用する
        int[] nums = new int[n];
        // 長さ n のリストは O(n) の領域を使用する
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 線形オーダー */
    void Linear(int n) {
        // 長さ n の配列は O(n) の領域を使用する
        int[] nums = new int[n];
        // 長さ n のリストは O(n) の領域を使用する
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 線形オーダー */
    func spaceLinear(n int) {
        // 長さ n の配列は O(n) の領域を使用する
        _ = make([]int, n)
        // 長さ n のリストは O(n) の領域を使用する
        var nodes []*node
        for i := 0; i < n; i++ {
            nodes = append(nodes, newNode(i))
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        m := make(map[int]string, n)
        for i := 0; i < n; i++ {
            m[i] = strconv.Itoa(i)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 線形オーダー */
    func linear(n: Int) {
        // 長さ n の配列は O(n) の領域を使用する
        let nums = Array(repeating: 0, count: n)
        // 長さ n のリストは O(n) の領域を使用する
        let nodes = (0 ..< n).map { ListNode(x: $0) }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 線形オーダー */
    function linear(n) {
        // 長さ n の配列は O(n) の領域を使用する
        const nums = new Array(n);
        // 長さ n のリストは O(n) の領域を使用する
        const nodes = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 線形オーダー */
    function linear(n: number): void {
        // 長さ n の配列は O(n) の領域を使用する
        const nums = new Array(n);
        // 長さ n のリストは O(n) の領域を使用する
        const nodes: ListNode[] = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 線形オーダー */
    void linear(int n) {
      // 長さ n の配列は O(n) の領域を使用する
      List<int> nums = List.filled(n, 0);
      // 長さ n のリストは O(n) の領域を使用する
      List<ListNode> nodes = [];
      for (var i = 0; i < n; i++) {
        nodes.add(ListNode(i));
      }
      // 長さ n のハッシュテーブルは O(n) の領域を使用する
      Map<int, String> map = HashMap();
      for (var i = 0; i < n; i++) {
        map.putIfAbsent(i, () => i.toString());
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 線形オーダー */
    #[allow(unused)]
    fn linear(n: i32) {
        // 長さ n の配列は O(n) の領域を使用する
        let mut nums = vec![0; n as usize];
        // 長さ n のリストは O(n) の領域を使用する
        let mut nodes = Vec::new();
        for i in 0..n {
            nodes.push(ListNode::new(i))
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
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
        UT_hash_handle hh; // uthash.h を用いて実装する
    } HashTable;

    /* 線形オーダー */
    void linear(int n) {
        // 長さ n の配列は O(n) の領域を使用する
        int *nums = malloc(sizeof(int) * n);
        free(nums);

        // 長さ n のリストは O(n) の領域を使用する
        ListNode **nodes = malloc(sizeof(ListNode *) * n);
        for (int i = 0; i < n; i++) {
            nodes[i] = newListNode(i);
        }
        // メモリの解放
        for (int i = 0; i < n; i++) {
            free(nodes[i]);
        }
        free(nodes);

        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        HashTable *h = NULL;
        for (int i = 0; i < n; i++) {
            HashTable *tmp = malloc(sizeof(HashTable));
            tmp->key = i;
            tmp->val = i;
            HASH_ADD_INT(h, key, tmp);
        }

        // メモリの解放
        HashTable *curr, *tmp;
        HASH_ITER(hh, h, curr, tmp) {
            HASH_DEL(h, curr);
            free(curr);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 線形オーダー */
    fun linear(n: Int) {
        // 長さ n の配列は O(n) の領域を使用する
        val nums = Array(n) { 0 }
        // 長さ n のリストは O(n) の領域を使用する
        val nodes = mutableListOf<ListNode>()
        for (i in 0..<n) {
            nodes.add(ListNode(i))
        }
        // 長さ n のハッシュテーブルは O(n) の領域を使用する
        val map = mutableMapOf<Int, String>()
        for (i in 0..<n) {
            map[i] = i.toString()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 線形オーダー ###
    def linear(n)
      # 長さ n のリストは O(n) の領域を使用する
      nums = Array.new(n, 0)

      # 長さ n のハッシュテーブルは O(n) の領域を使用する
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AF%20O%28n%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20hmap%20%3D%20dict%5Bint,%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20linear%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%E9%95%B7%E3%81%95%20n%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AF%20O%28n%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20hmap%20%3D%20dict%5Bint,%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20linear%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-17 の関数は再帰深度が $n$ で、まだ戻っていない `linear_recur()` が同時に $n$ 個存在するため、スタックフレームに $O(n)$ の空間を使います。

=== "Python"

    ```python title="space_complexity.py"
    def linear_recur(n: int):
        """線形オーダー（再帰による実装）"""
        print("再帰 n =", n)
        if n == 1:
            return
        linear_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 線形オーダー（再帰による実装） */
    void linearRecur(int n) {
        cout << "再帰 n = " << n << endl;
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 線形オーダー（再帰による実装） */
    void linearRecur(int n) {
        System.out.println("再帰 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 線形オーダー（再帰による実装） */
    void LinearRecur(int n) {
        Console.WriteLine("再帰 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 線形オーダー（再帰による実装） */
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
    /* 線形オーダー（再帰による実装） */
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
    /* 線形オーダー（再帰による実装） */
    function linearRecur(n) {
        console.log(`再帰 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 線形オーダー（再帰による実装） */
    function linearRecur(n: number): void {
        console.log(`再帰 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 線形オーダー（再帰による実装） */
    void linearRecur(int n) {
      print('再帰 n = $n');
      if (n == 1) return;
      linearRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 線形オーダー（再帰による実装） */
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
    /* 線形オーダー（再帰による実装） */
    void linearRecur(int n) {
        printf("再帰 n = %d\r\n", n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 線形オーダー（再帰による実装） */
    fun linearRecur(n: Int) {
        println("再帰 n = $n")
        if (n == 1)
            return
        linearRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 線形オーダー（再帰による実装）###
    def linear_recur(n)
      puts "再帰 n = #{n}"
      return if n == 1
      linear_recur(n - 1)
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20print%28%22%E5%86%8D%E5%B8%B0%20n%20%3D%22,%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20print%28%22%E5%86%8D%E5%B8%B0%20n%20%3D%22,%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E7%B7%9A%E5%BD%A2%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![再帰関数による線形の空間計算量](space_complexity.assets/space_complexity_recursive_linear.png){ class="animation-figure" }

<p align="center"> 図 2-17 &nbsp; 再帰関数による線形の空間計算量 </p>

### 3. &nbsp; 二乗のオーダー $O(n^2)$ {data-toc-label="3. &nbsp; 二乗のオーダー"}

二乗のオーダーは、要素数が $n$ の二乗に比例する行列やグラフによく見られます。

=== "Python"

    ```python title="space_complexity.py"
    def quadratic(n: int):
        """二次オーダー"""
        # 二次元リストは O(n^2) の領域を使用する
        num_matrix = [[0] * n for _ in range(n)]
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 二次オーダー */
    void quadratic(int n) {
        // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    void quadratic(int n) {
        // 行列は O(n^2) の領域を使用する
        int[][] numMatrix = new int[n][n];
        // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    void Quadratic(int n) {
        // 行列は O(n^2) の領域を使用する
        int[,] numMatrix = new int[n, n];
        // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    func spaceQuadratic(n int) {
        // 行列は O(n^2) の領域を使用する
        numMatrix := make([][]int, n)
        for i := 0; i < n; i++ {
            numMatrix[i] = make([]int, n)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 二次オーダー */
    func quadratic(n: Int) {
        // 二次元リストは O(n^2) の領域を使用する
        let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 二次オーダー */
    function quadratic(n) {
        // 行列は O(n^2) の領域を使用する
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    function quadratic(n: number): void {
        // 行列は O(n^2) の領域を使用する
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    void quadratic(int n) {
      // 行列は O(n^2) の領域を使用する
      List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
      // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    #[allow(unused)]
    fn quadratic(n: i32) {
        // 行列は O(n^2) の領域を使用する
        let num_matrix = vec![vec![0; n as usize]; n as usize];
        // 二次元リストは O(n^2) の領域を使用する
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
    /* 二次オーダー */
    void quadratic(int n) {
        // 二次元リストは O(n^2) の領域を使用する
        int **numMatrix = malloc(sizeof(int *) * n);
        for (int i = 0; i < n; i++) {
            int *tmp = malloc(sizeof(int) * n);
            for (int j = 0; j < n; j++) {
                tmp[j] = 0;
            }
            numMatrix[i] = tmp;
        }

        // メモリの解放
        for (int i = 0; i < n; i++) {
            free(numMatrix[i]);
        }
        free(numMatrix);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 二次オーダー */
    fun quadratic(n: Int) {
        // 行列は O(n^2) の領域を使用する
        val numMatrix = arrayOfNulls<Array<Int>?>(n)
        // 二次元リストは O(n^2) の領域を使用する
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
    ### 二次オーダー ###
    def quadratic(n)
      # 二次元リストは O(n^2) の領域を使用する
      Array.new(n) { Array.new(n, 0) }
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 405px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E5%85%83%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%5E2%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20quadratic%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E5%85%83%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20O%28n%5E2%29%20%E3%81%AE%E9%A0%98%E5%9F%9F%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20quadratic%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-18 の関数は再帰深度が $n$ で、各呼び出しで長さ $n$、$n-1$、$\dots$、$2$、$1$ の配列を初期化します。平均の長さは $n / 2$ なので、全体では $O(n^2)$ の空間を使います。

=== "Python"

    ```python title="space_complexity.py"
    def quadratic_recur(n: int) -> int:
        """二次オーダー（再帰による実装）"""
        if n <= 0:
            return 0
        # 配列 nums の長さは n, n-1, ..., 2, 1
        nums = [0] * n
        return quadratic_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 二次オーダー（再帰による実装） */
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
    /* 二次オーダー（再帰による実装） */
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
    /* 二次オーダー（再帰による実装） */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("再帰 n = " + n + " における nums の長さ = " + nums.Length);
        return QuadraticRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 二次オーダー（再帰による実装） */
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
    /* 二次オーダー（再帰による実装） */
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
    /* 二次オーダー（再帰による実装） */
    function quadraticRecur(n) {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`再帰 n = ${n} における nums の長さ = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 二次オーダー（再帰による実装） */
    function quadraticRecur(n: number): number {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`再帰 n = ${n} における nums の長さ = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 二次オーダー（再帰による実装） */
    int quadraticRecur(int n) {
      if (n <= 0) return 0;
      List<int> nums = List.filled(n, 0);
      print('再帰 n = $n における nums の長さ = ${nums.length}');
      return quadraticRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 二次オーダー（再帰による実装） */
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
    /* 二次オーダー（再帰による実装） */
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
    /* 二次オーダー（再帰による実装） */
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
    ### 二次オーダー（再帰による実装）###
    def quadratic_recur(n)
      return 0 unless n > 0

      # 配列 nums の長さは n, n-1, ..., 2, 1
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%20nums%20%E3%81%AE%E9%95%B7%E3%81%95%E3%81%AF%20n,%20n-1,%20...,%202,%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E5%86%8D%E5%B8%B0%E3%81%AB%E3%82%88%E3%82%8B%E5%AE%9F%E8%A3%85%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%20nums%20%E3%81%AE%E9%95%B7%E3%81%95%E3%81%AF%20n,%20n-1,%20...,%202,%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E4%BA%8C%E6%AC%A1%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![再帰関数による二乗の空間計算量](space_complexity.assets/space_complexity_recursive_quadratic.png){ class="animation-figure" }

<p align="center"> 図 2-18 &nbsp; 再帰関数による二乗の空間計算量 </p>

### 4. &nbsp; 指数のオーダー $O(2^n)$ {data-toc-label="4. &nbsp; 指数のオーダー"}

指数のオーダーは二分木によく見られます。図 2-19 の、層数が $n$ の「パーフェクト二分木」はノード数が $2^n - 1$ で、$O(2^n)$ の空間を使います。

=== "Python"

    ```python title="space_complexity.py"
    def build_tree(n: int) -> TreeNode | None:
        """指数オーダー（パーフェクト二分木の構築）"""
        if n == 0:
            return None
        root = TreeNode(0)
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
        return root
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    /* 指数オーダー（パーフェクト二分木の構築） */
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
    ### 指数オーダー（パーフェクト二分木の構築）###
    def build_tree(n)
      return if n == 0

      TreeNode.new.tap do |root|
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%91%E3%83%BC%E3%83%95%E3%82%A7%E3%82%AF%E3%83%88%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E6%A7%8B%E7%AF%89%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%EF%BC%88%E3%83%91%E3%83%BC%E3%83%95%E3%82%A7%E3%82%AF%E3%83%88%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E6%A7%8B%E7%AF%89%EF%BC%89%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%95%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%E6%8C%87%E6%95%B0%E3%82%AA%E3%83%BC%E3%83%80%E3%83%BC%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![パーフェクト二分木による指数の空間計算量](space_complexity.assets/space_complexity_exponential.png){ class="animation-figure" }

<p align="center"> 図 2-19 &nbsp; パーフェクト二分木による指数の空間計算量 </p>

### 5. &nbsp; 対数のオーダー $O(\log n)$ {data-toc-label="5. &nbsp; 対数のオーダー"}

対数のオーダーは分割統治によく見られます。たとえばマージソートは、長さ $n$ の配列を各再帰で中央から半分に分け、高さ $\log n$ の再帰木を作るため、スタックフレームに $O(\log n)$ の空間を使います。

数値から文字列への変換も例になります。正の整数 $n$ の桁数は $\lfloor \log_{10} n \rfloor + 1$ なので、文字列の長さも $\lfloor \log_{10} n \rfloor + 1$ です。したがって、空間計算量は $O(\log_{10} n + 1) = O(\log n)$ です。

## 2.4.4 &nbsp; 時間と空間のトレードオフ

理想的には、時間計算量も空間計算量も最適にしたいところです。しかし実際には、両方を同時に最適化するのは非常に難しいことが多いです。

**時間計算量を減らすには、空間計算量を増やす必要があることが多く、その逆も同様です**。メモリを使って実行を速くする考え方を「空間を使って時間を節約する」、その逆を「時間を使って空間を節約する」と呼びます。

どちらを選ぶかは、何を重視するかによります。多くの場合、空間より時間の方が貴重なため、空間を使って時間を節約する戦略が一般的です。ただし、データ量が非常に多い場合は、空間計算量を抑えることも重要です。
