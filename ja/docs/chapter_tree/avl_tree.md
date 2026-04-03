---
comments: true
---

# 7.5 &nbsp; AVL 木 *

「二分探索木」章で述べたように、挿入と削除を何度も繰り返すと、二分探索木は連結リストへ退化する可能性があります。この場合、すべての操作の時間計算量は $O(\log n)$ から $O(n)$ へ劣化します。

以下の図に示すように、ノード削除を 2 回行うと、この二分探索木は連結リストへ退化します。

![AVL 木がノード削除後に退化する](avl_tree.assets/avltree_degradation_from_removing_node.png){ class="animation-figure" }

<p align="center"> 図 7-24 &nbsp; AVL 木がノード削除後に退化する </p>

別の例として、以下の図に示す完全二分木に 2 つのノードを挿入すると、木は大きく左に傾き、探索操作の時間計算量もそれに伴って劣化します。

![AVL 木がノード挿入後に退化する](avl_tree.assets/avltree_degradation_from_inserting_node.png){ class="animation-figure" }

<p align="center"> 図 7-25 &nbsp; AVL 木がノード挿入後に退化する </p>

1962 年、G. M. Adelson-Velsky と E. M. Landis は論文“An algorithm for the organization of information”の中で <u>AVL 木</u> を提案しました。論文では一連の操作が詳しく説明されており、ノードの追加と削除を続けても AVL 木が退化しないようにして、各種操作の時間計算量を $O(\log n)$ の水準に保ちます。言い換えると、追加・削除・探索・更新を頻繁に行う場面でも、AVL 木は常に高いデータ操作性能を維持でき、実用価値の高い構造です。

## 7.5.1 &nbsp; AVL 木の基本用語

AVL 木は二分探索木であると同時に平衡二分木でもあり、これら 2 種類の二分木の性質をすべて満たします。したがって、<u>平衡二分探索木（balanced binary search tree）</u>の一種です。

### 1. &nbsp; ノードの高さ

AVL 木の操作ではノードの高さを取得する必要があるため、ノードクラスに `height` 変数を追加します：

=== "Python"

    ```python title=""
    class TreeNode:
        """AVL 木ノードクラス"""
        def __init__(self, val: int):
            self.val: int = val                 # ノード値
            self.height: int = 0                # ノードの高さ
            self.left: TreeNode | None = None   # 左の子ノード参照
            self.right: TreeNode | None = None  # 右の子ノード参照
    ```

=== "C++"

    ```cpp title=""
    /* AVL 木ノードクラス */
    struct TreeNode {
        int val{};          // ノード値
        int height = 0;     // ノードの高さ
        TreeNode *left{};   // 左の子ノード
        TreeNode *right{};  // 右の子ノード
        TreeNode() = default;
        explicit TreeNode(int x) : val(x){}
    };
    ```

=== "Java"

    ```java title=""
    /* AVL 木ノードクラス */
    class TreeNode {
        public int val;        // ノード値
        public int height;     // ノードの高さ
        public TreeNode left;  // 左の子ノード
        public TreeNode right; // 右の子ノード
        public TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* AVL 木ノードクラス */
    class TreeNode(int? x) {
        public int? val = x;    // ノード値
        public int height;      // ノードの高さ
        public TreeNode? left;  // 左の子ノード参照
        public TreeNode? right; // 右の子ノード参照
    }
    ```

=== "Go"

    ```go title=""
    /* AVL 木ノード構造体 */
    type TreeNode struct {
        Val    int       // ノード値
        Height int       // ノードの高さ
        Left   *TreeNode // 左の子ノード参照
        Right  *TreeNode // 右の子ノード参照
    }
    ```

=== "Swift"

    ```swift title=""
    /* AVL 木ノードクラス */
    class TreeNode {
        var val: Int // ノード値
        var height: Int // ノードの高さ
        var left: TreeNode? // 左の子ノード
        var right: TreeNode? // 右の子ノード

        init(x: Int) {
            val = x
            height = 0
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* AVL 木ノードクラス */
    class TreeNode {
        val; // ノード値
        height; //ノードの高さ
        left; // 左の子ノードポインタ
        right; // 右の子ノードポインタ
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
    /* AVL 木ノードクラス */
    class TreeNode {
        val: number;            // ノード値
        height: number;         // ノードの高さ
        left: TreeNode | null;  // 左の子ノードポインタ
        right: TreeNode | null; // 右の子ノードポインタ
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
    /* AVL 木ノードクラス */
    class TreeNode {
      int val;         // ノード値
      int height;      // ノードの高さ
      TreeNode? left;  // 左の子ノード
      TreeNode? right; // 右の子ノード
      TreeNode(this.val, [this.height = 0, this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* AVL 木ノード構造体 */
    struct TreeNode {
        val: i32,                               // ノード値
        height: i32,                            // ノードの高さ
        left: Option<Rc<RefCell<TreeNode>>>,    // 左の子ノード
        right: Option<Rc<RefCell<TreeNode>>>,   // 右の子ノード
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
    /* AVL 木ノード構造体 */
    typedef struct TreeNode {
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
    /* AVL 木ノードクラス */
    class TreeNode(val _val: Int) {  // ノード値
        val height: Int = 0          // ノードの高さ
        val left: TreeNode? = null   // 左の子ノード
        val right: TreeNode? = null  // 右の子ノード
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### AVL 木ノードクラス ###
    class TreeNode
      attr_accessor :val    # ノード値
      attr_accessor :height # ノードの高さ
      attr_accessor :left   # 左の子ノード参照
      attr_accessor :right  # 右の子ノード参照

      def initialize(val)
        @val = val
        @height = 0
      end
    end
    ```

