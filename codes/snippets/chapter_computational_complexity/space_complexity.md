<!-- [snippet]{space_categories} -->
```python title=""
class Node:
    """类"""
    def __init__(self, x: int):
        self.val: int = x              # 节点值
        self.next: Node | None = None  # 指向下一节点的引用

def function() -> int:
    """函数"""
    # 执行某些操作...
    return 0

def algorithm(n) -> int:  # 输入数据
    A = 0                 # 暂存数据（常量，一般用大写字母表示）
    b = 0                 # 暂存数据（变量）
    node = Node(0)        # 暂存数据（对象）
    c = function()        # 栈帧空间（调用函数）
    return A + b + c      # 输出数据
```

```cpp title=""
/* 结构体 */
struct Node {
    int val;
    Node *next;
    Node(int x) : val(x), next(nullptr) {}
};

/* 函数 */
int func() {
    // 执行某些操作...
    return 0;
}

int algorithm(int n) {        // 输入数据
    const int a = 0;          // 暂存数据（常量）
    int b = 0;                // 暂存数据（变量）
    Node* node = new Node(0); // 暂存数据（对象）
    int c = func();           // 栈帧空间（调用函数）
    return a + b + c;         // 输出数据
}
```

```java title=""
/* 类 */
class Node {
    int val;
    Node next;
    Node(int x) { val = x; }
}

/* 函数 */
int function() {
    // 执行某些操作...
    return 0;
}

int algorithm(int n) {        // 输入数据
    final int a = 0;          // 暂存数据（常量）
    int b = 0;                // 暂存数据（变量）
    Node node = new Node(0);  // 暂存数据（对象）
    int c = function();       // 栈帧空间（调用函数）
    return a + b + c;         // 输出数据
}
```

```csharp title=""
/* 类 */
class Node(int x) {
    int val = x;
    Node next;
}

/* 函数 */
int Function() {
    // 执行某些操作...
    return 0;
}

int Algorithm(int n) {        // 输入数据
    const int a = 0;          // 暂存数据（常量）
    int b = 0;                // 暂存数据（变量）
    Node node = new(0);       // 暂存数据（对象）
    int c = Function();       // 栈帧空间（调用函数）
    return a + b + c;         // 输出数据
}
```

```go title=""
/* 结构体 */
type node struct {
    val  int
    next *node
}

/* 创建 node 结构体  */
func newNode(val int) *node {
    return &node{val: val}
}

/* 函数 */
func function() int {
    // 执行某些操作...
    return 0
}

func algorithm(n int) int { // 输入数据
    const a = 0             // 暂存数据（常量）
    b := 0                  // 暂存数据（变量）
    newNode(0)              // 暂存数据（对象）
    c := function()         // 栈帧空间（调用函数）
    return a + b + c        // 输出数据
}
```

```swift title=""
/* 类 */
class Node {
    var val: Int
    var next: Node?

    init(x: Int) {
        val = x
    }
}

/* 函数 */
func function() -> Int {
    // 执行某些操作...
    return 0
}

func algorithm(n: Int) -> Int { // 输入数据
    let a = 0             // 暂存数据（常量）
    var b = 0             // 暂存数据（变量）
    let node = Node(x: 0) // 暂存数据（对象）
    let c = function()    // 栈帧空间（调用函数）
    return a + b + c      // 输出数据
}
```

```javascript title=""
/* 类 */
class Node {
    val;
    next;
    constructor(val) {
        this.val = val === undefined ? 0 : val; // 节点值
        this.next = null;                       // 指向下一节点的引用
    }
}

/* 函数 */
function constFunc() {
    // 执行某些操作
    return 0;
}

function algorithm(n) {       // 输入数据
    const a = 0;              // 暂存数据（常量）
    let b = 0;                // 暂存数据（变量）
    const node = new Node(0); // 暂存数据（对象）
    const c = constFunc();    // 栈帧空间（调用函数）
    return a + b + c;         // 输出数据
}
```

```typescript title=""
/* 类 */
class Node {
    val: number;
    next: Node | null;
    constructor(val?: number) {
        this.val = val === undefined ? 0 : val; // 节点值
        this.next = null;                       // 指向下一节点的引用
    }
}

/* 函数 */
function constFunc(): number {
    // 执行某些操作
    return 0;
}

function algorithm(n: number): number { // 输入数据
    const a = 0;                        // 暂存数据（常量）
    let b = 0;                          // 暂存数据（变量）
    const node = new Node(0);           // 暂存数据（对象）
    const c = constFunc();              // 栈帧空间（调用函数）
    return a + b + c;                   // 输出数据
}
```

