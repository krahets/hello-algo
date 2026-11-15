<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """Класс узла двоичного дерева"""
    def __init__(self, val: int):
        self.val: int = val                # Значение узла
        self.left: TreeNode | None = None  # Ссылка на левого дочернего узла
        self.right: TreeNode | None = None # Ссылка на правого дочернего узла
```

```cpp title=""
/* Структура узла двоичного дерева */
struct TreeNode {
    int val;          // Значение узла
    TreeNode *left;   // Указатель на левого дочернего узла
    TreeNode *right;  // Указатель на правого дочернего узла
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* Класс узла двоичного дерева */
class TreeNode {
    int val;         // Значение узла
    TreeNode left;   // Ссылка на левого дочернего узла
    TreeNode right;  // Ссылка на правого дочернего узла
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* Класс узла двоичного дерева */
class TreeNode(int? x) {
    public int? val = x;    // Значение узла
    public TreeNode? left;  // Ссылка на левого дочернего узла
    public TreeNode? right; // Ссылка на правого дочернего узла
}
```

```go title=""
/* Структура узла двоичного дерева */
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
/* Конструктор */
func NewTreeNode(v int) *TreeNode {
    return &TreeNode{
        Left:  nil, // Указатель на левого дочернего узла
        Right: nil, // Указатель на правого дочернего узла
        Val:   v,   // Значение узла
    }
}
```

```swift title=""
/* Класс узла двоичного дерева */
class TreeNode {
    var val: Int // Значение узла
    var left: TreeNode? // Ссылка на левого дочернего узла
    var right: TreeNode? // Ссылка на правого дочернего узла

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* Класс узла двоичного дерева */
class TreeNode {
    val; // Значение узла
    left; // Указатель на левого дочернего узла
    right; // Указатель на правого дочернего узла
    constructor(val, left, right) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* Класс узла двоичного дерева */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // Значение узла
        this.left = left === undefined ? null : left; // Ссылка на левого дочернего узла
        this.right = right === undefined ? null : right; // Ссылка на правого дочернего узла
    }
}
```

```dart title=""
/* Класс узла двоичного дерева */
class TreeNode {
  int val;         // Значение узла
  TreeNode? left;  // Ссылка на левого дочернего узла
  TreeNode? right; // Ссылка на правого дочернего узла
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Структура узла двоичного дерева */
struct TreeNode {
    val: i32,                               // Значение узла
    left: Option<Rc<RefCell<TreeNode>>>,    // Ссылка на левого дочернего узла
    right: Option<Rc<RefCell<TreeNode>>>,   // Ссылка на правого дочернего узла
}

impl TreeNode {
    /* Конструктор */
    fn new(val: i32) -> Rc<RefCell<Self>> {
        Rc::new(RefCell::new(Self {
            val,
            left: None,
            right: None
        }))
    }
}
```

```c title=""
/* Структура узла двоичного дерева */
typedef struct TreeNode {
    int val;                // Значение узла
    int height;             // Высота узла
    struct TreeNode *left;  // Указатель на левого дочернего узла
    struct TreeNode *right; // Указатель на правого дочернего узла
} TreeNode;

/* Конструктор */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}
```

```kotlin title=""
/* Класс узла двоичного дерева */
class TreeNode(val _val: Int) {  // Значение узла
    var left: TreeNode? = null   // Ссылка на левого дочернего узла
    var right: TreeNode? = null  // Ссылка на правого дочернего узла
}
```

```ruby title=""
### Класс узла двоичного дерева ###
class TreeNode
  attr_accessor :val    # Значение узла
  attr_accessor :left   # Ссылка на левого дочернего узла
  attr_accessor :right  # Ссылка на правого дочернего узла

