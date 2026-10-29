---
comments: true
---

# 7.1 &nbsp; 二分木

<u>二分木（binary tree）</u>は、「祖先」と「子孫」の派生関係を表す非線形データ構造で、「一つを二つに分ける」という分割統治の論理を体現しています。連結リストと同様、基本単位はノードで、各ノードには値、左の子への参照、右の子への参照が含まれます。

=== "Python"

    ```python title=""
    class TreeNode:
        """二分木のノードクラス"""
        def __init__(self, val: int):
            self.val: int = val                # ノードの値
            self.left: TreeNode | None = None  # 左の子への参照
            self.right: TreeNode | None = None # 右の子への参照
    ```

=== "C++"

    ```cpp title=""
    /* 二分木のノード構造体 */
    struct TreeNode {
        int val;          // ノードの値
        TreeNode *left;   // 左の子へのポインタ
        TreeNode *right;  // 右の子へのポインタ
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    };
    ```

=== "Java"

    ```java title=""
    /* 二分木のノードクラス */
    class TreeNode {
        int val;         // ノードの値
        TreeNode left;   // 左の子への参照
        TreeNode right;  // 右の子への参照
        TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* 二分木のノードクラス */
    class TreeNode(int? x) {
        public int? val = x;    // ノードの値
        public TreeNode? left;  // 左の子への参照
        public TreeNode? right; // 右の子への参照
    }
    ```

=== "Go"

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

=== "Swift"

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

=== "JS"

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

=== "TS"

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

=== "Dart"

    ```dart title=""
    /* 二分木のノードクラス */
    class TreeNode {
      int val;         // ノードの値
      TreeNode? left;  // 左の子への参照
      TreeNode? right; // 右の子への参照
      TreeNode(this.val, [this.left, this.right]);
    }
    ```

=== "Rust"

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

=== "C"

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

=== "Kotlin"

    ```kotlin title=""
    /* 二分木のノードクラス */
    class TreeNode(val _val: Int) {  // ノードの値
        var left: TreeNode? = null   // 左の子への参照
        var right: TreeNode? = null  // 右の子への参照
    }
    ```

=== "Ruby"

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

各ノードは二つの参照（ポインタ）を持ち、それぞれ<u>左の子ノード（left-child node）</u>と<u>右の子ノード（right-child node）</u>を指します。そのノードは、二つの子の<u>親ノード（parent node）</u>と呼ばれます。あるノードの左の子とその下のノードが作る木を<u>左部分木（left subtree）</u>と呼び、同様に<u>右部分木（right subtree）</u>も定義できます。

**二分木では、葉以外のすべてのノードが、子ノードと空でない部分木を持ちます**。図 7-1 で「ノード 2」を親とすると、左右の子は「ノード 4」と「ノード 5」です。左部分木はノード 4 とその下のノードが作る木、右部分木はノード 5 とその下のノードが作る木です。

![親ノード、子ノード、部分木](binary_tree.assets/binary_tree_definition.png){ class="animation-figure" }

<p align="center"> 図 7-1 &nbsp; 親ノード、子ノード、部分木 </p>

## 7.1.1 &nbsp; 二分木の主な用語

主な用語を図 7-2 に示します。

- <u>根ノード（root node）</u>：最上層にある、親を持たないノードです。
- <u>葉ノード（leaf node）</u>：子を持たず、二つのポインタがどちらも `None` を指すノードです。
- <u>辺（edge）</u>：二つのノードを結ぶ線で、ノードの参照（ポインタ）です。
- ノードの<u>レベル（level）</u>：上から下へ増え、根のレベルは 1 です。
- ノードの<u>次数（degree）</u>：子ノードの数です。二分木では 0、1、2 のいずれかです。
- 二分木の<u>高さ（height）</u>：根から最も遠い葉までに通る辺の数です。
- ノードの<u>深さ（depth）</u>：根からそのノードまでに通る辺の数です。
- ノードの<u>高さ（height）</u>：そのノードから最も遠い葉と、そのノードとの間にある辺の数です。

![二分木の主な用語](binary_tree.assets/binary_tree_terminology.png){ class="animation-figure" }

<p align="center"> 図 7-2 &nbsp; 二分木の主な用語 </p>

!!! tip "ヒント"

    通常、高さと深さは通る辺の数で定義しますが、問題や教科書によっては通るノードの数で定義する場合もあります。その場合は、高さと深さの両方に 1 を加えます。

## 7.1.2 &nbsp; 二分木の基本操作

### 1. &nbsp; 二分木の初期化

連結リストと同じく、まずノードを初期化し、次に参照（ポインタ）をつなぎます。

=== "Python"

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

=== "C++"

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

=== "Java"

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

=== "C#"

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

=== "Go"

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

