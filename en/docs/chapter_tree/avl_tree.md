---
comments: true
---

# 7.5 &nbsp; AVL tree *

In the "Binary Search Tree" section, we mentioned that after multiple insertions and removals, a binary search tree might degrade to a linked list. In such cases, the time complexity of all operations degrades from $O(\log n)$ to $O(n)$.

As shown in Figure 7-24, after two node removal operations, this binary search tree will degrade into a linked list.

![Degradation of an AVL tree after removing nodes](avl_tree.assets/avltree_degradation_from_removing_node.png){ class="animation-figure" }

<p align="center"> Figure 7-24 &nbsp; Degradation of an AVL tree after removing nodes </p>

For example, in the perfect binary tree shown in Figure 7-25, after inserting two nodes, the tree will lean heavily to the left, and the time complexity of search operations will also degrade.

![Degradation of an AVL tree after inserting nodes](avl_tree.assets/avltree_degradation_from_inserting_node.png){ class="animation-figure" }

<p align="center"> Figure 7-25 &nbsp; Degradation of an AVL tree after inserting nodes </p>

In 1962, G. M. Adelson-Velsky and E. M. Landis proposed the <u>AVL Tree</u> in their paper "An algorithm for the organization of information". The paper detailed a series of operations to ensure that after continuously adding and removing nodes, the AVL tree would not degrade, thus maintaining the time complexity of various operations at $O(\log n)$ level. In other words, in scenarios where frequent additions, removals, searches, and modifications are needed, the AVL tree can always maintain efficient data operation performance, which has great application value.

## 7.5.1 &nbsp; Common terminology in AVL trees

An AVL tree is both a binary search tree and a balanced binary tree, satisfying all properties of these two types of binary trees, hence it is a <u>balanced binary search tree</u>.

### 1. &nbsp; Node height

Since the operations related to AVL trees require obtaining node heights, we need to add a `height` variable to the node class:

=== "Python"

    ```python title=""
    class TreeNode:
        """AVL tree node"""
        def __init__(self, val: int):
            self.val: int = val                 # Node value
            self.height: int = 0                # Node height
            self.left: TreeNode | None = None   # Left child reference
            self.right: TreeNode | None = None  # Right child reference
    ```

=== "C++"

    ```cpp title=""
    /* AVL tree node */
    struct TreeNode {
        int val{};          // Node value
        int height = 0;     // Node height
        TreeNode *left{};   // Left child
        TreeNode *right{};  // Right child
        TreeNode() = default;
        explicit TreeNode(int x) : val(x){}
    };
    ```

=== "Java"

    ```java title=""
    /* AVL tree node */
    class TreeNode {
        public int val;        // Node value
        public int height;     // Node height
        public TreeNode left;  // Left child
        public TreeNode right; // Right child
        public TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* AVL tree node */
    class TreeNode(int? x) {
        public int? val = x;    // Node value
        public int height;      // Node height
        public TreeNode? left;  // Left child reference
        public TreeNode? right; // Right child reference
    }
    ```

=== "Go"

    ```go title=""
    /* AVL tree node */
    type TreeNode struct {
        Val    int       // Node value
        Height int       // Node height
        Left   *TreeNode // Left child reference
        Right  *TreeNode // Right child reference
    }
    ```

