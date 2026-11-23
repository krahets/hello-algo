<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """連結リストのノードクラス"""

    def __init__(self, val: int):
        self.val: int = val  # ノードの値
        self.next: ListNode | None = None  # 次のノードへの参照
```

```cpp title=""
/* 連結リストのノード */
struct ListNode {
    int val;        // ノードの値
    ListNode *next; // 後続ノードへのポインタ
    ListNode(int x) : val(x), next(nullptr) {
    }
};
```

```java title=""
/* 連結リストのノード */
public class ListNode {
    public int val;       // ノードの値
    public ListNode next; // 次のノードへの参照

    public ListNode(int x) {
        val = x;
    }
}
```

```csharp title=""
/* 連結リストのノード */
public class ListNode(int x) {
    public int val = x;    // ノードの値
    public ListNode? next; // 次のノードへの参照
}
```

```go title=""
// ListNode は連結リストのノード
type ListNode struct {
    Val  int       // ノードの値
    Next *ListNode // 後続ノードへのポインタ
}

// NewListNode は連結リストのノードのコンストラクタ
func NewListNode(v int) *ListNode {
    return &ListNode{
        Val:  v,
        Next: nil,
    }
}
```

```swift title=""
/* 連結リストのノードクラス */
class ListNode {
    var val: Int // ノードの値
    var next: ListNode? // 次のノードへの参照

    init(x: Int) { // コンストラクタ
        val = x
    }
}
```

```javascript title=""
/* 連結リストのノード */
class ListNode {
    val; // ノードの値
    next; // 次のノードへの参照（ポインタ）
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```typescript title=""
/* 連結リストのノード */
class ListNode {
    val: number; // ノードの値
    next: ListNode | null; // 次のノードへの参照
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```dart title=""
/* 連結リストのノード */
class ListNode {
  int val; // ノードの値
  ListNode? next; // 次のノードへの参照

  ListNode(this.val, [this.next]); // コンストラクタ
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 連結リストのノード */
#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T, // ノードの値
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後続ノードへのポインタ
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode { val, next: None }))
    }
}
```

```c title=""
/* 連結リストのノードの構造体 */
typedef struct ListNode {
    int val;               // ノードの値
    struct ListNode *next; // 次のノードへのポインタ
} ListNode;

/* コンストラクタ：新しいノードを初期化する */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* 連結リストのノード */
class ListNode(var _val: Int) {
    var next: ListNode? = null // 次のノードへの参照
}
```

```ruby title=""
### 連結リストのノードクラス ###
class ListNode
  attr_accessor :val  # ノードの値
  attr_accessor :next # 次のノードへの参照

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
# 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する
# 各ノードを初期化する
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# ノード間の参照を設定する
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
ListNode *n0 = new ListNode(1);
ListNode *n1 = new ListNode(3);
ListNode *n2 = new ListNode(2);
ListNode *n3 = new ListNode(5);
ListNode *n4 = new ListNode(4);
// ノード間の参照を設定する
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// ノード間の参照を設定する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
// 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する
// 各ノードを初期化する
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// ノード間の参照を設定する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)

// ノード間の参照を設定する
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// ノード間の参照を設定する
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// ノード間の参照を設定する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// ノード間の参照を設定する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
// 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する
// 各ノードを初期化する
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// ノード間の参照を設定する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
let n0 = ListNode::new(1);
let n1 = ListNode::new(3);
let n2 = ListNode::new(2);
let n3 = ListNode::new(5);
let n4 = ListNode::new(4);

// ノード間の参照を設定する
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
ListNode *n0 = newListNode(1);
ListNode *n1 = newListNode(3);
ListNode *n2 = newListNode(2);
ListNode *n3 = newListNode(5);
ListNode *n4 = newListNode(4);
// ノード間の参照を設定する
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
// 各ノードを初期化する
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)

// ノード間の参照を設定する
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```ruby title="linked_list.rb"
# 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する
# 各ノードを初期化する
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# ノード間の参照を設定する
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%90%84%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n0%20%3D%20ListNode(1)%0A%20%20%20%20n1%20%3D%20ListNode(3)%0A%20%20%20%20n2%20%3D%20ListNode(2)%0A%20%20%20%20n3%20%3D%20ListNode(5)%0A%20%20%20%20n4%20%3D%20ListNode(4)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E8%A8%AD%E5%AE%9A%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """双方向連結リストのノード"""

    def __init__(self, val: int):
        """コンストラクタ"""
        self.val: int = val  # ノードの値
        self.next: ListNode | None = None  # 後続ノードへの参照
        self.prev: ListNode | None = None  # 前のノードへの参照
```

```cpp title=""
/* 双方向連結リストのノード */
struct DoublyListNode {
    int val;              // ノードの値
    DoublyListNode *next; // 後続ノードへのポインタ
    DoublyListNode *prev; // 前のノードへのポインタ
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};
```

```java title=""
/* 双方向連結リストのノード */
class ListNode {
    int val;       // ノードの値
    ListNode next; // 後続ノードへの参照
    ListNode prev; // 前のノードへの参照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}
```

```csharp title=""
/* 双方向連結リストのノード */
public class ListNode(int val) {
    public int val = val;         // ノードの値
    public ListNode? next = null; // 後続ノードへの参照
    public ListNode? prev = null; // 前のノードへの参照
}
```

```go title=""
/* 双方向連結リストのノード構造体 */
type DoublyListNode struct {
    Val  int             // ノードの値
    Next *DoublyListNode // 後続ノードへのポインタ
    Prev *DoublyListNode // 先行ノードへのポインタ
}

// NewDoublyListNode で初期化
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
/* 双方向連結リストのノード */
class ListNode {
    var val: Int // ノードの値
    var next: ListNode? // 後続ノードへの参照
    weak var prev: ListNode? // 前のノードへの参照

    init(val: Int) {
        self.val = val
    }
}
```

```javascript title=""
/* 双方向連結リストのノード */
class ListNode {
    prev; // 前のノードへの参照（ポインタ）
    next; // 後続ノードへの参照（ポインタ）
    val; // ノードの値

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```typescript title=""
/* 双方向連結リストのノード */
class ListNode {
    prev: ListNode | null; // 前のノードへの参照（ポインタ）
    next: ListNode | null; // 後続ノードへの参照（ポインタ）
    val: number; // ノードの値

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```dart title=""
/* 双方向連結リストのノード */
class ListNode {
  int val; // ノードの値
  ListNode? next; // 後続ノードへの参照
  ListNode? prev; // 前のノードへの参照

  ListNode(this.val, {this.next, this.prev});
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 双方向連結リストのノード */
pub struct ListNode<T> {
    pub val: T,                                 // ノードの値
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後続ノードへのポインタ
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前のノードへのポインタ
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
/* 双方向連結リストのノード */
typedef struct DoublyListNode {
    int val;                     // ノードの値
    struct DoublyListNode *next; // 後続ノードへのポインタ
    struct DoublyListNode *prev; // 前のノードへのポインタ
} DoublyListNode;

/* コンストラクタ */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}
```

```kotlin title=""
/* 双方向連結リストのノード */
class ListNode(
    var _val: Int // ノードの値
) {
    var next: ListNode? = null // 後続ノードへの参照
    var prev: ListNode? = null // 前のノードへの参照
}
```

```ruby title=""
### 双方向連結リストのノード ###
class ListNode
  attr_accessor :val  # ノードの値
  attr_accessor :next # 後続ノードへの参照
  attr_accessor :prev # 前のノードへの参照

  ### コンストラクタ ###
  def initialize(val)
    @val = val
  end
end
```
