<!-- [snippet]{space_categories} -->
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

```dart title=""
/* クラス */
class Node {
  int val;
  Node? next;
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

<!-- [snippet]{worst_case_space} -->
```python title=""
def algorithm(n: int):
    a = 0               # O(1)
    b = [0] * 10000     # O(1)
    if n > 10:
        nums = [0] * n  # O(n)
```

```cpp title=""
void algorithm(int n) {
    int a = 0;               // O(1)
    vector<int> b(10000);    // O(1)
    if (n > 10)
        vector<int> nums(n); // O(n)
}
```

```java title=""
void algorithm(int n) {
    int a = 0;                   // O(1)
    int[] b = new int[10000];    // O(1)
    if (n > 10) {
        int[] nums = new int[n]; // O(n)
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 0;                   // O(1)
    int[] b = new int[10000];    // O(1)
    if (n > 10) {
        int[] nums = new int[n]; // O(n)
    }
}
```

```go title=""
func algorithm(n int) {
    a := 0                      // O(1)
    b := make([]int, 10000)     // O(1)
    var nums []int
    if n > 10 {
        nums = make([]int, n)   // O(n)
    }
    fmt.Println(a, b, nums)
}
```

```swift title=""
func algorithm(n: Int) {
    let a = 0 // O(1)
    let b = Array(repeating: 0, count: 10000) // O(1)
    if n > 10 {
        let nums = Array(repeating: 0, count: n) // O(n)
    }
}
```

```javascript title=""
function algorithm(n) {
    const a = 0;                   // O(1)
    const b = new Array(10000);    // O(1)
    if (n > 10) {
        const nums = new Array(n); // O(n)
    }
}
```

```typescript title=""
function algorithm(n: number): void {
    const a = 0;                   // O(1)
    const b = new Array(10000);    // O(1)
    if (n > 10) {
        const nums = new Array(n); // O(n)
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 0;                            // O(1)
  List<int> b = List.filled(10000, 0);  // O(1)
  if (n > 10) {
    List<int> nums = List.filled(n, 0); // O(n)
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let a = 0;                              // O(1)
    let b = [0; 10000];                     // O(1)
    if n > 10 {
        let nums = vec![0; n as usize];     // O(n)
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 0;               // O(1)
    int b[10000];            // O(1)
    if (n > 10) {
        int nums[n];         // O(n)
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    val a = 0                    // O(1)
    val b = IntArray(10000)      // O(1)
    if (n > 10) {
        val nums = IntArray(n)   // O(n)
    }
}
```

```ruby title=""
def algorithm(n)
    a = 0                           # O(1)
    b = Array.new(10000)            # O(1)
    nums = Array.new(n) if n > 10   # O(n)
end
```

<!-- [snippet]{loop_vs_recursion_space} -->
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

```rust title=""
fn function() -> i32 {
    // 何らかの処理を実行
    return 0;
}
/* ループの空間計算量は O(1) */
fn for_loop(n: i32) {
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