=== "Swift"

    ```swift title=""
    /* AVL tree node */
    class TreeNode {
        var val: Int // Node value
        var height: Int // Node height
        var left: TreeNode? // Left child
        var right: TreeNode? // Right child

        init(x: Int) {
            val = x
            height = 0
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* AVL tree node */
    class TreeNode {
        val; // Node value
        height; // Node height
        left; // Left child pointer
        right; // Right child pointer
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
    /* AVL tree node */
    class TreeNode {
        val: number;            // Node value
        height: number;         // Node height
        left: TreeNode | null;  // Left child pointer
        right: TreeNode | null; // Right child pointer
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
    /* AVL tree node */
    class TreeNode {
      int val;         // Node value
      int height;      // Node height
      TreeNode? left;  // Left child
      TreeNode? right; // Right child
      TreeNode(this.val, [this.height = 0, this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* AVL tree node */
    struct TreeNode {
        val: i32,                               // Node value
        height: i32,                            // Node height
        left: Option<Rc<RefCell<TreeNode>>>,    // Left child
        right: Option<Rc<RefCell<TreeNode>>>,   // Right child
    }

    impl TreeNode {
        /* Constructor */
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
    /* AVL tree node */
    TreeNode struct TreeNode {
        int val;
        int height;
        struct TreeNode *left;
        struct TreeNode *right;
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

=== "Kotlin"

    ```kotlin title=""
    /* AVL tree node */
    class TreeNode(val _val: Int) {  // Node value
        val height: Int = 0          // Node height
        val left: TreeNode? = null   // Left child
        val right: TreeNode? = null  // Right child
    }
    ```

=== "Ruby"

    ```ruby title=""

    ```

=== "Zig"

    ```zig title=""

    ```

The "node height" refers to the distance from that node to its farthest leaf node, i.e., the number of "edges" passed. It is important to note that the height of a leaf node is $0$, and the height of a null node is $-1$. We will create two utility functions for getting and updating the height of a node:

=== "Python"

    ```python title="avl_tree.py"
    def height(self, node: TreeNode | None) -> int:
        """Get node height"""
        # Empty node height is -1, leaf node height is 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """Update node height"""
        # Node height equals the height of the tallest subtree + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{height}

    [class]{AVLTree}-[func]{updateHeight}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Get node height */
    int height(TreeNode node) {
        // Empty node height is -1, leaf node height is 0
        return node == null ? -1 : node.height;
    }

    /* Update node height */
    void updateHeight(TreeNode node) {
        // Node height equals the height of the tallest subtree + 1
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

### 2. &nbsp; Node balance factor

The <u>balance factor</u> of a node is defined as the height of the node's left subtree minus the height of its right subtree, with the balance factor of a null node defined as $0$. We will also encapsulate the functionality of obtaining the node balance factor into a function for easy use later on:

=== "Python"

    ```python title="avl_tree.py"
    def balance_factor(self, node: TreeNode | None) -> int:
        """Get balance factor"""
        # Empty node balance factor is 0
        if node is None:
            return 0
        # Node balance factor = left subtree height - right subtree height
        return self.height(node.left) - self.height(node.right)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{balanceFactor}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Get balance factor */
    int balanceFactor(TreeNode node) {
        // Empty node balance factor is 0
        if (node == null)
            return 0;
        // Node balance factor = left subtree height - right subtree height
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

    Let the balance factor be $f$, then the balance factor of any node in an AVL tree satisfies $-1 \le f \le 1$.

## 7.5.2 &nbsp; Rotations in AVL trees

The characteristic feature of an AVL tree is the "rotation" operation, which can restore balance to an unbalanced node without affecting the in-order traversal sequence of the binary tree. In other words, **the rotation operation can maintain the property of a "binary search tree" while also turning the tree back into a "balanced binary tree"**.

We call nodes with an absolute balance factor $> 1$ "unbalanced nodes". Depending on the type of imbalance, there are four kinds of rotations: right rotation, left rotation, right-left rotation, and left-right rotation. Below, we detail these rotation operations.

### 1. &nbsp; Right rotation

As shown in Figure 7-26, the first unbalanced node from the bottom up in the binary tree is "node 3". Focusing on the subtree with this unbalanced node as the root, denoted as `node`, and its left child as `child`, perform a "right rotation". After the right rotation, the subtree is balanced again while still maintaining the properties of a binary search tree.

=== "<1>"
    ![Steps of right rotation](avl_tree.assets/avltree_right_rotate_step1.png){ class="animation-figure" }

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png){ class="animation-figure" }

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png){ class="animation-figure" }

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-26 &nbsp; Steps of right rotation </p>

As shown in Figure 7-27, when the `child` node has a right child (denoted as `grand_child`), a step needs to be added in the right rotation: set `grand_child` as the left child of `node`.

![Right rotation with grand_child](avl_tree.assets/avltree_right_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Figure 7-27 &nbsp; Right rotation with grand_child </p>

"Right rotation" is a figurative term; in practice, it is achieved by modifying node pointers, as shown in the following code:

=== "Python"

    ```python title="avl_tree.py"
    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Right rotation operation"""
        child = node.left
        grand_child = child.right
        # Rotate node to the right around child
        child.right = node
        node.left = grand_child
        # Update node height
        self.update_height(node)
        self.update_height(child)
        # Return the root of the subtree after rotation
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{rightRotate}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Right rotation operation */
    TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the subtree after rotation
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

### 2. &nbsp; Left rotation

Correspondingly, if considering the "mirror" of the above unbalanced binary tree, the "left rotation" operation shown in Figure 7-28 needs to be performed.

![Left rotation operation](avl_tree.assets/avltree_left_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-28 &nbsp; Left rotation operation </p>

Similarly, as shown in Figure 7-29, when the `child` node has a left child (denoted as `grand_child`), a step needs to be added in the left rotation: set `grand_child` as the right child of `node`.

![Left rotation with grand_child](avl_tree.assets/avltree_left_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Figure 7-29 &nbsp; Left rotation with grand_child </p>

It can be observed that **the right and left rotation operations are logically symmetrical, and they solve two symmetrical types of imbalance**. Based on symmetry, by replacing all `left` with `right`, and all `right` with `left` in the implementation code of right rotation, we can get the implementation code for left rotation:

=== "Python"

    ```python title="avl_tree.py"
    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Left rotation operation"""
        child = node.right
        grand_child = child.left
        # Rotate node to the left around child
        child.left = node
        node.right = grand_child
        # Update node height
        self.update_height(node)
        self.update_height(child)
        # Return the root of the subtree after rotation
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{leftRotate}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Left rotation operation */
    TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the subtree after rotation
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

### 3. &nbsp; Right-left rotation

For the unbalanced node 3 shown in Figure 7-30, using either left or right rotation alone cannot restore balance to the subtree. In this case, a "left rotation" needs to be performed on `child` first, followed by a "right rotation" on `node`.

![Right-left rotation](avl_tree.assets/avltree_left_right_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-30 &nbsp; Right-left rotation </p>

### 4. &nbsp; Left-right rotation

As shown in Figure 7-31, for the mirror case of the above unbalanced binary tree, a "right rotation" needs to be performed on `child` first, followed by a "left rotation" on `node`.

![Left-right rotation](avl_tree.assets/avltree_right_left_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-31 &nbsp; Left-right rotation </p>

### 5. &nbsp; Choice of rotation

The four kinds of imbalances shown in Figure 7-32 correspond to the cases described above, respectively requiring right rotation, left-right rotation, right-left rotation, and left rotation.

![The four rotation cases of AVL tree](avl_tree.assets/avltree_rotation_cases.png){ class="animation-figure" }

<p align="center"> Figure 7-32 &nbsp; The four rotation cases of AVL tree </p>

As shown in Table 7-3, we determine which of the above cases an unbalanced node belongs to by judging the sign of the balance factor of the unbalanced node and its higher-side child's balance factor.

<p align="center"> Table 7-3 &nbsp; Conditions for Choosing Among the Four Rotation Cases </p>

<div class="center-table" markdown>

| Balance factor of unbalanced node | Balance factor of child node | Rotation method to use            |
| --------------------------------- | ---------------------------- | --------------------------------- |
| $> 1$ (Left-leaning tree)         | $\geq 0$                     | Right rotation                    |
| $> 1$ (Left-leaning tree)         | $<0$                         | Left rotation then right rotation |
| $< -1$ (Right-leaning tree)       | $\leq 0$                     | Left rotation                     |
| $< -1$ (Right-leaning tree)       | $>0$                         | Right rotation then left rotation |

</div>

For convenience, we encapsulate the rotation operations into a function. **With this function, we can perform rotations on various kinds of imbalances, restoring balance to unbalanced nodes**. The code is as follows:

=== "Python"

    ```python title="avl_tree.py"
    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Perform rotation operation to restore balance to the subtree"""
        # Get the balance factor of node
        balance_factor = self.balance_factor(node)
        # Left-leaning tree
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # Right rotation
                return self.right_rotate(node)
            else:
                # First left rotation then right rotation
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # Right-leaning tree
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # Left rotation
                return self.left_rotate(node)
            else:
                # First right rotation then left rotation
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # Balanced tree, no rotation needed, return
        return node
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{rotate}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Perform rotation operation to restore balance to the subtree */
    TreeNode rotate(TreeNode node) {
        // Get the balance factor of node
        int balanceFactor = balanceFactor(node);
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Right rotation
                return rightRotate(node);
            } else {
                // First left rotation then right rotation
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Left rotation
                return leftRotate(node);
            } else {
                // First right rotation then left rotation
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return
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

## 7.5.3 &nbsp; Common operations in AVL trees

### 1. &nbsp; Node insertion

The node insertion operation in AVL trees is similar to that in binary search trees. The only difference is that after inserting a node in an AVL tree, a series of unbalanced nodes may appear along the path from that node to the root node. Therefore, **we need to start from this node and perform rotation operations upwards to restore balance to all unbalanced nodes**. The code is as follows:

=== "Python"

    ```python title="avl_tree.py"
    def insert(self, val):
        """Insert node"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """Recursively insert node (helper method)"""
        if node is None:
            return TreeNode(val)
        # 1. Find insertion position and insert node
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # Do not insert duplicate nodes, return
            return node
        # Update node height
        self.update_height(node)
        # 2. Perform rotation operation to restore balance to the subtree
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{insert}

    [class]{AVLTree}-[func]{insertHelper}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Insert node */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Recursively insert node (helper method) */
    TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // Do not insert duplicate nodes, return
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = rotate(node);
        // Return the root node of the subtree
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

### 2. &nbsp; Node removal

Similarly, based on the method of removing nodes in binary search trees, rotation operations need to be performed from the bottom up to restore balance to all unbalanced nodes. The code is as follows:

=== "Python"

    ```python title="avl_tree.py"
    def remove(self, val: int):
        """Remove node"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Recursively remove node (helper method)"""
        if node is None:
            return None
        # 1. Find and remove the node
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # Number of child nodes = 0, remove node and return
                if child is None:
                    return None
                # Number of child nodes = 1, remove node
                else:
                    node = child
            else:
                # Number of child nodes = 2, remove the next node in in-order traversal and replace the current node with it
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Update node height
        self.update_height(node)
        # 2. Perform rotation operation to restore balance to the subtree
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    [class]{AVLTree}-[func]{remove}

    [class]{AVLTree}-[func]{removeHelper}
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Remove node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Recursively remove node (helper method) */
    TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. Find and remove the node */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // Number of child nodes = 0, remove node and return
                if (child == null)
                    return null;
                // Number of child nodes = 1, remove node
                else
                    node = child;
            } else {
                // Number of child nodes = 2, remove the next node in in-order traversal and replace the current node with it
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = rotate(node);
        // Return the root node of the subtree
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

### 3. &nbsp; Node search

The node search operation in AVL trees is consistent with that in binary search trees and will not be detailed here.

## 7.5.4 &nbsp; Typical applications of AVL trees

- Organizing and storing large amounts of data, suitable for scenarios with high-frequency searches and low-frequency intertions and removals.
- Used to build index systems in databases.
- Red-black trees are also a common type of balanced binary search tree. Compared to AVL trees, red-black trees have more relaxed balancing conditions, require fewer rotations for node insertion and removal, and have a higher average efficiency for node addition and removal operations.
