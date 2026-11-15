<!-- [snippet]{space_categories} -->
```python title=""
class Node:
    """클래스"""
    def __init__(self, x: int):
        self.val: int = x              # 노드 값
        self.next: Node | None = None  # 다음 노드를 가리키는 참조

def function() -> int:
    """함수"""
    # 몇 가지 연산 수행...
    return 0

def algorithm(n) -> int:  # 입력 데이터
    A = 0                 # 임시 데이터(상수, 보통 대문자로 표기)
    b = 0                 # 임시 데이터(변수)
    node = Node(0)        # 임시 데이터(객체)
    c = function()        # 스택 프레임 공간(함수 호출)
    return A + b + c      # 출력 데이터
```

```cpp title=""
/* 구조체 */
struct Node {
    int val;
    Node *next;
    Node(int x) : val(x), next(nullptr) {}
};

/* 함수 */
int func() {
    // 몇 가지 연산 수행...
    return 0;
}

int algorithm(int n) {        // 입력 데이터
    const int a = 0;          // 임시 데이터(상수)
    int b = 0;                // 임시 데이터(변수)
    Node* node = new Node(0); // 임시 데이터(객체)
    int c = func();           // 스택 프레임 공간(함수 호출)
    return a + b + c;         // 출력 데이터
}
```

```java title=""
/* 클래스 */
class Node {
    int val;
    Node next;
    Node(int x) { val = x; }
}

/* 함수 */
int function() {
    // 몇 가지 연산 수행...
    return 0;
}

int algorithm(int n) {        // 입력 데이터
    final int a = 0;          // 임시 데이터(상수)
    int b = 0;                // 임시 데이터(변수)
    Node node = new Node(0);  // 임시 데이터(객체)
    int c = function();       // 스택 프레임 공간(함수 호출)
    return a + b + c;         // 출력 데이터
}
```

```csharp title=""
/* 클래스 */
class Node(int x) {
    int val = x;
    Node next;
}

/* 함수 */
int Function() {
    // 몇 가지 연산 수행...
    return 0;
}

int Algorithm(int n) {        // 입력 데이터
    const int a = 0;          // 임시 데이터(상수)
    int b = 0;                // 임시 데이터(변수)
    Node node = new(0);       // 임시 데이터(객체)
    int c = Function();       // 스택 프레임 공간(함수 호출)
    return a + b + c;         // 출력 데이터
}
```

```go title=""
/* 구조체 */
type node struct {
    val  int
    next *node
}

/* node 구조체 생성  */
func newNode(val int) *node {
    return &node{val: val}
}

/* 함수 */
func function() int {
    // 몇 가지 연산 수행...
    return 0
}

func algorithm(n int) int { // 입력 데이터
    const a = 0             // 임시 데이터(상수)
    b := 0                  // 임시 데이터(변수)
    newNode(0)              // 임시 데이터(객체)
    c := function()         // 스택 프레임 공간(함수 호출)
    return a + b + c        // 출력 데이터
}
```

```swift title=""
/* 클래스 */
class Node {
    var val: Int
    var next: Node?

    init(x: Int) {
        val = x
    }
}

/* 함수 */
func function() -> Int {
    // 몇 가지 연산 수행...
    return 0
}

func algorithm(n: Int) -> Int { // 입력 데이터
    let a = 0             // 임시 데이터(상수)
    var b = 0             // 임시 데이터(변수)
    let node = Node(x: 0) // 임시 데이터(객체)
    let c = function()    // 스택 프레임 공간(함수 호출)
    return a + b + c      // 출력 데이터
}
```

```javascript title=""
/* 클래스 */
class Node {
    val;
    next;
    constructor(val) {
        this.val = val === undefined ? 0 : val; // 노드 값
        this.next = null;                       // 다음 노드를 가리키는 참조
    }
}

/* 함수 */
function constFunc() {
    // 몇 가지 연산 수행
    return 0;
}

function algorithm(n) {       // 입력 데이터
    const a = 0;              // 임시 데이터(상수)
    let b = 0;                // 임시 데이터(변수)
    const node = new Node(0); // 임시 데이터(객체)
    const c = constFunc();    // 스택 프레임 공간(함수 호출)
    return a + b + c;         // 출력 데이터
}
```

```typescript title=""
/* 클래스 */
class Node {
    val: number;
    next: Node | null;
    constructor(val?: number) {
        this.val = val === undefined ? 0 : val; // 노드 값
        this.next = null;                       // 다음 노드를 가리키는 참조
    }
}

/* 함수 */
function constFunc(): number {
    // 몇 가지 연산 수행
    return 0;
}

function algorithm(n: number): number { // 입력 데이터
    const a = 0;                        // 임시 데이터(상수)
    let b = 0;                          // 임시 데이터(변수)
    const node = new Node(0);           // 임시 데이터(객체)
    const c = constFunc();              // 스택 프레임 공간(함수 호출)
    return a + b + c;                   // 출력 데이터
}
```

