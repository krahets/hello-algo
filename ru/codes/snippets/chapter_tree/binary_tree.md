<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """Класс узла двоичного дерева"""
    def __init__(self, val: int):
        self.val: int = val                # Значение узла
        self.left: TreeNode | None = None  # Ссылка на левый дочерний узел
        self.right: TreeNode | None = None # Ссылка на правый дочерний узел
```

```cpp title=""
/* Структура узла двоичного дерева */
struct TreeNode {
    int val;          // Значение узла
    TreeNode *left;   // Указатель на левый дочерний узел
    TreeNode *right;  // Указатель на правый дочерний узел
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* Класс узла двоичного дерева */
class TreeNode {
    int val;         // Значение узла
    TreeNode left;   // Ссылка на левый дочерний узел
    TreeNode right;  // Ссылка на правый дочерний узел
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* Класс узла двоичного дерева */
class TreeNode(int? x) {
    public int? val = x;    // Значение узла
    public TreeNode? left;  // Ссылка на левый дочерний узел
    public TreeNode? right; // Ссылка на правый дочерний узел
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
        Left:  nil, // Указатель на левый дочерний узел
        Right: nil, // Указатель на правый дочерний узел
        Val:   v,   // Значение узла
    }
}
```

```swift title=""
/* Класс узла двоичного дерева */
class TreeNode {
    var val: Int // Значение узла
    var left: TreeNode? // Ссылка на левый дочерний узел
    var right: TreeNode? // Ссылка на правый дочерний узел

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* Класс узла двоичного дерева */
class TreeNode {
    val; // Значение узла
    left; // Указатель на левый дочерний узел
    right; // Указатель на правый дочерний узел
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
        this.left = left === undefined ? null : left; // Ссылка на левый дочерний узел
        this.right = right === undefined ? null : right; // Ссылка на правый дочерний узел
    }
}
```

```dart title=""
/* Класс узла двоичного дерева */
class TreeNode {
  int val;         // Значение узла
  TreeNode? left;  // Ссылка на левый дочерний узел
  TreeNode? right; // Ссылка на правый дочерний узел
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Структура узла двоичного дерева */
struct TreeNode {
    val: i32,                               // Значение узла
    left: Option<Rc<RefCell<TreeNode>>>,    // Ссылка на левый дочерний узел
    right: Option<Rc<RefCell<TreeNode>>>,   // Ссылка на правый дочерний узел
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
    struct TreeNode *left;  // Указатель на левый дочерний узел
    struct TreeNode *right; // Указатель на правый дочерний узел
} TreeNode;

/* Конструктор */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->left = NULL;
    node->right = NULL;
    return node;
}
```

```kotlin title=""
/* Класс узла двоичного дерева */
class TreeNode(val _val: Int) {  // Значение узла
    var left: TreeNode? = null   // Ссылка на левый дочерний узел
    var right: TreeNode? = null  // Ссылка на правый дочерний узел
}
```

```ruby title=""
### Класс узла двоичного дерева ###
class TreeNode
  attr_accessor :val    # Значение узла
  attr_accessor :left   # Ссылка на левый дочерний узел
  attr_accessor :right  # Ссылка на правый дочерний узел

  def initialize(val)
    @val = val
  end
end
```

<!-- [snippet]{init_binary_tree} -->
```python title="binary_tree.py"
[file]{binary_tree}-[region]{init_binary_tree}
```

```cpp title="binary_tree.cpp"
[file]{binary_tree}-[region]{init_binary_tree}
```

```java title="binary_tree.java"
[file]{binary_tree}-[region]{init_binary_tree}
```

```csharp title="binary_tree.cs"
[file]{binary_tree}-[region]{init_binary_tree}
```

```go title="binary_tree.go"
[file]{binary_tree_test}-[region]{init_binary_tree}
```

```swift title="binary_tree.swift"
[file]{binary_tree}-[region]{init_binary_tree}
```

```javascript title="binary_tree.js"
[file]{binary_tree}-[region]{init_binary_tree}
```

```typescript title="binary_tree.ts"
[file]{binary_tree}-[region]{init_binary_tree}
```

```dart title="binary_tree.dart"
[file]{binary_tree}-[region]{init_binary_tree}
```

```rust title="binary_tree.rs"
[file]{binary_tree}-[region]{init_binary_tree}
```

```c title="binary_tree.c"
[file]{binary_tree}-[region]{init_binary_tree}
```

```kotlin title="binary_tree.kt"
[file]{binary_tree}-[region]{init_binary_tree}
```

```ruby title="binary_tree.rb"
[file]{binary_tree}-[region]{init_binary_tree}
```

<!-- [tutor]{init_binary_tree_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20%D1%83%D0%B7%D0%BB%D0%B0%D0%BC%D0%B8%20%28%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D0%B8%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_node} -->
```python title="binary_tree.py"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```cpp title="binary_tree.cpp"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```java title="binary_tree.java"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```csharp title="binary_tree.cs"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```go title="binary_tree.go"
[file]{binary_tree_test}-[region]{insert_node}
[file]{binary_tree_test}-[region]{remove_node}
```

```swift title="binary_tree.swift"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```javascript title="binary_tree.js"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```typescript title="binary_tree.ts"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```dart title="binary_tree.dart"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```rust title="binary_tree.rs"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```c title="binary_tree.c"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```kotlin title="binary_tree.kt"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

```ruby title="binary_tree.rb"
[file]{binary_tree}-[region]{insert_node}
[file]{binary_tree}-[region]{remove_node}
```

<!-- [tutor]{insert_remove_node_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20%D1%83%D0%B7%D0%BB%D0%B0%D0%BC%D0%B8%20%28%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D0%B8%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D0%B8%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%BE%D0%B2%0A%20%20%20%20P%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%20P%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20n1%20-%3E%20n2%0A%20%20%20%20n1.left%20%3D%20P%0A%20%20%20%20P.left%20%3D%20n2%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%20P%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
