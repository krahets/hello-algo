<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """AVL 樹節點類別"""
    def __init__(self, val: int):
        self.val: int = val                 # 節點值
        self.height: int = 0                # 節點高度
        self.left: TreeNode | None = None   # 左子節點引用
        self.right: TreeNode | None = None  # 右子節點引用
```

```cpp title=""
/* AVL 樹節點類別 */
struct TreeNode {
    int val{};          // 節點值
    int height = 0;     // 節點高度
    TreeNode *left{};   // 左子節點
    TreeNode *right{};  // 右子節點
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* AVL 樹節點類別 */
class TreeNode {
    public int val;        // 節點值
    public int height;     // 節點高度
    public TreeNode left;  // 左子節點
    public TreeNode right; // 右子節點
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* AVL 樹節點類別 */
class TreeNode(int? x) {
    public int? val = x;    // 節點值
    public int height;      // 節點高度
    public TreeNode? left;  // 左子節點引用
    public TreeNode? right; // 右子節點引用
}
```

```go title=""
/* AVL 樹節點結構體 */
type TreeNode struct {
    Val    int       // 節點值
    Height int       // 節點高度
    Left   *TreeNode // 左子節點引用
    Right  *TreeNode // 右子節點引用
}
```

```swift title=""
/* AVL 樹節點類別 */
class TreeNode {
    var val: Int // 節點值
    var height: Int // 節點高度
    var left: TreeNode? // 左子節點
    var right: TreeNode? // 右子節點

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* AVL 樹節點類別 */
class TreeNode {
    val; // 節點值
    height; //節點高度
    left; // 左子節點指標
    right; // 右子節點指標
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* AVL 樹節點類別 */
class TreeNode {
    val: number;            // 節點值
    height: number;         // 節點高度
    left: TreeNode | null;  // 左子節點指標
    right: TreeNode | null; // 右子節點指標
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* AVL 樹節點類別 */
class TreeNode {
  int val;         // 節點值
  int height;      // 節點高度
  TreeNode? left;  // 左子節點
  TreeNode? right; // 右子節點
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* AVL 樹節點結構體 */
struct TreeNode {
    val: i32,                               // 節點值
    height: i32,                            // 節點高度
    left: Option<Rc<RefCell<TreeNode>>>,    // 左子節點
    right: Option<Rc<RefCell<TreeNode>>>,   // 右子節點
}

impl TreeNode {
    /* 建構子 */
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
/* AVL 樹節點結構體 */
typedef struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

/* 建構子 */
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
/* AVL 樹節點類別 */
class TreeNode(val _val: Int) {  // 節點值
    var height: Int = 0          // 節點高度
    var left: TreeNode? = null   // 左子節點
    var right: TreeNode? = null  // 右子節點
}
```

```ruby title=""
### AVL 樹節點類別 ###
class TreeNode
  attr_accessor :val    # 節點值
  attr_accessor :height # 節點高度
  attr_accessor :left   # 左子節點引用
  attr_accessor :right  # 右子節點引用

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