  def initialize(val)
    @val = val
  end
end
```

<!-- [snippet]{init_binary_tree} -->
```python title="binary_tree.py"
# Инициализация двоичного дерева
# Инициализация узлов
n1 = TreeNode(val=1)
n2 = TreeNode(val=2)
n3 = TreeNode(val=3)
n4 = TreeNode(val=4)
n5 = TreeNode(val=5)
# Построение ссылок (указателей) между узлами
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```cpp title="binary_tree.cpp"
/* Инициализация двоичного дерева */
// Инициализация узлов
TreeNode* n1 = new TreeNode(1);
TreeNode* n2 = new TreeNode(2);
TreeNode* n3 = new TreeNode(3);
TreeNode* n4 = new TreeNode(4);
TreeNode* n5 = new TreeNode(5);
// Построение ссылок (указателей) между узлами
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```java title="binary_tree.java"
// Инициализация узлов
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// Построение ссылок (указателей) между узлами
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```csharp title="binary_tree.cs"
/* Инициализация двоичного дерева */
// Инициализация узлов
TreeNode n1 = new(1);
TreeNode n2 = new(2);
TreeNode n3 = new(3);
TreeNode n4 = new(4);
TreeNode n5 = new(5);
// Построение ссылок (указателей) между узлами
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```go title="binary_tree.go"
/* Инициализация двоичного дерева */
// Инициализация узлов
n1 := NewTreeNode(1)
n2 := NewTreeNode(2)
n3 := NewTreeNode(3)
n4 := NewTreeNode(4)
n5 := NewTreeNode(5)
// Построение ссылок (указателей) между узлами
n1.Left = n2
n1.Right = n3
n2.Left = n4
n2.Right = n5
```

```swift title="binary_tree.swift"
// Инициализация узлов
let n1 = TreeNode(x: 1)
let n2 = TreeNode(x: 2)
let n3 = TreeNode(x: 3)
let n4 = TreeNode(x: 4)
let n5 = TreeNode(x: 5)
// Построение ссылок (указателей) между узлами
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```javascript title="binary_tree.js"
/* Инициализация двоичного дерева */
// Инициализация узлов
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// Построение ссылок (указателей) между узлами
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```typescript title="binary_tree.ts"
/* Инициализация двоичного дерева */
// Инициализация узлов
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// Построение ссылок (указателей) между узлами
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```dart title="binary_tree.dart"
/* Инициализация двоичного дерева */
// Инициализация узлов
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// Построение ссылок (указателей) между узлами
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```rust title="binary_tree.rs"
// Инициализация узлов
let n1 = TreeNode::new(1);
let n2 = TreeNode::new(2);
let n3 = TreeNode::new(3);
let n4 = TreeNode::new(4);
let n5 = TreeNode::new(5);
// Построение ссылок (указателей) между узлами
n1.borrow_mut().left = Some(n2.clone());
n1.borrow_mut().right = Some(n3);
n2.borrow_mut().left = Some(n4);
n2.borrow_mut().right = Some(n5);
```

```c title="binary_tree.c"
/* Инициализация двоичного дерева */
// Инициализация узлов
TreeNode *n1 = newTreeNode(1);
TreeNode *n2 = newTreeNode(2);
TreeNode *n3 = newTreeNode(3);
TreeNode *n4 = newTreeNode(4);
TreeNode *n5 = newTreeNode(5);
// Построение ссылок (указателей) между узлами
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```kotlin title="binary_tree.kt"
// Инициализация узлов
val n1 = TreeNode(1)
val n2 = TreeNode(2)
val n3 = TreeNode(3)
val n4 = TreeNode(4)
val n5 = TreeNode(5)
// Построение ссылок (указателей) между узлами
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```ruby title="binary_tree.rb"
# Инициализация двоичного дерева
# Инициализация узлов
n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)
n5 = TreeNode.new(5)
# Построение ссылок (указателей) между узлами
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

<!-- [tutor]{init_binary_tree_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20%D1%83%D0%B7%D0%BB%D0%B0%D0%BC%D0%B8%20%28%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D0%B8%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_node} -->
```python title="binary_tree.py"
# Вставка и удаление узлов
p = TreeNode(0)
# Вставить узел P между n1 -> n2
n1.left = p
p.left = n2
# Удалить узел P
n1.left = n2
```

```cpp title="binary_tree.cpp"
/* Вставка и удаление узлов */
TreeNode* P = new TreeNode(0);
// Вставить узел P между n1 -> n2
n1->left = P;
P->left = n2;
// Удалить узел P
n1->left = n2;
// Освободить память
delete P;
```

```java title="binary_tree.java"
TreeNode P = new TreeNode(0);
// Вставить узел P между n1 -> n2
n1.left = P;
P.left = n2;
// Удалить узел P
n1.left = n2;
```

```csharp title="binary_tree.cs"
/* Вставка и удаление узлов */
TreeNode P = new(0);
// Вставить узел P между n1 -> n2
n1.left = P;
P.left = n2;
// Удалить узел P
n1.left = n2;
```

```go title="binary_tree.go"
/* Вставка и удаление узлов */
// Вставить узел P между n1 -> n2
p := NewTreeNode(0)
n1.Left = p
p.Left = n2
// Удалить узел P
n1.Left = n2
```

```swift title="binary_tree.swift"
let P = TreeNode(x: 0)
// Вставить узел P между n1 -> n2
n1.left = P
P.left = n2
// Удалить узел P
n1.left = n2
```

```javascript title="binary_tree.js"
/* Вставка и удаление узлов */
let P = new TreeNode(0);
// Вставить узел P между n1 -> n2
n1.left = P;
P.left = n2;
// Удалить узел P
n1.left = n2;
```

```typescript title="binary_tree.ts"
/* Вставка и удаление узлов */
const P = new TreeNode(0);
// Вставить узел P между n1 -> n2
n1.left = P;
P.left = n2;
// Удалить узел P
n1.left = n2;
```

```dart title="binary_tree.dart"
/* Вставка и удаление узлов */
TreeNode P = new TreeNode(0);
// Вставить узел P между n1 -> n2
n1.left = P;
P.left = n2;
// Удалить узел P
n1.left = n2;
```

```rust title="binary_tree.rs"
let p = TreeNode::new(0);
// Вставить узел P между n1 -> n2
n1.borrow_mut().left = Some(p.clone());
p.borrow_mut().left = Some(n2.clone());
// Удалить узел p
n1.borrow_mut().left = Some(n2);
```

```c title="binary_tree.c"
/* Вставка и удаление узлов */
TreeNode *P = newTreeNode(0);
// Вставить узел P между n1 -> n2
n1->left = P;
P->left = n2;
// Удалить узел P
n1->left = n2;
// Освободить память
free(P);
```

```kotlin title="binary_tree.kt"
val P = TreeNode(0)
// Вставить узел P между n1 -> n2
n1.left = P
P.left = n2
// Удалить узел P
n1.left = n2
```

```ruby title="binary_tree.rb"
# Вставка и удаление узлов
_p = TreeNode.new(0)
# Вставить узел _p между n1 -> n2
n1.left = _p
_p.left = n2
# Удалить узел
n1.left = n2
```

<!-- [tutor]{insert_remove_node_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20%D1%83%D0%B7%D0%BB%D0%B0%D0%BC%D0%B8%20%28%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D0%B8%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D0%B8%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%BE%D0%B2%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%20P%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20n1%20-%3E%20n2%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%20P%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
