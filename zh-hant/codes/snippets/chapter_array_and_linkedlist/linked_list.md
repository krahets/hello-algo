<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """鏈結串列節點類別"""

    def __init__(self, val: int):
        self.val: int = val  # 節點值
        self.next: ListNode | None = None  # 指向下一個節點的參照
```

```cpp title=""
/* 鏈結串列節點 */
struct ListNode {
    int val;        // 節點值
    ListNode *next; // 指向後繼節點的指標
    ListNode(int x) : val(x), next(nullptr) {
    }
};
```

```java title=""
/* 鏈結串列節點 */
public class ListNode {
    public int val;       // 節點值
    public ListNode next; // 指向下一個節點的參照

    public ListNode(int x) {
        val = x;
    }
}
```

```csharp title=""
/* 鏈結串列節點 */
public class ListNode(int x) {
    public int val = x;    // 節點值
    public ListNode? next; // 指向下一個節點的參照
}
```

```go title=""
// ListNode 鏈結串列節點
type ListNode struct {
    Val  int       // 節點值
    Next *ListNode // 指向後繼節點的指標
}

// NewListNode 鏈結串列節點建構函式
func NewListNode(v int) *ListNode {
    return &ListNode{
        Val:  v,
        Next: nil,
    }
}
```

```swift title=""
/* 鏈結串列節點類別 */
class ListNode {
    var val: Int // 節點值
    var next: ListNode? // 指向下一個節點的參照

    init(x: Int) { // 建構函式
        val = x
    }
}
```

```javascript title=""
/* 鏈結串列節點 */
class ListNode {
    val; // 節點值
    next; // 指向下一個節點的參照（指標）
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```typescript title=""
/* 鏈結串列節點 */
class ListNode {
    val: number; // 節點值
    next: ListNode | null; // 指向下一個節點的參照
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```dart title=""
/* 鏈結串列節點 */
class ListNode {
  int val; // 節點值
  ListNode? next; // 指向下一個節點的參照

  ListNode(this.val, [this.next]); // 建構函式
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 鏈結串列節點 */
#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T, // 節點值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 指向後繼節點的指標
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode { val, next: None }))
    }
}
```

```c title=""
/* 鏈結串列節點結構體 */
typedef struct ListNode {
    int val;               // 節點值
    struct ListNode *next; // 指向下一個節點的指標
} ListNode;

/* 建構函式，用來初始化新節點 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* 鏈結串列節點 */
class ListNode(var _val: Int) {
    var next: ListNode? = null // 指向下一個節點的參照
}
```

```ruby title=""
### 鏈結串列節點類別 ###
class ListNode
  attr_accessor :val  # 節點值
  attr_accessor :next # 指向下一個節點的參照

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
# 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4
# 初始化各個節點
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# 建立節點之間的參照
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
ListNode *n0 = new ListNode(1);
ListNode *n1 = new ListNode(3);
ListNode *n2 = new ListNode(2);
ListNode *n3 = new ListNode(5);
ListNode *n4 = new ListNode(4);
// 建立節點之間的參照
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// 建立節點之間的參照
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
// 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4
// 初始化各個節點
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// 建立節點之間的參照
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)

// 建立節點之間的參照
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// 建立節點之間的參照
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 建立節點之間的參照
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 建立節點之間的參照
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
// 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4
// 初始化各個節點
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// 建立節點之間的參照
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
let n0 = ListNode::new(1);
let n1 = ListNode::new(3);
let n2 = ListNode::new(2);
let n3 = ListNode::new(5);
let n4 = ListNode::new(4);

// 建立節點之間的參照
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
ListNode *n0 = newListNode(1);
ListNode *n1 = newListNode(3);
ListNode *n2 = newListNode(2);
ListNode *n3 = newListNode(5);
ListNode *n4 = newListNode(4);
// 建立節點之間的參照
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各個節點
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)

// 建立節點之間的參照
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```ruby title="linked_list.rb"
# 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4
# 初始化各個節點
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# 建立節點之間的參照
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%90%84%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%8F%83%E7%85%A7%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """雙向鏈結串列節點"""

    def __init__(self, val: int):
        """建構方法"""
        self.val: int = val  # 節點值
        self.next: ListNode | None = None  # 指向後繼節點的參照
        self.prev: ListNode | None = None  # 指向前驅節點的參照
```

```cpp title=""
/* 雙向鏈結串列節點 */
struct DoublyListNode {
    int val;              // 節點值
    DoublyListNode *next; // 指向後繼節點的指標
    DoublyListNode *prev; // 指向前驅節點的指標
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};
```

```java title=""
/* 雙向鏈結串列節點 */
class ListNode {
    int val;       // 節點值
    ListNode next; // 指向後繼節點的參照
    ListNode prev; // 指向前驅節點的參照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}
```

```csharp title=""
/* 雙向鏈結串列節點 */
public class ListNode(int val) {
    public int val = val;         // 節點值
    public ListNode? next = null; // 指向後繼節點的參照
    public ListNode? prev = null; // 指向前驅節點的參照
}
```

```go title=""
/* 雙向鏈結串列節點結構體 */
type DoublyListNode struct {
    Val  int             // 節點值
    Next *DoublyListNode // 指向後繼節點的指標
    Prev *DoublyListNode // 指向前驅節點的指標
}

// NewDoublyListNode 初始化
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
/* 雙向鏈結串列節點 */
class ListNode {
    var val: Int // 節點值
    var next: ListNode? // 指向後繼節點的參照
    weak var prev: ListNode? // 指向前驅節點的參照

    init(val: Int) {
        self.val = val
    }
}
```

```javascript title=""
/* 雙向鏈結串列節點 */
class ListNode {
    prev; // 指向前驅節點的參照（指標）
    next; // 指向後繼節點的參照（指標）
    val; // 節點值

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```typescript title=""
/* 雙向鏈結串列節點 */
class ListNode {
    prev: ListNode | null; // 指向前驅節點的參照（指標）
    next: ListNode | null; // 指向後繼節點的參照（指標）
    val: number; // 節點值

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```dart title=""
/* 雙向鏈結串列節點 */
class ListNode {
  int val; // 節點值
  ListNode? next; // 指向後繼節點的參照
  ListNode? prev; // 指向前驅節點的參照

  ListNode(this.val, {this.next, this.prev});
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 雙向鏈結串列節點 */
pub struct ListNode<T> {
    pub val: T,                                 // 節點值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 指向後繼節點的指標
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 指向前驅節點的指標
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode {
            val,
            next: None,
            prev: None,
        }))
    }
}
```

```c title=""
/* 雙向鏈結串列節點 */
typedef struct DoublyListNode {
    int val;                     // 節點值
    struct DoublyListNode *next; // 指向後繼節點的指標
    struct DoublyListNode *prev; // 指向前驅節點的指標
} DoublyListNode;

/* 建構函式 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}
```

```kotlin title=""
/* 雙向鏈結串列節點 */
class ListNode(
    var _val: Int // 節點值
) {
    var next: ListNode? = null // 指向後繼節點的參照
    var prev: ListNode? = null // 指向前驅節點的參照
}
```

```ruby title=""
### 雙向鏈結串列節點 ###
class ListNode
  attr_accessor :val  # 節點值
  attr_accessor :next # 指向後繼節點的參照
  attr_accessor :prev # 指向前驅節點的參照

  ### 建構方法 ###
  def initialize(val)
    @val = val
  end
end
```
