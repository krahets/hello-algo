<!-- [snippet]{space_categories} -->
```python title=""
class Node:
    """Class"""
    def __init__(self, x: int):
        self.val: int = x              # Node value
        self.next: Node | None = None  # Reference to the next node

def function() -> int:
    """Function"""
    # Perform some operations...
    return 0

def algorithm(n) -> int:  # Input data
    A = 0                 # Temporary data (constant, conventionally named in uppercase)
    b = 0                 # Temporary data (variable)
    node = Node(0)        # Temporary data (object)
    c = function()        # Stack frame (function call)
    return A + b + c      # Output data
```

```cpp title=""
/* Structure */
struct Node {
    int val;
    Node *next;
    Node(int x) : val(x), next(nullptr) {}
};

/* Function */
int func() {
    // Perform some operations...
    return 0;
}

int algorithm(int n) {        // Input data
    const int a = 0;          // Temporary data (constant)
    int b = 0;                // Temporary data (variable)
    Node* node = new Node(0); // Temporary data (object)
    int c = func();           // Stack frame (function call)
    return a + b + c;         // Output data
}
```

```java title=""
/* Class */
class Node {
    int val;
    Node next;
    Node(int x) { val = x; }
}

/* Function */
int function() {
    // Perform some operations...
    return 0;
}

int algorithm(int n) {        // Input data
    final int a = 0;          // Temporary data (constant)
    int b = 0;                // Temporary data (variable)
    Node node = new Node(0);  // Temporary data (object)
    int c = function();       // Stack frame (function call)
    return a + b + c;         // Output data
}
```

```csharp title=""
/* Class */
class Node(int x) {
    int val = x;
    Node next;
}

/* Function */
int Function() {
    // Perform some operations...
    return 0;
}

int Algorithm(int n) {        // Input data
    const int a = 0;          // Temporary data (constant)
    int b = 0;                // Temporary data (variable)
    Node node = new(0);       // Temporary data (object)
    int c = Function();       // Stack frame (function call)
    return a + b + c;         // Output data
}
```

```go title=""
/* Structure */
type node struct {
    val  int
    next *node
}

/* Create a node structure  */
func newNode(val int) *node {
    return &node{val: val}
}

/* Function */
func function() int {
    // Perform some operations...
    return 0
}

func algorithm(n int) int { // Input data
    const a = 0             // Temporary data (constant)
    b := 0                  // Temporary data (variable)
    newNode(0)              // Temporary data (object)
    c := function()         // Stack frame (function call)
    return a + b + c        // Output data
}
```

```swift title=""
/* Class */
class Node {
    var val: Int
    var next: Node?

    init(x: Int) {
        val = x
    }
}

/* Function */
func function() -> Int {
    // Perform some operations...
    return 0
}

func algorithm(n: Int) -> Int { // Input data
    let a = 0             // Temporary data (constant)
    var b = 0             // Temporary data (variable)
    let node = Node(x: 0) // Temporary data (object)
    let c = function()    // Stack frame (function call)
    return a + b + c      // Output data
}
```

```javascript title=""
/* Class */
class Node {
    val;
    next;
    constructor(val) {
        this.val = val === undefined ? 0 : val; // Node value
        this.next = null;                       // Reference to the next node
    }
}

/* Function */
function constFunc() {
    // Perform some operations
    return 0;
}

function algorithm(n) {       // Input data
    const a = 0;              // Temporary data (constant)
    let b = 0;                // Temporary data (variable)
    const node = new Node(0); // Temporary data (object)
    const c = constFunc();    // Stack frame (function call)
    return a + b + c;         // Output data
}
```

```typescript title=""
/* Class */
class Node {
    val: number;
    next: Node | null;
    constructor(val?: number) {
        this.val = val === undefined ? 0 : val; // Node value
        this.next = null;                       // Reference to the next node
    }
}

/* Function */
function constFunc(): number {
    // Perform some operations
    return 0;
}

function algorithm(n: number): number { // Input data
    const a = 0;                        // Temporary data (constant)
    let b = 0;                          // Temporary data (variable)
    const node = new Node(0);           // Temporary data (object)
    const c = constFunc();              // Stack frame (function call)
    return a + b + c;                   // Output data
}
```

```dart title=""
/* Class */
class Node {
  int val;
  Node? next;
  Node(this.val, [this.next]);
}

/* Function */
int function() {
  // Perform some operations...
  return 0;
}

int algorithm(int n) {  // Input data
  const int a = 0;      // Temporary data (constant)
  int b = 0;            // Temporary data (variable)
  Node node = Node(0);  // Temporary data (object)
  int c = function();   // Stack frame (function call)
  return a + b + c;     // Output data
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Structure */
struct Node {
    val: i32,
    next: Option<Rc<RefCell<Node>>>,
}

/* Create a Node structure */
impl Node {
    fn new(val: i32) -> Self {
        Self { val: val, next: None }
    }
}

/* Function */
fn function() -> i32 {      
    // Perform some operations...
    return 0;
}

fn algorithm(n: i32) -> i32 {       // Input data
    const a: i32 = 0;               // Temporary data (constant)
    let mut b = 0;                  // Temporary data (variable)
    let node = Node::new(0);        // Temporary data (object)
    let c = function();             // Stack frame (function call)
    return a + b + c;               // Output data
}
```

