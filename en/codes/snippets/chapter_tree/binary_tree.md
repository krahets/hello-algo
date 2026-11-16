<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """Binary tree node class"""
    def __init__(self, val: int):
        self.val: int = val                # Node value
        self.left: TreeNode | None = None  # Left child reference
        self.right: TreeNode | None = None # Right child reference
```

```cpp title=""
/* Binary tree node struct */
struct TreeNode {
    int val;          // Node value
    TreeNode *left;   // Left child pointer
    TreeNode *right;  // Right child pointer
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* Binary tree node class */
class TreeNode {
    int val;         // Node value
    TreeNode left;   // Left child reference
    TreeNode right;  // Right child reference
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* Binary tree node class */
class TreeNode(int? x) {
    public int? val = x;    // Node value
    public TreeNode? left;  // Left child reference
    public TreeNode? right; // Right child reference
}
```

```go title=""
/* Binary tree node struct */
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
/* Constructor */
func NewTreeNode(v int) *TreeNode {
    return &TreeNode{
        Left:  nil, // Left child pointer
        Right: nil, // Right child pointer
        Val:   v,   // Node value
    }
}
```

```swift title=""
/* Binary tree node class */
class TreeNode {
    var val: Int // Node value
    var left: TreeNode? // Left child reference
    var right: TreeNode? // Right child reference

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* Binary tree node class */
class TreeNode {
    val; // Node value
    left; // Left child pointer
    right; // Right child pointer
    constructor(val, left, right) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* Binary tree node class */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // Node value
        this.left = left === undefined ? null : left; // Left child reference
        this.right = right === undefined ? null : right; // Right child reference
    }
}
```

```dart title=""
/* Binary tree node class */
class TreeNode {
  int val;         // Node value
  TreeNode? left;  // Left child reference
  TreeNode? right; // Right child reference
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* Binary tree node struct */
struct TreeNode {
    val: i32,                               // Node value
    left: Option<Rc<RefCell<TreeNode>>>,    // Left child reference
    right: Option<Rc<RefCell<TreeNode>>>,   // Right child reference
}

impl TreeNode {
    /* Constructor */
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
/* Binary tree node struct */
typedef struct TreeNode {
    int val;                // Node value
    struct TreeNode *left;  // Left child pointer
    struct TreeNode *right; // Right child pointer
} TreeNode;

/* Constructor */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->left = NULL;
    node->right = NULL;
    return node;
}
```

```kotlin title=""
/* Binary tree node class */
class TreeNode(val _val: Int) {  // Node value
    var left: TreeNode? = null   // Left child reference
    var right: TreeNode? = null  // Right child reference
}
```

```ruby title=""
### Binary tree node class ###
class TreeNode
  attr_accessor :val    # Node value
  attr_accessor :left   # Left child reference
  attr_accessor :right  # Right child reference

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
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Left%20child%20reference%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Right%20child%20reference%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20binary%20tree%0A%20%20%20%20%23%20Initialize%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Connect%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Left%20child%20reference%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Right%20child%20reference%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20binary%20tree%0A%20%20%20%20%23%20Initialize%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Connect%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20Insert%20and%20delete%20a%20node%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20Insert%20node%20P%20between%20n1%20and%20n2%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20Delete%20node%20P%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
