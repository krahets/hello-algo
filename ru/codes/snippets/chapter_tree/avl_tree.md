<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """Класс узла AVL-дерева"""
    def __init__(self, val: int):
        self.val: int = val                 # Значение узла
        self.height: int = 0                # Высота узла
        self.left: TreeNode | None = None   # Ссылка на левого дочернего узла
        self.right: TreeNode | None = None  # Ссылка на правого дочернего узла
```

```cpp title=""
/* Класс узла AVL-дерева */
struct TreeNode {
    int val{};          // Значение узла
    int height = 0;     // Высота узла
    TreeNode *left{};   // Левый дочерний узел
    TreeNode *right{};  // Правый дочерний узел
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* Класс узла AVL-дерева */
class TreeNode {
    public int val;        // Значение узла
    public int height;     // Высота узла
    public TreeNode left;  // Левый дочерний узел
    public TreeNode right; // Правый дочерний узел
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* Класс узла AVL-дерева */
class TreeNode(int? x) {
    public int? val = x;    // Значение узла
    public int height;      // Высота узла
    public TreeNode? left;  // Ссылка на левого дочернего узла
    public TreeNode? right; // Ссылка на правого дочернего узла
}
```

```go title=""
/* Структура узла AVL-дерева */
type TreeNode struct {
    Val    int       // Значение узла
    Height int       // Высота узла
    Left   *TreeNode // Ссылка на левого дочернего узла
    Right  *TreeNode // Ссылка на правого дочернего узла
}
```

```swift title=""
/* Класс узла AVL-дерева */
class TreeNode {
    var val: Int // Значение узла
    var height: Int // Высота узла
    var left: TreeNode? // Левый дочерний узел
    var right: TreeNode? // Правый дочерний узел

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* Класс узла AVL-дерева */
class TreeNode {
    val; // Значение узла
    height; // Высота узла
    left; // Указатель на левого дочернего узла
    right; // Указатель на правого дочернего узла
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* Класс узла AVL-дерева */
class TreeNode {
    val: number;            // Значение узла
    height: number;         // Высота узла
    left: TreeNode | null;  // Указатель на левого дочернего узла
    right: TreeNode | null; // Указатель на правого дочернего узла
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* Класс узла AVL-дерева */
class TreeNode {
  int val;         // Значение узла
  int height;      // Высота узла
  TreeNode? left;  // Левый дочерний узел
  TreeNode? right; // Правый дочерний узел
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Структура узла AVL-дерева */
struct TreeNode {
    val: i32,                               // Значение узла
    height: i32,                            // Высота узла
    left: Option<Rc<RefCell<TreeNode>>>,    // Левый дочерний узел
    right: Option<Rc<RefCell<TreeNode>>>,   // Правый дочерний узел
}

impl TreeNode {
    /* Конструктор */
    fn new(val: i32) -> Rc<RefCell<Self>> {
        Rc::new(RefCell::new(Self {
            val,
            height: 0,
            left: None,
            right: None
        }))
    }
}
```

```c title=""
/* Структура узла AVL-дерева */
typedef struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
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
/* Класс узла AVL-дерева */
class TreeNode(val _val: Int) {  // Значение узла
    var height: Int = 0          // Высота узла
    var left: TreeNode? = null   // Левый дочерний узел
    var right: TreeNode? = null  // Правый дочерний узел
}
```

```ruby title=""
### Класс узла AVL-дерева ###
class TreeNode
  attr_accessor :val    # Значение узла
  attr_accessor :height # Высота узла
  attr_accessor :left   # Ссылка на левого дочернего узла
  attr_accessor :right  # Ссылка на правого дочернего узла

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