=== "Swift"

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

=== "JS"

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

=== "TS"

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

=== "Dart"

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

=== "Rust"

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

=== "C"

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

=== "Kotlin"

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

=== "Ruby"

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

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n1%20%3D%20TreeNode(val%3D1)%0A%20%20%20%20n2%20%3D%20TreeNode(val%3D2)%0A%20%20%20%20n3%20%3D%20TreeNode(val%3D3)%0A%20%20%20%20n4%20%3D%20TreeNode(val%3D4)%0A%20%20%20%20n5%20%3D%20TreeNode(val%3D5)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%EF%BC%88%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%EF%BC%89%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n1%20%3D%20TreeNode(val%3D1)%0A%20%20%20%20n2%20%3D%20TreeNode(val%3D2)%0A%20%20%20%20n3%20%3D%20TreeNode(val%3D3)%0A%20%20%20%20n4%20%3D%20TreeNode(val%3D4)%0A%20%20%20%20n5%20%3D%20TreeNode(val%3D5)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%EF%BC%88%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%EF%BC%89%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; ノードの挿入と削除

連結リストと同様に、ポインタを変更してノードを挿入・削除できます。図 7-3 に例を示します。

![二分木でのノードの挿入と削除](binary_tree.assets/binary_tree_add_remove.png){ class="animation-figure" }

<p align="center"> 図 7-3 &nbsp; 二分木でのノードの挿入と削除 </p>

=== "Python"

    ```python title="binary_tree.py"
    # ノードの挿入と削除
    p = TreeNode(0)
    # n1 -> n2 の間にノード P を挿入
    n1.left = p
    p.left = n2
    # ノード P を削除
    n1.left = n2
    ```

=== "C++"

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

=== "Java"

    ```java title="binary_tree.java"
    TreeNode P = new TreeNode(0);
    // n1 -> n2 の間にノード P を挿入
    n1.left = P;
    P.left = n2;
    // ノード P を削除
    n1.left = n2;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* ノードの挿入と削除 */
    TreeNode P = new(0);
    // n1 -> n2 の間にノード P を挿入
    n1.left = P;
    P.left = n2;
    // ノード P を削除
    n1.left = n2;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* ノードの挿入と削除 */
    // n1 -> n2 の間にノード P を挿入
    p := NewTreeNode(0)
    n1.Left = p
    p.Left = n2
    // ノード P を削除
    n1.Left = n2
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    let P = TreeNode(x: 0)
    // n1 -> n2 の間にノード P を挿入
    n1.left = P
    P.left = n2
    // ノード P を削除
    n1.left = n2
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* ノードの挿入と削除 */
    let P = new TreeNode(0);
    // n1 -> n2 の間にノード P を挿入
    n1.left = P;
    P.left = n2;
    // ノード P を削除
    n1.left = n2;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* ノードの挿入と削除 */
    const P = new TreeNode(0);
    // n1 -> n2 の間にノード P を挿入
    n1.left = P;
    P.left = n2;
    // ノード P を削除
    n1.left = n2;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* ノードの挿入と削除 */
    TreeNode P = new TreeNode(0);
    // n1 -> n2 の間にノード P を挿入
    n1.left = P;
    P.left = n2;
    // ノード P を削除
    n1.left = n2;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    let p = TreeNode::new(0);
    // n1 -> n2 の間にノード P を挿入
    n1.borrow_mut().left = Some(p.clone());
    p.borrow_mut().left = Some(n2.clone());
    // ノード p を削除
    n1.borrow_mut().left = Some(n2);
    ```

=== "C"

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

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    val P = TreeNode(0)
    // n1 -> n2 の間にノード P を挿入
    n1.left = P
    P.left = n2
    // ノード P を削除
    n1.left = n2
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # ノードの挿入と削除
    _p = TreeNode.new(0)
    # n1 -> n2 の間にノード _p を挿入
    n1.left = _p
    _p.left = n2
    # ノードを削除
    n1.left = n2
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n1%20%3D%20TreeNode(val%3D1)%0A%20%20%20%20n2%20%3D%20TreeNode(val%3D2)%0A%20%20%20%20n3%20%3D%20TreeNode(val%3D3)%0A%20%20%20%20n4%20%3D%20TreeNode(val%3D4)%0A%20%20%20%20n5%20%3D%20TreeNode(val%3D5)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%EF%BC%88%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%EF%BC%89%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E6%8C%BF%E5%85%A5%E3%81%A8%E5%89%8A%E9%99%A4%0A%20%20%20%20p%20%3D%20TreeNode(0)%0A%20%20%20%20%23%20n1%20-%3E%20n2%20%E3%81%AE%E9%96%93%E3%81%AB%E3%83%8E%E3%83%BC%E3%83%89%20P%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20P%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20n1.left%20%3D%20n2&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=37&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n1%20%3D%20TreeNode(val%3D1)%0A%20%20%20%20n2%20%3D%20TreeNode(val%3D2)%0A%20%20%20%20n3%20%3D%20TreeNode(val%3D3)%0A%20%20%20%20n4%20%3D%20TreeNode(val%3D4)%0A%20%20%20%20n5%20%3D%20TreeNode(val%3D5)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%EF%BC%88%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%EF%BC%89%E3%82%92%E3%81%A4%E3%81%AA%E3%81%90%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E6%8C%BF%E5%85%A5%E3%81%A8%E5%89%8A%E9%99%A4%0A%20%20%20%20p%20%3D%20TreeNode(0)%0A%20%20%20%20%23%20n1%20-%3E%20n2%20%E3%81%AE%E9%96%93%E3%81%AB%E3%83%8E%E3%83%BC%E3%83%89%20P%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20n1.left%20%3D%20p%0A%20%20%20%20p.left%20%3D%20n2%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20P%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20n1.left%20%3D%20n2&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=37&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

