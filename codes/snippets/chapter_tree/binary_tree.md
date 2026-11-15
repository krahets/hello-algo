<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """二叉树节点类"""
    def __init__(self, val: int):
        self.val: int = val                # 节点值
        self.left: TreeNode | None = None  # 左子节点引用
        self.right: TreeNode | None = None # 右子节点引用
```

```cpp title=""
/* 二叉树节点结构体 */
struct TreeNode {
    int val;          // 节点值
    TreeNode *left;   // 左子节点指针
    TreeNode *right;  // 右子节点指针
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* 二叉树节点类 */
class TreeNode {
    int val;         // 节点值
    TreeNode left;   // 左子节点引用
    TreeNode right;  // 右子节点引用
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* 二叉树节点类 */
class TreeNode(int? x) {
    public int? val = x;    // 节点值
    public TreeNode? left;  // 左子节点引用
    public TreeNode? right; // 右子节点引用
}
```

```go title=""
/* 二叉树节点结构体 */
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
/* 构造方法 */
func NewTreeNode(v int) *TreeNode {
    return &TreeNode{
        Left:  nil, // 左子节点指针
        Right: nil, // 右子节点指针
        Val:   v,   // 节点值
    }
}
```

```swift title=""
/* 二叉树节点类 */
class TreeNode {
    var val: Int // 节点值
    var left: TreeNode? // 左子节点引用
    var right: TreeNode? // 右子节点引用

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* 二叉树节点类 */
class TreeNode {
    val; // 节点值
    left; // 左子节点指针
    right; // 右子节点指针
    constructor(val, left, right) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* 二叉树节点类 */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // 节点值
        this.left = left === undefined ? null : left; // 左子节点引用
        this.right = right === undefined ? null : right; // 右子节点引用
    }
}
```

```dart title=""
/* 二叉树节点类 */
class TreeNode {
  int val;         // 节点值
  TreeNode? left;  // 左子节点引用
  TreeNode? right; // 右子节点引用
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 二叉树节点结构体 */
struct TreeNode {
    val: i32,                               // 节点值
    left: Option<Rc<RefCell<TreeNode>>>,    // 左子节点引用
    right: Option<Rc<RefCell<TreeNode>>>,   // 右子节点引用
}

impl TreeNode {
    /* 构造方法 */
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
[file]{utils/tree_node.h}-[region]{tree_node}
```

```kotlin title=""
/* 二叉树节点类 */
class TreeNode(val _val: Int) {  // 节点值
    var left: TreeNode? = null   // 左子节点引用
    var right: TreeNode? = null  // 右子节点引用
}
```

```ruby title=""
### 二叉树节点类 ###
class TreeNode
  attr_accessor :val    # 节点值
  attr_accessor :left   # 左子节点引用
  attr_accessor :right  # 右子节点引用

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
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%A0%91%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E8%8A%82%E7%82%B9%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E6%9E%84%E5%BB%BA%E8%8A%82%E7%82%B9%E4%B9%8B%E9%97%B4%E7%9A%84%E5%BC%95%E7%94%A8%EF%BC%88%E6%8C%87%E9%92%88%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%A0%91%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E8%8A%82%E7%82%B9%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E6%9E%84%E5%BB%BA%E8%8A%82%E7%82%B9%E4%B9%8B%E9%97%B4%E7%9A%84%E5%BC%95%E7%94%A8%EF%BC%88%E6%8C%87%E9%92%88%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%B8%8E%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20%E5%9C%A8%20n1%20-%3E%20n2%20%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%20P%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%20P%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
