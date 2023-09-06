# AVL 树 *

在二叉搜索树章节中，我们提到了在多次插入和删除操作后，二叉搜索树可能退化为链表。这种情况下，所有操作的时间复杂度将从 $O(\log n)$ 恶化为 $O(n)$。

如下图所示，经过两次删除节点操作，这个二叉搜索树便会退化为链表。

![AVL 树在删除节点后发生退化](avl_tree.assets/avltree_degradation_from_removing_node.png)

再例如，在下图的完美二叉树中插入两个节点后，树将严重向左倾斜，查找操作的时间复杂度也随之恶化。

![AVL 树在插入节点后发生退化](avl_tree.assets/avltree_degradation_from_inserting_node.png)

G. M. Adelson-Velsky 和 E. M. Landis 在其 1962 年发表的论文 "An algorithm for the organization of information" 中提出了「AVL 树」。论文中详细描述了一系列操作，确保在持续添加和删除节点后，AVL 树不会退化，从而使得各种操作的时间复杂度保持在 $O(\log n)$ 级别。换句话说，在需要频繁进行增删查改操作的场景中，AVL 树能始终保持高效的数据操作性能，具有很好的应用价值。

## AVL 树常见术语

AVL 树既是二叉搜索树也是平衡二叉树，同时满足这两类二叉树的所有性质，因此也被称为「平衡二叉搜索树 balanced binary search tree」。

### 节点高度

由于 AVL 树的相关操作需要获取节点高度，因此我们需要为节点类添加 `height` 变量。

=== "Python"

    ```python title=""
    class TreeNode:
        """AVL 树节点类"""
        def __init__(self, val: int):
            self.val: int = val                    # 节点值
            self.height: int = 0                   # 节点高度
            self.left: Optional[TreeNode] = None   # 左子节点引用
            self.right: Optional[TreeNode] = None  # 右子节点引用
    ```

=== "C++"

    ```cpp title=""
    /* AVL 树节点类 */
    struct TreeNode {
        int val{};          // 节点值
        int height = 0;     // 节点高度
        TreeNode *left{};   // 左子节点
        TreeNode *right{};  // 右子节点
        TreeNode() = default;
        explicit TreeNode(int x) : val(x){}
    };
    ```

=== "Java"

    ```java title=""
    /* AVL 树节点类 */
    class TreeNode {
        public int val;        // 节点值
        public int height;     // 节点高度
        public TreeNode left;  // 左子节点
        public TreeNode right; // 右子节点
        public TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* AVL 树节点类 */
    class TreeNode {
        public int val;          // 节点值
        public int height;       // 节点高度
        public TreeNode? left;   // 左子节点
        public TreeNode? right;  // 右子节点
        public TreeNode(int x) { val = x; }
    }
    ```

=== "Go"

    ```go title=""
    /* AVL 树节点结构体 */
    type TreeNode struct {
        Val    int       // 节点值
        Height int       // 节点高度
        Left   *TreeNode // 左子节点引用
        Right  *TreeNode // 右子节点引用
    }
    ```

=== "Swift"

    ```swift title=""
    /* AVL 树节点类 */
    class TreeNode {
        var val: Int // 节点值
        var height: Int // 节点高度
        var left: TreeNode? // 左子节点
        var right: TreeNode? // 右子节点

        init(x: Int) {
            val = x
            height = 0
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* AVL 树节点类 */
    class TreeNode {
        val; // 节点值
        height; //节点高度
        left; // 左子节点指针
        right; // 右子节点指针
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
    /* AVL 树节点类 */
    class TreeNode {
        val: number;            // 节点值
        height: number;         // 节点高度
        left: TreeNode | null;  // 左子节点指针
        right: TreeNode | null; // 右子节点指针
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
    /* AVL 树节点类 */
    class TreeNode {
      int val;         // 节点值
      int height;      // 节点高度
      TreeNode? left;  // 左子节点
      TreeNode? right; // 右子节点
      TreeNode(this.val, [this.height = 0, this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""

    ```

=== "C"

    ```c title=""
    /* AVL 树节点结构体 */
    struct TreeNode {
        int val;
        int height;
        struct TreeNode *left;
        struct TreeNode *right;
    };

    typedef struct TreeNode TreeNode;

    /* 构造函数 */
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

=== "Zig"

    ```zig title=""

    ```

“节点高度”是指从该节点到最远叶节点的距离，即所经过的“边”的数量。需要特别注意的是，叶节点的高度为 0 ，而空节点的高度为 -1 。我们将创建两个工具函数，分别用于获取和更新节点的高度。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{__update_height}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
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

    [class]{AVLTree}-[func]{#updateHeight}
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

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

### 节点平衡因子

节点的「平衡因子 balance factor」定义为节点左子树的高度减去右子树的高度，同时规定空节点的平衡因子为 0 。我们同样将获取节点平衡因子的功能封装成函数，方便后续使用。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{balance_factor}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{balanceFactor}
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

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

!!! note

    设平衡因子为 $f$ ，则一棵 AVL 树的任意节点的平衡因子皆满足 $-1 \le f \le 1$ 。

## AVL 树旋转

AVL 树的特点在于“旋转”操作，它能够在不影响二叉树的中序遍历序列的前提下，使失衡节点重新恢复平衡。换句话说，**旋转操作既能保持“二叉搜索树”的性质，也能使树重新变为“平衡二叉树”**。

我们将平衡因子绝对值 $> 1$ 的节点称为“失衡节点”。根据节点失衡情况的不同，旋转操作分为四种：右旋、左旋、先右旋后左旋、先左旋后右旋。下面我们将详细介绍这些旋转操作。

### 右旋

如下图所示，节点下方为平衡因子。从底至顶看，二叉树中首个失衡节点是“节点 3”。我们关注以该失衡节点为根节点的子树，将该节点记为 `node` ，其左子节点记为 `child` ，执行“右旋”操作。完成右旋后，子树已经恢复平衡，并且仍然保持二叉搜索树的特性。

=== "<1>"
    ![右旋操作步骤](avl_tree.assets/avltree_right_rotate_step1.png)

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png)

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png)

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png)

如下图所示，当节点 `child` 有右子节点（记为 `grandChild` ）时，需要在右旋中添加一步：将 `grandChild` 作为 `node` 的左子节点。

![有 grandChild 的右旋操作](avl_tree.assets/avltree_right_rotate_with_grandchild.png)

“向右旋转”是一种形象化的说法，实际上需要通过修改节点指针来实现，代码如下所示。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{__right_rotate}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{rightRotate}
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
    [class]{AVLTree}-[func]{#rightRotate}
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

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{rightRotate}
    ```