!!! tip "ヒント"

    挿入は元の論理構造を変える可能性があり、削除は通常、そのノードとすべての部分木の削除を意味します。そのため、実際に意味のある操作を実現するには、複数の操作を組み合わせて挿入や削除を行うのが一般的です。

## 7.1.3 &nbsp; 主な二分木の種類

### 1. &nbsp; パーフェクト二分木

図 7-4 の<u>パーフェクト二分木（perfect binary tree）</u>は、すべてのレベルが完全に埋まっています。葉の次数は $0$、ほかのすべてのノードの次数は $2$ です。高さが $h$ なら、総ノード数は $2^{h+1} - 1$ という典型的な指数関係になり、自然界の細胞分裂に似た様子を示します。

!!! tip "ヒント"

    中国語圏では、パーフェクト二分木は<u>「满二叉树」</u>ともよく呼ばれます。

![パーフェクト二分木](binary_tree.assets/perfect_binary_tree.png){ class="animation-figure" }

<p align="center"> 図 7-4 &nbsp; パーフェクト二分木 </p>

### 2. &nbsp; 完全二分木

図 7-5 の<u>完全二分木（complete binary tree）</u>では、最下層だけが完全に埋まっていなくてもよく、その層のノードは左から右へ連続して埋まっている必要があります。パーフェクト二分木も、完全二分木の一種です。

![完全二分木](binary_tree.assets/complete_binary_tree.png){ class="animation-figure" }

<p align="center"> 図 7-5 &nbsp; 完全二分木 </p>

### 3. &nbsp; 全二分木

図 7-6 の<u>全二分木（full binary tree）</u>では、葉以外のすべてのノードが二つの子を持ちます。

![全二分木](binary_tree.assets/full_binary_tree.png){ class="animation-figure" }

<p align="center"> 図 7-6 &nbsp; 全二分木 </p>

### 4. &nbsp; 平衡二分木

図 7-7 の<u>平衡二分木（balanced binary tree）</u>では、どのノードでも左右の部分木の高さの差の絶対値が 1 以下です。

![平衡二分木](binary_tree.assets/balanced_binary_tree.png){ class="animation-figure" }

<p align="center"> 図 7-7 &nbsp; 平衡二分木 </p>

## 7.1.4 &nbsp; 二分木の退化

図 7-8 は理想的な構造と退化した構造です。各層が埋まるとパーフェクト二分木になり、すべてのノードが一方に偏ると連結リストに退化します。

- パーフェクト二分木は理想的な場合で、分割統治の利点を十分に発揮できます。
- 連結リストはもう一方の極端な場合で、各操作が線形になり、時間計算量は $O(n)$ に悪化します。

![二分木の最良と最悪の構造](binary_tree.assets/binary_tree_best_worst_cases.png){ class="animation-figure" }

<p align="center"> 図 7-8 &nbsp; 二分木の最良と最悪の構造 </p>

表 7-1 のように、最良と最悪の構造では、葉の数、総ノード数、高さなどが最大値または最小値になります。

<p align="center"> 表 7-1 &nbsp; 二分木の最良と最悪の構造 </p>

<div class="center-table" markdown>

|                             | パーフェクト二分木         | 連結リスト    |
| --------------------------- | ------------------ | ------- |
| 第 $i$ レベルのノード数         | $2^{i-1}$          | $1$     |
| 高さ $h$ の木の葉ノード数 | $2^h$              | $1$     |
| 高さ $h$ の木の総ノード数   | $2^{h+1} - 1$      | $h + 1$ |
| 総ノード数 $n$ の木の高さ   | $\log_2 (n+1) - 1$ | $n - 1$ |

</div>
