<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """鏈結串列節點類別"""
    def __init__(self, val: int):
        self.val: int = val               # 節點值
        self.next: ListNode | None = None # 指向下一節點的引用
```

```cpp title=""
/* 鏈結串列節點結構體 */
struct ListNode {
    int val;         // 節點值
    ListNode *next;  // 指向下一節點的指標
    ListNode(int x) : val(x), next(nullptr) {}  // 建構子
};
```

```java title=""
/* 鏈結串列節點類別 */
class ListNode {
    int val;        // 節點值
    ListNode next;  // 指向下一節點的引用
    ListNode(int x) { val = x; }  // 建構子
}
```

```csharp title=""
/* 鏈結串列節點類別 */
class ListNode(int x) {  //建構子
    public int val = x;     // 節點值
    public ListNode? next;  // 指向下一節點的引用
}
```

```go title=""
/* 鏈結串列節點結構體 */
type ListNode struct {
    Val  int       // 節點值
    Next *ListNode // 指向下一節點的指標
}

// NewListNode 建構子，建立一個新的鏈結串列
func NewListNode(val int) *ListNode {
    return &ListNode{
        Val:  val,
        Next: nil,
    }
}
```

```swift title=""
/* 鏈結串列節點類別 */
class ListNode {
    var val: Int // 節點值
    var next: ListNode? // 指向下一節點的引用

    init(x: Int) { // 建構子
        val = x
    }
}
```

```javascript title=""
/* 鏈結串列節點類別 */
class ListNode {
    constructor(val, next) {
        this.val = (val === undefined ? 0 : val);       // 節點值
        this.next = (next === undefined ? null : next); // 指向下一節點的引用
    }
}
```

```typescript title=""
/* 鏈結串列節點類別 */
class ListNode {
    val: number;
    next: ListNode | null;
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;        // 節點值
        this.next = next === undefined ? null : next;  // 指向下一節點的引用
    }
}
```

```dart title=""
/* 鏈結串列節點類別 */
class ListNode {
  int val; // 節點值
  ListNode? next; // 指向下一節點的引用
  ListNode(this.val, [this.next]); // 建構子
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;
/* 鏈結串列節點類別 */
#[derive(Debug)]
struct ListNode {
    val: i32, // 節點值
    next: Option<Rc<RefCell<ListNode>>>, // 指向下一節點的指標
}
```

```c title=""
/* 鏈結串列節點結構體 */
typedef struct ListNode {
    int val;               // 節點值
    struct ListNode *next; // 指向下一節點的指標
} ListNode;

/* 建構子 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *) malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* 鏈結串列節點類別 */
// 建構子
class ListNode(x: Int) {
    val _val: Int = x          // 節點值
    var next: ListNode? = null // 指向下一個節點的引用
}
```

```ruby title=""
# 鏈結串列節點類別
class ListNode
  attr_accessor :val  # 節點值
  attr_accessor :next # 指向下一節點的引用

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
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B9%BC%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%90%84%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%BC%95%E7%94%A8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """雙向鏈結串列節點類別"""
    def __init__(self, val: int):
        self.val: int = val                # 節點值
        self.next: ListNode | None = None  # 指向後繼節點的引用
        self.prev: ListNode | None = None  # 指向前驅節點的引用
```

```cpp title=""
/* 雙向鏈結串列節點結構體 */
struct ListNode {
    int val;         // 節點值
    ListNode *next;  // 指向後繼節點的指標
    ListNode *prev;  // 指向前驅節點的指標
    ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // 建構子
};
```

```java title=""
/* 雙向鏈結串列節點類別 */
class ListNode {
    int val;        // 節點值
    ListNode next;  // 指向後繼節點的引用
    ListNode prev;  // 指向前驅節點的引用
    ListNode(int x) { val = x; }  // 建構子
}
```

```csharp title=""
/* 雙向鏈結串列節點類別 */
class ListNode(int x) {  // 建構子
    public int val = x;     // 節點值
    public ListNode? next;  // 指向後繼節點的引用
    public ListNode? prev;  // 指向前驅節點的引用
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
/* 雙向鏈結串列節點類別 */
class ListNode {
    var val: Int // 節點值
    var next: ListNode? // 指向後繼節點的引用
    var prev: ListNode? // 指向前驅節點的引用

    init(x: Int) { // 建構子
        val = x
    }
}
```

```javascript title=""
/* 雙向鏈結串列節點類別 */
class ListNode {
    constructor(val, next, prev) {
        this.val = val  ===  undefined ? 0 : val;        // 節點值
        this.next = next  ===  undefined ? null : next;  // 指向後繼節點的引用
        this.prev = prev  ===  undefined ? null : prev;  // 指向前驅節點的引用
    }
}
```

```typescript title=""
/* 雙向鏈結串列節點類別 */
class ListNode {
    val: number;
    next: ListNode | null;
    prev: ListNode | null;
    constructor(val?: number, next?: ListNode | null, prev?: ListNode | null) {
        this.val = val  ===  undefined ? 0 : val;        // 節點值
        this.next = next  ===  undefined ? null : next;  // 指向後繼節點的引用
        this.prev = prev  ===  undefined ? null : prev;  // 指向前驅節點的引用
    }
}
```

```dart title=""
/* 雙向鏈結串列節點類別 */
class ListNode {
    int val;        // 節點值
    ListNode? next;  // 指向後繼節點的引用
    ListNode? prev;  // 指向前驅節點的引用
    ListNode(this.val, [this.next, this.prev]);  // 建構子
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 雙向鏈結串列節點型別 */
#[derive(Debug)]
struct ListNode {
    val: i32, // 節點值
    next: Option<Rc<RefCell<ListNode>>>, // 指向後繼節點的指標
    prev: Option<Rc<RefCell<ListNode>>>, // 指向前驅節點的指標
}

/* 建構子 */
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
/* 雙向鏈結串列節點結構體 */
typedef struct ListNode {
    int val;               // 節點值
    struct ListNode *next; // 指向後繼節點的指標
    struct ListNode *prev; // 指向前驅節點的指標
} ListNode;

/* 建構子 */
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
/* 雙向鏈結串列節點類別 */
// 建構子
class ListNode(x: Int) {
    val _val: Int = x           // 節點值
    var next: ListNode? = null  // 指向後繼節點的引用
    var prev: ListNode? = null  // 指向前驅節點的引用
}
```

```ruby title=""
# 雙向鏈結串列節點類別
class ListNode
  attr_accessor :val    # 節點值
  attr_accessor :next   # 指向後繼節點的引用
  attr_accessor :prev   # 指向前驅節點的引用

  def initialize(val=0, next_node=nil, prev_node=nil)
    @val = val
    @next = next_node
    @prev = prev_node
  end
end
```
