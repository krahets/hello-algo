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
    int height;             // 노드 높이
    struct TreeNode *left;  // 왼쪽 자식 노드 포인터
    struct TreeNode *right; // 오른쪽 자식 노드 포인터
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
# 이진 트리 초기화
# 노드 초기화
n1 = TreeNode(val=1)
n2 = TreeNode(val=2)
n3 = TreeNode(val=3)
n4 = TreeNode(val=4)
n5 = TreeNode(val=5)
# 노드 사이의 참조(포인터) 연결
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```cpp title="binary_tree.cpp"
/* 이진 트리 초기화 */
// 노드 초기화
TreeNode* n1 = new TreeNode(1);
TreeNode* n2 = new TreeNode(2);
TreeNode* n3 = new TreeNode(3);
TreeNode* n4 = new TreeNode(4);
TreeNode* n5 = new TreeNode(5);
// 노드 사이의 참조(포인터) 연결
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```java title="binary_tree.java"
// 노드 초기화
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// 노드 사이의 참조(포인터) 연결
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```csharp title="binary_tree.cs"
/* 이진 트리 초기화 */
// 노드 초기화
TreeNode n1 = new(1);
TreeNode n2 = new(2);
TreeNode n3 = new(3);
TreeNode n4 = new(4);
TreeNode n5 = new(5);
// 노드 사이의 참조(포인터) 연결
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```go title="binary_tree.go"
/* 이진 트리 초기화 */
// 노드 초기화
n1 := NewTreeNode(1)
n2 := NewTreeNode(2)
n3 := NewTreeNode(3)
n4 := NewTreeNode(4)
n5 := NewTreeNode(5)
// 노드 사이의 참조(포인터) 연결
n1.Left = n2
n1.Right = n3
n2.Left = n4
n2.Right = n5
```

```swift title="binary_tree.swift"
// 노드 초기화
let n1 = TreeNode(x: 1)
let n2 = TreeNode(x: 2)
let n3 = TreeNode(x: 3)
let n4 = TreeNode(x: 4)
let n5 = TreeNode(x: 5)
// 노드 사이의 참조(포인터) 연결
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```javascript title="binary_tree.js"
/* 이진 트리 초기화 */
// 노드 초기화
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 노드 사이의 참조(포인터) 연결
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```typescript title="binary_tree.ts"
/* 이진 트리 초기화 */
// 노드 초기화
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 노드 사이의 참조(포인터) 연결
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```dart title="binary_tree.dart"
/* 이진 트리 초기화 */
// 노드 초기화
TreeNode n1 = new TreeNode(1);
TreeNode n2 = new TreeNode(2);
TreeNode n3 = new TreeNode(3);
TreeNode n4 = new TreeNode(4);
TreeNode n5 = new TreeNode(5);
// 노드 사이의 참조(포인터) 연결
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
```

```rust title="binary_tree.rs"
// 노드 초기화
let n1 = TreeNode::new(1);
let n2 = TreeNode::new(2);
let n3 = TreeNode::new(3);
let n4 = TreeNode::new(4);
let n5 = TreeNode::new(5);
// 노드 사이의 참조(포인터) 연결
n1.borrow_mut().left = Some(n2.clone());
n1.borrow_mut().right = Some(n3);
n2.borrow_mut().left = Some(n4);
n2.borrow_mut().right = Some(n5);
```

```c title="binary_tree.c"
/* 이진 트리 초기화 */
// 노드 초기화
TreeNode *n1 = newTreeNode(1);
TreeNode *n2 = newTreeNode(2);
TreeNode *n3 = newTreeNode(3);
TreeNode *n4 = newTreeNode(4);
TreeNode *n5 = newTreeNode(5);
// 노드 사이의 참조(포인터) 연결
n1->left = n2;
n1->right = n3;
n2->left = n4;
n2->right = n5;
```