```c title=""
/* Function */
int func() {
    // Perform some operations...
    return 0;
}

int algorithm(int n) { // Input data
    const int a = 0;   // Temporary data (constant)
    int b = 0;         // Temporary data (variable)
    int c = func();    // Stack frame (function call)
    return a + b + c;  // Output data
}
```

```kotlin title=""
/* Class */
class Node(var _val: Int) {
    var next: Node? = null
}

/* Function */
fun function(): Int {
    // Perform some operations...
    return 0
}

fun algorithm(n: Int): Int { // Input data
    val a = 0                // Temporary data (constant)
    var b = 0                // Temporary data (variable)
    val node = Node(0)       // Temporary data (object)
    val c = function()       // Stack frame (function call)
    return a + b + c         // Output data
}
```

```ruby title=""
### Class ###
class Node
    attr_accessor :val      # Node value
    attr_accessor :next     # Reference to the next node

    def initialize(x)
        @val = x
    end
end

### Function ###
def function
    # Perform some operations...
    0
end

### Algorithm ###
def algorithm(n)        # Input data
    a = 0               # Temporary data (constant)
    b = 0               # Temporary data (variable)
    node = Node.new(0)  # Temporary data (object)
    c = function        # Stack frame (function call)
    a + b + c           # Output data
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
    # Perform some operations
    return 0

def loop(n: int):
    """The loop uses O(1) space"""
    for _ in range(n):
        function()

def recur(n: int):
    """The recursion uses O(n) space"""
    if n == 1:
        return
    return recur(n - 1)
```

```cpp title=""
int func() {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* The recursion uses O(n) space */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```java title=""
int function() {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        function();
    }
}
/* The recursion uses O(n) space */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```csharp title=""
int Function() {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
void Loop(int n) {
    for (int i = 0; i < n; i++) {
        Function();
    }
}
/* The recursion uses O(n) space */
int Recur(int n) {
    if (n == 1) return 1;
    return Recur(n - 1);
}
```

```go title=""
func function() int {
    // Perform some operations
    return 0
}

/* The loop uses O(1) space */
func loop(n int) {
    for i := 0; i < n; i++ {
        function()
    }
}

/* The recursion uses O(n) space */
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
    // Perform some operations
    return 0
}

/* The loop uses O(1) space */
func loop(n: Int) {
    for _ in 0 ..< n {
        function()
    }
}

/* The recursion uses O(n) space */
func recur(n: Int) {
    if n == 1 {
        return
    }
    recur(n: n - 1)
}
```

```javascript title=""
function constFunc() {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
function loop(n) {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* The recursion uses O(n) space */
function recur(n) {
    if (n === 1) return;
    return recur(n - 1);
}
```

```typescript title=""
function constFunc(): number {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
function loop(n: number): void {
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}
/* The recursion uses O(n) space */
function recur(n: number): void {
    if (n === 1) return;
    return recur(n - 1);
}
```

```dart title=""
int function() {
  // Perform some operations
  return 0;
}
/* The loop uses O(1) space */
void loop(int n) {
  for (int i = 0; i < n; i++) {
    function();
  }
}
/* The recursion uses O(n) space */
void recur(int n) {
  if (n == 1) return;
  recur(n - 1);
}
```

```rust title=""
fn function() -> i32 {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
fn for_loop(n: i32) {
    for i in 0..n {
        function();
    }
}
/* The recursion uses O(n) space */
fn recur(n: i32) {
    if n == 1 {
        return;
    }
    recur(n - 1);
}
```

```c title=""
int func() {
    // Perform some operations
    return 0;
}
/* The loop uses O(1) space */
void loop(int n) {
    for (int i = 0; i < n; i++) {
        func();
    }
}
/* The recursion uses O(n) space */
void recur(int n) {
    if (n == 1) return;
    recur(n - 1);
}
```

```kotlin title=""
fun function(): Int {
    // Perform some operations
    return 0
}
/* The loop uses O(1) space */
fun loop(n: Int) {
    for (i in 0..<n) {
        function()
    }
}
/* The recursion uses O(n) space */
fun recur(n: Int) {
    if (n == 1) return
    return recur(n - 1)
}
```

```ruby title=""
def function
    # Perform some operations
    0
end

### The loop uses O(1) space ###
def loop(n)
    (0...n).each { function }
end

### The recursion uses O(n) space ###
def recur(n)
    return if n == 1
    recur(n - 1)
end
```
