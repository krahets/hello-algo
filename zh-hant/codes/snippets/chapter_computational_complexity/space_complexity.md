<!-- [snippet]{space_categories} -->
```python title=""
class Node:
    """類別"""
    def __init__(self, x: int):
        self.val: int = x              # 節點值
        self.next: Node | None = None  # 指向下一節點的引用

def function() -> int:
    """函式"""
    # 執行某些操作...
    return 0

def algorithm(n) -> int:  # 輸入資料
    A = 0                 # 暫存資料（常數，一般用大寫字母表示）
    b = 0                 # 暫存資料（變數）
    node = Node(0)        # 暫存資料（物件）
    c = function()        # 堆疊幀空間（呼叫函式）
    return A + b + c      # 輸出資料
```

```cpp title=""
/* 結構體 */
struct Node {
    int val;
    Node *next;
    Node(int x) : val(x), next(nullptr) {}
};

/* 函式 */
int func() {
    // 執行某些操作...
    return 0;
}

int algorithm(int n) {        // 輸入資料
    const int a = 0;          // 暫存資料（常數）
    int b = 0;                // 暫存資料（變數）
    Node* node = new Node(0); // 暫存資料（物件）
    int c = func();           // 堆疊幀空間（呼叫函式）
    return a + b + c;         // 輸出資料
}
```

```java title=""
/* 類別 */
class Node {
    int val;
    Node next;
    Node(int x) { val = x; }
}

/* 函式 */
int function() {
    // 執行某些操作...
    return 0;
}

int algorithm(int n) {        // 輸入資料
    final int a = 0;          // 暫存資料（常數）
    int b = 0;                // 暫存資料（變數）
    Node node = new Node(0);  // 暫存資料（物件）
    int c = function();       // 堆疊幀空間（呼叫函式）
    return a + b + c;         // 輸出資料
}
```

```csharp title=""
/* 類別 */
class Node(int x) {
    int val = x;
    Node next;
}

/* 函式 */
int Function() {
    // 執行某些操作...
    return 0;
}

int Algorithm(int n) {        // 輸入資料
    const int a = 0;          // 暫存資料（常數）
    int b = 0;                // 暫存資料（變數）
    Node node = new(0);       // 暫存資料（物件）
    int c = Function();       // 堆疊幀空間（呼叫函式）
    return a + b + c;         // 輸出資料
}
```

```go title=""
/* 結構體 */
type node struct {
    val  int
    next *node
}

/* 建立 node 結構體  */
func newNode(val int) *node {
    return &node{val: val}
}

/* 函式 */
func function() int {
    // 執行某些操作...
    return 0
}

func algorithm(n int) int { // 輸入資料
    const a = 0             // 暫存資料（常數）
    b := 0                  // 暫存資料（變數）
    newNode(0)              // 暫存資料（物件）
    c := function()         // 堆疊幀空間（呼叫函式）
    return a + b + c        // 輸出資料
}
```

```swift title=""
/* 類別 */
class Node {
    var val: Int
    var next: Node?

    init(x: Int) {
        val = x
    }
}

/* 函式 */
func function() -> Int {
    // 執行某些操作...
    return 0
}

func algorithm(n: Int) -> Int { // 輸入資料
    let a = 0             // 暫存資料（常數）
    var b = 0             // 暫存資料（變數）
    let node = Node(x: 0) // 暫存資料（物件）
    let c = function()    // 堆疊幀空間（呼叫函式）
    return a + b + c      // 輸出資料
}
```

```javascript title=""
/* 類別 */
class Node {
    val;
    next;
    constructor(val) {
        this.val = val === undefined ? 0 : val; // 節點值
        this.next = null;                       // 指向下一節點的引用
    }
}

/* 函式 */
function constFunc() {
    // 執行某些操作
    return 0;
}

function algorithm(n) {       // 輸入資料
    const a = 0;              // 暫存資料（常數）
    let b = 0;                // 暫存資料（變數）
    const node = new Node(0); // 暫存資料（物件）
    const c = constFunc();    // 堆疊幀空間（呼叫函式）
    return a + b + c;         // 輸出資料
}
```

```typescript title=""
/* 類別 */
class Node {
    val: number;
    next: Node | null;
    constructor(val?: number) {
        this.val = val === undefined ? 0 : val; // 節點值
        this.next = null;                       // 指向下一節點的引用
    }
}

/* 函式 */
function constFunc(): number {
    // 執行某些操作
    return 0;
}

function algorithm(n: number): number { // 輸入資料
    const a = 0;                        // 暫存資料（常數）
    let b = 0;                          // 暫存資料（變數）
    const node = new Node(0);           // 暫存資料（物件）
    const c = constFunc();              // 堆疊幀空間（呼叫函式）
    return a + b + c;                   // 輸出資料
}
```

