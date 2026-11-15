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
    int height;             // Node height
    struct TreeNode *left;  // Left child pointer
    struct TreeNode *right; // Right child pointer
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
# Initialize a binary tree
# Initialize nodes
n1 = TreeNode(val=1)
n2 = TreeNode(val=2)
n3 = TreeNode(val=3)
n4 = TreeNode(val=4)
n5 = TreeNode(val=5)
# Connect nodes with references (pointers)
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```cpp title="binary_tree.cpp"
/* Initialize a binary tree */
// Initialize nodes
TreeNode* n1 = new TreeNode(1);
TreeNode* n2 = new TreeNode(2);
TreeNode* n3 = new TreeNode(3);
TreeNode* n4 = new TreeNode(4);
TreeNode* n5 = new TreeNode(5);
// Connect nodes with references (pointers)
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```java title="binary_tree.java"
// Initialize nodes
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// Connect nodes with references (pointers)
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```csharp title="binary_tree.cs"
/* Initialize a binary tree */
// Initialize nodes
TreeNode n1 = new(1);
TreeNode n2 = new(2);
TreeNode n3 = new(3);
TreeNode n4 = new(4);
TreeNode n5 = new(5);
// Connect nodes with references (pointers)
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```go title="binary_tree.go"
/* Initialize a binary tree */
// Initialize nodes
n1 := NewTreeNode(1)
n2 := NewTreeNode(2)
n3 := NewTreeNode(3)
n4 := NewTreeNode(4)
n5 := NewTreeNode(5)
// Connect nodes with references (pointers)
n1.Left = n2
n1.Right = n3
n2.Left = n4
n2.Right = n5
```

```swift title="binary_tree.swift"
// Initialize nodes
let n1 = TreeNode(x: 1)
let n2 = TreeNode(x: 2)
let n3 = TreeNode(x: 3)
let n4 = TreeNode(x: 4)
let n5 = TreeNode(x: 5)
// Connect nodes with references (pointers)
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```javascript title="binary_tree.js"
/* Initialize a binary tree */
// Initialize nodes
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// Connect nodes with references (pointers)
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```typescript title="binary_tree.ts"
/* Initialize a binary tree */
// Initialize nodes
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// Connect nodes with references (pointers)
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```dart title="binary_tree.dart"
/* Initialize a binary tree */
// Initialize nodes
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// Connect nodes with references (pointers)
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```rust title="binary_tree.rs"
// Initialize nodes
let n1 = TreeNode::new(1);
let n2 = TreeNode::new(2);
let n3 = TreeNode::new(3);
let n4 = TreeNode::new(4);
let n5 = TreeNode::new(5);
// Connect nodes with references (pointers)
n1.borrow_mut().left = Some(n2.clone());
n1.borrow_mut().right = Some(n3);
n2.borrow_mut().left = Some(n4);
n2.borrow_mut().right = Some(n5);
```

```c title="binary_tree.c"
/* Initialize a binary tree */
// Initialize nodes
TreeNode *n1 = newTreeNode(1);
TreeNode *n2 = newTreeNode(2);
TreeNode *n3 = newTreeNode(3);
TreeNode *n4 = newTreeNode(4);
TreeNode *n5 = newTreeNode(5);
// Connect nodes with references (pointers)
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```kotlin title="binary_tree.kt"
// Initialize nodes
val n1 = TreeNode(1)
val n2 = TreeNode(2)
val n3 = TreeNode(3)
val n4 = TreeNode(4)
val n5 = TreeNode(5)
// Connect nodes with references (pointers)
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```ruby title="binary_tree.rb"
# Initialize a binary tree
# Initialize nodes
n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)
n5 = TreeNode.new(5)
# Connect nodes with references (pointers)
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

<!-- [tutor]{init_binary_tree_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Left%20child%20reference%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Right%20child%20reference%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20binary%20tree%0A%20%20%20%20%23%20Initialize%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Connect%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_node} -->
```python title="binary_tree.py"
# Insert and delete a node
p = TreeNode(0)
# Insert node P between n1 and n2
n1.left = p
p.left = n2
# Delete node P
n1.left = n2
```

```cpp title="binary_tree.cpp"
/* Insert and delete a node */
TreeNode* P = new TreeNode(0);
// Insert node P between n1 and n2
n1->left = P;
P->left = n2;
// Delete node P
n1->left = n2;
// Free the memory
delete P;
```

```java title="binary_tree.java"
TreeNode P = new TreeNode(0);
// Insert node P between n1 and n2
n1.left = P;
P.left = n2;
// Delete node P
n1.left = n2;
```

```csharp title="binary_tree.cs"
/* Insert and delete a node */
TreeNode P = new(0);
// Insert node P between n1 and n2
n1.left = P;
P.left = n2;
// Delete node P
n1.left = n2;
```

```go title="binary_tree.go"
/* Insert and delete a node */
// Insert node P between n1 and n2
p := NewTreeNode(0)
n1.Left = p
p.Left = n2
// Delete node P
n1.Left = n2
```

```swift title="binary_tree.swift"
let P = TreeNode(x: 0)
// Insert node P between n1 and n2
n1.left = P
P.left = n2
// Delete node P
n1.left = n2
```

```javascript title="binary_tree.js"
/* Insert and delete a node */
let P = new TreeNode(0);
// Insert node P between n1 and n2
n1.left = P;
P.left = n2;
// Delete node P
n1.left = n2;
```

```typescript title="binary_tree.ts"
/* Insert and delete a node */
const P = new TreeNode(0);
// Insert node P between n1 and n2
n1.left = P;
P.left = n2;
// Delete node P
n1.left = n2;
```

```dart title="binary_tree.dart"
/* Insert and delete a node */
TreeNode P = new TreeNode(0);
// Insert node P between n1 and n2
n1.left = P;
P.left = n2;
// Delete node P
n1.left = n2;
```

```rust title="binary_tree.rs"
let p = TreeNode::new(0);
// Insert node P between n1 and n2
n1.borrow_mut().left = Some(p.clone());
p.borrow_mut().left = Some(n2.clone());
// Delete node p
n1.borrow_mut().left = Some(n2);
```

```c title="binary_tree.c"
/* Insert and delete a node */
TreeNode *P = newTreeNode(0);
// Insert node P between n1 and n2
n1->left = P;
P->left = n2;
// Delete node P
n1->left = n2;
// Free the memory
free(P);
```

```kotlin title="binary_tree.kt"
val P = TreeNode(0)
// Insert node P between n1 and n2
n1.left = P
P.left = n2
// Delete node P
n1.left = n2
```

```ruby title="binary_tree.rb"
# Insert and delete a node
_p = TreeNode.new(0)
# Insert node _p between n1 and n2
n1.left = _p
_p.left = n2
# Delete the node
n1.left = n2
```

<!-- [tutor]{insert_remove_node_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Left%20child%20reference%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Right%20child%20reference%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20binary%20tree%0A%20%20%20%20%23%20Initialize%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Connect%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20Insert%20and%20delete%20a%20node%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20Insert%20node%20P%20between%20n1%20and%20n2%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20Delete%20node%20P%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