```kotlin title="binary_tree.kt"
// 노드 초기화
val n1 = TreeNode(1)
val n2 = TreeNode(2)
val n3 = TreeNode(3)
val n4 = TreeNode(4)
val n5 = TreeNode(5)
// 노드 사이의 참조(포인터) 연결
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

```ruby title="binary_tree.rb"
# 이진 트리 초기화
# 노드 초기화
n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)
n5 = TreeNode.new(5)
# 노드 사이의 참조(포인터) 연결
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
```

<!-- [tutor]{init_binary_tree_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AC%EC%9D%B4%EC%9D%98%20%EC%B0%B8%EC%A1%B0%28%ED%8F%AC%EC%9D%B8%ED%84%B0%29%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_node} -->
```python title="binary_tree.py"
# 노드 삽입과 삭제
p = TreeNode(0)
# n1 -> n2 사이에 노드 P 삽입
n1.left = p
p.left = n2
# 노드 P 삭제
n1.left = n2
```

```cpp title="binary_tree.cpp"
/* 노드 삽입과 삭제 */
TreeNode* P = new TreeNode(0);
// n1 -> n2 사이에 노드 P 삽입
n1->left = P;
P->left = n2;
// 노드 P 삭제
n1->left = n2;
// 메모리 해제
delete P;
```

```java title="binary_tree.java"
TreeNode P = new TreeNode(0);
// n1 -> n2 사이에 노드 P 삽입
n1.left = P;
P.left = n2;
// 노드 P 삭제
n1.left = n2;
```

```csharp title="binary_tree.cs"
/* 노드 삽입과 삭제 */
TreeNode P = new(0);
// n1 -> n2 사이에 노드 P 삽입
n1.left = P;
P.left = n2;
// 노드 P 삭제
n1.left = n2;
```

```go title="binary_tree.go"
/* 노드 삽입과 삭제 */
// n1 -> n2 사이에 노드 P 삽입
p := NewTreeNode(0)
n1.Left = p
p.Left = n2
// 노드 P 삭제
n1.Left = n2
```

```swift title="binary_tree.swift"
let P = TreeNode(x: 0)
// n1 -> n2 사이에 노드 P 삽입
n1.left = P
P.left = n2
// 노드 P 삭제
n1.left = n2
```

```javascript title="binary_tree.js"
/* 노드 삽입과 삭제 */
let P = new TreeNode(0);
// n1 -> n2 사이에 노드 P 삽입
n1.left = P;
P.left = n2;
// 노드 P 삭제
n1.left = n2;
```

```typescript title="binary_tree.ts"
/* 노드 삽입과 삭제 */
const P = new TreeNode(0);
// n1 -> n2 사이에 노드 P 삽입
n1.left = P;
P.left = n2;
// 노드 P 삭제
n1.left = n2;
```

```dart title="binary_tree.dart"
/* 노드 삽입과 삭제 */
TreeNode P = new TreeNode(0);
// n1 -> n2 사이에 노드 P 삽입
n1.left = P;
P.left = n2;
// 노드 P 삭제
n1.left = n2;
```

```rust title="binary_tree.rs"
let p = TreeNode::new(0);
// n1 -> n2 사이에 노드 P 삽입
n1.borrow_mut().left = Some(p.clone());
p.borrow_mut().left = Some(n2.clone());
// 노드 p 삭제
n1.borrow_mut().left = Some(n2);
```

```c title="binary_tree.c"
/* 노드 삽입과 삭제 */
TreeNode *P = newTreeNode(0);
// n1 -> n2 사이에 노드 P 삽입
n1->left = P;
P->left = n2;
// 노드 P 삭제
n1->left = n2;
// 메모리 해제
free(P);
```

```kotlin title="binary_tree.kt"
val P = TreeNode(0)
// n1 -> n2 사이에 노드 P 삽입
n1.left = P
P.left = n2
// 노드 P 삭제
n1.left = n2
```

```ruby title="binary_tree.rb"
# 노드 삽입과 삭제
_p = TreeNode.new(0)
# n1 -> n2 사이에 노드 _p 삽입
n1.left = _p
_p.left = n2
# 노드 삭제
n1.left = n2
```

<!-- [tutor]{insert_remove_node_tutor} -->
https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AC%EC%9D%B4%EC%9D%98%20%EC%B0%B8%EC%A1%B0%28%ED%8F%AC%EC%9D%B8%ED%84%B0%29%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%BD%EC%9E%85%EA%B3%BC%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20p%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20n1%20-%3E%20n2%20%EC%82%AC%EC%9D%B4%EC%97%90%20%EB%85%B8%EB%93%9C%20P%20%EC%82%BD%EC%9E%85%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20P%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20n1.left%20%3D%20n2&cumulative=false&curInstr=37&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