```dart title=""
/* 類別 */
class Node {
  int val;
  Node? next;
  Node(this.val, [this.next]);
}

/* 函式 */
int function() {
  // 執行某些操作...
  return 0;
}

int algorithm(int n) {  // 輸入資料
  const int a = 0;      // 暫存資料（常數）
  int b = 0;            // 暫存資料（變數）
  Node node = Node(0);  // 暫存資料（物件）
  int c = function();   // 堆疊幀空間（呼叫函式）
  return a + b + c;     // 輸出資料
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 結構體 */
struct Node {
    val: i32,
    next: Option<Rc<RefCell<Node>>>,
}

/* 建立 Node 結構體 */
impl Node {
    fn new(val: i32) -> Self {
        Self { val: val, next: None }
    }
}

/* 函式 */
fn function() -> i32 {      
    // 執行某些操作...
    return 0;
}

fn algorithm(n: i32) -> i32 {       // 輸入資料
    const a: i32 = 0;               // 暫存資料（常數）
    let mut b = 0;                  // 暫存資料（變數）
    let node = Node::new(0);        // 暫存資料（物件）
    let c = function();             // 堆疊幀空間（呼叫函式）
    return a + b + c;               // 輸出資料
}
```

```c title=""
/* 函式 */
int func() {
    // 執行某些操作...
    return 0;
}

int algorithm(int n) { // 輸入資料
    const int a = 0;   // 暫存資料（常數）
    int b = 0;         // 暫存資料（變數）
    int c = func();    // 堆疊幀空間（呼叫函式）
    return a + b + c;  // 輸出資料
}
```

```kotlin title=""
/* 類別 */
class Node(var _val: Int) {
    var next: Node? = null
}

/* 函式 */
fun function(): Int {
    // 執行某些操作...
    return 0
}

fun algorithm(n: Int): Int { // 輸入資料
    val a = 0                // 暫存資料（常數）
    var b = 0                // 暫存資料（變數）
    val node = Node(0)       // 暫存資料（物件）
    val c = function()       // 堆疊幀空間（呼叫函式）
    return a + b + c         // 輸出資料
}
```

```ruby title=""
### 類別 ###
class Node
    attr_accessor :val      # 節點值
    attr_accessor :next     # 指向下一節點的引用

    def initialize(x)
        @val = x
    end
end

### 函式 ###
def function
    # 執行某些操作...
    0
end

### 演算法 ###
def algorithm(n)        # 輸入資料
    a = 0               # 暫存資料（常數）
    b = 0               # 暫存資料（變數）
    node = Node.new(0)  # 暫存資料（物件）
    c = function        # 堆疊幀空間（呼叫函式）
    a + b + c           # 輸出資料
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
    # 執行某些操作
    return 0

def loop(n: int):
    """迴圈的空間複雜度為 O(1)"""
    for _ in range(n):
        function()

def recur(n: int):
    """遞迴的空間複雜度為 O(n)"""
    if n == 1:
        return
    return recur(n - 1)
```

```cpp title=""
int func() {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* 遞迴的空間複雜度為 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```java title=""
int function() {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        function();
    }
}
/* 遞迴的空間複雜度為 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```csharp title=""
int Function() {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
void Loop(int n) {
    for (int i = 0; i < n; i++) {
        Function();
    }
}
/* 遞迴的空間複雜度為 O(n) */
int Recur(int n) {
    if (n == 1) return 1;
    return Recur(n - 1);
}
```

```go title=""
func function() int {
    // 執行某些操作
    return 0
}

/* 迴圈的空間複雜度為 O(1) */
func loop(n int) {
    for i := 0; i < n; i++ {
        function()
    }
}

/* 遞迴的空間複雜度為 O(n) */
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
    // 執行某些操作
    return 0
}

/* 迴圈的空間複雜度為 O(1) */
func loop(n: Int) {
    for _ in 0 ..< n {
        function()
    }
}

/* 遞迴的空間複雜度為 O(n) */
func recur(n: Int) {
    if n == 1 {
        return
    }
    recur(n: n - 1)
}
```

```javascript title=""
function constFunc() {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
function loop(n) {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* 遞迴的空間複雜度為 O(n) */
function recur(n) {
    if (n === 1) return;
    return recur(n - 1);
}
```

```typescript title=""
function constFunc(): number {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
function loop(n: number): void {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* 遞迴的空間複雜度為 O(n) */
function recur(n: number): void {
    if (n === 1) return;
    return recur(n - 1);
}
```

```dart title=""
int function() {
  // 執行某些操作
  return 0;
}
/* 迴圈的空間複雜度為 O(1) */
void loop(int n) {
  for (int i = 0; i < n; i++) {
    function();
  }
}
/* 遞迴的空間複雜度為 O(n) */
void recur(int n) {
  if (n == 1) return;
  recur(n - 1);
}
```

```rust title=""
fn function() -> i32 {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
fn for_loop(n: i32) {
    for i in 0..n {
        function();
    }
}
/* 遞迴的空間複雜度為 O(n) */
fn recur(n: i32) {
    if n == 1 {
        return;
    }
    recur(n - 1);
}
```

```c title=""
int func() {
    // 執行某些操作
    return 0;
}
/* 迴圈的空間複雜度為 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* 遞迴的空間複雜度為 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```kotlin title=""
fun function(): Int {
    // 執行某些操作
    return 0
}
/* 迴圈的空間複雜度為 O(1) */
fun loop(n: Int) {
    for (i in 0..<n) {
        function()
    }
}
/* 遞迴的空間複雜度為 O(n) */
fun recur(n: Int) {
    if (n == 1) return
    return recur(n - 1)
}
```

```ruby title=""
def function
    # 執行某些操作
    0
end

### 迴圈的空間複雜度為 O(1) ###
def loop(n)
    (0...n).each { function }
end

### 遞迴的空間複雜度為 O(n) ###
def recur(n)
    return if n == 1
    recur(n - 1)
end
```
