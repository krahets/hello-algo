<!-- [snippet]{list_node_class} -->
```python title=""
class ListNode:
    """Класс узла связного списка"""
    def __init__(self, val: int):
        self.val: int = val               # Значение узла
        self.next: ListNode | None = None # Ссылка на следующий узел
```

```cpp title=""
/* Структура узла связного списка */
struct ListNode {
    int val;         // Значение узла
    ListNode *next;  // Указатель на следующий узел
    ListNode(int x) : val(x), next(nullptr) {}  // Конструктор
};
```

```java title=""
/* Класс узла связного списка */
class ListNode {
    int val;        // Значение узла
    ListNode next;  // Ссылка на следующий узел
    ListNode(int x) { val = x; }  // Конструктор
}
```

```csharp title=""
/* Класс узла связного списка */
class ListNode(int x) {  // Конструктор
    public int val = x;     // Значение узла
    public ListNode? next;  // Ссылка на следующий узел
}
```

```go title=""
/* Структура узла связного списка */
type ListNode struct {
    Val  int       // Значение узла
    Next *ListNode // Указатель на следующий узел
}

// NewListNode — функция-конструктор, создающая новый связный список.
func NewListNode(val int) *ListNode {
    return &ListNode{
        Val:  val,
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
/* Класс узла связного списка */
class ListNode {
    constructor(val, next) {
        this.val = (val === undefined ? 0 : val);       // Значение узла
        this.next = (next === undefined ? null : next); // Ссылка на следующий узел
    }
}
```

```typescript title=""
/* Класс узла связного списка */
class ListNode {
    val: number;
    next: ListNode | null;
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;        // Значение узла
        this.next = next === undefined ? null : next;  // Ссылка на следующий узел
    }
}
```

```dart title=""
/* Класс узла связного списка */
class ListNode {
  int val; // Значение узла
  ListNode? next; // Ссылка на следующий узел
  ListNode(this.val, [this.next]); // Конструктор
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;
/* Класс узла связного списка */
#[derive(Debug)]
struct ListNode {
    val: i32, // Значение узла
    next: Option<Rc<RefCell<ListNode>>>, // Указатель на следующий узел
}
```

```c title=""
/* Структура узла связного списка */
typedef struct ListNode {
    int val;               // Значение узла
    struct ListNode *next; // Указатель на следующий узел
} ListNode;

/* Конструктор */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *) malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}
```

```kotlin title=""
/* Класс узла связного списка */
// Конструктор
class ListNode(x: Int) {
    val _val: Int = x          // Значение узла
    var next: ListNode? = null // Ссылка на следующий узел
}
```

```ruby title=""
# Класс узла связного списка
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
# Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4
# Инициализация каждого узла
n0 = ListNode(1)
n1 = ListNode(3)
n2 = ListNode(2)
n3 = ListNode(5)
n4 = ListNode(4)
# Построение ссылок между узлами
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```cpp title="linked_list.cpp"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
ListNode* n0 = new ListNode(1);
ListNode* n1 = new ListNode(3);
ListNode* n2 = new ListNode(2);
ListNode* n3 = new ListNode(5);
ListNode* n4 = new ListNode(4);
// Построение ссылок между узлами
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```java title="linked_list.java"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
ListNode n0 = new ListNode(1);
ListNode n1 = new ListNode(3);
ListNode n2 = new ListNode(2);
ListNode n3 = new ListNode(5);
ListNode n4 = new ListNode(4);
// Построение ссылок между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```csharp title="linked_list.cs"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
ListNode n0 = new(1);
ListNode n1 = new(3);
ListNode n2 = new(2);
ListNode n3 = new(5);
ListNode n4 = new(4);
// Построение ссылок между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```go title="linked_list.go"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
n0 := NewListNode(1)
n1 := NewListNode(3)
n2 := NewListNode(2)
n3 := NewListNode(5)
n4 := NewListNode(4)
// Построение ссылок между узлами
n0.Next = n1
n1.Next = n2
n2.Next = n3
n3.Next = n4
```

```swift title="linked_list.swift"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
let n0 = ListNode(x: 1)
let n1 = ListNode(x: 3)
let n2 = ListNode(x: 2)
let n3 = ListNode(x: 5)
let n4 = ListNode(x: 4)
// Построение ссылок между узлами
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

```javascript title="linked_list.js"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Построение ссылок между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```typescript title="linked_list.ts"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Построение ссылок между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```dart title="linked_list.dart"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
ListNode n0 = ListNode(1);
ListNode n1 = ListNode(3);
ListNode n2 = ListNode(2);
ListNode n3 = ListNode(5);
ListNode n4 = ListNode(4);
// Построение ссылок между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```rust title="linked_list.rs"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
let n0 = Rc::new(RefCell::new(ListNode { val: 1, next: None }));
let n1 = Rc::new(RefCell::new(ListNode { val: 3, next: None }));
let n2 = Rc::new(RefCell::new(ListNode { val: 2, next: None }));
let n3 = Rc::new(RefCell::new(ListNode { val: 5, next: None }));
let n4 = Rc::new(RefCell::new(ListNode { val: 4, next: None }));

