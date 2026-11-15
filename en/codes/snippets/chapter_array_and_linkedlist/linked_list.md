<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """Linked list node class"""
    def __init__(self, val: int):
        self.val: int = val               # Node value
        self.next: ListNode | None = None # Reference to the next node
```

```cpp title=""
/* Linked list node structure */
struct ListNode {
    int val;         // Node value
    ListNode *next;  // Pointer to the next node
    ListNode(int x) : val(x), next(nullptr) {}  // Constructor
};
```

```java title=""
/* Linked list node class */
class ListNode {
    int val;        // Node value
    ListNode next;  // Reference to the next node
    ListNode(int x) { val = x; }  // Constructor
}
```

```csharp title=""
/* Linked list node class */
class ListNode(int x) {  // Constructor
    public int val = x;     // Node value
    public ListNode? next;  // Reference to the next node
}
```

```go title=""
/* Linked list node structure */
type ListNode struct {
    Val  int       // Node value
    Next *ListNode // Pointer to the next node
}

// NewListNode constructor: create a new linked list
func NewListNode(val int) *ListNode {
    return &ListNode{
        Val:  val,
        Next: nil,
    }
}
```

```swift title=""
/* Linked list node class */
class ListNode {
    var val: Int // Node value
    var next: ListNode? // Reference to the next node

    init(x: Int) { // Constructor
        val = x
    }
}
```

```javascript title=""
/* Linked list node class */
class ListNode {
    constructor(val, next) {
        this.val = (val === undefined ? 0 : val);       // Node value
        this.next = (next === undefined ? null : next); // Reference to the next node
    }
}
```

```typescript title=""
/* Linked list node class */
class ListNode {
    val: number;
    next: ListNode | null;
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;        // Node value
        this.next = next === undefined ? null : next;  // Reference to the next node
    }
}
```

```dart title=""
/* Linked list node class */
class ListNode {
  int val; // Node value
  ListNode? next; // Reference to the next node
  ListNode(this.val, [this.next]); // Constructor
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;
/* Linked list node class */
#[derive(Debug)]
struct ListNode {
    val: i32, // Node value
    next: Option<Rc<RefCell<ListNode>>>, // Pointer to the next node
}
```

```c title=""
/* Linked list node structure */
typedef struct ListNode {
    int val;               // Node value
    struct ListNode *next; // Pointer to the next node
} ListNode;

/* Constructor */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *) malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* Linked list node class */
// Constructor
class ListNode(x: Int) {
    val _val: Int = x          // Node value
    var next: ListNode? = null // Reference to the next node
}
```

```ruby title=""
# Linked list node class
class ListNode
  attr_accessor :val  # Node value
  attr_accessor :next # Reference to the next node

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
[file]{linked_list}-[region]{init_linked_list}
```

```cpp title="linked_list.cpp"
[file]{linked_list}-[region]{init_linked_list}
```

```java title="linked_list.java"
[file]{linked_list}-[region]{init_linked_list}
```

```csharp title="linked_list.cs"
[file]{linked_list}-[region]{init_linked_list}
```

```go title="linked_list.go"
[file]{linked_list_test}-[region]{init_linked_list}
```

```swift title="linked_list.swift"
[file]{linked_list}-[region]{init_linked_list}
```

```javascript title="linked_list.js"
[file]{linked_list}-[region]{init_linked_list}
```

```typescript title="linked_list.ts"
[file]{linked_list}-[region]{init_linked_list}
```

```dart title="linked_list.dart"
[file]{linked_list}-[region]{init_linked_list}
```

```rust title="linked_list.rs"
[file]{linked_list}-[region]{init_linked_list}
```

```c title="linked_list.c"
[file]{linked_list}-[region]{init_linked_list}
```

```kotlin title="linked_list.kt"
[file]{linked_list}-[region]{init_linked_list}
```

```ruby title="linked_list.rb"
[file]{linked_list}-[region]{init_linked_list}
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20successor%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20linked%20list%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20Initialize%20the%20nodes%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20Link%20the%20nodes%20with%20references%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """Doubly linked list node class"""
    def __init__(self, val: int):
        self.val: int = val                # Node value
        self.next: ListNode | None = None  # Reference to the successor
        self.prev: ListNode | None = None  # Reference to the predecessor
