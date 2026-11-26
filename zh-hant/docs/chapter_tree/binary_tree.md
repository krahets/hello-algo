---
comments: true
---

# 7.1 &nbsp; 二元樹

<u>二元樹（binary tree）</u>是一種非線性資料結構，用來表示「祖先」與「後代」之間的衍生關係，體現了將問題「一分為二」的分治想法。與鏈結串列相似，二元樹的基本單位是節點，每個節點包含節點值，以及左右子節點的參照。

=== "Python"

    ```python title=""
    class TreeNode:
        """二元樹節點類別"""
        def __init__(self, val: int):
            self.val: int = val                # 節點值
            self.left: TreeNode | None = None  # 左子節點的參照
            self.right: TreeNode | None = None # 右子節點的參照
    ```

=== "C++"

    ```cpp title=""
    /* 二元樹節點結構體 */
    struct TreeNode {
        int val;          // 節點值
        TreeNode *left;   // 左子節點指標
        TreeNode *right;  // 右子節點指標
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    };
    ```

=== "Java"

    ```java title=""
    /* 二元樹節點類別 */
    class TreeNode {
        int val;         // 節點值
        TreeNode left;   // 左子節點的參照
        TreeNode right;  // 右子節點的參照
        TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* 二元樹節點類別 */
    class TreeNode(int? x) {
        public int? val = x;    // 節點值
        public TreeNode? left;  // 左子節點的參照
        public TreeNode? right; // 右子節點的參照
    }
    ```

=== "Go"

    ```go title=""
    /* 二元樹節點結構體 */
    type TreeNode struct {
        Val   int
        Left  *TreeNode
        Right *TreeNode
    }
    /* 建構方法 */
    func NewTreeNode(v int) *TreeNode {
        return &TreeNode{
            Left:  nil, // 左子節點指標
            Right: nil, // 右子節點指標
            Val:   v,   // 節點值
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* 二元樹節點類別 */
    class TreeNode {
        var val: Int // 節點值
        var left: TreeNode? // 左子節點的參照
        var right: TreeNode? // 右子節點的參照

        init(x: Int) {
            val = x
        }
    }
    ```

=== "JS"

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

=== "TS"

    ```typescript title=""
    /* 二元樹節點類別 */
    class TreeNode {
        val: number;
        left: TreeNode | null;
        right: TreeNode | null;

        constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
            this.val = val === undefined ? 0 : val; // 節點值
            this.left = left === undefined ? null : left; // 左子節點的參照
            this.right = right === undefined ? null : right; // 右子節點的參照
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* 二元樹節點類別 */
    class TreeNode {
      int val;         // 節點值
      TreeNode? left;  // 左子節點的參照
      TreeNode? right; // 右子節點的參照
      TreeNode(this.val, [this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* 二元樹節點結構體 */
    struct TreeNode {
        val: i32,                               // 節點值
        left: Option<Rc<RefCell<TreeNode>>>,    // 左子節點的參照
        right: Option<Rc<RefCell<TreeNode>>>,   // 右子節點的參照
    }

    impl TreeNode {
        /* 建構方法 */
        fn new(val: i32) -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(Self {
                val,
                left: None,
                right: None
            }))
        }
    }
    ```

=== "C"

    ```c title=""
    /* 二元樹節點結構體 */
    typedef struct TreeNode {
        int val;                // 節點值
        struct TreeNode *left;  // 左子節點指標
        struct TreeNode *right; // 右子節點指標
    } TreeNode;

    /* 建構函式 */
    TreeNode *newTreeNode(int val) {
        TreeNode *node;

        node = (TreeNode *)malloc(sizeof(TreeNode));
        node->val = val;
        node->left = NULL;
        node->right = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 二元樹節點類別 */
    class TreeNode(val _val: Int) {  // 節點值
        var left: TreeNode? = null   // 左子節點的參照
        var right: TreeNode? = null  // 右子節點的參照
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### 二元樹節點類別 ###
    class TreeNode
      attr_accessor :val    # 節點值
      attr_accessor :left   # 左子節點的參照
      attr_accessor :right  # 右子節點的參照

      def initialize(val)
        @val = val
      end
    end
    ```

每個節點都有兩個參照（指標），分別指向<u>左子節點（left-child node）</u>與<u>右子節點（right-child node）</u>，而該節點就是這兩個子節點的<u>父節點（parent node）</u>。給定二元樹中的一個節點，由它的左子節點及該子節點所有後代形成的樹稱為<u>左子樹（left subtree）</u>，<u>右子樹（right subtree）</u>的定義也相同。