### 左旋

相应的，如果考虑上述失衡二叉树的“镜像”，则需要执行下图所示的“左旋”操作。

![左旋操作](avl_tree.assets/avltree_left_rotate.png)

同理，如下图所示，当节点 `child` 有左子节点（记为 `grandChild` ）时，需要在左旋中添加一步：将 `grandChild` 作为 `node` 的右子节点。

![有 grandChild 的左旋操作](avl_tree.assets/avltree_left_rotate_with_grandchild.png)

可以观察到，**右旋和左旋操作在逻辑上是镜像对称的，它们分别解决的两种失衡情况也是对称的**。基于对称性，我们只需将右旋的实现代码中的所有的 `left` 替换为 `right` ，将所有的 `right` 替换为 `left` ，即可得到左旋的实现代码。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{__left_rotate}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{leftRotate}
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
    [class]{AVLTree}-[func]{#leftRotate}
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

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{leftRotate}
    ```

### 先左旋后右旋

对于下图中的失衡节点 3 ，仅使用左旋或右旋都无法使子树恢复平衡。此时需要先对 `child` 执行“左旋”，再对 `node` 执行“右旋”。

![先左旋后右旋](avl_tree.assets/avltree_left_right_rotate.png)

### 先右旋后左旋

如下图所示，对于上述失衡二叉树的镜像情况，需要先对 `child` 执行“右旋”，然后对 `node` 执行“左旋”。

![先右旋后左旋](avl_tree.assets/avltree_right_left_rotate.png)

### 旋转的选择

下图展示的四种失衡情况与上述案例逐个对应，分别需要采用右旋、左旋、先右后左、先左后右的旋转操作。

![AVL 树的四种旋转情况](avl_tree.assets/avltree_rotation_cases.png)

如下表所示，我们通过判断失衡节点的平衡因子以及较高一侧子节点的平衡因子的正负号，来确定失衡节点属于上图中的哪种情况。

<p align="center"> 表 <id> &nbsp; 四种旋转情况的选择条件 </p>

| 失衡节点的平衡因子 | 子节点的平衡因子 | 应采用的旋转方法 |
| ---------------- | ---------------- | ---------------- |
| $> 1$ （即左偏树）  | $\geq 0$         | 右旋             |
| $> 1$ （即左偏树）  | $<0$             | 先左旋后右旋     |
| $< -1$ （即右偏树）  | $\leq 0$         | 左旋             |
| $< -1$ （即右偏树）  | $>0$             | 先右旋后左旋     |

为了便于使用，我们将旋转操作封装成一个函数。**有了这个函数，我们就能对各种失衡情况进行旋转，使失衡节点重新恢复平衡**。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{__rotate}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{rotate}
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
    [class]{AVLTree}-[func]{#rotate}
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

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{rotate}
    ```

## AVL 树常用操作

### 插入节点

AVL 树的节点插入操作与二叉搜索树在主体上类似。唯一的区别在于，在 AVL 树中插入节点后，从该节点到根节点的路径上可能会出现一系列失衡节点。因此，**我们需要从这个节点开始，自底向上执行旋转操作，使所有失衡节点恢复平衡**。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{__insert_helper}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
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

    [class]{AVLTree}-[func]{#insertHelper}
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
    [class]{aVLTree}-[func]{insert}

    [class]{}-[func]{insertHelper}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

### 删除节点

类似地，在二叉搜索树的删除节点方法的基础上，需要从底至顶地执行旋转操作，使所有失衡节点恢复平衡。

=== "Python"

    ```python title="avl_tree.py"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{__remove_helper}
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "Java"

    ```java title="avl_tree.java"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
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

    [class]{AVLTree}-[func]{#removeHelper}
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
    [class]{aVLTree}-[func]{removeNode}

    [class]{}-[func]{removeHelper}
    ```

=== "Zig"

    ```zig title="avl_tree.zig"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

### 查找节点

AVL 树的节点查找操作与二叉搜索树一致，在此不再赘述。

## AVL 树典型应用

- 组织和存储大型数据，适用于高频查找、低频增删的场景。
- 用于构建数据库中的索引系统。
- 红黑树在许多应用中比 AVL 树更受欢迎。这是因为红黑树的平衡条件相对宽松，在红黑树中插入与删除节点所需的旋转操作相对较少，其节点增删操作的平均效率更高。