「ノードの高さ」とは、そのノードから最も遠い葉ノードまでの距離、すなわち通過する「辺」の本数を指します。特に、葉ノードの高さは $0$、空ノードの高さは $-1$ です。ここでは、ノードの高さを取得・更新するための 2 つの補助関数を用意します：

=== "Python"

    ```python title="avl_tree.py"
    def height(self, node: TreeNode | None) -> int:
        """ノードの高さを取得"""
        # 空ノードの高さは -1、葉ノードの高さは 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """ノードの高さを更新する"""
        # ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height = max([self.height(node.left), self.height(node.right)]) + 1
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* ノードの高さを取得 */
    int height(TreeNode *node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node == nullptr ? -1 : node->height;
    }

    /* ノードの高さを更新する */
    void updateHeight(TreeNode *node) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
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

    /* ノードの高さを更新する */
    void updateHeight(TreeNode node) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* ノードの高さを取得 */
    int Height(TreeNode? node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    void UpdateHeight(TreeNode node) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* ノードの高さを取得 */
    func (t *aVLTree) height(node *TreeNode) int {
        // 空ノードの高さは -1、葉ノードの高さは 0
        if node != nil {
            return node.Height
        }
        return -1
    }

    /* ノードの高さを更新する */
    func (t *aVLTree) updateHeight(node *TreeNode) {
        lh := t.height(node.Left)
        rh := t.height(node.Right)
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        if lh > rh {
            node.Height = lh + 1
        } else {
            node.Height = rh + 1
        }
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* ノードの高さを取得 */
    func height(node: TreeNode?) -> Int {
        // 空ノードの高さは -1、葉ノードの高さは 0
        node?.height ?? -1
    }

    /* ノードの高さを更新する */
    func updateHeight(node: TreeNode?) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* ノードの高さを取得 */
    height(node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node === null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    #updateHeight(node) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* ノードの高さを取得 */
    height(node: TreeNode): number {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node === null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    updateHeight(node: TreeNode): void {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* ノードの高さを取得 */
    int height(TreeNode? node) {
      // 空ノードの高さは -1、葉ノードの高さは 0
      return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    void updateHeight(TreeNode? node) {
      // ノードの高さは最も高い部分木の高さ + 1 に等しい
      node!.height = max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* ノードの高さを取得 */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // 空ノードの高さは -1、葉ノードの高さは 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* ノードの高さを更新する */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // ノードの高さは最も高い部分木の高さ + 1 に等しい
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* ノードの高さを取得 */
    int height(TreeNode *node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        if (node != NULL) {
            return node->height;
        }
        return -1;
    }

    /* ノードの高さを更新する */
    void updateHeight(TreeNode *node) {
        int lh = height(node->left);
        int rh = height(node->right);
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        if (lh > rh) {
            node->height = lh + 1;
        } else {
            node->height = rh + 1;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* ノードの高さを取得 */
    fun height(node: TreeNode?): Int {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node?.height ?: -1
    }

    /* ノードの高さを更新する */
    fun updateHeight(node: TreeNode?) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### ノードの高さを取得 ###
    def height(node)
      # 空ノードの高さは -1、葉ノードの高さは 0
      return node.height unless node.nil?

      -1
    end

    ### ノードの高さを更新 ###
    def update_height(node)
      # ノードの高さは最も高い部分木の高さ + 1 に等しい
      node.height = [height(node.left), height(node.right)].max + 1
    end
    ```

### 2. &nbsp; ノードの平衡係数

ノードの<u>平衡係数（balance factor）</u>は、左部分木の高さから右部分木の高さを引いた値と定義し、空ノードの平衡係数は $0$ とします。同様に、ノードの平衡係数を取得する機能も関数にカプセル化して、後続で使いやすくします：