```dart title=""
/* 클래스 */
class Node {
  int val;
  Node? next;
  Node(this.val, [this.next]);
}

/* 함수 */
int function() {
  // 몇 가지 연산 수행...
  return 0;
}

int algorithm(int n) {  // 입력 데이터
  const int a = 0;      // 임시 데이터(상수)
  int b = 0;            // 임시 데이터(변수)
  Node node = Node(0);  // 임시 데이터(객체)
  int c = function();   // 스택 프레임 공간(함수 호출)
  return a + b + c;     // 출력 데이터
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 구조체 */
struct Node {
    val: i32,
    next: Option<Rc<RefCell<Node>>>,
}

/* Node 구조체 생성 */
impl Node {
    fn new(val: i32) -> Self {
        Self { val: val, next: None }
    }
}

/* 함수 */
fn function() -> i32 {      
    // 몇 가지 연산 수행...
    return 0;
}

fn algorithm(n: i32) -> i32 {       // 입력 데이터
    const a: i32 = 0;               // 임시 데이터(상수)
    let mut b = 0;                  // 임시 데이터(변수)
    let node = Node::new(0);        // 임시 데이터(객체)
    let c = function();             // 스택 프레임 공간(함수 호출)
    return a + b + c;               // 출력 데이터
}
```

```c title=""
/* 함수 */
int func() {
    // 몇 가지 연산 수행...
    return 0;
}

int algorithm(int n) { // 입력 데이터
    const int a = 0;   // 임시 데이터(상수)
    int b = 0;         // 임시 데이터(변수)
    int c = func();    // 스택 프레임 공간(함수 호출)
    return a + b + c;  // 출력 데이터
}
```

```kotlin title=""
/* 클래스 */
class Node(var _val: Int) {
    var next: Node? = null
}

/* 함수 */
fun function(): Int {
    // 몇 가지 연산 수행...
    return 0
}

fun algorithm(n: Int): Int { // 입력 데이터
    val a = 0                // 임시 데이터(상수)
    var b = 0                // 임시 데이터(변수)
    val node = Node(0)       // 임시 데이터(객체)
    val c = function()       // 스택 프레임 공간(함수 호출)
    return a + b + c         // 출력 데이터
}
```

```ruby title=""
### 클래스 ###
class Node
    attr_accessor :val      # 노드 값
    attr_accessor :next     # 다음 노드를 가리키는 참조

    def initialize(x)
        @val = x
    end
end

### 함수 ###
def function
    # 몇 가지 연산 수행...
    0
end

### 알고리즘 ###
def algorithm(n)        # 입력 데이터
    a = 0               # 임시 데이터(상수)
    b = 0               # 임시 데이터(변수)
    node = Node.new(0)  # 임시 데이터(객체)
    c = function        # 스택 프레임 공간(함수 호출)
    a + b + c           # 출력 데이터
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
    # 몇 가지 연산 수행
    return 0

def loop(n: int):
    """반복문의 공간 복잡도는 O(1)"""
    for _ in range(n):
        function()

def recur(n: int):
    """재귀의 공간 복잡도는 O(n)"""
    if n == 1:
        return
    return recur(n - 1)
```

```cpp title=""
int func() {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```java title=""
int function() {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        function();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```csharp title=""
int Function() {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
void Loop(int n) {
    for (int i = 0; i < n; i++) {
        Function();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
int Recur(int n) {
    if (n == 1) return 1;
    return Recur(n - 1);
}
```

```go title=""
func function() int {
    // 몇 가지 연산 수행
    return 0
}

/* 반복문의 공간 복잡도는 O(1) */
func loop(n int) {
    for i := 0; i < n; i++ {
        function()
    }
}

/* 재귀의 공간 복잡도는 O(n) */
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
    // 몇 가지 연산 수행
    return 0
}

/* 반복문의 공간 복잡도는 O(1) */
func loop(n: Int) {
    for _ in 0 ..< n {
        function()
    }
}

/* 재귀의 공간 복잡도는 O(n) */
func recur(n: Int) {
    if n == 1 {
        return
    }
    recur(n: n - 1)
}
```

```javascript title=""
function constFunc() {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
function loop(n) {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
function recur(n) {
    if (n === 1) return;
    return recur(n - 1);
}
```

```typescript title=""
function constFunc(): number {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
function loop(n: number): void {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
function recur(n: number): void {
    if (n === 1) return;
    return recur(n - 1);
}
```

```dart title=""
int function() {
  // 몇 가지 연산 수행
  return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
void loop(int n) {
  for (int i = 0; i < n; i++) {
    function();
  }
}
/* 재귀의 공간 복잡도는 O(n) */
void recur(int n) {
  if (n == 1) return;
  recur(n - 1);
}
```

```rust title=""
fn function() -> i32 {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
fn for_loop(n: i32) {
    for i in 0..n {
        function();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
fn recur(n: i32) {
    if n == 1 {
        return;
    }
    recur(n - 1);
}
```

```c title=""
int func() {
    // 몇 가지 연산 수행
    return 0;
}
/* 반복문의 공간 복잡도는 O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* 재귀의 공간 복잡도는 O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```kotlin title=""
fun function(): Int {
    // 몇 가지 연산 수행
    return 0
}
/* 반복문의 공간 복잡도는 O(1) */
fun loop(n: Int) {
    for (i in 0..<n) {
        function()
    }
}
/* 재귀의 공간 복잡도는 O(n) */
fun recur(n: Int) {
    if (n == 1) return
    return recur(n - 1)
}
```

```ruby title=""
def function
    # 몇 가지 연산 수행
    0
end

### 반복문의 공간 복잡도는 O(1) ###
def loop(n)
    (0...n).each { function }
end

### 재귀의 공간 복잡도는 O(n) ###
def recur(n)
    return if n == 1
    recur(n - 1)
end
```
