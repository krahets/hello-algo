<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """연결 리스트 노드 클래스"""

    def __init__(self, val: int):
        self.val: int = val  # 노드 값
        self.next: ListNode | None = None  # 다음 노드를 가리키는 참조
```

```cpp title=""
/* 연결 리스트 노드 */
struct ListNode {
    int val;        // 노드 값
    ListNode *next; // 다음 노드 포인터
    ListNode(int x) : val(x), next(nullptr) {
    }
};
```

```java title=""
/* 연결 리스트 노드 */
public class ListNode {
    public int val;       // 노드 값
    public ListNode next; // 다음 노드를 가리키는 참조

    public ListNode(int x) {
        val = x;
    }
}
```

```csharp title=""
/* 연결 리스트 노드 */
public class ListNode(int x) {
    public int val = x;    // 노드 값
    public ListNode? next; // 다음 노드를 가리키는 참조
}
```

```go title=""
// ListNode: 연결 리스트 노드
type ListNode struct {
    Val  int       // 노드 값
    Next *ListNode // 다음 노드 포인터
}

// NewListNode: 연결 리스트 노드 생성자
func NewListNode(v int) *ListNode {
    return &ListNode{
        Val:  v,
        Next: nil,
    }
}
```

```swift title=""
/* 연결 리스트 노드 클래스 */
class ListNode {
    var val: Int // 노드 값
    var next: ListNode? // 다음 노드를 가리키는 참조

    init(x: Int) { // 생성자
        val = x
    }
}
```

```javascript title=""
/* 연결 리스트 노드 */
class ListNode {
    val; // 노드 값
    next; // 다음 노드를 가리키는 참조(포인터)
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```typescript title=""
/* 연결 리스트 노드 */
class ListNode {
    val: number; // 노드 값
    next: ListNode | null; // 다음 노드를 가리키는 참조
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```dart title=""
/* 연결 리스트 노드 */
class ListNode {
  int val; // 노드 값
  ListNode? next; // 다음 노드를 가리키는 참조

  ListNode(this.val, [this.next]); // 생성자
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 연결 리스트 노드 */
#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T, // 노드 값
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 다음 노드 포인터
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode { val, next: None }))
    }
}
```

```c title=""
/* 연결 리스트 노드 구조체 */
typedef struct ListNode {
    int val;               // 노드 값
    struct ListNode *next; // 다음 노드를 가리키는 포인터
} ListNode;

/* 생성자: 새 노드를 초기화한다 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* 연결 리스트 노드 */
class ListNode(var _val: Int) {
    var next: ListNode? = null // 다음 노드를 가리키는 참조
}
```

```ruby title=""
### 연결 리스트 노드 클래스 ###
class ListNode
  attr_accessor :val  # 노드 값
  attr_accessor :next # 다음 노드를 가리키는 참조

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
# 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화
# 각 노드를 초기화한다
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# 노드 사이의 참조를 설정한다
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
ListNode *n0 = new ListNode(1);
ListNode *n1 = new ListNode(3);
ListNode *n2 = new ListNode(2);
ListNode *n3 = new ListNode(5);
ListNode *n4 = new ListNode(4);
// 노드 사이의 참조를 설정한다
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// 노드 사이의 참조를 설정한다
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
// 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화
// 각 노드를 초기화한다
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// 노드 사이의 참조를 설정한다
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)

// 노드 사이의 참조를 설정한다
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// 노드 사이의 참조를 설정한다
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 노드 사이의 참조를 설정한다
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 노드 사이의 참조를 설정한다
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
// 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화
// 각 노드를 초기화한다
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// 노드 사이의 참조를 설정한다
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
let n0 = ListNode::new(1);
let n1 = ListNode::new(3);
let n2 = ListNode::new(2);
let n3 = ListNode::new(5);
let n4 = ListNode::new(4);

