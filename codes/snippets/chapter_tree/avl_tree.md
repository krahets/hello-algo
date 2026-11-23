<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """AVL 树节点类"""
    def __init__(self, val: int):
        self.val: int = val                 # 节点值
        self.height: int = 0                # 节点高度
        self.left: TreeNode | None = None   # 左子节点引用
        self.right: TreeNode | None = None  # 右子节点引用
```

```cpp title=""
/* AVL 树节点类 */
struct TreeNode {
    int val{};          // 节点值
    int height = 0;     // 节点高度
    TreeNode *left{};   // 左子节点
    TreeNode *right{};  // 右子节点
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* AVL 树节点类 */
class TreeNode {
    public int val;        // 节点值
    public int height;     // 节点高度
    public TreeNode left;  // 左子节点
    public TreeNode right; // 右子节点
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* AVL 树节点类 */
class TreeNode(int? x) {
    public int? val = x;    // 节点值
    public int height;      // 节点高度
    public TreeNode? left;  // 左子节点引用
    public TreeNode? right; // 右子节点引用
}
```

```go title=""
/* AVL 树节点结构体 */
type TreeNode struct {
    Val    int       // 节点值
    Height int       // 节点高度
    Left   *TreeNode // 左子节点引用
    Right  *TreeNode // 右子节点引用
}
```

```swift title=""
/* AVL 树节点类 */
class TreeNode {
    var val: Int // 节点值
    var height: Int // 节点高度
    var left: TreeNode? // 左子节点
    var right: TreeNode? // 右子节点

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* AVL 树节点类 */
class TreeNode {
    val; // 节点值
    height; //节点高度
    left; // 左子节点指针
    right; // 右子节点指针
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* AVL 树节点类 */
class TreeNode {
    val: number;            // 节点值
    height: number;         // 节点高度
    left: TreeNode | null;  // 左子节点指针
    right: TreeNode | null; // 右子节点指针
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* AVL 树节点类 */
class TreeNode {
  int val;         // 节点值
  int height;      // 节点高度
  TreeNode? left;  // 左子节点
  TreeNode? right; // 右子节点
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* AVL 树节点结构体 */
struct TreeNode {
    val: i32,                               // 节点值
    height: i32,                            // 节点高度
    left: Option<Rc<RefCell<TreeNode>>>,    // 左子节点
    right: Option<Rc<RefCell<TreeNode>>>,   // 右子节点
}

impl TreeNode {
    /* 构造方法 */
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
/* AVL 树节点结构体 */
typedef struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

/* 构造函数 */
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
/* AVL 树节点类 */
class TreeNode(val _val: Int) {  // 节点值
    var height: Int = 0          // 节点高度
    var left: TreeNode? = null   // 左子节点
    var right: TreeNode? = null  // 右子节点
}
```

```ruby title=""
### AVL 树节点类 ###
class TreeNode
  attr_accessor :val    # 节点值
  attr_accessor :height # 节点高度
  attr_accessor :left   # 左子节点引用
  attr_accessor :right  # 右子节点引用

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