// Построение ссылок между узлами
n0.borrow_mut().next = Some(n1.clone());
n1.borrow_mut().next = Some(n2.clone());
n2.borrow_mut().next = Some(n3.clone());
n3.borrow_mut().next = Some(n4.clone());
```

```c title="linked_list.c"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
ListNode* n0 = newListNode(1);
ListNode* n1 = newListNode(3);
ListNode* n2 = newListNode(2);
ListNode* n3 = newListNode(5);
ListNode* n4 = newListNode(4);
// Построение ссылок между узлами
n0->next = n1;
n1->next = n2;
n2->next = n3;
n3->next = n4;
```

```kotlin title="linked_list.kt"
/* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
// Инициализация каждого узла
val n0 = ListNode(1)
val n1 = ListNode(3)
val n2 = ListNode(2)
val n3 = ListNode(5)
val n4 = ListNode(4)
// Построение ссылок между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
```

```ruby title="linked_list.rb"
# Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4
# Инициализация каждого узла
n0 = ListNode.new(1)
n1 = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(5)
n4 = ListNode.new(4)
# Построение ссылок между узлами
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D1%83%D0%B7%D0%B5%D0%BB%D0%BA%D0%BB%D0%B0%D1%81%D1%81%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%B0%D0%B6%D0%B4%D1%8B%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20%D1%83%D0%B7%D0%BB%D0%B0%D0%BC%D0%B8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
class ListNode:
    """Класс узла двусвязного списка"""
    def __init__(self, val: int):
        self.val: int = val                # Значение узла
        self.next: ListNode | None = None  # Ссылка на следующий узел
        self.prev: ListNode | None = None  # Ссылка на предыдущий узел
```

```cpp title=""
/* Структура узла двусвязного списка */
struct ListNode {
    int val;         // Значение узла
    ListNode *next;  // Указатель на следующий узел
    ListNode *prev;  // Указатель на предыдущий узел
    ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // Конструктор
};
```

```java title=""
/* Класс узла двусвязного списка */
class ListNode {
    int val;        // Значение узла
    ListNode next;  // Ссылка на следующий узел
    ListNode prev;  // Ссылка на предыдущий узел
    ListNode(int x) { val = x; }  // Конструктор
}
```

```csharp title=""
/* Класс узла двусвязного списка */
class ListNode(int x) {  // Конструктор
    public int val = x;     // Значение узла
    public ListNode? next;  // Ссылка на следующий узел
    public ListNode? prev;  // Ссылка на предыдущий узел
}
```

```go title=""
/* Структура узла двусвязного списка */
type DoublyListNode struct {
    Val  int             // Значение узла
    Next *DoublyListNode // Указатель на следующий узел
    Prev *DoublyListNode // Указатель на предыдущий узел
}

// NewDoublyListNode инициализирует узел двусвязного списка.
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
/* Класс узла двусвязного списка */
class ListNode {
    var val: Int // Значение узла
    var next: ListNode? // Ссылка на следующий узел
    var prev: ListNode? // Ссылка на предыдущий узел

    init(x: Int) { // Конструктор
        val = x
    }
}
```

```javascript title=""
/* Класс узла двусвязного списка */
class ListNode {
    constructor(val, next, prev) {
        this.val = val  ===  undefined ? 0 : val;        // Значение узла
        this.next = next  ===  undefined ? null : next;  // Ссылка на следующий узел
        this.prev = prev  ===  undefined ? null : prev;  // Ссылка на предыдущий узел
    }
}
```

```typescript title=""
/* Класс узла двусвязного списка */
class ListNode {
    val: number;
    next: ListNode | null;
    prev: ListNode | null;
    constructor(val?: number, next?: ListNode | null, prev?: ListNode | null) {
        this.val = val  ===  undefined ? 0 : val;        // Значение узла
        this.next = next  ===  undefined ? null : next;  // Ссылка на следующий узел
        this.prev = prev  ===  undefined ? null : prev;  // Ссылка на предыдущий узел
    }
}
```

```dart title=""
/* Класс узла двусвязного списка */
class ListNode {
    int val;        // Значение узла
    ListNode? next;  // Ссылка на следующий узел
    ListNode? prev;  // Ссылка на предыдущий узел
    ListNode(this.val, [this.next, this.prev]);  // Конструктор
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Тип узла двусвязного списка */
#[derive(Debug)]
struct ListNode {
    val: i32, // Значение узла
    next: Option<Rc<RefCell<ListNode>>>, // Указатель на следующий узел
    prev: Option<Rc<RefCell<ListNode>>>, // Указатель на предыдущий узел
}

/* Конструктор */
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
/* Структура узла двусвязного списка */
typedef struct ListNode {
    int val;               // Значение узла
    struct ListNode *next; // Указатель на следующий узел
    struct ListNode *prev; // Указатель на предыдущий узел
} ListNode;

/* Конструктор */
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
/* Класс узла двусвязного списка */
// Конструктор
class ListNode(x: Int) {
    val _val: Int = x           // Значение узла
    var next: ListNode? = null  // Ссылка на следующий узел
    var prev: ListNode? = null  // Ссылка на предыдущий узел
}
```

```ruby title=""
# Класс узла двусвязного списка
class ListNode
  attr_accessor :val    # Значение узла
  attr_accessor :next   # Ссылка на следующий узел
  attr_accessor :prev   # Ссылка на предыдущий узел

  def initialize(val=0, next_node=nil, prev_node=nil)
    @val = val
    @next = next_node
    @prev = prev_node
  end
end
```
