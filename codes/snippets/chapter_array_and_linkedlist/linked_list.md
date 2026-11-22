<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """链表节点类"""

    def __init__(self, val: int):
        self.val: int = val  # 节点值
        self.next: ListNode | None = None  # 指向下一节点的引用
```

```cpp title=""
/* 链表节点 */
struct ListNode {
    int val;        // 节点值
    ListNode *next; // 后继节点指针
    ListNode(int x) : val(x), next(nullptr) {
    }
};
```

```java title=""
/* 链表节点 */
public class ListNode {
    public int val;       // 节点值
    public ListNode next; // 指向下一节点的引用

    public ListNode(int x) {
        val = x;
    }
}
```

```csharp title=""
/* 链表节点 */
public class ListNode(int x) {
    public int val = x;    // 节点值
    public ListNode? next; // 指向下一节点的引用
}
```

```go title=""
// ListNode 链表节点
type ListNode struct {
    Val  int       // 节点值
    Next *ListNode // 后继节点指针
}

// NewListNode 链表节点构造函数
func NewListNode(v int) *ListNode {
    return &ListNode{
        Val:  v,
        Next: nil,
    }
}
```

```swift title=""
/* 链表节点类 */
class ListNode {
    var val: Int // 节点值
    var next: ListNode? // 指向下一节点的引用

    init(x: Int) { // 构造函数
        val = x
    }
}
```

```javascript title=""
/* 链表节点 */
class ListNode {
    val; // 节点值
    next; // 指向下一节点的引用（指针）
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```typescript title=""
/* 链表节点 */
class ListNode {
    val: number; // 节点值
    next: ListNode | null; // 指向下一节点的引用
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```dart title=""
/* 链表节点 */
class ListNode {
  int val; // 节点值
  ListNode? next; // 指向下一节点的引用

  ListNode(this.val, [this.next]); // 构造函数
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 链表节点 */
#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T, // 节点值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 后继节点指针
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode { val, next: None }))
    }
}
```

```c title=""
/* 链表节点结构体 */
typedef struct ListNode {
    int val;               // 节点值
    struct ListNode *next; // 指向下一节点的指针
} ListNode;

/* 构造函数，初始化一个新节点 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* 链表节点 */
class ListNode(var _val: Int) {
    var next: ListNode? = null // 指向下一节点的引用
}
```

```ruby title=""
### 链表节点类 ###
class ListNode
  attr_accessor :val  # 节点值
  attr_accessor :next # 指向下一节点的引用

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
# 初始化链表 1 -> 3 -> 2 -> 5 -> 4
# 初始化各个节点
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# 构建节点之间的引用
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
ListNode *n0 = new ListNode(1);
ListNode *n1 = new ListNode(3);
ListNode *n2 = new ListNode(2);
ListNode *n3 = new ListNode(5);
ListNode *n4 = new ListNode(4);
// 构建节点之间的引用
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// 构建节点之间的引用
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
// 初始化链表 1 -> 3 -> 2 -> 5 -> 4
// 初始化各个节点
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// 构建节点之间的引用
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)

// 构建节点之间的引用
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// 构建节点之间的引用
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 构建节点之间的引用
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 构建节点之间的引用
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
// 初始化链表 1 -> 3 -> 2 -> 5 -> 4
// 初始化各个节点
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// 构建节点之间的引用
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
let n0 = ListNode::new(1);
let n1 = ListNode::new(3);
let n2 = ListNode::new(2);
let n3 = ListNode::new(5);
let n4 = ListNode::new(4);

// 构建节点之间的引用
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
ListNode *n0 = newListNode(1);
ListNode *n1 = newListNode(3);
ListNode *n2 = newListNode(2);
ListNode *n3 = newListNode(5);
ListNode *n4 = newListNode(4);
// 构建节点之间的引用
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
// 初始化各个节点
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)

// 构建节点之间的引用
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```ruby title="linked_list.rb"
# 初始化链表 1 -> 3 -> 2 -> 5 -> 4
# 初始化各个节点
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# 构建节点之间的引用
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%93%BE%E8%A1%A8%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%90%84%E4%B8%AA%E8%8A%82%E7%82%B9%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%E6%9E%84%E5%BB%BA%E8%8A%82%E7%82%B9%E4%B9%8B%E9%97%B4%E7%9A%84%E5%BC%95%E7%94%A8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """双向链表节点"""

    def __init__(self, val: int):
        """构造方法"""
        self.val: int = val  # 节点值
        self.next: ListNode | None = None  # 后继节点引用
        self.prev: ListNode | None = None  # 前驱节点引用
```

```cpp title=""
/* 双向链表节点 */
struct DoublyListNode {
    int val;              // 节点值
    DoublyListNode *next; // 后继节点指针
    DoublyListNode *prev; // 前驱节点指针
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};
```

```java title=""
/* 双向链表节点 */
class ListNode {
    int val;       // 节点值
    ListNode next; // 后继节点引用
    ListNode prev; // 前驱节点引用

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}
```

```csharp title=""
/* 双向链表节点 */
public class ListNode(int val) {
    public int val = val;         // 节点值
    public ListNode? next = null; // 后继节点引用
    public ListNode? prev = null; // 前驱节点引用
}
```

```go title=""
/* 双向链表节点结构体 */
type DoublyListNode struct {
    Val  int             // 节点值
    Next *DoublyListNode // 后继节点指针
    Prev *DoublyListNode // 前驱节点指针
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
/* 双向链表节点 */
class ListNode {
    var val: Int // 节点值
    var next: ListNode? // 后继节点引用
    weak var prev: ListNode? // 前驱节点引用

    init(val: Int) {
        self.val = val
    }
}
```

```javascript title=""
/* 双向链表节点 */
class ListNode {
    prev; // 前驱节点引用（指针）
    next; // 后继节点引用（指针）
    val; // 节点值

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```typescript title=""
/* 双向链表节点 */
class ListNode {
    prev: ListNode | null; // 前驱节点引用（指针）
    next: ListNode | null; // 后继节点引用（指针）
    val: number; // 节点值

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```dart title=""
/* 双向链表节点 */
class ListNode {
  int val; // 节点值
  ListNode? next; // 后继节点引用
  ListNode? prev; // 前驱节点引用

  ListNode(this.val, {this.next, this.prev});
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 双向链表节点 */
pub struct ListNode<T> {
    pub val: T,                                 // 节点值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 后继节点指针
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前驱节点指针
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
/* 双向链表节点 */
typedef struct DoublyListNode {
    int val;                     // 节点值
    struct DoublyListNode *next; // 后继节点指针
    struct DoublyListNode *prev; // 前驱节点指针
} DoublyListNode;

/* 构造函数 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}
```

```kotlin title=""
/* 双向链表节点 */
class ListNode(
    var _val: Int // 节点值
) {
    var next: ListNode? = null // 后继节点引用
    var prev: ListNode? = null // 前驱节点引用
}
```

```ruby title=""
### 双向链表节点 ###
class ListNode
  attr_accessor :val  # 节点值
  attr_accessor :next # 后继节点引用
  attr_accessor :prev # 前驱节点引用

  ### 构造方法 ###
  def initialize(val)
    @val = val
  end
end
```