=== "Python"

    ```python title="avl_tree.py"
    def balance_factor(self, node: TreeNode | None) -> int:
        """平衡係数を取得"""
        # 空ノードの平衡係数は 0
        if node is None:
            return 0
        # ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return self.height(node.left) - self.height(node.right)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 平衡係数を取得 */
    int balanceFactor(TreeNode *node) {
        // 空ノードの平衡係数は 0
        if (node == nullptr)
            return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node->left) - height(node->right);
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 平衡係数を取得 */
    int balanceFactor(TreeNode node) {
        // 空ノードの平衡係数は 0
        if (node == null)
            return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right);
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* 平衡係数を取得 */
    int BalanceFactor(TreeNode? node) {
        // 空ノードの平衡係数は 0
        if (node == null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return Height(node.left) - Height(node.right);
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* 平衡係数を取得 */
    func (t *aVLTree) balanceFactor(node *TreeNode) int {
        // 空ノードの平衡係数は 0
        if node == nil {
            return 0
        }
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return t.height(node.Left) - t.height(node.Right)
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* 平衡係数を取得 */
    func balanceFactor(node: TreeNode?) -> Int {
        // 空ノードの平衡係数は 0
        guard let node = node else { return 0 }
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node: node.left) - height(node: node.right)
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* 平衡係数を取得 */
    balanceFactor(node) {
        // 空ノードの平衡係数は 0
        if (node === null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* 平衡係数を取得 */
    balanceFactor(node: TreeNode): number {
        // 空ノードの平衡係数は 0
        if (node === null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* 平衡係数を取得 */
    int balanceFactor(TreeNode? node) {
      // 空ノードの平衡係数は 0
      if (node == null) return 0;
      // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
      return height(node.left) - height(node.right);
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* 平衡係数を取得 */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // 空ノードの平衡係数は 0
            None => 0,
            // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* 平衡係数を取得 */
    int balanceFactor(TreeNode *node) {
        // 空ノードの平衡係数は 0
        if (node == NULL) {
            return 0;
        }
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node->left) - height(node->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* 平衡係数を取得 */
    fun balanceFactor(node: TreeNode?): Int {
        // 空ノードの平衡係数は 0
        if (node == null) return 0
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right)
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### 平衡係数を取得 ###
    def balance_factor(node)
      # 空ノードの平衡係数は 0
      return 0 if node.nil?

      # ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
      height(node.left) - height(node.right)
    end
    ```

!!! tip

    平衡係数を $f$ とすると、AVL 木の任意のノードの平衡係数は常に $-1 \le f \le 1$ を満たします。

## 7.5.2 &nbsp; AVL 木の回転

AVL 木の特徴は「回転」操作にあり、二分木の中順走査列を変えずに、不平衡ノードを再び平衡に戻せます。言い換えると、**回転操作は「二分探索木」の性質を保ちながら、木を再び「平衡二分木」に戻すことができます**。

平衡係数の絶対値が $> 1$ のノードを「不平衡ノード」と呼びます。ノードの不平衡の形に応じて、回転操作は 4 種類に分かれます。右回転、左回転、右回転してから左回転、左回転してから右回転です。以下でこれらを順に説明します。

### 1. &nbsp; 右回転

以下の図では、ノードの下に平衡係数を示しています。下から上へ見ると、二分木で最初に不平衡になるのは「ノード 3」です。この不平衡ノードを根とする部分木に注目し、そのノードを `node`、左の子ノードを `child` として、「右回転」を行います。右回転後、部分木は平衡を回復し、なおかつ二分探索木の性質も保たれます。

=== "<1>"
    ![右回転の手順](avl_tree.assets/avltree_right_rotate_step1.png){ class="animation-figure" }

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png){ class="animation-figure" }

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png){ class="animation-figure" }

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png){ class="animation-figure" }

<p align="center"> 図 7-26 &nbsp; 右回転の手順 </p>

以下の図に示すように、ノード `child` に右の子ノード（`grand_child` と記す）がある場合、右回転には 1 ステップ追加する必要があります。すなわち、`grand_child` を `node` の左の子ノードにします。