**在二元樹中，除了葉節點，其餘節點都有子節點與非空的子樹**。如圖 7-1 所示，以節點 2 為父節點，它的左右子節點分別是節點 4 和節點 5；左子樹是由節點 4 及其所有後代形成的樹，右子樹則是由節點 5 及其所有後代形成的樹。

![父節點、子節點與子樹](binary_tree.assets/binary_tree_definition.svg){ class="animation-figure" }

<p align="center"> 圖 7-1 &nbsp; 父節點、子節點與子樹 </p>

## 7.1.1 &nbsp; 二元樹的常用術語

圖 7-2 說明二元樹的常用術語。

- <u>根節點（root node）</u>：位於二元樹最上層，沒有父節點。
- <u>葉節點（leaf node）</u>：沒有子節點，兩個指標都指向 `None`。
- <u>邊（edge）</u>：連接兩個節點的線段，代表節點之間的參照（指標）。
- 節點所在的<u>層（level）</u>：從上往下依序編號，根節點位於第 1 層。
- 節點的<u>分支度（degree）</u>：該節點的子節點數。在二元樹中，分支度可能是 0、1 或 2。
- 二元樹的<u>高度（height）</u>：從根節點到距離最遠的葉節點所經過的邊數。
- 節點的<u>深度（depth）</u>：從根節點到該節點所經過的邊數。
- 節點的<u>高度（height）</u>：從距離該節點最遠的葉節點到該節點所經過的邊數。

![二元樹的常用術語](binary_tree.assets/binary_tree_terminology.svg){ class="animation-figure" }

<p align="center"> 圖 7-2 &nbsp; 二元樹的常用術語 </p>

!!! tip

    本書通常用「經過的邊數」定義高度與深度，有些題目或教材則用「經過的節點數」來定義。若以節點數計算，高度與深度都要加 1。

## 7.1.2 &nbsp; 二元樹的基本操作

### 1. &nbsp; 初始化二元樹

和鏈結串列相同，先初始化節點，再建立參照（指標）。

