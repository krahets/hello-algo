---
comments: true
---

# 7.5 &nbsp; AVL木 *

「二分探索木」の節では、複数の挿入と削除の後、二分探索木が連結リストに退化する可能性があることを述べました。このような場合、すべての操作の時間計算量が$O(\log n)$から$O(n)$に悪化します。

下図に示すように、2つのノード削除操作の後、この二分探索木は連結リストに退化します。

![ノード削除後のAVL木の退化](avl_tree.assets/avltree_degradation_from_removing_node.png){ class="animation-figure" }

<p align="center"> 図 7-24 &nbsp; ノード削除後のAVL木の退化 </p>

例えば、下図に示す完全二分木では、2つのノードを挿入した後、木が左に大きく傾き、検索操作の時間計算量も悪化します。

![ノード挿入後のAVL木の退化](avl_tree.assets/avltree_degradation_from_inserting_node.png){ class="animation-figure" }

<p align="center"> 図 7-25 &nbsp; ノード挿入後のAVL木の退化 </p>

1962年、G. M. Adelson-VelskyとE. M. Landisが論文「An algorithm for the organization of information」で<u>AVL木</u>を提案しました。この論文では、ノードの継続的な追加と削除の後もAVL木が退化しないことを保証する一連の操作について詳述し、さまざまな操作の時間計算量を$O(\log n)$レベルに維持しました。つまり、頻繁な追加、削除、検索、変更が必要なシナリオで、AVL木は常に効率的なデータ操作性能を維持でき、大きな応用価値があります。

## 7.5.1 &nbsp; AVL木の一般的な用語

AVL木は二分探索木でありかつ平衡二分木でもあり、これら2つの種類の二分木のすべての性質を満たしているため、<u>平衡二分探索木</u>です。

### 1. &nbsp; ノードの高さ

AVL木に関連する操作ではノードの高さを取得する必要があるため、ノードクラスに`height`変数を追加する必要があります：

=== "Python"

    ```python title=""
    class TreeNode:
        """AVL木ノード"""
        def __init__(self, val: int):
            self.val: int = val                 # ノード値
            self.height: int = 0                # ノードの高さ
            self.left: TreeNode | None = None   # 左の子への参照
            self.right: TreeNode | None = None  # 右の子への参照
    ```

=== "C++"

    ```cpp title=""
    /* AVL木ノード */
    struct TreeNode {
        int val{};          // ノード値
        int height = 0;     // ノードの高さ
        TreeNode *left{};   // 左の子
        TreeNode *right{};  // 右の子
        TreeNode() = default;
        explicit TreeNode(int x) : val(x){}
    };
    ```

=== "Java"

    ```java title=""
    /* AVL木ノード */
    class TreeNode {
        public int val;        // ノード値
        public int height;     // ノードの高さ
        public TreeNode left;  // 左の子
        public TreeNode right; // 右の子
        public TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* AVL木ノード */
    class TreeNode(int? x) {
        public int? val = x;    // ノード値
        public int height;      // ノードの高さ
        public TreeNode? left;  // 左の子への参照
        public TreeNode? right; // 右の子への参照
    }
    ```

=== "Go"

    ```go title=""
    /* AVL木ノード */
    type TreeNode struct {
        Val    int       // ノード値
        Height int       // ノードの高さ
        Left   *TreeNode // 左の子への参照
        Right  *TreeNode // 右の子への参照
    }
    ```

