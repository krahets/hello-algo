<!-- [snippet]{avl_tree_node} -->
```python title=""
class TreeNode:
    """AVL 트리 노드 클래스"""
    def __init__(self, val: int):
        self.val: int = val                 # 노드 값
        self.height: int = 0                # 노드 높이
        self.left: TreeNode | None = None   # 왼쪽 자식 노드 참조
        self.right: TreeNode | None = None  # 오른쪽 자식 노드 참조
```

```cpp title=""
/* AVL 트리 노드 클래스 */
struct TreeNode {
    int val{};          // 노드 값
    int height = 0;     // 노드 높이
    TreeNode *left{};   // 왼쪽 자식 노드
    TreeNode *right{};  // 오른쪽 자식 노드
    TreeNode() = default;
    explicit TreeNode(int x) : val(x){}
};
```

```java title=""
/* AVL 트리 노드 클래스 */
class TreeNode {
    public int val;        // 노드 값
    public int height;     // 노드 높이
    public TreeNode left;  // 왼쪽 자식 노드
    public TreeNode right; // 오른쪽 자식 노드
    public TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* AVL 트리 노드 클래스 */
class TreeNode(int? x) {
    public int? val = x;    // 노드 값
    public int height;      // 노드 높이
    public TreeNode? left;  // 왼쪽 자식 노드 참조
    public TreeNode? right; // 오른쪽 자식 노드 참조
}
```

```go title=""
/* AVL 트리 노드 구조체 */
type TreeNode struct {
    Val    int       // 노드 값
    Height int       // 노드 높이
    Left   *TreeNode // 왼쪽 자식 노드 참조
    Right  *TreeNode // 오른쪽 자식 노드 참조
}
```

```swift title=""
/* AVL 트리 노드 클래스 */
class TreeNode {
    var val: Int // 노드 값
    var height: Int // 노드 높이
    var left: TreeNode? // 왼쪽 자식 노드
    var right: TreeNode? // 오른쪽 자식 노드

    init(x: Int) {
        val = x
        height = 0
    }
}
```

```javascript title=""
/* AVL 트리 노드 클래스 */
class TreeNode {
    val; // 노드 값
    height; //노드 높이
    left; // 왼쪽 자식 노드 포인터
    right; // 오른쪽 자식 노드 포인터
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* AVL 트리 노드 클래스 */
class TreeNode {
    val: number;            // 노드 값
    height: number;         // 노드 높이
    left: TreeNode | null;  // 왼쪽 자식 노드 포인터
    right: TreeNode | null; // 오른쪽 자식 노드 포인터
    constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```dart title=""
/* AVL 트리 노드 클래스 */
class TreeNode {
  int val;         // 노드 값
  int height;      // 노드 높이
  TreeNode? left;  // 왼쪽 자식 노드
  TreeNode? right; // 오른쪽 자식 노드
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* AVL 트리 노드 구조체 */
struct TreeNode {
    val: i32,                               // 노드 값
    height: i32,                            // 노드 높이
    left: Option<Rc<RefCell<TreeNode>>>,    // 왼쪽 자식 노드
    right: Option<Rc<RefCell<TreeNode>>>,   // 오른쪽 자식 노드
}

impl TreeNode {
    /* 생성자 */
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
/* AVL 트리 노드 구조체 */
typedef struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

/* 생성자 */
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
/* AVL 트리 노드 클래스 */
class TreeNode(val _val: Int) {  // 노드 값
    var height: Int = 0          // 노드 높이
    var left: TreeNode? = null   // 왼쪽 자식 노드
    var right: TreeNode? = null  // 오른쪽 자식 노드
}
```

```ruby title=""
### AVL 트리 노드 클래스 ###
class TreeNode
  attr_accessor :val    # 노드 값
  attr_accessor :height # 노드 높이
  attr_accessor :left   # 왼쪽 자식 노드 참조
  attr_accessor :right  # 오른쪽 자식 노드 참조

  def initialize(val)
    @val = val
    @height = 0
  end
end
```