```

```cpp title=""
/* Doubly linked list node structure */
struct ListNode {
    int val;         // Node value
    ListNode *next;  // Pointer to the successor
    ListNode *prev;  // Pointer to the predecessor
    ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // Constructor
};
```

```java title=""
/* Doubly linked list node class */
class ListNode {
    int val;        // Node value
    ListNode next;  // Reference to the successor
    ListNode prev;  // Reference to the predecessor
    ListNode(int x) { val = x; }  // Constructor
}
```

```csharp title=""
/* Doubly linked list node class */
class ListNode(int x) {  // Constructor
    public int val = x;     // Node value
    public ListNode? next;  // Reference to the successor
    public ListNode? prev;  // Reference to the predecessor
}
```

```go title=""
/* Doubly linked list node structure */
type DoublyListNode struct {
    Val  int             // Node value
    Next *DoublyListNode // Pointer to the successor
    Prev *DoublyListNode // Pointer to the predecessor
}

// Initialize a node with NewDoublyListNode
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
/* Doubly linked list node class */
class ListNode {
    var val: Int // Node value
    var next: ListNode? // Reference to the successor
    var prev: ListNode? // Reference to the predecessor

    init(x: Int) { // Constructor
        val = x
    }
}
```

```javascript title=""
/* Doubly linked list node class */
class ListNode {
    constructor(val, next, prev) {
        this.val = val  ===  undefined ? 0 : val;        // Node value
        this.next = next  ===  undefined ? null : next;  // Reference to the successor
        this.prev = prev  ===  undefined ? null : prev;  // Reference to the predecessor
    }
}
```

```typescript title=""
/* Doubly linked list node class */
class ListNode {
    val: number;
    next: ListNode | null;
    prev: ListNode | null;
    constructor(val?: number, next?: ListNode | null, prev?: ListNode | null) {
        this.val = val  ===  undefined ? 0 : val;        // Node value
        this.next = next  ===  undefined ? null : next;  // Reference to the successor
        this.prev = prev  ===  undefined ? null : prev;  // Reference to the predecessor
    }
}
```

```dart title=""
/* Doubly linked list node class */
class ListNode {
    int val;        // Node value
    ListNode? next;  // Reference to the successor
    ListNode? prev;  // Reference to the predecessor
    ListNode(this.val, [this.next, this.prev]);  // Constructor
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Doubly linked list node type */
#[derive(Debug)]
struct ListNode {
    val: i32, // Node value
    next: Option<Rc<RefCell<ListNode>>>, // Pointer to the successor
    prev: Option<Rc<RefCell<ListNode>>>, // Pointer to the predecessor
}

/* Constructor */
impl ListNode {
    fn new(val: i32) -> Self {
        ListNode {
            val,
            next: None,
            prev: None,
        }
    }
}
```

```c title=""
/* Doubly linked list node structure */
typedef struct ListNode {
    int val;               // Node value
    struct ListNode *next; // Pointer to the successor
    struct ListNode *prev; // Pointer to the predecessor
} ListNode;

/* Constructor */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *) malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    node->prev = NULL;
    return node;
}
```

```kotlin title=""
/* Doubly linked list node class */
// Constructor
class ListNode(x: Int) {
    val _val: Int = x           // Node value
    var next: ListNode? = null  // Reference to the successor
    var prev: ListNode? = null  // Reference to the predecessor
}
```

```ruby title=""
# Doubly linked list node class
class ListNode
  attr_accessor :val    # Node value
  attr_accessor :next   # Reference to the successor
  attr_accessor :prev   # Reference to the predecessor

  def initialize(val=0, next_node=nil, prev_node=nil)
    @val = val
    @next = next_node
    @prev = prev_node
  end
end
```
