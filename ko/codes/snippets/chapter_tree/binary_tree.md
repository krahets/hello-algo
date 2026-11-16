<!-- [snippet]{tree_node_class} -->
```python title=""
class TreeNode:
    """이진 트리 노드 클래스"""
    def __init__(self, val: int):
        self.val: int = val                # 노드 값
        self.left: TreeNode | None = None  # 왼쪽 자식 노드 참조
        self.right: TreeNode | None = None # 오른쪽 자식 노드 참조
```

```cpp title=""
/* 이진 트리 노드 구조체 */
struct TreeNode {
    int val;          // 노드 값
    TreeNode *left;   // 왼쪽 자식 노드 포인터
    TreeNode *right;  // 오른쪽 자식 노드 포인터
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
```

```java title=""
/* 이진 트리 노드 클래스 */
class TreeNode {
    int val;         // 노드 값
    TreeNode left;   // 왼쪽 자식 노드 참조
    TreeNode right;  // 오른쪽 자식 노드 참조
    TreeNode(int x) { val = x; }
}
```

```csharp title=""
/* 이진 트리 노드 클래스 */
class TreeNode(int? x) {
    public int? val = x;    // 노드 값
    public TreeNode? left;  // 왼쪽 자식 노드 참조
    public TreeNode? right; // 오른쪽 자식 노드 참조
}
```

```go title=""
/* 이진 트리 노드 구조체 */
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}
/* 생성자 */
func NewTreeNode(v int) *TreeNode {
    return &TreeNode{
        Left:  nil, // 왼쪽 자식 노드 포인터
        Right: nil, // 오른쪽 자식 노드 포인터
        Val:   v,   // 노드 값
    }
}
```

```swift title=""
/* 이진 트리 노드 클래스 */
class TreeNode {
    var val: Int // 노드 값
    var left: TreeNode? // 왼쪽 자식 노드 참조
    var right: TreeNode? // 오른쪽 자식 노드 참조

    init(x: Int) {
        val = x
    }
}
```

```javascript title=""
/* 이진 트리 노드 클래스 */
class TreeNode {
    val; // 노드 값
    left; // 왼쪽 자식 노드 포인터
    right; // 오른쪽 자식 노드 포인터
    constructor(val, left, right) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}
```

```typescript title=""
/* 이진 트리 노드 클래스 */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // 노드 값
        this.left = left === undefined ? null : left; // 왼쪽 자식 노드 참조
        this.right = right === undefined ? null : right; // 오른쪽 자식 노드 참조
    }
}
```

```dart title=""
/* 이진 트리 노드 클래스 */
class TreeNode {
  int val;         // 노드 값
  TreeNode? left;  // 왼쪽 자식 노드 참조
  TreeNode? right; // 오른쪽 자식 노드 참조
  TreeNode(this.val, [this.left, this.right]);
}
```

```rust title=""
use std::rc::Rc;
use std::cell::RefCell;

/* 이진 트리 노드 구조체 */
struct TreeNode {
    val: i32,                               // 노드 값
    left: Option<Rc<RefCell<TreeNode>>>,    // 왼쪽 자식 노드 참조
    right: Option<Rc<RefCell<TreeNode>>>,   // 오른쪽 자식 노드 참조
}

impl TreeNode {
    /* 생성자 */
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
/* 이진 트리 노드 구조체 */
typedef struct TreeNode {
    int val;                // 노드 값
    struct TreeNode *left;  // 왼쪽 자식 노드 포인터
    struct TreeNode *right; // 오른쪽 자식 노드 포인터
} TreeNode;

/* 생성자 */
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
/* 이진 트리 노드 클래스 */
class TreeNode(val _val: Int) {  // 노드 값
    var left: TreeNode? = null   // 왼쪽 자식 노드 참조
    var right: TreeNode? = null  // 오른쪽 자식 노드 참조
}
```

```ruby title=""
### 이진 트리 노드 클래스 ###
class TreeNode
  attr_accessor :val    # 노드 값
  attr_accessor :left   # 왼쪽 자식 노드 참조
  attr_accessor :right  # 오른쪽 자식 노드 참조

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
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AC%EC%9D%B4%EC%9D%98%20%EC%B0%B8%EC%A1%B0%28%ED%8F%AC%EC%9D%B8%ED%84%B0%29%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AC%EC%9D%B4%EC%9D%98%20%EC%B0%B8%EC%A1%B0%28%ED%8F%AC%EC%9D%B8%ED%84%B0%29%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%BD%EC%9E%85%EA%B3%BC%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20n1%20-%3E%20n2%20%EC%82%AC%EC%9D%B4%EC%97%90%20%EB%85%B8%EB%93%9C%20P%20%EC%82%BD%EC%9E%85%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20P%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