```dart title=""
/* 类 */
class Node {
  int val;
  Node? next;
  Node(this.val, [this.next]);
}

/* 函数 */
int function() {
  // 执行某些操作...
  return 0;
}

int algorithm(int n) {  // 输入数据
  const int a = 0;      // 暂存数据（常量）
  int b = 0;            // 暂存数据（变量）
  Node node = Node(0);  // 暂存数据（对象）
  int c = function();   // 栈帧空间（调用函数）
  return a + b + c;     // 输出数据
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 结构体 */
struct Node {
    val: i32,
    next: Option<Rc<RefCell<Node>>>,
}

/* 创建 Node 结构体 */
impl Node {
    fn new(val: i32) -> Self {
        Self { val: val, next: None }
    }
}

/* 函数 */
fn function() -> i32 {      
    // 执行某些操作...
    return 0;
}

fn algorithm(n: i32) -> i32 {       // 输入数据
    const a: i32 = 0;               // 暂存数据（常量）
    let mut b = 0;                  // 暂存数据（变量）
    let node = Node::new(0);        // 暂存数据（对象）
    let c = function();             // 栈帧空间（调用函数）
    return a + b + c;               // 输出数据
}
```

```c title=""
/* 函数 */
int func() {
    // 执行某些操作...
    return 0;
}

int algorithm(int n) { // 输入数据
    const int a = 0;   // 暂存数据（常量）
    int b = 0;         // 暂存数据（变量）
    int c = func();    // 栈帧空间（调用函数）
    return a + b + c;  // 输出数据
}
```

```kotlin title=""
/* 类 */
class Node(var _val: Int) {
    var next: Node? = null
}

/* 函数 */
fun function(): Int {
    // 执行某些操作...
    return 0
}

fun algorithm(n: Int): Int { // 输入数据
    val a = 0                // 暂存数据（常量）
    var b = 0                // 暂存数据（变量）
    val node = Node(0)       // 暂存数据（对象）
    val c = function()       // 栈帧空间（调用函数）
    return a + b + c         // 输出数据
}
```

```ruby title=""
### 类 ###
class Node
    attr_accessor :val      # 节点值
    attr_accessor :next     # 指向下一节点的引用

    def initialize(x)
        @val = x
    end
end

### 函数 ###
def function
    # 执行某些操作...
    0
end

### 算法 ###
def algorithm(n)        # 输入数据
    a = 0               # 暂存数据（常量）
    b = 0               # 暂存数据（变量）
    node = Node.new(0)  # 暂存数据（对象）
    c = function        # 栈帧空间（调用函数）
    a + b + c           # 输出数据
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
    # 执行某些操作
    return 0

def loop(n: int):
    """循环的空间复杂度为 O(1)"""
    for _ in range(n):
        function()

def recur(n: int):
    """递归的空间复杂度为 O(n)"""
    if n == 1:
        return
    return recur(n - 1)
```

```cpp title=""
int func() {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* 递归的空间复杂度为 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```java title=""
int function() {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        function();
    }
}
/* 递归的空间复杂度为 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```csharp title=""
int Function() {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
void Loop(int n) {
    for (int i = 0; i < n; i++) {
        Function();
    }
}
/* 递归的空间复杂度为 O(n) */
int Recur(int n) {
    if (n == 1) return 1;
    return Recur(n - 1);
}
```

```go title=""
func function() int {
    // 执行某些操作
    return 0
}

/* 循环的空间复杂度为 O(1) */
func loop(n int) {
    for i := 0; i < n; i++ {
        function()
    }
}

/* 递归的空间复杂度为 O(n) */
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
    // 执行某些操作
    return 0
}

/* 循环的空间复杂度为 O(1) */
func loop(n: Int) {
    for _ in 0 ..< n {
        function()
    }
}

/* 递归的空间复杂度为 O(n) */
func recur(n: Int) {
    if n == 1 {
        return
    }
    recur(n: n - 1)
}
```

```javascript title=""
function constFunc() {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
function loop(n) {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* 递归的空间复杂度为 O(n) */
function recur(n) {
    if (n === 1) return;
    return recur(n - 1);
}
```

```typescript title=""
function constFunc(): number {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
function loop(n: number): void {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* 递归的空间复杂度为 O(n) */
function recur(n: number): void {
    if (n === 1) return;
    return recur(n - 1);
}
```

```dart title=""
int function() {
  // 执行某些操作
  return 0;
}
/* 循环的空间复杂度为 O(1) */
void loop(int n) {
  for (int i = 0; i < n; i++) {
    function();
  }
}
/* 递归的空间复杂度为 O(n) */
void recur(int n) {
  if (n == 1) return;
  recur(n - 1);
}
```

```rust title=""
fn function() -> i32 {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
fn for_loop(n: i32) {
    for i in 0..n {
        function();
    }
}
/* 递归的空间复杂度为 O(n) */
fn recur(n: i32) {
    if n == 1 {
        return;
    }
    recur(n - 1);
}
```

```c title=""
int func() {
    // 执行某些操作
    return 0;
}
/* 循环的空间复杂度为 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* 递归的空间复杂度为 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```kotlin title=""
fun function(): Int {
    // 执行某些操作
    return 0
}
/* 循环的空间复杂度为 O(1) */
fun loop(n: Int) {
    for (i in 0..<n) {
        function()
    }
}
/* 递归的空间复杂度为 O(n) */
fun recur(n: Int) {
    if (n == 1) return
    return recur(n - 1)
}
```

```ruby title=""
def function
    # 执行某些操作
    0
end

### 循环的空间复杂度为 O(1) ###
def loop(n)
    (0...n).each { function }
end

### 递归的空间复杂度为 O(n) ###
def recur(n)
    return if n == 1
    recur(n - 1)
end
```
