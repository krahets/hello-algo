<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """연결 리스트 노드 클래스"""
    def __init__(self, val: int):
        self.val: int = val               # 노드 값
        self.next: ListNode | None = None # 다음 노드를 가리키는 참조
```

```cpp title=""
/* 연결 리스트 노드 구조체 */
struct ListNode {
    int val;         // 노드 값
    ListNode *next;  // 다음 노드를 가리키는 포인터
    ListNode(int x) : val(x), next(nullptr) {}  // 생성자
};
```

```java title=""
/* 연결 리스트 노드 클래스 */
class ListNode {
    int val;        // 노드 값
    ListNode next;  // 다음 노드를 가리키는 참조
    ListNode(int x) { val = x; }  // 생성자
}
```

```csharp title=""
/* 연결 리스트 노드 클래스 */
class ListNode(int x) {  //생성자
    public int val = x;     // 노드 값
    public ListNode? next;  // 다음 노드를 가리키는 참조
}
```

```go title=""
/* 연결 리스트 노드 구조체 */
type ListNode struct {
    Val  int       // 노드 값
    Next *ListNode // 다음 노드를 가리키는 포인터
}

// NewListNode 생성자: 새 연결 리스트 생성
func NewListNode(val int) *ListNode {
    return &ListNode{
        Val:  val,
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
/* 연결 리스트 노드 클래스 */
class ListNode {
    constructor(val, next) {
        this.val = (val === undefined ? 0 : val);       // 노드 값
        this.next = (next === undefined ? null : next); // 다음 노드를 가리키는 참조
    }
}
```

```typescript title=""
/* 연결 리스트 노드 클래스 */
class ListNode {
    val: number;
    next: ListNode | null;
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;        // 노드 값
        this.next = next === undefined ? null : next;  // 다음 노드를 가리키는 참조
    }
}
```

```dart title=""
/* 연결 리스트 노드 클래스 */
class ListNode {
  int val; // 노드 값
  ListNode? next; // 다음 노드를 가리키는 참조
  ListNode(this.val, [this.next]); // 생성자
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;
/* 연결 리스트 노드 클래스 */
#[derive(Debug)]
struct ListNode {
    val: i32, // 노드 값
    next: Option<Rc<RefCell<ListNode>>>, // 다음 노드를 가리키는 포인터
}
```

```c title=""
/* 연결 리스트 노드 구조체 */
typedef struct ListNode {
    int val;               // 노드 값
    struct ListNode *next; // 다음 노드를 가리키는 포인터
} ListNode;

/* 생성자 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *) malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* 연결 리스트 노드 클래스 */
// 생성자
class ListNode(x: Int) {
    val _val: Int = x          // 노드 값
    var next: ListNode? = null // 다음 노드를 가리키는 참조
}
```

```ruby title=""
# 연결 리스트 노드 클래스
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
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%ED%9B%84%EC%86%8D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EA%B0%81%20%EB%85%B8%EB%93%9C%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AC%EC%9D%B4%EC%9D%98%20%EC%B0%B8%EC%A1%B0%20%EC%84%A4%EC%A0%95%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """이중 연결 리스트 노드 클래스"""
    def __init__(self, val: int):
        self.val: int = val                # 노드 값
        self.next: ListNode | None = None  # 후속 노드를 가리키는 참조
        self.prev: ListNode | None = None  # 선행 노드를 가리키는 참조
```

```cpp title=""
/* 이중 연결 리스트 노드 구조체 */
struct ListNode {
    int val;         // 노드 값
    ListNode *next;  // 후속 노드를 가리키는 포인터
    ListNode *prev;  // 선행 노드를 가리키는 포인터
    ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // 생성자
};
```

```java title=""
/* 이중 연결 리스트 노드 클래스 */
class ListNode {
    int val;        // 노드 값
    ListNode next;  // 후속 노드를 가리키는 참조
    ListNode prev;  // 선행 노드를 가리키는 참조
    ListNode(int x) { val = x; }  // 생성자
}
```

```csharp title=""
/* 이중 연결 리스트 노드 클래스 */
class ListNode(int x) {  // 생성자
    public int val = x;     // 노드 값
    public ListNode? next;  // 후속 노드를 가리키는 참조
    public ListNode? prev;  // 선행 노드를 가리키는 참조
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
/* 이중 연결 리스트 노드 클래스 */
class ListNode {
    var val: Int // 노드 값
    var next: ListNode? // 후속 노드를 가리키는 참조
    var prev: ListNode? // 선행 노드를 가리키는 참조

    init(x: Int) { // 생성자
        val = x
    }
}
```

```javascript title=""
/* 이중 연결 리스트 노드 클래스 */
class ListNode {
    constructor(val, next, prev) {
        this.val = val  ===  undefined ? 0 : val;        // 노드 값
        this.next = next  ===  undefined ? null : next;  // 후속 노드를 가리키는 참조
        this.prev = prev  ===  undefined ? null : prev;  // 선행 노드를 가리키는 참조
    }
}
```

```typescript title=""
/* 이중 연결 리스트 노드 클래스 */
class ListNode {
    val: number;
    next: ListNode | null;
    prev: ListNode | null;
    constructor(val?: number, next?: ListNode | null, prev?: ListNode | null) {
        this.val = val  ===  undefined ? 0 : val;        // 노드 값
        this.next = next  ===  undefined ? null : next;  // 후속 노드를 가리키는 참조
        this.prev = prev  ===  undefined ? null : prev;  // 선행 노드를 가리키는 참조
    }
}
```

```dart title=""
/* 이중 연결 리스트 노드 클래스 */
class ListNode {
    int val;        // 노드 값
    ListNode? next;  // 후속 노드를 가리키는 참조
    ListNode? prev;  // 선행 노드를 가리키는 참조
    ListNode(this.val, [this.next, this.prev]);  // 생성자
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 이중 연결 리스트 노드 자료형 */
#[derive(Debug)]
struct ListNode {
    val: i32, // 노드 값
    next: Option<Rc<RefCell<ListNode>>>, // 후속 노드를 가리키는 포인터
    prev: Option<Rc<RefCell<ListNode>>>, // 선행 노드를 가리키는 포인터
}

/* 생성자 */
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
/* 이중 연결 리스트 노드 구조체 */
typedef struct ListNode {
    int val;               // 노드 값
    struct ListNode *next; // 후속 노드를 가리키는 포인터
    struct ListNode *prev; // 선행 노드를 가리키는 포인터
} ListNode;

/* 생성자 */
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
/* 이중 연결 리스트 노드 클래스 */
// 생성자
class ListNode(x: Int) {
    val _val: Int = x           // 노드 값
    var next: ListNode? = null  // 후속 노드를 가리키는 참조
    var prev: ListNode? = null  // 선행 노드를 가리키는 참조
}
```

```ruby title=""
# 이중 연결 리스트 노드 클래스
class ListNode
  attr_accessor :val    # 노드 값
  attr_accessor :next   # 후속 노드를 가리키는 참조
  attr_accessor :prev   # 선행 노드를 가리키는 참조

  def initialize(val=0, next_node=nil, prev_node=nil)
    @val = val
    @next = next_node
    @prev = prev_node
  end
end
```
