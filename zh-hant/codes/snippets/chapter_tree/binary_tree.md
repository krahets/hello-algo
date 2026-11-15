<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """二元樹節點類別"""
    def __init__(self, val: int):
        self.val: int = val                # 節點值
        self.left: TreeNode | None = None  # 左子節點引用
        self.right: TreeNode | None = None # 右子節點引用
```

```cpp title=""
/* 二元樹節點結構體 */
struct TreeNode {
    int val;          // 節點值
    TreeNode *left;   // 左子節點指標
    TreeNode *right;  // 右子節點指標
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* 二元樹節點類別 */
class TreeNode {
    int val;         // 節點值
    TreeNode left;   // 左子節點引用
    TreeNode right;  // 右子節點引用
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* 二元樹節點類別 */
class TreeNode(int? x) {
    public int? val = x;    // 節點值
    public TreeNode? left;  // 左子節點引用
    public TreeNode? right; // 右子節點引用
}
```

```go title=""
/* 二元樹節點結構體 */
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
/* 建構子 */
func NewTreeNode(v int) *TreeNode {
    return &TreeNode{
        Left:  nil, // 左子節點指標
        Right: nil, // 右子節點指標
        Val:   v,   // 節點值
    }
}
```

```swift title=""
/* 二元樹節點類別 */
class TreeNode {
    var val: Int // 節點值
    var left: TreeNode? // 左子節點引用
    var right: TreeNode? // 右子節點引用

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* 二元樹節點類別 */
class TreeNode {
    val; // 節點值
    left; // 左子節點指標
    right; // 右子節點指標
    constructor(val, left, right) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* 二元樹節點類別 */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // 節點值
        this.left = left === undefined ? null : left; // 左子節點引用
        this.right = right === undefined ? null : right; // 右子節點引用
    }
}
```

```dart title=""
/* 二元樹節點類別 */
class TreeNode {
  int val;         // 節點值
  TreeNode? left;  // 左子節點引用
  TreeNode? right; // 右子節點引用
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 二元樹節點結構體 */
struct TreeNode {
    val: i32,                               // 節點值
    left: Option<Rc<RefCell<TreeNode>>>,    // 左子節點引用
    right: Option<Rc<RefCell<TreeNode>>>,   // 右子節點引用
}

impl TreeNode {
    /* 建構子 */
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
/* 二元樹節點結構體 */
typedef struct TreeNode {
    int val;                // 節點值
    int height;             // 節點高度
    struct TreeNode *left;  // 左子節點指標
    struct TreeNode *right; // 右子節點指標
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
/* 二元樹節點類別 */
class TreeNode(val _val: Int) {  // 節點值
    var left: TreeNode? = null   // 左子節點引用
    var right: TreeNode? = null  // 右子節點引用
}
```

```ruby title=""
### 二元樹節點類別 ###
class TreeNode
  attr_accessor :val    # 節點值
  attr_accessor :left   # 左子節點引用
  attr_accessor :right  # 右子節點引用

  def initialize(val)
    @val = val
  end
end
```

<!-- [snippet]{init_binary_tree} -->
```python title="binary_tree.py"
# 初始化二元樹
# 初始化節點
n1 = TreeNode(val=1)
n2 = TreeNode(val=2)
n3 = TreeNode(val=3)
n4 = TreeNode(val=4)
n5 = TreeNode(val=5)
# 構建節點之間的引用（指標）
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```cpp title="binary_tree.cpp"
/* 初始化二元樹 */
// 初始化節點
TreeNode* n1 = new TreeNode(1);
TreeNode* n2 = new TreeNode(2);
TreeNode* n3 = new TreeNode(3);
TreeNode* n4 = new TreeNode(4);
TreeNode* n5 = new TreeNode(5);
// 構建節點之間的引用（指標）
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```java title="binary_tree.java"
// 初始化節點
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// 構建節點之間的引用（指標）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```csharp title="binary_tree.cs"
/* 初始化二元樹 */
// 初始化節點
TreeNode n1 = new(1);
TreeNode n2 = new(2);
TreeNode n3 = new(3);
TreeNode n4 = new(4);
TreeNode n5 = new(5);
// 構建節點之間的引用（指標）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```go title="binary_tree.go"
/* 初始化二元樹 */
// 初始化節點
n1 := NewTreeNode(1)
n2 := NewTreeNode(2)
n3 := NewTreeNode(3)
n4 := NewTreeNode(4)
n5 := NewTreeNode(5)
// 構建節點之間的引用（指標）
n1.Left = n2
n1.Right = n3
n2.Left = n4
n2.Right = n5
```

```swift title="binary_tree.swift"
// 初始化節點
let n1 = TreeNode(x: 1)
let n2 = TreeNode(x: 2)
let n3 = TreeNode(x: 3)
let n4 = TreeNode(x: 4)
let n5 = TreeNode(x: 5)
// 構建節點之間的引用（指標）
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```javascript title="binary_tree.js"
/* 初始化二元樹 */
// 初始化節點
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 構建節點之間的引用（指標）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```typescript title="binary_tree.ts"
/* 初始化二元樹 */
// 初始化節點
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 構建節點之間的引用（指標）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```dart title="binary_tree.dart"
/* 初始化二元樹 */
// 初始化節點
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// 構建節點之間的引用（指標）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```rust title="binary_tree.rs"
// 初始化節點
let n1 = TreeNode::new(1);
let n2 = TreeNode::new(2);
let n3 = TreeNode::new(3);
let n4 = TreeNode::new(4);
let n5 = TreeNode::new(5);
// 構建節點之間的引用（指標）
n1.borrow_mut().left = Some(n2.clone());
n1.borrow_mut().right = Some(n3);
n2.borrow_mut().left = Some(n4);
n2.borrow_mut().right = Some(n5);
```

```c title="binary_tree.c"
/* 初始化二元樹 */
// 初始化節點
TreeNode *n1 = newTreeNode(1);
TreeNode *n2 = newTreeNode(2);
TreeNode *n3 = newTreeNode(3);
TreeNode *n4 = newTreeNode(4);
TreeNode *n5 = newTreeNode(5);
// 構建節點之間的引用（指標）
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```kotlin title="binary_tree.kt"
// 初始化節點
val n1 = TreeNode(1)
val n2 = TreeNode(2)
val n3 = TreeNode(3)
val n4 = TreeNode(4)
val n5 = TreeNode(5)
// 構建節點之間的引用（指標）
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```ruby title="binary_tree.rb"
# 初始化二元樹
# 初始化節點
n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)
n5 = TreeNode.new(5)
# 構建節點之間的引用（指標）
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

<!-- [tutor]{init_binary_tree_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%AF%80%E9%BB%9E%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%BC%95%E7%94%A8%EF%BC%88%E6%8C%87%E6%A8%99%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_node} -->
```python title="binary_tree.py"
# 插入與刪除節點
p = TreeNode(0)
# 在 n1 -> n2 中間插入節點 P
n1.left = p
p.left = n2
# 刪除節點 P
n1.left = n2
```

```cpp title="binary_tree.cpp"
/* 插入與刪除節點 */
TreeNode* P = new TreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1->left = P;
P->left = n2;
// 刪除節點 P
n1->left = n2;
// 釋放記憶體
delete P;
```

```java title="binary_tree.java"
TreeNode P = new TreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1.left = P;
P.left = n2;
// 刪除節點 P
n1.left = n2;
```

```csharp title="binary_tree.cs"
/* 插入與刪除節點 */
TreeNode P = new(0);
// 在 n1 -> n2 中間插入節點 P
n1.left = P;
P.left = n2;
// 刪除節點 P
n1.left = n2;
```

```go title="binary_tree.go"
/* 插入與刪除節點 */
// 在 n1 -> n2 中間插入節點 P
p := NewTreeNode(0)
n1.Left = p
p.Left = n2
// 刪除節點 P
n1.Left = n2
```

```swift title="binary_tree.swift"
let P = TreeNode(x: 0)
// 在 n1 -> n2 中間插入節點 P
n1.left = P
P.left = n2
// 刪除節點 P
n1.left = n2
```

```javascript title="binary_tree.js"
/* 插入與刪除節點 */
let P = new TreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1.left = P;
P.left = n2;
// 刪除節點 P
n1.left = n2;
```

```typescript title="binary_tree.ts"
/* 插入與刪除節點 */
const P = new TreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1.left = P;
P.left = n2;
// 刪除節點 P
n1.left = n2;
```

```dart title="binary_tree.dart"
/* 插入與刪除節點 */
TreeNode P = new TreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1.left = P;
P.left = n2;
// 刪除節點 P
n1.left = n2;
```

```rust title="binary_tree.rs"
let p = TreeNode::new(0);
// 在 n1 -> n2 中間插入節點 P
n1.borrow_mut().left = Some(p.clone());
p.borrow_mut().left = Some(n2.clone());
// 刪除節點 p
n1.borrow_mut().left = Some(n2);
```

```c title="binary_tree.c"
/* 插入與刪除節點 */
TreeNode *P = newTreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1->left = P;
P->left = n2;
// 刪除節點 P
n1->left = n2;
// 釋放記憶體
free(P);
```

```kotlin title="binary_tree.kt"
val P = TreeNode(0)
// 在 n1 -> n2 中間插入節點 P
n1.left = P
P.left = n2
// 刪除節點 P
n1.left = n2
```

```ruby title="binary_tree.rb"
# 插入與刪除節點
_p = TreeNode.new(0)
# 在 n1 -> n2 中間插入節點 _p
n1.left = _p
_p.left = n2
# 刪除節點
n1.left = n2
```

<!-- [tutor]{insert_remove_node_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%AF%80%E9%BB%9E%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%BC%95%E7%94%A8%EF%BC%88%E6%8C%87%E6%A8%99%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%88%87%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20%E5%9C%A8%20n1%20-%3E%20n2%20%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%20P%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20P%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