=== "Python"

    ```python title="binary_tree.py"
    # 初始化二元樹
    # 初始化節點
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # 建立節點之間的參照（指標）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "C++"

    ```cpp title="binary_tree.cpp"
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // 建立節點之間的參照（指標）
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    ```

=== "Java"

    ```java title="binary_tree.java"
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode n1 = new TreeNode(1);
    TreeNode n2 = new TreeNode(2);
    TreeNode n3 = new TreeNode(3);
    TreeNode n4 = new TreeNode(4);
    TreeNode n5 = new TreeNode(5);
    // 建立節點之間的參照（指標）
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode n1 = new(1);
    TreeNode n2 = new(2);
    TreeNode n3 = new(3);
    TreeNode n4 = new(4);
    TreeNode n5 = new(5);
    // 建立節點之間的參照（指標）
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* 初始化二元樹 */
    // 初始化節點
    n1 := NewTreeNode(1)
    n2 := NewTreeNode(2)
    n3 := NewTreeNode(3)
    n4 := NewTreeNode(4)
    n5 := NewTreeNode(5)
    // 建立節點之間的參照（指標）
    n1.Left = n2
    n1.Right = n3
    n2.Left = n4
    n2.Right = n5
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    /* 初始化二元樹 */
    // 初始化節點
    let n1 = TreeNode(x: 1)
    let n2 = TreeNode(x: 2)
    let n3 = TreeNode(x: 3)
    let n4 = TreeNode(x: 4)
    let n5 = TreeNode(x: 5)
    // 建立節點之間的參照（指標）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* 初始化二元樹 */
    // 初始化節點
    let n1 = new TreeNode(1),
        n2 = new TreeNode(2),
        n3 = new TreeNode(3),
        n4 = new TreeNode(4),
        n5 = new TreeNode(5);
    // 建立節點之間的參照（指標）
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* 初始化二元樹 */
    // 初始化節點
    let n1 = new TreeNode(1),
        n2 = new TreeNode(2),
        n3 = new TreeNode(3),
        n4 = new TreeNode(4),
        n5 = new TreeNode(5);
    // 建立節點之間的參照（指標）
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode n1 = TreeNode(1);
    TreeNode n2 = TreeNode(2);
    TreeNode n3 = TreeNode(3);
    TreeNode n4 = TreeNode(4);
    TreeNode n5 = TreeNode(5);
    // 建立節點之間的參照（指標）
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    /* 初始化二元樹 */
    // 初始化節點
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // 建立節點之間的參照（指標）
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    ```

=== "C"

    ```c title="binary_tree.c"
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // 建立節點之間的參照（指標）
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    ```

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    /* 初始化二元樹 */
    // 初始化節點
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // 建立節點之間的參照（指標）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # 初始化二元樹
    # 初始化節點
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    n4 = TreeNode.new(4)
    n5 = TreeNode.new(5)
    # 建立節點之間的參照（指標）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E6%8C%87%E5%90%91%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%AF%80%E9%BB%9E%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%8F%83%E7%85%A7%EF%BC%88%E6%8C%87%E6%A8%99%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E6%8C%87%E5%90%91%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%AF%80%E9%BB%9E%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%8F%83%E7%85%A7%EF%BC%88%E6%8C%87%E6%A8%99%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 插入與刪除節點

和鏈結串列一樣，二元樹也可透過修改指標來插入與刪除節點。圖 7-3 是一個例子。

![在二元樹中插入與刪除節點](binary_tree.assets/binary_tree_add_remove.svg){ class="animation-figure" }

<p align="center"> 圖 7-3 &nbsp; 在二元樹中插入與刪除節點 </p>

=== "Python"

    ```python title="binary_tree.py"
    # 插入與刪除節點
    P = TreeNode(0)
    # 在 n1 -> n2 之間插入節點 P
    n1.left = P
    P.left = n2
    # 刪除節點 P
    n1.left = n2
    ```

=== "C++"

    ```cpp title="binary_tree.cpp"
    /* 插入與刪除節點 */
    TreeNode *P = new TreeNode(0);
    // 在 n1 -> n2 之間插入節點 P
    n1->left = P;
    P->left = n2;
    // 刪除節點 P
    n1->left = n2;
    delete P; // 釋放記憶體
    ```

=== "Java"

    ```java title="binary_tree.java"
    /* 插入與刪除節點 */
    TreeNode P = new TreeNode(0);
    // 在 n1 -> n2 之間插入節點 P
    n1.left = P;
    P.left = n2;
    // 刪除節點 P
    n1.left = n2;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* 插入與刪除節點 */
    TreeNode P = new(0);
    // 在 n1 -> n2 之間插入節點 P
    n1.left = P;
    P.left = n2;
    // 刪除節點 P
    n1.left = n2;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* 插入與刪除節點 */
    // 在 n1 -> n2 之間插入節點 P
    p := NewTreeNode(0)
    n1.Left = p
    p.Left = n2
    // 刪除節點 P
    n1.Left = n2
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    /* 插入與刪除節點 */
    let P = TreeNode(x: 0)
    // 在 n1 -> n2 之間插入節點 P
    n1.left = P
    P.left = n2
    // 刪除節點 P
    n1.left = n2
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* 插入與刪除節點 */
    const P = new TreeNode(0);
    // 在 n1 -> n2 之間插入節點 P
    n1.left = P;
    P.left = n2;
    // 刪除節點 P
    n1.left = n2;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* 插入與刪除節點 */
    const P = new TreeNode(0);
    // 在 n1 -> n2 之間插入節點 P
    n1.left = P;
    P.left = n2;
    // 刪除節點 P
    n1.left = n2;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* 插入與刪除節點 */
    TreeNode p = TreeNode(0);
    // 在 n1 -> n2 之間插入節點 P
    n1.left = p;
    p.left = n2;
    // 刪除節點 P
    n1.left = n2;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    /* 插入與刪除節點 */
    let p = TreeNode::new(0);
    // 在 n1 -> n2 之間插入節點 P
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    // 刪除節點 P
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    ```

=== "C"

    ```c title="binary_tree.c"
    /* 插入與刪除節點 */
    TreeNode *P = newTreeNode(0);
    // 在 n1 -> n2 之間插入節點 P
    n1->left = P;
    P->left = n2;
    // 刪除節點 P
    n1->left = n2;
    // 釋放記憶體
    free(P);
    ```

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    /* 插入與刪除節點 */
    val P = TreeNode(0)
    // 在 n1 -> n2 之間插入節點 P
    n1.left = P
    P.left = n2
    // 刪除節點 P
    n1.left = n2
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # 插入與刪除節點
    _p = TreeNode.new(0)
    # 在 n1 -> n2 之間插入節點 _p
    n1.left = _p
    _p.left = n2
    # 刪除節點
    n1.left = n2
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E6%8C%87%E5%90%91%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%AF%80%E9%BB%9E%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%8F%83%E7%85%A7%EF%BC%88%E6%8C%87%E6%A8%99%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%88%87%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20P%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20%E5%9C%A8%20n1%20-%3E%20n2%20%E4%B9%8B%E9%96%93%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%20P%0A%20%20%20%20n1.left%20%3D%20P%0A%20%20%20%20P.left%20%3D%20n2%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20P%0A%20%20%20%20n1.left%20%3D%20n2&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=37&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E6%8C%87%E5%90%91%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%AF%80%E9%BB%9E%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%AF%80%E9%BB%9E%E4%B9%8B%E9%96%93%E7%9A%84%E5%8F%83%E7%85%A7%EF%BC%88%E6%8C%87%E6%A8%99%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%88%87%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20P%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20%E5%9C%A8%20n1%20-%3E%20n2%20%E4%B9%8B%E9%96%93%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%20P%0A%20%20%20%20n1.left%20%3D%20P%0A%20%20%20%20P.left%20%3D%20n2%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20P%0A%20%20%20%20n1.left%20%3D%20n2&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=37&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

!!! tip

    請留意，插入節點可能改變二元樹原本的邏輯結構，刪除節點則通常意味著刪除該節點及其所有子樹。因此，實際在二元樹中插入或刪除節點時，通常需要搭配一系列操作，才能達到想要的效果。

## 7.1.3 &nbsp; 常見的二元樹類型

### 1. &nbsp; 完美二元樹

如圖 7-4 所示，<u>完美二元樹（perfect binary tree）</u>的每一層都已填滿。葉節點的分支度為 $0$，其餘節點的分支度都是 $2$。若樹高為 $h$，節點總數就是 $2^{h+1} - 1$。這種標準的指數關係也反映了自然界常見的細胞分裂現象。

!!! tip

    在中文社群中，完美二元樹也常稱為<u>滿二元樹</u>。

![完美二元樹](binary_tree.assets/perfect_binary_tree.svg){ class="animation-figure" }

<p align="center"> 圖 7-4 &nbsp; 完美二元樹 </p>

### 2. &nbsp; 完全二元樹

如圖 7-5 所示，<u>完全二元樹（complete binary tree）</u>只有最底層可以未填滿，而且最底層的節點必須從左到右連續排列。完美二元樹也是完全二元樹。

![完全二元樹](binary_tree.assets/complete_binary_tree.svg){ class="animation-figure" }

<p align="center"> 圖 7-5 &nbsp; 完全二元樹 </p>

### 3. &nbsp; 完滿二元樹

如圖 7-6 所示，<u>完滿二元樹（full binary tree，又稱嚴格二元樹）</u>中除了葉節點，其餘每個節點都有兩個子節點。

![完滿二元樹](binary_tree.assets/full_binary_tree.svg){ class="animation-figure" }

<p align="center"> 圖 7-6 &nbsp; 完滿二元樹 </p>

### 4. &nbsp; 平衡二元樹

如圖 7-7 所示，<u>平衡二元樹（balanced binary tree）</u>中每個節點的左右子樹高度差的絕對值都不超過 1。

![平衡二元樹](binary_tree.assets/balanced_binary_tree.svg){ class="animation-figure" }

<p align="center"> 圖 7-7 &nbsp; 平衡二元樹 </p>

## 7.1.4 &nbsp; 二元樹的退化

圖 7-8 比較二元樹的理想結構與退化結構。當每一層都填滿，就形成「完美二元樹」；若所有節點都偏向同一側，二元樹就會退化成「鏈結串列」。

- 完美二元樹是理想情況，可以充分發揮二元樹分治的優勢。
- 鏈結串列則是另一個極端，各項操作都變成線性操作，時間複雜度退化為 $O(n)$。

![二元樹的最佳結構與最差結構](binary_tree.assets/binary_tree_best_worst_cases.svg){ class="animation-figure" }

<p align="center"> 圖 7-8 &nbsp; 二元樹的最佳結構與最差結構 </p>

如表 7-1 所示，在最佳與最差兩種結構下，二元樹的葉節點數、節點總數和高度等分別達到最大值或最小值。

<p align="center"> 表 7-1 &nbsp; 二元樹的最佳結構與最差結構 </p>

<div class="center-table" markdown>

|                             | 完美二元樹         | 鏈結串列    |
| --------------------------- | ------------------ | ------- |
| 第 $i$ 層的節點數         | $2^{i-1}$          | $1$     |
| 高度為 $h$ 的樹的葉節點數 | $2^h$              | $1$     |
| 高度為 $h$ 的樹的節點總數   | $2^{h+1} - 1$      | $h + 1$ |
| 節點總數為 $n$ 的樹的高度   | $\log_2 (n+1) - 1$ | $n - 1$ |

</div>
