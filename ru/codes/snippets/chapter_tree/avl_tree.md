<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """Класс узла АВЛ-дерева"""
    def __init__(self, val: int):
        self.val: int = val                 # Значение узла
        self.height: int = 0                # Высота узла
        self.left: TreeNode | None = None   # Ссылка на левого потомка
        self.right: TreeNode | None = None  # Ссылка на правого потомка
```

```cpp title=""
/* Класс узла АВЛ-дерева */
struct TreeNode {
    int val{};          // Значение узла
    int height = 0;     // Высота узла
    TreeNode *left{};   // Левый потомок
    TreeNode *right{};  // Правый потомок
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* Класс узла АВЛ-дерева */
class TreeNode {
    public int val;        // Значение узла
    public int height;     // Высота узла
    public TreeNode left;  // Левый потомок
    public TreeNode right; // Правый потомок
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* Класс узла АВЛ-дерева */
class TreeNode(int? x) {
    public int? val = x;    // Значение узла
    public int height;      // Высота узла
    public TreeNode? left;  // Ссылка на левого потомка
    public TreeNode? right; // Ссылка на правого потомка
}
```

```go title=""
/* Структура узла АВЛ-дерева */
type TreeNode struct {
    Val    int       // Значение узла
    Height int       // Высота узла
    Left   *TreeNode // Ссылка на левого потомка
    Right  *TreeNode // Ссылка на правого потомка
}
```

```swift title=""
/* Класс узла АВЛ-дерева */
class TreeNode {
    var val: Int // Значение узла
    var height: Int // Высота узла
    var left: TreeNode? // Левый потомок
    var right: TreeNode? // Правый потомок

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* Класс узла АВЛ-дерева */
class TreeNode {
    val; // Значение узла
    height; //Высота узла
    left; // Указатель на левого потомка
    right; // Указатель на правого потомка
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* Класс узла АВЛ-дерева */
class TreeNode {
    val: number;            // Значение узла
    height: number;         // Высота узла
    left: TreeNode | null;  // Указатель на левого потомка
    right: TreeNode | null; // Указатель на правого потомка
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* Класс узла АВЛ-дерева */
class TreeNode {
  int val;         // Значение узла
  int height;      // Высота узла
  TreeNode? left;  // Левый потомок
  TreeNode? right; // Правый потомок
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Структура узла АВЛ-дерева */
struct TreeNode {
    val: i32,                               // Значение узла
    height: i32,                            // Высота узла
    left: Option<Rc<RefCell<TreeNode>>>,    // Левый потомок
    right: Option<Rc<RefCell<TreeNode>>>,   // Правый потомок
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
/* Структура узла АВЛ-дерева */
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
/* Класс узла АВЛ-дерева */
class TreeNode(val _val: Int) {  // Значение узла
    var height: Int = 0          // Высота узла
    var left: TreeNode? = null   // Левый потомок
    var right: TreeNode? = null  // Правый потомок
}
```

```ruby title=""
### Класс узла АВЛ-дерева ###
class TreeNode
  attr_accessor :val    # Значение узла
  attr_accessor :height # Высота узла
  attr_accessor :left   # Ссылка на левого потомка
  attr_accessor :right  # Ссылка на правого потомка

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
