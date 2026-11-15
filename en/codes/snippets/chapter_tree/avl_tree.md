<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """AVL tree node class"""
    def __init__(self, val: int):
        self.val: int = val                 # Node value
        self.height: int = 0                # Node height
        self.left: TreeNode | None = None   # Left child reference
        self.right: TreeNode | None = None  # Right child reference
```

```cpp title=""
/* AVL tree node class */
struct TreeNode {
    int val{};          // Node value
    int height = 0;     // Node height
    TreeNode *left{};   // Left child
    TreeNode *right{};  // Right child
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* AVL tree node class */
class TreeNode {
    public int val;        // Node value
    public int height;     // Node height
    public TreeNode left;  // Left child
    public TreeNode right; // Right child
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* AVL tree node class */
class TreeNode(int? x) {
    public int? val = x;    // Node value
    public int height;      // Node height
    public TreeNode? left;  // Left child reference
    public TreeNode? right; // Right child reference
}
```

```go title=""
/* AVL tree node struct */
type TreeNode struct {
    Val    int       // Node value
    Height int       // Node height
    Left   *TreeNode // Left child reference
    Right  *TreeNode // Right child reference
}
```

```swift title=""
/* AVL tree node class */
class TreeNode {
    var val: Int // Node value
    var height: Int // Node height
    var left: TreeNode? // Left child
    var right: TreeNode? // Right child

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* AVL tree node class */
class TreeNode {
    val; // Node value
    height; //Node height
    left; // Left child pointer
    right; // Right child pointer
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* AVL tree node class */
class TreeNode {
    val: number;            // Node value
    height: number;         // Node height
    left: TreeNode | null;  // Left child pointer
    right: TreeNode | null; // Right child pointer
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* AVL tree node class */
class TreeNode {
  int val;         // Node value
  int height;      // Node height
  TreeNode? left;  // Left child
  TreeNode? right; // Right child
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* AVL tree node struct */
struct TreeNode {
    val: i32,                               // Node value
    height: i32,                            // Node height
    left: Option<Rc<RefCell<TreeNode>>>,    // Left child
    right: Option<Rc<RefCell<TreeNode>>>,   // Right child
}

impl TreeNode {
    /* Constructor */
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
/* AVL tree node struct */
typedef struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

/* Constructor */
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
/* AVL tree node class */
class TreeNode(val _val: Int) {  // Node value
    var height: Int = 0          // Node height
    var left: TreeNode? = null   // Left child
    var right: TreeNode? = null  // Right child
}
```

```ruby title=""
### AVL tree node class ###
class TreeNode
  attr_accessor :val    # Node value
  attr_accessor :height # Node height
  attr_accessor :left   # Left child reference
  attr_accessor :right  # Right child reference

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
