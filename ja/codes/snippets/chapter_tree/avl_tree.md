<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """AVL 木のノードクラス"""
    def __init__(self, val: int):
        self.val: int = val                 # ノードの値
        self.height: int = 0                # ノードの高さ
        self.left: TreeNode | None = None   # 左の子への参照
        self.right: TreeNode | None = None  # 右の子への参照
```

```cpp title=""
/* AVL 木のノードクラス */
struct TreeNode {
    int val{};          // ノードの値
    int height = 0;     // ノードの高さ
    TreeNode *left{};   // 左の子
    TreeNode *right{};  // 右の子
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* AVL 木のノードクラス */
class TreeNode {
    public int val;        // ノードの値
    public int height;     // ノードの高さ
    public TreeNode left;  // 左の子
    public TreeNode right; // 右の子
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* AVL 木のノードクラス */
class TreeNode(int? x) {
    public int? val = x;    // ノードの値
    public int height;      // ノードの高さ
    public TreeNode? left;  // 左の子への参照
    public TreeNode? right; // 右の子への参照
}
```

```go title=""
/* AVL 木のノード構造体 */
type TreeNode struct {
    Val    int       // ノードの値
    Height int       // ノードの高さ
    Left   *TreeNode // 左の子への参照
    Right  *TreeNode // 右の子への参照
}
```

```swift title=""
/* AVL 木のノードクラス */
class TreeNode {
    var val: Int // ノードの値
    var height: Int // ノードの高さ
    var left: TreeNode? // 左の子
    var right: TreeNode? // 右の子

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* AVL 木のノードクラス */
class TreeNode {
    val; // ノードの値
    height; //ノードの高さ
    left; // 左の子へのポインタ
    right; // 右の子へのポインタ
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* AVL 木のノードクラス */
class TreeNode {
    val: number;            // ノードの値
    height: number;         // ノードの高さ
    left: TreeNode | null;  // 左の子へのポインタ
    right: TreeNode | null; // 右の子へのポインタ
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* AVL 木のノードクラス */
class TreeNode {
  int val;         // ノードの値
  int height;      // ノードの高さ
  TreeNode? left;  // 左の子
  TreeNode? right; // 右の子
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* AVL 木のノード構造体 */
struct TreeNode {
    val: i32,                               // ノードの値
    height: i32,                            // ノードの高さ
    left: Option<Rc<RefCell<TreeNode>>>,    // 左の子
    right: Option<Rc<RefCell<TreeNode>>>,   // 右の子
}

impl TreeNode {
    /* コンストラクタ */
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
/* AVL 木のノード構造体 */
typedef struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

/* コンストラクタ */
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
/* AVL 木のノードクラス */
class TreeNode(val _val: Int) {  // ノードの値
    var height: Int = 0          // ノードの高さ
    var left: TreeNode? = null   // 左の子
    var right: TreeNode? = null  // 右の子
}
```

```ruby title=""
### AVL 木のノードクラス ###
class TreeNode
  attr_accessor :val    # ノードの値
  attr_accessor :height # ノードの高さ
  attr_accessor :left   # 左の子への参照
  attr_accessor :right  # 右の子への参照

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
