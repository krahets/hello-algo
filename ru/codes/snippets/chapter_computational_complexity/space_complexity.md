<!-- [snippet]{space_categories} -->
```python title=""
class Node:
    """Класс"""
    def __init__(self, x: int):
        self.val: int = x              # Значение узла
        self.next: Node | None = None  # Ссылка на следующий узел

def function() -> int:
    """Функция"""
    # Выполнить некоторые операции...
    return 0

def algorithm(n) -> int:  # Входные данные
    A = 0                 # Временные данные (константа, обычно обозначается заглавной буквой)
    b = 0                 # Временные данные (переменная)
    node = Node(0)        # Временные данные (объект)
    c = function()        # Пространство кадра стека (вызов функции)
    return A + b + c      # Выходные данные
```

```cpp title=""
/* Структура */
struct Node {
    int val;
    Node *next;
    Node(int x) : val(x), next(nullptr) {}
};

/* Функция */
int func() {
    // Выполнить некоторые операции...
    return 0;
}

int algorithm(int n) {        // Входные данные
    const int a = 0;          // Временные данные (константа)
    int b = 0;                // Временные данные (переменная)
    Node* node = new Node(0); // Временные данные (объект)
    int c = func();           // Пространство кадра стека (вызов функции)
    return a + b + c;         // Выходные данные
}
```

```java title=""
/* Класс */
class Node {
    int val;
    Node next;
    Node(int x) { val = x; }
}

/* Функция */
int function() {
    // Выполнить некоторые операции...
    return 0;
}

int algorithm(int n) {        // Входные данные
    final int a = 0;          // Временные данные (константа)
    int b = 0;                // Временные данные (переменная)
    Node node = new Node(0);  // Временные данные (объект)
    int c = function();       // Пространство кадра стека (вызов функции)
    return a + b + c;         // Выходные данные
}
```

```csharp title=""
/* Класс */
class Node(int x) {
    int val = x;
    Node next;
}

/* Функция */
int Function() {
    // Выполнить некоторые операции...
    return 0;
}

int Algorithm(int n) {        // Входные данные
    const int a = 0;          // Временные данные (константа)
    int b = 0;                // Временные данные (переменная)
    Node node = new(0);       // Временные данные (объект)
    int c = Function();       // Пространство кадра стека (вызов функции)
    return a + b + c;         // Выходные данные
}
```

```go title=""
/* Структура */
type node struct {
    val  int
    next *node
}

/* Создать структуру node */
func newNode(val int) *node {
    return &node{val: val}
}

/* Функция */
func function() int {
    // Выполнить некоторые операции...
    return 0
}

func algorithm(n int) int { // Входные данные
    const a = 0             // Временные данные (константа)
    b := 0                  // Временные данные (переменная)
    newNode(0)              // Временные данные (объект)
    c := function()         // Пространство кадра стека (вызов функции)
    return a + b + c        // Выходные данные
}
```

```swift title=""
/* Класс */
class Node {
    var val: Int
    var next: Node?

    init(x: Int) {
        val = x
    }
}

/* Функция */
func function() -> Int {
    // Выполнить некоторые операции...
    return 0
}

func algorithm(n: Int) -> Int { // Входные данные
    let a = 0             // Временные данные (константа)
    var b = 0             // Временные данные (переменная)
    let node = Node(x: 0) // Временные данные (объект)
    let c = function()    // Пространство кадра стека (вызов функции)
    return a + b + c      // Выходные данные
}
```

```javascript title=""
/* Класс */
class Node {
    val;
    next;
    constructor(val) {
        this.val = val === undefined ? 0 : val; // Значение узла
        this.next = null;                       // Ссылка на следующий узел
    }
}

/* Функция */
function constFunc() {
    // Выполнить некоторые операции
    return 0;
}

function algorithm(n) {       // Входные данные
    const a = 0;              // Временные данные (константа)
    let b = 0;                // Временные данные (переменная)
    const node = new Node(0); // Временные данные (объект)
    const c = constFunc();    // Пространство кадра стека (вызов функции)
    return a + b + c;         // Выходные данные
}
```

```typescript title=""
/* Класс */
class Node {
    val: number;
    next: Node | null;
    constructor(val?: number) {
        this.val = val === undefined ? 0 : val; // Значение узла
        this.next = null;                       // Ссылка на следующий узел
    }
}

/* Функция */
function constFunc(): number {
    // Выполнить некоторые операции
    return 0;
}

function algorithm(n: number): number { // Входные данные
    const a = 0;                        // Временные данные (константа)
    let b = 0;                          // Временные данные (переменная)
    const node = new Node(0);           // Временные данные (объект)
    const c = constFunc();              // Пространство кадра стека (вызов функции)
    return a + b + c;                   // Выходные данные
}
```

