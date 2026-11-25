<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """Класс узла связного списка"""

    def __init__(self, val: int):
        self.val: int = val  # Значение узла
        self.next: ListNode | None = None  # Ссылка на следующий узел
```

```cpp title=""
/* Узел связного списка */
struct ListNode {
    int val;        // Значение узла
    ListNode *next; // Указатель на следующий узел
    ListNode(int x) : val(x), next(nullptr) {
    }
};
```

```java title=""
/* Узел связного списка */
public class ListNode {
    public int val;       // Значение узла
    public ListNode next; // Ссылка на следующий узел

    public ListNode(int x) {
        val = x;
    }
}
```

```csharp title=""
/* Узел связного списка */
public class ListNode(int x) {
    public int val = x;    // Значение узла
    public ListNode? next; // Ссылка на следующий узел
}
```

```go title=""
// ListNode — узел связного списка
type ListNode struct {
    Val  int       // Значение узла
    Next *ListNode // Указатель на следующий узел
}

// NewListNode — конструктор узла связного списка
func NewListNode(v int) *ListNode {
    return &ListNode{
        Val:  v,
        Next: nil,
    }
}
```

```swift title=""
/* Класс узла связного списка */
class ListNode {
    var val: Int // Значение узла
    var next: ListNode? // Ссылка на следующий узел

    init(x: Int) { // Конструктор
        val = x
    }
}
```

```javascript title=""
/* Узел связного списка */
class ListNode {
    val; // Значение узла
    next; // Ссылка (указатель) на следующий узел
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```typescript title=""
/* Узел связного списка */
class ListNode {
    val: number; // Значение узла
    next: ListNode | null; // Ссылка на следующий узел
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
```

```dart title=""
/* Узел связного списка */
class ListNode {
  int val; // Значение узла
  ListNode? next; // Ссылка на следующий узел

  ListNode(this.val, [this.next]); // Конструктор
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* Узел связного списка */
#[derive(Debug)]
pub struct ListNode<T> {
    pub val: T, // Значение узла
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на следующий узел
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode { val, next: None }))
    }
}
```

```c title=""
/* Структура узла связного списка */
typedef struct ListNode {
    int val;               // Значение узла
    struct ListNode *next; // Указатель на следующий узел
} ListNode;

/* Конструктор инициализирует новый узел */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* Узел связного списка */
class ListNode(var _val: Int) {
    var next: ListNode? = null // Ссылка на следующий узел
}
```

```ruby title=""
### Класс узла связного списка ###
class ListNode
  attr_accessor :val  # Значение узла
  attr_accessor :next # Ссылка на следующий узел

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
# Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4
# Инициализировать узлы
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# Связать узлы ссылками
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
ListNode *n0 = new ListNode(1);
ListNode *n1 = new ListNode(3);
ListNode *n2 = new ListNode(2);
ListNode *n3 = new ListNode(5);
ListNode *n4 = new ListNode(4);
// Связать узлы ссылками
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// Связать узлы ссылками
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
// Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4
// Инициализировать узлы
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// Связать узлы ссылками
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)

// Связать узлы ссылками
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// Связать узлы ссылками
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Связать узлы ссылками
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Связать узлы ссылками
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
// Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4
// Инициализировать узлы
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// Связать узлы ссылками
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
let n0 = ListNode::new(1);
let n1 = ListNode::new(3);
let n2 = ListNode::new(2);
let n3 = ListNode::new(5);
let n4 = ListNode::new(4);

// Связать узлы ссылками
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
ListNode *n0 = newListNode(1);
ListNode *n1 = newListNode(3);
ListNode *n2 = newListNode(2);
ListNode *n3 = newListNode(5);
ListNode *n4 = newListNode(4);
// Связать узлы ссылками
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализировать узлы
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)

// Связать узлы ссылками
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```ruby title="linked_list.rb"
# Инициализировать связный список 1 -> 3 -> 2 -> 5 -> 4
# Инициализировать узлы
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# Связать узлы ссылками
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%83%D0%B7%D0%BB%D1%8B%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%D0%A1%D0%B2%D1%8F%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC%20%D1%83%D0%B7%D0%BB%D1%8B%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%D0%BC%D0%B8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """Узел двусвязного списка"""

    def __init__(self, val: int):
        """Конструктор"""
        self.val: int = val  # Значение узла
        self.next: ListNode | None = None  # Ссылка на следующий узел
        self.prev: ListNode | None = None  # Ссылка на предыдущий узел
```

```cpp title=""
/* Узел двусвязного списка */
struct DoublyListNode {
    int val;              // Значение узла
    DoublyListNode *next; // Указатель на следующий узел
    DoublyListNode *prev; // Указатель на предыдущий узел
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};
```

```java title=""
/* Узел двусвязного списка */
class ListNode {
    int val;       // Значение узла
    ListNode next; // Ссылка на следующий узел
    ListNode prev; // Ссылка на предыдущий узел

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}
```

```csharp title=""
/* Узел двусвязного списка */
public class ListNode(int val) {
    public int val = val;         // Значение узла
    public ListNode? next = null; // Ссылка на следующий узел
    public ListNode? prev = null; // Ссылка на предыдущий узел
}
```

```go title=""
/* Структура узла двусвязного списка */
type DoublyListNode struct {
    Val  int             // Значение узла
    Next *DoublyListNode // Указатель на следующий узел
    Prev *DoublyListNode // Указатель на предыдущий узел
}

// Инициализация с помощью NewDoublyListNode
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
/* Узел двусвязного списка */
class ListNode {
    var val: Int // Значение узла
    var next: ListNode? // Ссылка на следующий узел
    weak var prev: ListNode? // Ссылка на предыдущий узел

    init(val: Int) {
        self.val = val
    }
}
```

```javascript title=""
/* Узел двусвязного списка */
class ListNode {
    prev; // Ссылка (указатель) на предыдущий узел
    next; // Ссылка (указатель) на следующий узел
    val; // Значение узла

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```typescript title=""
/* Узел двусвязного списка */
class ListNode {
    prev: ListNode | null; // Ссылка (указатель) на предыдущий узел
    next: ListNode | null; // Ссылка (указатель) на следующий узел
    val: number; // Значение узла

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}
```

```dart title=""
/* Узел двусвязного списка */
class ListNode {
  int val; // Значение узла
  ListNode? next; // Ссылка на следующий узел
  ListNode? prev; // Ссылка на предыдущий узел

  ListNode(this.val, {this.next, this.prev});
}
```

```rust title=""
use std::cell::RefCell;
use std::rc::Rc;

/* Узел двусвязного списка */
pub struct ListNode<T> {
    pub val: T,                                 // Значение узла
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на следующий узел
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на предыдущий узел
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
/* Узел двусвязного списка */
typedef struct DoublyListNode {
    int val;                     // Значение узла
    struct DoublyListNode *next; // Указатель на следующий узел
    struct DoublyListNode *prev; // Указатель на предыдущий узел
} DoublyListNode;

/* Конструктор */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}
```

```kotlin title=""
/* Узел двусвязного списка */
class ListNode(
    var _val: Int // Значение узла
) {
    var next: ListNode? = null // Ссылка на следующий узел
    var prev: ListNode? = null // Ссылка на предыдущий узел
}
```

```ruby title=""
### Узел двусвязного списка ###
class ListNode
  attr_accessor :val  # Значение узла
  attr_accessor :next # Ссылка на следующий узел
  attr_accessor :prev # Ссылка на предыдущий узел

  ### Конструктор ###
  def initialize(val)
    @val = val
  end
end
```