// 노드 사이의 참조를 설정한다
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
ListNode *n0 = newListNode(1);
ListNode *n1 = newListNode(3);
ListNode *n2 = newListNode(2);
ListNode *n3 = newListNode(5);
ListNode *n4 = newListNode(4);
// 노드 사이의 참조를 설정한다
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
// 각 노드를 초기화한다
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)

// 노드 사이의 참조를 설정한다
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```ruby title="linked_list.rb"
# 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화
# 각 노드를 초기화한다
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# 노드 사이의 참조를 설정한다
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%ED%9B%84%EC%86%8D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EA%B0%81%20%EB%85%B8%EB%93%9C%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AC%EC%9D%B4%EC%9D%98%20%EC%B0%B8%EC%A1%B0%20%EC%84%A4%EC%A0%95%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """이중 연결 리스트 노드"""

    def __init__(self, val: int):
        """생성자"""
        self.val: int = val  # 노드 값
        self.next: ListNode | None = None  # 다음 노드 참조
        self.prev: ListNode | None = None  # 이전 노드 참조
```

```cpp title=""
/* 이중 연결 리스트 노드 */
struct DoublyListNode {
    int val;              // 노드 값
    DoublyListNode *next; // 다음 노드 포인터
    DoublyListNode *prev; // 이전 노드 포인터
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};
```

```java title=""
/* 이중 연결 리스트 노드 */
class ListNode {
    int val;       // 노드 값
    ListNode next; // 다음 노드 참조
    ListNode prev; // 이전 노드 참조

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}
```

```csharp title=""
/* 이중 연결 리스트 노드 */
public class ListNode(int val) {
    public int val = val;         // 노드 값
    public ListNode? next = null; // 다음 노드 참조
    public ListNode? prev = null; // 이전 노드 참조
}
```

```go title=""
/* 이중 연결 리스트 노드 구조체 */
type DoublyListNode struct {
    Val  int             // 노드 값
    Next *DoublyListNode // 후속 노드를 가리키는 포인터
    Prev *DoublyListNode // 선행 노드를 가리키는 포인터
}

// NewDoublyListNode 초기화
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
/* 이중 연결 리스트 노드 */
class ListNode {
    var val: Int // 노드 값
    var next: ListNode? // 다음 노드 참조
    weak var prev: ListNode? // 이전 노드 참조

    init(val: Int) {
        self.val = val
    }
}
```

```javascript title=""
/* 이중 연결 리스트 노드 */
class ListNode {
    prev; // 이전 노드 참조(포인터)
    next; // 다음 노드 참조(포인터)
    val; // 노드 값

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```typescript title=""
/* 이중 연결 리스트 노드 */
class ListNode {
    prev: ListNode | null; // 이전 노드 참조(포인터)
    next: ListNode | null; // 다음 노드 참조(포인터)
    val: number; // 노드 값

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```dart title=""
/* 이중 연결 리스트 노드 */
class ListNode {
  int val; // 노드 값
  ListNode? next; // 다음 노드 참조
  ListNode? prev; // 이전 노드 참조

  ListNode(this.val, {this.next, this.prev});
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* 이중 연결 리스트 노드 */
pub struct ListNode<T> {
    pub val: T,                                 // 노드 값
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 다음 노드 포인터
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 이전 노드 포인터
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
/* 이중 연결 리스트 노드 */
typedef struct DoublyListNode {
    int val;                     // 노드 값
    struct DoublyListNode *next; // 다음 노드 포인터
    struct DoublyListNode *prev; // 이전 노드 포인터
} DoublyListNode;

/* 생성자 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}
```

```kotlin title=""
/* 이중 연결 리스트 노드 */
class ListNode(
    var _val: Int // 노드 값
) {
    var next: ListNode? = null // 다음 노드 참조
    var prev: ListNode? = null // 이전 노드 참조
}
```

```ruby title=""
### 이중 연결 리스트 노드 ###
class ListNode
  attr_accessor :val  # 노드 값
  attr_accessor :next # 다음 노드 참조
  attr_accessor :prev # 이전 노드 참조

  ### 생성자 ###
  def initialize(val)
    @val = val
  end
end
```
