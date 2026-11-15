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
# Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4
# Initialize the nodes
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# Link the nodes with references
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
ListNode* n0 = new ListNode(1);
ListNode* n1 = new ListNode(3);
ListNode* n2 = new ListNode(2);
ListNode* n3 = new ListNode(5);
ListNode* n4 = new ListNode(4);
// Link the nodes with references
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// Link the nodes with references
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// Link the nodes with references
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)
// Link the nodes with references
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// Link the nodes with references
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Link the nodes with references
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Link the nodes with references
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// Link the nodes with references
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
let n0 = Rc::new(RefCell::new(ListNode { val: 1, next: None }));
let n1 = Rc::new(RefCell::new(ListNode { val: 3, next: None }));
let n2 = Rc::new(RefCell::new(ListNode { val: 2, next: None }));
let n3 = Rc::new(RefCell::new(ListNode { val: 5, next: None }));
let n4 = Rc::new(RefCell::new(ListNode { val: 4, next: None }));

// Link the nodes with references
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
ListNode* n0 = newListNode(1);
ListNode* n1 = newListNode(3);
ListNode* n2 = newListNode(2);
ListNode* n3 = newListNode(5);
ListNode* n4 = newListNode(4);
// Link the nodes with references
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
// Initialize the nodes
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)
// Link the nodes with references
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```ruby title="linked_list.rb"
# Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4
# Initialize the nodes
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# Link the nodes with references
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
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