=== "Swift"

    ```swift title=""
    /* AVL木ノード */
    class TreeNode {
        var val: Int // ノード値
        var height: Int // ノードの高さ
        var left: TreeNode? // 左の子
        var right: TreeNode? // 右の子

        init(x: Int) {
            val = x
            height = 0
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* AVL木ノード */
    class TreeNode {
        val; // ノード値
        height; // ノードの高さ
        left; // 左の子ポインタ
        right; // 右の子ポインタ
        constructor(val, left, right, height) {
            this.val = val === undefined ? 0 : val;
            this.height = height === undefined ? 0 : height;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* AVL木ノード */
    class TreeNode {
        val: number;            // ノード値
        height: number;         // ノードの高さ
        left: TreeNode | null;  // 左の子ポインタ
        right: TreeNode | null; // 右の子ポインタ
        constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
            this.val = val === undefined ? 0 : val;
            this.height = height === undefined ? 0 : height;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* AVL木ノード */
    class TreeNode {
      int val;         // ノード値
      int height;      // ノードの高さ
      TreeNode? left;  // 左の子
      TreeNode? right; // 右の子
      TreeNode(this.val, [this.height = 0, this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* AVL木ノード */
    struct TreeNode {
        val: i32,                               // ノード値
        height: i32,                            // ノードの高さ
        left: Option<Rc<RefCell<TreeNode>>>,    // 左の子
        right: Option<Rc<RefCell<TreeNode>>>,   // 右の子
    }

    impl TreeNode {
        /* コンストラクタ */
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

=== "C"

    ```c title=""
    /* AVL木ノード */
    TreeNode struct TreeNode {
        int val;
        int height;
        struct TreeNode *left;
        struct TreeNode *right;
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
    /* AVL木ノード */
    class TreeNode(val _val: Int) {  // ノード値
        val height: Int = 0          // ノードの高さ
        val left: TreeNode? = null   // 左の子
        val right: TreeNode? = null  // 右の子
    }
    ```

=== "Ruby"

    ```ruby title=""

    ```

=== "Zig"

    ```zig title=""

    ```

「ノードの高さ」とは、そのノードから最も遠い葉ノードまでの距離、つまり通過する「辺」の数を指します。重要なのは、葉ノードの高さは$0$で、nullノードの高さは$-1$であることです。ノードの高さを取得し、更新するための2つのユーティリティ関数を作成します：

=== "Python"

    ```python title="avl_tree.py"
    def height(self, node: TreeNode | None) -> int:
        """ノードの高さを取得"""
        # 空ノードの高さは-1、葉ノードの高さは0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """ノードの高さを更新"""
        # ノードの高さ = 最も高い部分木の高さ + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* ノードの高さを取得 */
    int height(TreeNode *node) {
        // 空ノードの高さは-1、葉ノードの高さは0
        return node == nullptr ? -1 : node->height;
    }

    /* ノードの高さを更新 */
    void updateHeight(TreeNode *node) {
        // ノードの高さ = 最も高い部分木の高さ + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* ノードの高さを取得 */
    int height(TreeNode node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新 */
    void updateHeight(TreeNode node) {
        // ノードの高さは最も高い部分木の高さ + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{Height}

    [class]{AVLTree}-[func]{UpdateHeight}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{height}

    [class]{aVLTree}-[func]{updateHeight}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{update_height}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{}-[func]{height}

    [class]{}-[func]{updateHeight}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{update_height}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

### 2. &nbsp; ノードの平衡因子

ノードの<u>平衡因子</u>は、そのノードの左部分木の高さから右部分木の高さを引いた値として定義され、nullノードの平衡因子は$0$として定義されます。後で使いやすくするため、ノードの平衡因子を取得する機能も関数にカプセル化します：

=== "Python"

    ```python title="avl_tree.py"
    def balance_factor(self, node: TreeNode | None) -> int:
        """バランス因子を取得"""
        # 空ノードのバランス因子は0
        if node is None:
            return 0
        # ノードのバランス因子 = 左部分木の高さ - 右部分木の高さ
        return self.height(node.left) - self.height(node.right)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 平衡因子を取得 */
    int balanceFactor(TreeNode *node) {
        // 空ノードの平衡因子は0
        if (node == nullptr)
            return 0;
        // ノードの平衡因子 = 左部分木の高さ - 右部分木の高さ
        return height(node->left) - height(node->right);
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 平衡因子を取得 */
    int balanceFactor(TreeNode node) {
        // 空ノードの平衡因子は 0
        if (node == null)
            return 0;
        // ノードの平衡因子 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right);
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{BalanceFactor}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{balanceFactor}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{balance_factor}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{}-[func]{balanceFactor}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{balance_factor}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

!!! tip

    平衡因子を$f$とすると、AVL木の任意のノードの平衡因子は$-1 \le f \le 1$を満たします。

## 7.5.2 &nbsp; AVL木の回転

AVL木の特徴的な機能は「回転」操作で、これは二分木の中順探索シーケンスに影響を与えることなく、不平衡なノードのバランスを回復できます。つまり、**回転操作は「二分探索木」の性質を維持しながら、木を「平衡二分木」に戻すことができます**。

絶対平衡因子が$> 1$のノードを「不平衡ノード」と呼びます。不平衡のタイプに応じて、4種類の回転があります：右回転、左回転、右左回転、左右回転です。以下、これらの回転操作について詳しく説明します。

### 1. &nbsp; 右回転

下図に示すように、二分木で下から上への最初の不平衡ノードは「ノード3」です。この不平衡ノードを根とする部分木に焦点を当て、これを`node`とし、その左の子を`child`として、「右回転」を実行します。右回転後、部分木は再びバランスが取れ、同時に二分探索木の性質も維持されます。

=== "<1>"
    ![右回転の手順](avl_tree.assets/avltree_right_rotate_step1.png){ class="animation-figure" }

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png){ class="animation-figure" }

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png){ class="animation-figure" }

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png){ class="animation-figure" }

<p align="center"> 図 7-26 &nbsp; 右回転の手順 </p>

下図に示すように、`child`ノードに右の子（`grand_child`と表記）がある場合、右回転で手順を追加する必要があります：`grand_child`を`node`の左の子に設定します。

![grand_childがある右回転](avl_tree.assets/avltree_right_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> 図 7-27 &nbsp; grand_childがある右回転 </p>

「右回転」は比喩的な用語で、実際にはノードポインタを変更することで実現されます。以下のコードで示されます：

=== "Python"

    ```python title="avl_tree.py"
    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右回転操作"""
        child = node.left
        grand_child = child.right
        # childを中心にnodeを右に回転
        child.right = node
        node.left = grand_child
        # ノードの高さを更新
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木のルートを返す
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 右回転操作 */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // childを中心にnodeを右に回転
        child->right = node;
        node->left = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木のルートを返す
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 右回転操作 */
    TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // child を軸として node を右に回転
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根を返す
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{RightRotate}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{rightRotate}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{right_rotate}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{}-[func]{rightRotate}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{right_rotate}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{rightRotate}
    ```

### 2. &nbsp; 左回転

対応して、上記の不平衡二分木の「鏡像」を考慮すると、下図に示す「左回転」操作を実行する必要があります。

![左回転操作](avl_tree.assets/avltree_left_rotate.png){ class="animation-figure" }

<p align="center"> 図 7-28 &nbsp; 左回転操作 </p>

同様に、下図に示すように、`child`ノードに左の子（`grand_child`と表記）がある場合、左回転で手順を追加する必要があります：`grand_child`を`node`の右の子に設定します。

![grand_childがある左回転](avl_tree.assets/avltree_left_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> 図 7-29 &nbsp; grand_childがある左回転 </p>

**右回転と左回転の操作は論理的に対称であり、2つの対称的な不平衡タイプを解決します**ことが観察できます。対称性に基づいて、右回転の実装コードですべての`left`を`right`に、すべての`right`を`left`に置き換えることで、左回転の実装コードを得ることができます：

=== "Python"

    ```python title="avl_tree.py"
    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左回転操作"""
        child = node.right
        grand_child = child.left
        # childを中心にnodeを左に回転
        child.left = node
        node.right = grand_child
        # ノードの高さを更新
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木のルートを返す
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 左回転操作 */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // childを中心にnodeを左に回転
        child->left = node;
        node->right = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木のルートを返す
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 左回転操作 */
    TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // child を軸として node を左に回転
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根を返す
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{LeftRotate}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{leftRotate}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{left_rotate}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{}-[func]{leftRotate}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{left_rotate}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{leftRotate}
    ```

### 3. &nbsp; 左右回転

下図に示す不平衡ノード3の場合、左回転または右回転のいずれかだけでは部分木のバランスを回復できません。この場合、まず`child`に対して「左回転」を実行し、次に`node`に対して「右回転」を実行する必要があります。

![左右回転](avl_tree.assets/avltree_left_right_rotate.png){ class="animation-figure" }

<p align="center"> 図 7-30 &nbsp; 左右回転 </p>

### 4. &nbsp; 右左回転

下図に示すように、上記の不平衡二分木の鏡像ケースでは、まず`child`に対して「右回転」を実行し、次に`node`に対して「左回転」を実行する必要があります。

![右左回転](avl_tree.assets/avltree_right_left_rotate.png){ class="animation-figure" }

<p align="center"> 図 7-31 &nbsp; 右左回転 </p>

### 5. &nbsp; 回転の選択

下図に示す4種類の不平衡は、それぞれ上記で説明したケースに対応し、右回転、左右回転、右左回転、左回転が必要です。

![AVL木の4つの回転ケース](avl_tree.assets/avltree_rotation_cases.png){ class="animation-figure" }

<p align="center"> 図 7-32 &nbsp; AVL木の4つの回転ケース </p>

下表に示すように、不平衡ノードの平衡因子とその高い側の子の平衡因子の符号を判断することで、不平衡ノードが上記のどのケースに属するかを決定します。

<p align="center"> 表 7-3 &nbsp; 4つの回転ケースの選択条件 </p>

<div class="center-table" markdown>

| 不平衡ノードの平衡因子 | 子ノードの平衡因子 | 使用する回転方法             |
| --------------------- | ----------------- | --------------------------- |
| $> 1$（左に傾いた木）  | $\geq 0$          | 右回転                      |
| $> 1$（左に傾いた木）  | $<0$              | 左回転してから右回転        |
| $< -1$（右に傾いた木） | $\leq 0$          | 左回転                      |
| $< -1$（右に傾いた木） | $>0$              | 右回転してから左回転        |

</div>

便宜上、回転操作を関数にカプセル化します。**この関数により、さまざまな種類の不平衡に対して回転を実行し、不平衡ノードのバランスを回復できます**。コードは以下の通りです：

=== "Python"

    ```python title="avl_tree.py"
    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """回転操作を実行して部分木のバランスを復元"""
        # nodeのバランス因子を取得
        balance_factor = self.balance_factor(node)
        # 左偏り木
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右回転
                return self.right_rotate(node)
            else:
                # 左回転してから右回転
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右偏り木
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左回転
                return self.left_rotate(node)
            else:
                # 右回転してから左回転
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # バランスの取れた木、回転不要、戻る
        return node
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 回転操作を実行して部分木の平衡を回復 */
    TreeNode *rotate(TreeNode *node) {
        // nodeの平衡因子を取得
        int _balanceFactor = balanceFactor(node);
        // 左に傾いた木
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 先に左回転、その後右回転
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // 右に傾いた木
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 先に右回転、その後左回転
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // 平衡な木、回転不要、そのまま戻る
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 回転操作を実行して部分木の平衡を回復 */
    TreeNode rotate(TreeNode node) {
        // node の平衡因子を取得
        int balanceFactor = balanceFactor(node);
        // 左傾斜の木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 先に左回転、その後右回転
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // 右傾斜の木
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 先に右回転、その後左回転
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // 平衡木、回転は不要、戻る
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{Rotate}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{rotate}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{}-[func]{rotate}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{rotate}
    ```

## 7.5.3 &nbsp; AVL木の一般的な操作

### 1. &nbsp; ノードの挿入

AVL木のノード挿入操作は二分探索木のそれと似ています。唯一の違いは、AVL木でノードを挿入した後、そのノードから根ノードまでのパス上に一連の不平衡ノードが現れる可能性があることです。したがって、**このノードから始めて上向きに回転操作を実行し、すべての不平衡ノードのバランスを回復する必要があります**。コードは以下の通りです：

=== "Python"

    ```python title="avl_tree.py"
    def insert(self, val):
        """ノードを挿入"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """再帰的にノードを挿入（ヘルパーメソッド）"""
        if node is None:
            return TreeNode(val)
        # 1. 挿入位置を見つけてノードを挿入
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重複ノードは挿入しない、戻る
            return node
        # ノードの高さを更新
        self.update_height(node)
        # 2. 回転操作を実行して部分木のバランスを復元
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* ノードを挿入 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* ノードを再帰的に挿入（ヘルパーメソッド） */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. 挿入位置を見つけてノードを挿入 */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // 重複ノードは挿入しない、そのまま戻る
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木のルートノードを返す
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* ノードを挿入 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* 再帰的にノードを挿入（補助メソッド） */
    TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. 挿入位置を見つけてノードを挿入 */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // 重複ノードは挿入しない、戻る
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{Insert}

    [class]{AVLTree}-[func]{InsertHelper}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{insert}

    [class]{aVLTree}-[func]{insertHelper}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insert_helper}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{AVLTree}-[func]{insert}

    [class]{}-[func]{insertHelper}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insert_helper}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

### 2. &nbsp; ノードの削除

同様に、二分探索木でのノード削除方法に基づいて、下から上へ回転操作を実行してすべての不平衡ノードのバランスを回復する必要があります。コードは以下の通りです：

=== "Python"

    ```python title="avl_tree.py"
    def remove(self, val: int):
        """ノードを削除"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """再帰的にノードを削除（ヘルパーメソッド）"""
        if node is None:
            return None
        # 1. ノードを見つけて削除
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子ノード数 = 0、ノードを削除して戻る
                if child is None:
                    return None
                # 子ノード数 = 1、ノードを削除
                else:
                    node = child
            else:
                # 子ノード数 = 2、中順走査の次のノードを削除し、それで現在のノードを置き換え
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # ノードの高さを更新
        self.update_height(node)
        # 2. 回転操作を実行して部分木のバランスを復元
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* ノードを削除 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* ノードを再帰的に削除（ヘルパーメソッド） */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. ノードを見つけて削除 */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // 子ノード数 = 0、ノードを削除して戻る
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // 子ノード数 = 1、ノードを削除
                else {
                    delete node;
                    node = child;
                }
            } else {
                // 子ノード数 = 2、中順走査の次のノードを削除し、現在のノードと置き換える
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木のルートノードを返す
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* ノードを削除 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* 再帰的にノードを削除（補助メソッド） */
    TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. ノードを見つけて削除 */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // 子ノード数 = 0、ノードを削除して戻る
                if (child == null)
                    return null;
                // 子ノード数 = 1、ノードを削除
                else
                    node = child;
            } else {
                // 子ノード数 = 2、中順走査の次のノードを削除し、現在のノードをそれで置き換える
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{Remove}

    [class]{AVLTree}-[func]{RemoveHelper}
    ```

=== "Go"

    ```go title="avl_tree.go"
    [class]{aVLTree}-[func]{remove}

    [class]{aVLTree}-[func]{removeHelper}
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{remove_helper}
    ```

=== "C"

    ```c title="avl_tree.c"
    [class]{AVLTree}-[func]{removeItem}

    [class]{}-[func]{removeHelper}
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{remove_helper}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

### 3. &nbsp; ノードの検索

AVL木でのノード検索操作は二分探索木のそれと一致しており、ここでは詳述しません。

## 7.5.4 &nbsp; AVL木の典型的な応用

- 大量のデータの整理と格納に使用され、検索頻度が高く、挿入と削除の頻度が低いシナリオに適しています。
- データベースのインデックスシステムの構築に使用されます。
- 赤黒木も一般的な平衡二分探索木の一種です。AVL木と比較して、赤黒木はより緩い平衡条件を持ち、ノードの挿入と削除にかかる回転数が少なく、ノードの追加と削除操作の平均効率が高くなります。
