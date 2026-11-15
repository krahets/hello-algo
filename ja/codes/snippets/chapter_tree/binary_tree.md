<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """二分木のノードクラス"""
    def __init__(self, val: int):
        self.val: int = val                # ノードの値
        self.left: TreeNode | None = None  # 左の子への参照
        self.right: TreeNode | None = None # 右の子への参照
```

```cpp title=""
/* 二分木のノード構造体 */
struct TreeNode {
    int val;          // ノードの値
    TreeNode *left;   // 左の子へのポインタ
    TreeNode *right;  // 右の子へのポインタ
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* 二分木のノードクラス */
class TreeNode {
    int val;         // ノードの値
    TreeNode left;   // 左の子への参照
    TreeNode right;  // 右の子への参照
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* 二分木のノードクラス */
class TreeNode(int? x) {
    public int? val = x;    // ノードの値
    public TreeNode? left;  // 左の子への参照
    public TreeNode? right; // 右の子への参照
}
```

```go title=""
/* 二分木のノード構造体 */
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
/* コンストラクタ */
func NewTreeNode(v int) *TreeNode {
    return &TreeNode{
        Left:  nil, // 左の子へのポインタ
        Right: nil, // 右の子へのポインタ
        Val:   v,   // ノードの値
    }
}
```

```swift title=""
/* 二分木のノードクラス */
class TreeNode {
    var val: Int // ノードの値
    var left: TreeNode? // 左の子への参照
    var right: TreeNode? // 右の子への参照

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* 二分木のノードクラス */
class TreeNode {
    val; // ノードの値
    left; // 左の子へのポインタ
    right; // 右の子へのポインタ
    constructor(val, left, right) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* 二分木のノードクラス */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // ノードの値
        this.left = left === undefined ? null : left; // 左の子への参照
        this.right = right === undefined ? null : right; // 右の子への参照
    }
}
```

```dart title=""
/* 二分木のノードクラス */
class TreeNode {
  int val;         // ノードの値
  TreeNode? left;  // 左の子への参照
  TreeNode? right; // 右の子への参照
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 二分木のノード構造体 */
struct TreeNode {
    val: i32,                               // ノードの値
    left: Option<Rc<RefCell<TreeNode>>>,    // 左の子への参照
    right: Option<Rc<RefCell<TreeNode>>>,   // 右の子への参照
}

impl TreeNode {
    /* コンストラクタ */
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
/* 二分木のノード構造体 */
typedef struct TreeNode {
    int val;                // ノードの値
    int height;             // ノードの高さ
    struct TreeNode *left;  // 左の子へのポインタ
    struct TreeNode *right; // 右の子へのポインタ
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
/* 二分木のノードクラス */
class TreeNode(val _val: Int) {  // ノードの値
    var left: TreeNode? = null   // 左の子への参照
    var right: TreeNode? = null  // 右の子への参照
}
```

```ruby title=""
### 二分木のノードクラス ###
class TreeNode
  attr_accessor :val    # ノードの値
  attr_accessor :left   # 左の子への参照
  attr_accessor :right  # 右の子への参照

  def initialize(val)
    @val = val
  end
end
```

<!-- [snippet]{init_binary_tree} -->
```python title="binary_tree.py"
# 二分木を初期化
# ノードを初期化
n1 = TreeNode(val=1)
n2 = TreeNode(val=2)
n3 = TreeNode(val=3)
n4 = TreeNode(val=4)
n5 = TreeNode(val=5)
# ノード間の参照（ポインタ）をつなぐ
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```cpp title="binary_tree.cpp"
/* 二分木を初期化 */
// ノードを初期化
TreeNode* n1 = new TreeNode(1);
TreeNode* n2 = new TreeNode(2);
TreeNode* n3 = new TreeNode(3);
TreeNode* n4 = new TreeNode(4);
TreeNode* n5 = new TreeNode(5);
// ノード間の参照（ポインタ）をつなぐ
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```java title="binary_tree.java"
// ノードを初期化
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```csharp title="binary_tree.cs"
/* 二分木を初期化 */
// ノードを初期化
TreeNode n1 = new(1);
TreeNode n2 = new(2);
TreeNode n3 = new(3);
TreeNode n4 = new(4);
TreeNode n5 = new(5);
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```go title="binary_tree.go"
/* 二分木を初期化 */
// ノードを初期化
n1 := NewTreeNode(1)
n2 := NewTreeNode(2)
n3 := NewTreeNode(3)
n4 := NewTreeNode(4)
n5 := NewTreeNode(5)
// ノード間の参照（ポインタ）をつなぐ
n1.Left = n2
n1.Right = n3
n2.Left = n4
n2.Right = n5
```

```swift title="binary_tree.swift"
// ノードを初期化
let n1 = TreeNode(x: 1)
let n2 = TreeNode(x: 2)
let n3 = TreeNode(x: 3)
let n4 = TreeNode(x: 4)
let n5 = TreeNode(x: 5)
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```javascript title="binary_tree.js"
/* 二分木を初期化 */
// ノードを初期化
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```typescript title="binary_tree.ts"
/* 二分木を初期化 */
// ノードを初期化
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```dart title="binary_tree.dart"
/* 二分木を初期化 */
// ノードを初期化
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```rust title="binary_tree.rs"
// ノードを初期化
let n1 = TreeNode::new(1);
let n2 = TreeNode::new(2);
let n3 = TreeNode::new(3);
let n4 = TreeNode::new(4);
let n5 = TreeNode::new(5);
// ノード間の参照（ポインタ）をつなぐ
n1.borrow_mut().left = Some(n2.clone());
n1.borrow_mut().right = Some(n3);
n2.borrow_mut().left = Some(n4);
n2.borrow_mut().right = Some(n5);
```

```c title="binary_tree.c"
/* 二分木を初期化 */
// ノードを初期化
TreeNode *n1 = newTreeNode(1);
TreeNode *n2 = newTreeNode(2);
TreeNode *n3 = newTreeNode(3);
TreeNode *n4 = newTreeNode(4);
TreeNode *n5 = newTreeNode(5);
// ノード間の参照（ポインタ）をつなぐ
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```kotlin title="binary_tree.kt"
// ノードを初期化
val n1 = TreeNode(1)
val n2 = TreeNode(2)
val n3 = TreeNode(3)
val n4 = TreeNode(4)
val n5 = TreeNode(5)
// ノード間の参照（ポインタ）をつなぐ
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```ruby title="binary_tree.rb"
# 二分木を初期化
# ノードを初期化
n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)
n5 = TreeNode.new(5)
# ノード間の参照（ポインタ）をつなぐ
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

<!-- [tutor]{init_binary_tree_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n1%20%3D%20TreeNode(val%3D1)%0A%20%20%20%20n2%20%3D%20TreeNode(val%3D2)%0A%20%20%20%20n3%20%3D%20TreeNode(val%3D3)%0A%20%20%20%20n4%20%3D%20TreeNode(val%3D4)%0A%20%20%20%20n5%20%3D%20TreeNode(val%3D5)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%EF%BC%88%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%EF%BC%89%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_node} -->
```python title="binary_tree.py"
# ノードの挿入と削除
p = TreeNode(0)
# n1 -> n2 の間にノード P を挿入
n1.left = p
p.left = n2
# ノード P を削除
n1.left = n2
```

```cpp title="binary_tree.cpp"
/* ノードの挿入と削除 */
TreeNode* P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1->left = P;
P->left = n2;
// ノード P を削除
n1->left = n2;
// メモリを解放
delete P;
```

```java title="binary_tree.java"
TreeNode P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1.left = P;
P.left = n2;
// ノード P を削除
n1.left = n2;
```

```csharp title="binary_tree.cs"
/* ノードの挿入と削除 */
TreeNode P = new(0);
// n1 -> n2 の間にノード P を挿入
n1.left = P;
P.left = n2;
// ノード P を削除
n1.left = n2;
```

```go title="binary_tree.go"
/* ノードの挿入と削除 */
// n1 -> n2 の間にノード P を挿入
p := NewTreeNode(0)
n1.Left = p
p.Left = n2
// ノード P を削除
n1.Left = n2
```

```swift title="binary_tree.swift"
let P = TreeNode(x: 0)
// n1 -> n2 の間にノード P を挿入
n1.left = P
P.left = n2
// ノード P を削除
n1.left = n2
```

```javascript title="binary_tree.js"
/* ノードの挿入と削除 */
let P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1.left = P;
P.left = n2;
// ノード P を削除
n1.left = n2;
```

```typescript title="binary_tree.ts"
/* ノードの挿入と削除 */
const P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1.left = P;
P.left = n2;
// ノード P を削除
n1.left = n2;
```

```dart title="binary_tree.dart"
/* ノードの挿入と削除 */
TreeNode P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1.left = P;
P.left = n2;
// ノード P を削除
n1.left = n2;
```

```rust title="binary_tree.rs"
let p = TreeNode::new(0);
// n1 -> n2 の間にノード P を挿入
n1.borrow_mut().left = Some(p.clone());
p.borrow_mut().left = Some(n2.clone());
// ノード p を削除
n1.borrow_mut().left = Some(n2);
```

```c title="binary_tree.c"
/* ノードの挿入と削除 */
TreeNode *P = newTreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1->left = P;
P->left = n2;
// ノード P を削除
n1->left = n2;
// メモリを解放
free(P);
```

```kotlin title="binary_tree.kt"
val P = TreeNode(0)
// n1 -> n2 の間にノード P を挿入
n1.left = P
P.left = n2
// ノード P を削除
n1.left = n2
```

```ruby title="binary_tree.rb"
# ノードの挿入と削除
_p = TreeNode.new(0)
# n1 -> n2 の間にノード _p を挿入
n1.left = _p
_p.left = n2
# ノードを削除
n1.left = n2
```

<!-- [tutor]{insert_remove_node_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n1%20%3D%20TreeNode(val%3D1)%0A%20%20%20%20n2%20%3D%20TreeNode(val%3D2)%0A%20%20%20%20n3%20%3D%20TreeNode(val%3D3)%0A%20%20%20%20n4%20%3D%20TreeNode(val%3D4)%0A%20%20%20%20n5%20%3D%20TreeNode(val%3D5)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%EF%BC%88%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%EF%BC%89%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E6%8C%BF%E5%85%A5%E3%81%A8%E5%89%8A%E9%99%A4%0A%20%20%20%20p%20%3D%20TreeNode(0)%0A%20%20%20%20%23%20n1%20-%3E%20n2%20%E3%81%AE%E9%96%93%E3%81%AB%E3%83%8E%E3%83%BC%E3%83%89%20P%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20P%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