```dart title=""
/* Класс */
class Node {
  int val;
  Node? next;
  Node(this.val, [this.next]);
}

/* Функция */
int function() {
  // Выполнить некоторые операции...
  return 0;
}

int algorithm(int n) {  // Входные данные
  const int a = 0;      // Временные данные (константа)
  int b = 0;            // Временные данные (переменная)
  Node node = Node(0);  // Временные данные (объект)
  int c = function();   // Пространство кадра стека (вызов функции)
  return a + b + c;     // Выходные данные
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Структура */
struct Node {
    val: i32,
    next: Option<Rc<RefCell<Node>>>,
}

/* Создать структуру Node */
impl Node {
    fn new(val: i32) -> Self {
        Self { val: val, next: None }
    }
}

/* Функция */
fn function() -> i32 {      
    // Выполнить некоторые операции...
    return 0;
}

fn algorithm(n: i32) -> i32 {       // Входные данные
    const a: i32 = 0;               // Временные данные (константа)
    let mut b = 0;                  // Временные данные (переменная)
    let node = Node::new(0);        // Временные данные (объект)
    let c = function();             // Пространство кадра стека (вызов функции)
    return a + b + c;               // Выходные данные
}
```

```c title=""
/* Функция */
int func() {
    // Выполнить некоторые операции...
    return 0;
}

int algorithm(int n) { // Входные данные
    const int a = 0;   // Временные данные (константа)
    int b = 0;         // Временные данные (переменная)
    int c = func();    // Пространство кадра стека (вызов функции)
    return a + b + c;  // Выходные данные
}
```

```kotlin title=""
/* Класс */
class Node(var _val: Int) {
    var next: Node? = null
}

/* Функция */
fun function(): Int {
    // Выполнить некоторые операции...
    return 0
}

fun algorithm(n: Int): Int { // Входные данные
    val a = 0                // Временные данные (константа)
    var b = 0                // Временные данные (переменная)
    val node = Node(0)       // Временные данные (объект)
    val c = function()       // Пространство кадра стека (вызов функции)
    return a + b + c         // Выходные данные
}
```

```ruby title=""
### Класс ###
class Node
    attr_accessor :val      # Значение узла
    attr_accessor :next     # Ссылка на следующий узел

    def initialize(x)
        @val = x
    end
end

### Функция ###
def function
    # Выполнить некоторые операции...
    0
end

### Алгоритм ###
def algorithm(n)        # Входные данные
    a = 0               # Временные данные (константа)
    b = 0               # Временные данные (переменная)
    node = Node.new(0)  # Временные данные (объект)
    c = function        # Пространство кадра стека (вызов функции)
    a + b + c           # Выходные данные
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
    # Выполнить некоторые операции
    return 0

def loop(n: int):
    """Пространственная сложность цикла равна O(1)"""
    for _ in range(n):
        function()

def recur(n: int):
    """Пространственная сложность рекурсии равна O(n)"""
    if n == 1:
        return
    return recur(n - 1)
```

```cpp title=""
int func() {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```java title=""
int function() {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        function();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```csharp title=""
int Function() {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
void Loop(int n) {
    for (int i = 0; i < n; i++) {
        Function();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
int Recur(int n) {
    if (n == 1) return 1;
    return Recur(n - 1);
}
```

```go title=""
func function() int {
    // Выполнить некоторые операции
    return 0
}

/* Пространственная сложность цикла равна O(1) */
func loop(n int) {
    for i := 0; i < n; i++ {
        function()
    }
}

/* Пространственная сложность рекурсии равна O(n) */
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
    // Выполнить некоторые операции
    return 0
}

/* Пространственная сложность цикла равна O(1) */
func loop(n: Int) {
    for _ in 0 ..< n {
        function()
    }
}

/* Пространственная сложность рекурсии равна O(n) */
func recur(n: Int) {
    if n == 1 {
        return
    }
    recur(n: n - 1)
}
```

```javascript title=""
function constFunc() {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
function loop(n) {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
function recur(n) {
    if (n === 1) return;
    return recur(n - 1);
}
```

```typescript title=""
function constFunc(): number {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
function loop(n: number): void {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
function recur(n: number): void {
    if (n === 1) return;
    return recur(n - 1);
}
```

```dart title=""
int function() {
  // Выполнить некоторые операции
  return 0;
}
/* Пространственная сложность цикла равна O(1) */
void loop(int n) {
  for (int i = 0; i < n; i++) {
    function();
  }
}
/* Пространственная сложность рекурсии равна O(n) */
void recur(int n) {
  if (n == 1) return;
  recur(n - 1);
}
```

```rust title=""
fn function() -> i32 {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
fn for_loop(n: i32) {
    for i in 0..n {
        function();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
fn recur(n: i32) {
    if n == 1 {
        return;
    }
    recur(n - 1);
}
```

```c title=""
int func() {
    // Выполнить некоторые операции
    return 0;
}
/* Пространственная сложность цикла равна O(1) */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* Пространственная сложность рекурсии равна O(n) */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```kotlin title=""
fun function(): Int {
    // Выполнить некоторые операции
    return 0
}
/* Пространственная сложность цикла равна O(1) */
fun loop(n: Int) {
    for (i in 0..<n) {
        function()
    }
}
/* Пространственная сложность рекурсии равна O(n) */
fun recur(n: Int) {
    if (n == 1) return
    return recur(n - 1)
}
```

```ruby title=""
def function
    # Выполнить некоторые операции
    0
end

### Пространственная сложность цикла равна O(1) ###
def loop(n)
    (0...n).each { function }
end

### Пространственная сложность рекурсии равна O(n) ###
def recur(n)
    return if n == 1
    recur(n - 1)
end
```