![grand_child を持つ右回転](avl_tree.assets/avltree_right_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> 図 7-27 &nbsp; grand_child を持つ右回転 </p>

「右に回転する」というのはあくまでイメージしやすい表現であり、実際にはノードポインタを変更して実現します。コードは次のとおりです：

=== "Python"

    ```python title="avl_tree.py"
    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """右回転"""
        child = node.left
        grand_child = child.right
        # child を支点として node を右回転させる
        child.right = node
        node.left = grand_child
        # ノードの高さを更新する
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木の根ノードを返す
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 右回転 */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // child を支点として node を右回転させる
        child->right = node;
        node->left = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 右回転 */
    TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // child を支点として node を右回転させる
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* 右回転 */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // child を支点として node を右回転させる
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        UpdateHeight(node);
        UpdateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* 右回転 */
    func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
        child := node.Left
        grandChild := child.Right
        // child を支点として node を右回転させる
        child.Right = node
        node.Left = grandChild
        // ノードの高さを更新する
        t.updateHeight(node)
        t.updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* 右回転 */
    func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // child を支点として node を右回転させる
        child?.right = node
        node?.left = grandChild
        // ノードの高さを更新する
        updateHeight(node: node)
        updateHeight(node: child)
        // 回転後の部分木の根ノードを返す
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* 右回転 */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // child を支点として node を右回転させる
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* 右回転 */
    rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // child を支点として node を右回転させる
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        this.updateHeight(node);
        this.updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* 右回転 */
    TreeNode? rightRotate(TreeNode? node) {
      TreeNode? child = node!.left;
      TreeNode? grandChild = child!.right;
      // child を支点として node を右回転させる
      child.right = node;
      node.left = grandChild;
      // ノードの高さを更新する
      updateHeight(node);
      updateHeight(child);
      // 回転後の部分木の根ノードを返す
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* 右回転 */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // child を支点として node を右回転させる
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // ノードの高さを更新する
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回転後の部分木の根ノードを返す
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* 右回転 */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->left;
        grandChild = child->right;
        // child を支点として node を右回転させる
        child->right = node;
        node->left = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* 右回転 */
    fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // child を支点として node を右回転させる
        child.right = node
        node.left = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### 右回転操作 ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # child を支点として node を右回転させる
      child.right = node
      node.left = grand_child
      # ノードの高さを更新する
      update_height(node)
      update_height(child)
      # 回転後の部分木の根ノードを返す
      child
    end
    ```

### 2. &nbsp; 左回転

対応する鏡像として、上記の不平衡二分木を左右反転して考えると、以下の図に示す「左回転」が必要になります。

![左回転](avl_tree.assets/avltree_left_rotate.png){ class="animation-figure" }

<p align="center"> 図 7-28 &nbsp; 左回転 </p>

同様に、以下の図に示すように、ノード `child` に左の子ノード（`grand_child` と記す）がある場合、左回転にも 1 ステップ追加する必要があります。すなわち、`grand_child` を `node` の右の子ノードにします。

![grand_child を持つ左回転](avl_tree.assets/avltree_left_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> 図 7-29 &nbsp; grand_child を持つ左回転 </p>

分かるように、**右回転と左回転は論理的に鏡像対称であり、それぞれが解決する 2 種類の不平衡も対称です**。この対称性に基づけば、右回転の実装コードにあるすべての `left` を `right` に、すべての `right` を `left` に置き換えるだけで、左回転の実装コードが得られます：

=== "Python"

    ```python title="avl_tree.py"
    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """左回転"""
        child = node.right
        grand_child = child.left
        # child を支点として node を左回転させる
        child.left = node
        node.right = grand_child
        # ノードの高さを更新する
        self.update_height(node)
        self.update_height(child)
        # 回転後の部分木の根ノードを返す
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 左回転 */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // child を支点として node を左回転させる
        child->left = node;
        node->right = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 左回転 */
    TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // child を支点として node を左回転させる
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* 左回転 */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // child を支点として node を左回転させる
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        UpdateHeight(node);
        UpdateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* 左回転 */
    func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
        child := node.Right
        grandChild := child.Left
        // child を支点として node を左回転させる
        child.Left = node
        node.Right = grandChild
        // ノードの高さを更新する
        t.updateHeight(node)
        t.updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* 左回転 */
    func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // child を支点として node を左回転させる
        child?.left = node
        node?.right = grandChild
        // ノードの高さを更新する
        updateHeight(node: node)
        updateHeight(node: child)
        // 回転後の部分木の根ノードを返す
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* 左回転 */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // child を支点として node を左回転させる
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* 左回転 */
    leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // child を支点として node を左回転させる
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        this.updateHeight(node);
        this.updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* 左回転 */
    TreeNode? leftRotate(TreeNode? node) {
      TreeNode? child = node!.right;
      TreeNode? grandChild = child!.left;
      // child を支点として node を左回転させる
      child.left = node;
      node.right = grandChild;
      // ノードの高さを更新する
      updateHeight(node);
      updateHeight(child);
      // 回転後の部分木の根ノードを返す
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* 左回転 */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // child を支点として node を左回転させる
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // ノードの高さを更新する
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 回転後の部分木の根ノードを返す
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* 左回転 */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->right;
        grandChild = child->left;
        // child を支点として node を左回転させる
        child->left = node;
        node->right = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* 左回転 */
    fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // child を支点として node を左回転させる
        child.left = node
        node.right = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### 左回転操作 ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # child を支点として node を左回転させる
      child.left = node
      node.right = grand_child
      # ノードの高さを更新する
      update_height(node)
      update_height(child)
      # 回転後の部分木の根ノードを返す
      child
    end
    ```

### 3. &nbsp; 左回転してから右回転

以下の図の不平衡ノード 3 では、左回転だけでも右回転だけでも部分木を平衡に戻せません。この場合は、まず `child` に「左回転」を行い、次に `node` に「右回転」を行います。

![左回転してから右回転](avl_tree.assets/avltree_left_right_rotate.png){ class="animation-figure" }

<p align="center"> 図 7-30 &nbsp; 左回転してから右回転 </p>

### 4. &nbsp; 右回転してから左回転

以下の図に示すように、上記の不平衡二分木の鏡像のケースでは、まず `child` に「右回転」を行い、次に `node` に「左回転」を行います。

![右回転してから左回転](avl_tree.assets/avltree_right_left_rotate.png){ class="animation-figure" }

<p align="center"> 図 7-31 &nbsp; 右回転してから左回転 </p>

### 5. &nbsp; 回転の選択

以下の図に示す 4 種類の不平衡は、上の各ケースにそれぞれ対応しており、必要な操作は順に右回転、左回転してから右回転、右回転してから左回転、左回転です。

![AVL 木の 4 つの回転ケース](avl_tree.assets/avltree_rotation_cases.png){ class="animation-figure" }

<p align="center"> 図 7-32 &nbsp; AVL 木の 4 つの回転ケース </p>

以下の表に示すように、不平衡ノードの平衡係数と、高い側の子ノードの平衡係数の符号を判定することで、その不平衡ノードが上図のどのケースに属するかを判断できます。

<p align="center"> 表 7-3 &nbsp; 4 種類の回転ケースの選択条件 </p>

<div class="center-table" markdown>

| 不平衡ノードの平衡係数 | 子ノードの平衡係数 | 採用すべき回転方法 |
| ------------------ | ---------------- | ---------------- |
| $> 1$ （左に偏った木）   | $\geq 0$         | 右回転             |
| $> 1$ （左に偏った木）   | $<0$             | 左回転してから右回転     |
| $< -1$ （右に偏った木）  | $\leq 0$         | 左回転             |
| $< -1$ （右に偏った木）  | $>0$             | 右回転してから左回転     |

</div>

使いやすくするために、回転操作を 1 つの関数にカプセル化します。**この関数があれば、さまざまな不平衡ケースに対して回転を行い、不平衡ノードを再び平衡に戻せます**。コードは次のとおりです：

=== "Python"

    ```python title="avl_tree.py"
    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """回転操作を行い、この部分木の平衡を回復する"""
        # ノード node の平衡係数を取得
        balance_factor = self.balance_factor(node)
        # 左に偏った木
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # 右回転
                return self.right_rotate(node)
            else:
                # 左回転してから右回転
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # 右に偏った木
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # 左回転
                return self.left_rotate(node)
            else:
                # 右回転してから左回転
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # 平衡木なので回転不要、そのまま返す
        return node
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* 回転操作を行い、この部分木の平衡を回復する */
    TreeNode *rotate(TreeNode *node) {
        // ノード node の平衡係数を取得
        int _balanceFactor = balanceFactor(node);
        // 左に偏った木
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 左回転してから右回転
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // 右に偏った木
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 右回転してから左回転
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* 回転操作を行い、この部分木の平衡を回復する */
    TreeNode rotate(TreeNode node) {
        // ノード node の平衡係数を取得
        int balanceFactor = balanceFactor(node);
        // 左に偏った木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 左回転してから右回転
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 右回転してから左回転
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* 回転操作を行い、この部分木の平衡を回復する */
    TreeNode? Rotate(TreeNode? node) {
        // ノード node の平衡係数を取得
        int balanceFactorInt = BalanceFactor(node);
        // 左に偏った木
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // 右回転
                return RightRotate(node);
            } else {
                // 左回転してから右回転
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // 左回転
                return LeftRotate(node);
            } else {
                // 右回転してから左回転
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* 回転操作を行い、この部分木の平衡を回復する */
    func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
        // ノード `node` の平衡係数を取得する
        // Go では短い変数名が推奨されるため、ここで `bf` は `t.balanceFactor` を表す
        bf := t.balanceFactor(node)
        // 左に偏った木
        if bf > 1 {
            if t.balanceFactor(node.Left) >= 0 {
                // 右回転
                return t.rightRotate(node)
            } else {
                // 左回転してから右回転
                node.Left = t.leftRotate(node.Left)
                return t.rightRotate(node)
            }
        }
        // 右に偏った木
        if bf < -1 {
            if t.balanceFactor(node.Right) <= 0 {
                // 左回転
                return t.leftRotate(node)
            } else {
                // 右回転してから左回転
                node.Right = t.rightRotate(node.Right)
                return t.leftRotate(node)
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* 回転操作を行い、この部分木の平衡を回復する */
    func rotate(node: TreeNode?) -> TreeNode? {
        // ノード node の平衡係数を取得
        let balanceFactor = balanceFactor(node: node)
        // 左に偏った木
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // 右回転
                return rightRotate(node: node)
            } else {
                // 左回転してから右回転
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // 右に偏った木
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // 左回転
                return leftRotate(node: node)
            } else {
                // 右回転してから左回転
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* 回転操作を行い、この部分木の平衡を回復する */
    #rotate(node) {
        // ノード node の平衡係数を取得
        const balanceFactor = this.balanceFactor(node);
        // 左に偏った木
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右回転
                return this.#rightRotate(node);
            } else {
                // 左回転してから右回転
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // 左回転
                return this.#leftRotate(node);
            } else {
                // 右回転してから左回転
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* 回転操作を行い、この部分木の平衡を回復する */
    rotate(node: TreeNode): TreeNode {
        // ノード node の平衡係数を取得
        const balanceFactor = this.balanceFactor(node);
        // 左に偏った木
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右回転
                return this.rightRotate(node);
            } else {
                // 左回転してから右回転
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // 左回転
                return this.leftRotate(node);
            } else {
                // 右回転してから左回転
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* 回転操作を行い、この部分木の平衡を回復する */
    TreeNode? rotate(TreeNode? node) {
      // ノード node の平衡係数を取得
      int factor = balanceFactor(node);
      // 左に偏った木
      if (factor > 1) {
        if (balanceFactor(node!.left) >= 0) {
          // 右回転
          return rightRotate(node);
        } else {
          // 左回転してから右回転
          node.left = leftRotate(node.left);
          return rightRotate(node);
        }
      }
      // 右に偏った木
      if (factor < -1) {
        if (balanceFactor(node!.right) <= 0) {
          // 左回転
          return leftRotate(node);
        } else {
          // 右回転してから左回転
          node.right = rightRotate(node.right);
          return leftRotate(node);
        }
      }
      // 平衡木なので回転不要、そのまま返す
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* 回転操作を行い、この部分木の平衡を回復する */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // ノード node の平衡係数を取得
        let balance_factor = Self::balance_factor(node.clone());
        // 左に偏った木
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // 右回転
                Self::right_rotate(Some(node))
            } else {
                // 左回転してから右回転
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // 右に偏った木
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // 左回転
                Self::left_rotate(Some(node))
            } else {
                // 右回転してから左回転
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // 平衡木なので回転不要、そのまま返す
            node
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* 回転操作を行い、この部分木の平衡を回復する */
    TreeNode *rotate(TreeNode *node) {
        // ノード node の平衡係数を取得
        int bf = balanceFactor(node);
        // 左に偏った木
        if (bf > 1) {
            if (balanceFactor(node->left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 左回転してから右回転
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // 右に偏った木
        if (bf < -1) {
            if (balanceFactor(node->right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 右回転してから左回転
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* 回転操作を行い、この部分木の平衡を回復する */
    fun rotate(node: TreeNode): TreeNode {
        // ノード node の平衡係数を取得
        val balanceFactor = balanceFactor(node)
        // 左に偏った木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node)
            } else {
                // 左回転してから右回転
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左回転
                return leftRotate(node)
            } else {
                // 右回転してから左回転
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### 回転操作を行い、この部分木の平衡を回復する ###
    def rotate(node)
      # ノード node の平衡係数を取得
      balance_factor = balance_factor(node)
      # 左部分木をたどる
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # 右回転
          return right_rotate(node)
        else
          # 左回転してから右回転
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # 右に偏った木
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # 左回転
          return left_rotate(node)
        else
          # 右回転してから左回転
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # 平衡木なので回転不要、そのまま返す
      node
    end
    ```

## 7.5.3 &nbsp; AVL 木の基本操作

### 1. &nbsp; ノードの挿入

AVL 木のノード挿入は、基本的には二分探索木と同じです。唯一の違いは、AVL 木ではノード挿入後に、そのノードから根ノードまでの経路上に複数の不平衡ノードが現れる可能性があることです。したがって、**このノードから開始して、下から上へ回転操作を行い、すべての不平衡ノードを平衡に戻す必要があります**。コードは次のとおりです：

=== "Python"

    ```python title="avl_tree.py"
    def insert(self, val):
        """ノードを挿入"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """ノードを再帰的に挿入する（補助メソッド）"""
        if node is None:
            return TreeNode(val)
        # 1. 挿入位置を探索してノードを挿入
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # 重複ノードは挿入せず、そのまま返す
            return node
        # ノードの高さを更新する
        self.update_height(node)
        # 2. 回転操作を行い、部分木の平衡を回復する
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* ノードを挿入 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // 重複ノードは挿入せず、そのまま返す
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* ノードを挿入 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // 重複ノードは挿入せず、そのまま返す
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* ノードを挿入 */
    void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // 重複ノードは挿入せず、そのまま返す
        UpdateHeight(node);  // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = Rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* ノードを挿入 */
    func (t *aVLTree) insert(val int) {
        t.root = t.insertHelper(t.root, val)
    }

    /* ノードを再帰的に挿入する（補助関数） */
    func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return NewTreeNode(val)
        }
        /* 1. 挿入位置を探索してノードを挿入 */
        if val < node.Val.(int) {
            node.Left = t.insertHelper(node.Left, val)
        } else if val > node.Val.(int) {
            node.Right = t.insertHelper(node.Right, val)
        } else {
            // 重複ノードは挿入せず、そのまま返す
            return node
        }
        // ノードの高さを更新する
        t.updateHeight(node)
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = t.rotate(node)
        // 部分木の根ノードを返す
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* ノードを挿入 */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. 挿入位置を探索してノードを挿入 */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // 重複ノードは挿入せず、そのまま返す
        }
        updateHeight(node: node) // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node: node)
        // 部分木の根ノードを返す
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* ノードを挿入 */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // 重複ノードは挿入せず、そのまま返す
        this.#updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = this.#rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* ノードを挿入 */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // 重複ノードは挿入せず、そのまま返す
        }
        this.updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = this.rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* ノードを挿入 */
    void insert(int val) {
      root = insertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode? insertHelper(TreeNode? node, int val) {
      if (node == null) return TreeNode(val);
      /* 1. 挿入位置を探索してノードを挿入 */
      if (val < node.val)
        node.left = insertHelper(node.left, val);
      else if (val > node.val)
        node.right = insertHelper(node.right, val);
      else
        return node; // 重複ノードは挿入せず、そのまま返す
      updateHeight(node); // ノードの高さを更新する
      /* 2. 回転操作を行い、部分木の平衡を回復する */
      node = rotate(node);
      // 部分木の根ノードを返す
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* ノードを挿入 */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 挿入位置を探索してノードを挿入 */
                match {
                    let node_val = node.borrow().val;
                    node_val
                }
                .cmp(&val)
                {
                    Ordering::Greater => {
                        let left = node.borrow().left.clone();
                        node.borrow_mut().left = Self::insert_helper(left, val);
                    }
                    Ordering::Less => {
                        let right = node.borrow().right.clone();
                        node.borrow_mut().right = Self::insert_helper(right, val);
                    }
                    Ordering::Equal => {
                        return Some(node); // 重複ノードは挿入せず、そのまま返す
                    }
                }
                Self::update_height(Some(node.clone())); // ノードの高さを更新する

                /* 2. 回転操作を行い、部分木の平衡を回復する */
                node = Self::rotate(Some(node)).unwrap();
                // 部分木の根ノードを返す
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* ノードを挿入 */
    void insert(AVLTree *tree, int val) {
        tree->root = insertHelper(tree->root, val);
    }

    /* ノードを再帰的に挿入する（補助関数） */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == NULL) {
            return newTreeNode(val);
        }
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node->val) {
            node->left = insertHelper(node->left, val);
        } else if (val > node->val) {
            node->right = insertHelper(node->right, val);
        } else {
            // 重複ノードは挿入せず、そのまま返す
            return node;
        }
        // ノードの高さを更新する
        updateHeight(node);
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* ノードを挿入 */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. 挿入位置を探索してノードを挿入 */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // 重複ノードは挿入せず、そのまま返す
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根ノードを返す
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### ノードを挿入 ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    ### ノードを挿入 ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    # ## ノードを再帰的に挿入（補助メソッド）###
    def insert_helper(node, val)
      return TreeNode.new(val) if node.nil?
      # 1. 挿入位置を探索してノードを挿入
      if val < node.val
        node.left = insert_helper(node.left, val)
      elsif val > node.val
        node.right = insert_helper(node.right, val)
      else
        # 重複ノードは挿入せず、そのまま返す
        return node
      end
      # ノードの高さを更新する
      update_height(node)
      # 2. 回転操作を行い、部分木の平衡を回復する
      rotate(node)
    end
    ```

### 2. &nbsp; ノードの削除

同様に、二分探索木のノード削除メソッドを土台として、下から上へ回転操作を行い、すべての不平衡ノードを平衡に戻す必要があります。コードは次のとおりです：

=== "Python"

    ```python title="avl_tree.py"
    def remove(self, val: int):
        """ノードを削除"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """ノードを再帰的に削除する（補助メソッド）"""
        if node is None:
            return None
        # 1. ノードを探索して削除
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # 子ノード数 = 0 の場合、node をそのまま削除して返す
                if child is None:
                    return None
                # 子ノード数 = 1 の場合、node をそのまま削除する
                else:
                    node = child
            else:
                # 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # ノードの高さを更新する
        self.update_height(node)
        # 2. 回転操作を行い、部分木の平衡を回復する
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* ノードを削除 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. ノードを探索して削除 */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else {
                    delete node;
                    node = child;
                }
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* ノードを削除 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. ノードを探索して削除 */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == null)
                    return null;
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else
                    node = child;
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* ノードを削除 */
    void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. ノードを探索して削除 */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == null)
                    return null;
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else
                    node = child;
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = Rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* ノードを削除 */
    func (t *aVLTree) remove(val int) {
        t.root = t.removeHelper(t.root, val)
    }

    /* ノードを再帰的に削除する（補助関数） */
    func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return nil
        }
        /* 1. ノードを探索して削除 */
        if val < node.Val.(int) {
            node.Left = t.removeHelper(node.Left, val)
        } else if val > node.Val.(int) {
            node.Right = t.removeHelper(node.Right, val)
        } else {
            if node.Left == nil || node.Right == nil {
                child := node.Left
                if node.Right != nil {
                    child = node.Right
                }
                if child == nil {
                    // 子ノード数 = 0 の場合、node をそのまま削除して返す
                    return nil
                } else {
                    // 子ノード数 = 1 の場合、node をそのまま削除する
                    node = child
                }
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                temp := node.Right
                for temp.Left != nil {
                    temp = temp.Left
                }
                node.Right = t.removeHelper(node.Right, temp.Val.(int))
                node.Val = temp.Val
            }
        }
        // ノードの高さを更新する
        t.updateHeight(node)
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = t.rotate(node)
        // 部分木の根ノードを返す
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* ノードを削除 */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. ノードを探索して削除 */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if child == nil {
                    return nil
                }
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else {
                    node = child
                }
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node: node)
        // 部分木の根ノードを返す
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* ノードを削除 */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. ノードを探索して削除 */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child === null) return null;
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else node = child;
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = this.#rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* ノードを削除 */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. ノードを探索して削除 */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child === null) {
                    return null;
                } else {
                    // 子ノード数 = 1 の場合、node をそのまま削除する
                    node = child;
                }
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = this.rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* ノードを削除 */
    void remove(int val) {
      root = removeHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode? removeHelper(TreeNode? node, int val) {
      if (node == null) return null;
      /* 1. ノードを探索して削除 */
      if (val < node.val)
        node.left = removeHelper(node.left, val);
      else if (val > node.val)
        node.right = removeHelper(node.right, val);
      else {
        if (node.left == null || node.right == null) {
          TreeNode? child = node.left ?? node.right;
          // 子ノード数 = 0 の場合、node をそのまま削除して返す
          if (child == null)
            return null;
          // 子ノード数 = 1 の場合、node をそのまま削除する
          else
            node = child;
        } else {
          // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
          TreeNode? temp = node.right;
          while (temp!.left != null) {
            temp = temp.left;
          }
          node.right = removeHelper(node.right, temp.val);
          node.val = temp.val;
        }
      }
      updateHeight(node); // ノードの高さを更新する
      /* 2. 回転操作を行い、部分木の平衡を回復する */
      node = rotate(node);
      // 部分木の根ノードを返す
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* ノードを削除 */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. ノードを探索して削除 */
                if val < node.borrow().val {
                    let left = node.borrow().left.clone();
                    node.borrow_mut().left = Self::remove_helper(left, val);
                } else if val > node.borrow().val {
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, val);
                } else if node.borrow().left.is_none() || node.borrow().right.is_none() {
                    let child = if node.borrow().left.is_some() {
                        node.borrow().left.clone()
                    } else {
                        node.borrow().right.clone()
                    };
                    match child {
                        // 子ノード数 = 0 の場合、node をそのまま削除して返す
                        None => {
                            return None;
                        }
                        // 子ノード数 = 1 の場合、node をそのまま削除する
                        Some(child) => node = child,
                    }
                } else {
                    // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                    let mut temp = node.borrow().right.clone().unwrap();
                    loop {
                        let temp_left = temp.borrow().left.clone();
                        if temp_left.is_none() {
                            break;
                        }
                        temp = temp_left.unwrap();
                    }
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, temp.borrow().val);
                    node.borrow_mut().val = temp.borrow().val;
                }
                Self::update_height(Some(node.clone())); // ノードの高さを更新する

                /* 2. 回転操作を行い、部分木の平衡を回復する */
                node = Self::rotate(Some(node)).unwrap();
                // 部分木の根ノードを返す
                Some(node)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* ノードを削除 */
    // stdio.h を導入しているため、ここでは remove 識別子を使えない
    void removeItem(AVLTree *tree, int val) {
        TreeNode *root = removeHelper(tree->root, val);
    }

    /* ノードを再帰的に削除する（補助関数） */
    TreeNode *removeHelper(TreeNode *node, int val) {
        TreeNode *child, *grandChild;
        if (node == NULL) {
            return NULL;
        }
        /* 1. ノードを探索して削除 */
        if (val < node->val) {
            node->left = removeHelper(node->left, val);
        } else if (val > node->val) {
            node->right = removeHelper(node->right, val);
        } else {
            if (node->left == NULL || node->right == NULL) {
                child = node->left;
                if (node->right != NULL) {
                    child = node->right;
                }
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == NULL) {
                    return NULL;
                } else {
                    // 子ノード数 = 1 の場合、node をそのまま削除する
                    node = child;
                }
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode *temp = node->right;
                while (temp->left != NULL) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        // ノードの高さを更新する
        updateHeight(node);
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* ノードを削除 */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. ノードを探索して削除 */
        if (_val < node._val)
            node.left = removeHelper(node.left, _val)
        else if (_val > node._val)
            node.right = removeHelper(node.right, _val)
        else {
            if (node.left == null || node.right == null) {
                val child = if (node.left != null)
                    node.left
                else
                    node.right
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == null)
                    return null
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else
                    node = child
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根ノードを返す
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### ノードを削除 ###
    def remove(val)
      @root = remove_helper(@root, val)
    end

    ### ノードを削除 ###
    def remove(val)
      @root = remove_helper(@root, val)
    end

    # ## ノードを再帰的に削除（補助メソッド）###
    def remove_helper(node, val)
      return if node.nil?
      # 1. ノードを探索して削除
      if val < node.val
        node.left = remove_helper(node.left, val)
      elsif val > node.val
        node.right = remove_helper(node.right, val)
      else
        if node.left.nil? || node.right.nil?
          child = node.left || node.right
          # 子ノード数 = 0 の場合、node をそのまま削除して返す
          return if child.nil?
          # 子ノード数 = 1 の場合、node をそのまま削除する
          node = child
        else
          # 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
          temp = node.right
          while !temp.left.nil?
            temp = temp.left
          end
          node.right = remove_helper(node.right, temp.val)
          node.val = temp.val
        end
      end
      # ノードの高さを更新する
      update_height(node)
      # 2. 回転操作を行い、部分木の平衡を回復する
      rotate(node)
    end
    ```

### 3. &nbsp; ノードの探索

AVL 木のノード探索操作は二分探索木と同じなので、ここでは繰り返しません。

## 7.5.4 &nbsp; AVL 木の代表的な応用

- 大規模データの整理・格納に用いられ、高頻度の探索と低頻度の追加・削除に適しています。
- データベースのインデックスシステムの構築に使われます。
- 赤黒木も代表的な平衡二分探索木の一つです。AVL 木と比べると、赤黒木は平衡条件がより緩く、ノードの挿入・削除に必要な回転操作が少ないため、平均的な更新効率はより高くなります。
