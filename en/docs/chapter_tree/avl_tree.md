---
comments: true
---

# 7.5 &nbsp; AVL trees *

The binary-search-tree section explained that repeated insertions and deletions can make a tree degenerate into a linked list. All operations then degrade from $O(\log n)$ to $O(n)$ time.

In the example below, just two deletions turn the binary search tree into a linked list.

![An AVL-tree example degenerating after deletions](avl_tree.assets/avltree_degradation_from_removing_node.png){ class="animation-figure" }

<p align="center"> Figure 7-24 &nbsp; An AVL-tree example degenerating after deletions </p>

Likewise, inserting two nodes into the perfect binary tree below makes it heavily skewed to the left, degrading lookup performance.

![An AVL-tree example degenerating after insertions](avl_tree.assets/avltree_degradation_from_inserting_node.png){ class="animation-figure" }

<p align="center"> Figure 7-25 &nbsp; An AVL-tree example degenerating after insertions </p>

In 1962, G. M. Adelson-Velsky and E. M. Landis introduced the <u>AVL tree</u> in their paper “An algorithm for the organization of information.” They described operations that prevent degeneration through repeated insertions and deletions, keeping the time complexity of operations at $O(\log n)$. AVL trees therefore maintain efficient data operations when insertions, deletions, lookups, and updates are frequent, making them valuable in practice.

## 7.5.1 &nbsp; AVL tree terminology

An AVL tree is both a binary search tree and a balanced binary tree, satisfying the properties of both. It is therefore a <u>balanced binary search tree</u>.

### 1. &nbsp; Node height

AVL operations need node heights, so add a `height` variable to the node class:

=== "Python"

    ```python title=""
    class TreeNode:
        """AVL tree node class"""
        def __init__(self, val: int):
            self.val: int = val                 # Node value
            self.height: int = 0                # Node height
            self.left: TreeNode | None = None   # Left child reference
            self.right: TreeNode | None = None  # Right child reference
    ```

=== "C++"

    ```cpp title=""
    /* AVL tree node class */
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
    /* AVL tree node class */
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
    /* AVL tree node class */
    class TreeNode(int? x) {
        public int? val = x;    // Node value
        public int height;      // Node height
        public TreeNode? left;  // Left child reference
        public TreeNode? right; // Right child reference
    }
    ```

=== "Go"

    ```go title=""
    /* AVL tree node struct */
    type TreeNode struct {
        Val    int       // Node value
        Height int       // Node height
        Left   *TreeNode // Left child reference
        Right  *TreeNode // Right child reference
    }
    ```

=== "Swift"

    ```swift title=""
    /* AVL tree node class */
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
    /* AVL tree node class */
    class TreeNode {
        val; // Node value
        height; //Node height
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
    /* AVL tree node class */
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
    /* AVL tree node class */
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

    /* AVL tree node struct */
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
    /* AVL tree node struct */
    typedef struct TreeNode {
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
    /* AVL tree node class */
    class TreeNode(val _val: Int) {  // Node value
        var height: Int = 0          // Node height
        var left: TreeNode? = null   // Left child
        var right: TreeNode? = null  // Right child
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### AVL tree node class ###
    class TreeNode
      attr_accessor :val    # Node value
      attr_accessor :height # Node height
      attr_accessor :left   # Left child reference
      attr_accessor :right  # Right child reference

      def initialize(val)
        @val = val
        @height = 0
      end
    end
    ```

A node's height is the distance to its farthest leaf, measured in edges. A leaf has height $0$, while a missing node has height $-1$. We create two helper functions to retrieve and update a node's height:

=== "Python"

    ```python title="avl_tree.py"
    def height(self, node: TreeNode | None) -> int:
        """Get the node height"""
        # An empty subtree has height -1; a leaf has height 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """Update the node height"""
        # The node height equals the height of its taller subtree + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Get the node height */
    int height(TreeNode *node) {
        // A null node has height -1; a leaf has height 0
        return node == nullptr ? -1 : node->height;
    }

    /* Update the node height */
    void updateHeight(TreeNode *node) {
        // The node height equals the height of its taller subtree + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Get the node height */
    int height(TreeNode node) {
        // A null node has height -1; a leaf has height 0
        return node == null ? -1 : node.height;
    }

    /* Update the node height */
    void updateHeight(TreeNode node) {
        // The node height equals the height of its taller subtree + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Get the node height */
    int Height(TreeNode? node) {
        // A null node has height -1; a leaf has height 0
        return node == null ? -1 : node.height;
    }

    /* Update the node height */
    void UpdateHeight(TreeNode node) {
        // The node height equals the height of its taller subtree + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Get the node height */
    func (t *aVLTree) height(node *TreeNode) int {
        // A nil node has height -1; a leaf has height 0
        if node != nil {
            return node.Height
        }
        return -1
    }

    /* Update the node height */
    func (t *aVLTree) updateHeight(node *TreeNode) {
        lh := t.height(node.Left)
        rh := t.height(node.Right)
        // The node height equals the height of its taller subtree + 1
        if lh > rh {
            node.Height = lh + 1
        } else {
            node.Height = rh + 1
        }
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Get the node height */
    func height(node: TreeNode?) -> Int {
        // A nil node has height -1; a leaf has height 0
        node?.height ?? -1
    }

    /* Update the node height */
    func updateHeight(node: TreeNode?) {
        // The node height equals the height of its taller subtree + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Get the node height */
    height(node) {
        // A null node has height -1; a leaf has height 0
        return node === null ? -1 : node.height;
    }

    /* Update the node height */
    #updateHeight(node) {
        // The node height equals the height of its taller subtree + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Get the node height */
    height(node: TreeNode): number {
        // A null node has height -1; a leaf has height 0
        return node === null ? -1 : node.height;
    }

    /* Update the node height */
    updateHeight(node: TreeNode): void {
        // The node height equals the height of its taller subtree + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Get the node height */
    int height(TreeNode? node) {
      // A null node has height -1; a leaf has height 0
      return node == null ? -1 : node.height;
    }

    /* Update the node height */
    void updateHeight(TreeNode? node) {
      // The node height equals the height of its taller subtree + 1
      node!.height = max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Get the node height */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // A null node has height -1; a leaf has height 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* Update the node height */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // The node height equals the height of its taller subtree + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Get the node height */
    int height(TreeNode *node) {
        // A null node has height -1; a leaf has height 0
        if (node != NULL) {
            return node->height;
        }
        return -1;
    }

    /* Update the node height */
    void updateHeight(TreeNode *node) {
        int lh = height(node->left);
        int rh = height(node->right);
        // The node height equals the height of its taller subtree + 1
        if (lh > rh) {
            node->height = lh + 1;
        } else {
            node->height = rh + 1;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Get the node height */
    fun height(node: TreeNode?): Int {
        // A null node has height -1; a leaf has height 0
        return node?.height ?: -1
    }

    /* Update the node height */
    fun updateHeight(node: TreeNode?) {
        // The node height equals the height of its taller subtree + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Get the node height ###
    def height(node)
      # A nil node has height -1; a leaf has height 0
      return node.height unless node.nil?

      -1
    end

    ### Update the node height ###
    def update_height(node)
      # The node height equals the height of its taller subtree + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end
    ```

### 2. &nbsp; Balance factor

A node's <u>balance factor</u> is its left subtree's height minus its right subtree's height. A missing node has balance factor $0$. Wrap this calculation in a function for convenient use:

=== "Python"

    ```python title="avl_tree.py"
    def balance_factor(self, node: TreeNode | None) -> int:
        """Get the balance factor"""
        # An empty subtree has balance factor 0
        if node is None:
            return 0
        # Node balance factor = left subtree height - right subtree height
        return self.height(node.left) - self.height(node.right)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Get the balance factor */
    int balanceFactor(TreeNode *node) {
        // A null node has balance factor 0
        if (node == nullptr)
            return 0;
        // Node balance factor = left subtree height - right subtree height
        return height(node->left) - height(node->right);
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Get the balance factor */
    int balanceFactor(TreeNode node) {
        // A null node has balance factor 0
        if (node == null)
            return 0;
        // Node balance factor = left subtree height - right subtree height
        return height(node.left) - height(node.right);
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Get the balance factor */
    int BalanceFactor(TreeNode? node) {
        // A null node has balance factor 0
        if (node == null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return Height(node.left) - Height(node.right);
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Get the balance factor */
    func (t *aVLTree) balanceFactor(node *TreeNode) int {
        // A nil node has balance factor 0
        if node == nil {
            return 0
        }
        // Node balance factor = left subtree height - right subtree height
        return t.height(node.Left) - t.height(node.Right)
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Get the balance factor */
    func balanceFactor(node: TreeNode?) -> Int {
        // A nil node has balance factor 0
        guard let node = node else { return 0 }
        // Node balance factor = left subtree height - right subtree height
        return height(node: node.left) - height(node: node.right)
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Get the balance factor */
    balanceFactor(node) {
        // A null node has balance factor 0
        if (node === null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Get the balance factor */
    balanceFactor(node: TreeNode): number {
        // A null node has balance factor 0
        if (node === null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Get the balance factor */
    int balanceFactor(TreeNode? node) {
      // A null node has balance factor 0
      if (node == null) return 0;
      // Node balance factor = left subtree height - right subtree height
      return height(node.left) - height(node.right);
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Get the balance factor */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // A null node has balance factor 0
            None => 0,
            // Node balance factor = left subtree height - right subtree height
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Get the balance factor */
    int balanceFactor(TreeNode *node) {
        // A null node has balance factor 0
        if (node == NULL) {
            return 0;
        }
        // Node balance factor = left subtree height - right subtree height
        return height(node->left) - height(node->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Get the balance factor */
    fun balanceFactor(node: TreeNode?): Int {
        // A null node has balance factor 0
        if (node == null) return 0
        // Node balance factor = left subtree height - right subtree height
        return height(node.left) - height(node.right)
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Get the balance factor ###
    def balance_factor(node)
      # A nil node has balance factor 0
      return 0 if node.nil?

      # Node balance factor = left subtree height - right subtree height
      height(node.left) - height(node.right)
    end
    ```

!!! tip

    If a node's balance factor is $f$, every node in an AVL tree satisfies $-1 \le f \le 1$.

## 7.5.2 &nbsp; AVL tree rotations

The defining operation of an AVL tree is rotation, which restores balance without changing the inorder traversal sequence. **A rotation preserves the binary-search-tree property while restoring the balanced-tree property**.

A node whose balance factor has absolute value $> 1$ is “unbalanced.” Depending on the imbalance, we use one of four rotations: right, left, right-then-left, or left-then-right. Let us examine them in detail.

### 1. &nbsp; Right rotation

In Figure 7-26, balance factors appear beneath the nodes. Viewed from the bottom up, node 3 is the first unbalanced node. Focus on the subtree rooted there, naming its root `node` and its left child `child`. A right rotation restores balance while preserving the binary-search-tree property.

=== "<1>"
    ![Steps of a right rotation](avl_tree.assets/avltree_right_rotate_step1.png){ class="animation-figure" }

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png){ class="animation-figure" }

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png){ class="animation-figure" }

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-26 &nbsp; Steps of a right rotation </p>

If `child` has a right child, denoted by `grand_child`, add one step to the rotation: make `grand_child` the left child of `node`, as shown below.

![A right rotation with grand_child](avl_tree.assets/avltree_right_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Figure 7-27 &nbsp; A right rotation with grand_child </p>

“Rotating right” is a visual description; the implementation updates node pointers:

=== "Python"

    ```python title="avl_tree.py"
    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Right rotation"""
        child = node.left
        grand_child = child.right
        # Rotate node to the right around child
        child.right = node
        node.left = grand_child
        # Update the node height
        self.update_height(node)
        self.update_height(child)
        # Return the root of the rotated subtree
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Right rotation */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // Rotate node to the right around child
        child->right = node;
        node->left = grandChild;
        // Update the node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Right rotation */
    TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Right rotation */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Right rotation */
    func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
        child := node.Left
        grandChild := child.Right
        // Rotate node to the right around child
        child.Right = node
        node.Left = grandChild
        // Update the node height
        t.updateHeight(node)
        t.updateHeight(child)
        // Return the root of the rotated subtree
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Right rotation */
    func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Rotate node to the right around child
        child?.right = node
        node?.left = grandChild
        // Update the node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return the root of the rotated subtree
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Right rotation */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Right rotation */
    rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Right rotation */
    TreeNode? rightRotate(TreeNode? node) {
      TreeNode? child = node!.left;
      TreeNode? grandChild = child!.right;
      // Rotate node to the right around child
      child.right = node;
      node.left = grandChild;
      // Update the node height
      updateHeight(node);
      updateHeight(child);
      // Return the root of the rotated subtree
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Right rotation */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // Rotate node to the right around child
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // Update the node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return the root of the rotated subtree
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Right rotation */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->left;
        grandChild = child->right;
        // Rotate node to the right around child
        child->right = node;
        node->left = grandChild;
        // Update the node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Right rotation */
    fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Rotate node to the right around child
        child.right = node
        node.left = grandChild
        // Update the node height
        updateHeight(node)
        updateHeight(child)
        // Return the root of the rotated subtree
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Right rotation ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Rotate node to the right around child
      child.right = node
      node.left = grand_child
      # Update the node height
      update_height(node)
      update_height(child)
      # Return the root of the rotated subtree
      child
    end
    ```

### 2. &nbsp; Left rotation

For the mirror image of the unbalanced tree above, perform a left rotation, as shown below.

![A left rotation](avl_tree.assets/avltree_left_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-28 &nbsp; A left rotation </p>

Similarly, if `child` has a left child, denoted by `grand_child`, make it the right child of `node` during the rotation.

![A left rotation with grand_child](avl_tree.assets/avltree_left_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Figure 7-29 &nbsp; A left rotation with grand_child </p>

**Right and left rotations are mirror images, as are the imbalances they resolve**. To obtain left-rotation code, exchange every `left` and `right` in the right-rotation implementation:

=== "Python"

    ```python title="avl_tree.py"
    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Left rotation"""
        child = node.right
        grand_child = child.left
        # Rotate node to the left around child
        child.left = node
        node.right = grand_child
        # Update the node height
        self.update_height(node)
        self.update_height(child)
        # Return the root of the rotated subtree
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Left rotation */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // Rotate node to the left around child
        child->left = node;
        node->right = grandChild;
        // Update the node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Left rotation */
    TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Left rotation */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Left rotation */
    func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
        child := node.Right
        grandChild := child.Left
        // Rotate node to the left around child
        child.Left = node
        node.Right = grandChild
        // Update the node height
        t.updateHeight(node)
        t.updateHeight(child)
        // Return the root of the rotated subtree
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Left rotation */
    func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Rotate node to the left around child
        child?.left = node
        node?.right = grandChild
        // Update the node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return the root of the rotated subtree
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Left rotation */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Left rotation */
    leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Left rotation */
    TreeNode? leftRotate(TreeNode? node) {
      TreeNode? child = node!.right;
      TreeNode? grandChild = child!.left;
      // Rotate node to the left around child
      child.left = node;
      node.right = grandChild;
      // Update the node height
      updateHeight(node);
      updateHeight(child);
      // Return the root of the rotated subtree
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Left rotation */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // Rotate node to the left around child
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // Update the node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return the root of the rotated subtree
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Left rotation */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->right;
        grandChild = child->left;
        // Rotate node to the left around child
        child->left = node;
        node->right = grandChild;
        // Update the node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Left rotation */
    fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Rotate node to the left around child
        child.left = node
        node.right = grandChild
        // Update the node height
        updateHeight(node)
        updateHeight(child)
        // Return the root of the rotated subtree
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Left rotation ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Rotate node to the left around child
      child.left = node
      node.right = grand_child
      # Update the node height
      update_height(node)
      update_height(child)
      # Return the root of the rotated subtree
      child
    end
    ```

### 3. &nbsp; Left-then-right rotation

For unbalanced node 3 below, neither a left nor a right rotation alone restores balance. First rotate `child` to the left, then rotate `node` to the right.

![A left-then-right rotation](avl_tree.assets/avltree_left_right_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-30 &nbsp; A left-then-right rotation </p>

### 4. &nbsp; Right-then-left rotation

For the mirror-image case below, first rotate `child` to the right, then rotate `node` to the left.

![A right-then-left rotation](avl_tree.assets/avltree_right_left_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-31 &nbsp; A right-then-left rotation </p>

### 5. &nbsp; Choosing a rotation

The four cases below correspond to the examples above and require, respectively, right, left-then-right, right-then-left, and left rotations.

![The four AVL rotation cases](avl_tree.assets/avltree_rotation_cases.png){ class="animation-figure" }

<p align="center"> Figure 7-32 &nbsp; The four AVL rotation cases </p>

As Table 7-3 shows, the signs of the unbalanced node's balance factor and that of the child on its taller side determine the case.

<p align="center"> Table 7-3 &nbsp; Conditions for choosing a rotation </p>

<div class="center-table" markdown>

| Unbalanced node's balance factor | Child's balance factor | Rotation |
| ------------------ | ---------------- | ---------------- |
| $> 1$ (left-heavy)   | $\geq 0$         | Right             |
| $> 1$ (left-heavy)   | $<0$             | Left, then right     |
| $< -1$ (right-heavy)  | $\leq 0$         | Left             |
| $< -1$ (right-heavy)  | $>0$             | Right, then left     |

</div>

Wrap the rotation logic in one function. **It can then handle every imbalance and restore the affected node's balance**. The code is as follows:

=== "Python"

    ```python title="avl_tree.py"
    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Perform rotations to restore balance in this subtree"""
        # Get the balance factor of node
        balance_factor = self.balance_factor(node)
        # Left-heavy tree
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # Rotate right
                return self.right_rotate(node)
            else:
                # Rotate left, then right
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # Right-heavy tree
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # Rotate left
                return self.left_rotate(node)
            else:
                # Rotate right, then left
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # The tree is balanced; return without rotating
        return node
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Perform rotations to restore balance in this subtree */
    TreeNode *rotate(TreeNode *node) {
        // Get the balance factor of node
        int _balanceFactor = balanceFactor(node);
        // Left-heavy tree
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Rotate right
                return rightRotate(node);
            } else {
                // Rotate left, then right
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Right-heavy tree
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Rotate left
                return leftRotate(node);
            } else {
                // Rotate right, then left
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Perform rotations to restore balance in this subtree */
    TreeNode rotate(TreeNode node) {
        // Get the balance factor of node
        int balanceFactor = balanceFactor(node);
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Rotate right
                return rightRotate(node);
            } else {
                // Rotate left, then right
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Rotate left
                return leftRotate(node);
            } else {
                // Rotate right, then left
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Perform rotations to restore balance in this subtree */
    TreeNode? Rotate(TreeNode? node) {
        // Get the balance factor of node
        int balanceFactorInt = BalanceFactor(node);
        // Left-heavy tree
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Rotate right
                return RightRotate(node);
            } else {
                // Rotate left, then right
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Rotate left
                return LeftRotate(node);
            } else {
                // Rotate right, then left
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Perform rotations to restore balance in this subtree */
    func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
        // Get the balance factor of node
        // Go favors short local variable names; bf holds the result of t.balanceFactor(node)
        bf := t.balanceFactor(node)
        // Left-heavy tree
        if bf > 1 {
            if t.balanceFactor(node.Left) >= 0 {
                // Rotate right
                return t.rightRotate(node)
            } else {
                // Rotate left, then right
                node.Left = t.leftRotate(node.Left)
                return t.rightRotate(node)
            }
        }
        // Right-heavy tree
        if bf < -1 {
            if t.balanceFactor(node.Right) <= 0 {
                // Rotate left
                return t.leftRotate(node)
            } else {
                // Rotate right, then left
                node.Right = t.rightRotate(node.Right)
                return t.leftRotate(node)
            }
        }
        // The tree is balanced; return without rotating
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Perform rotations to restore balance in this subtree */
    func rotate(node: TreeNode?) -> TreeNode? {
        // Get the balance factor of node
        let balanceFactor = balanceFactor(node: node)
        // Left-heavy tree
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Rotate right
                return rightRotate(node: node)
            } else {
                // Rotate left, then right
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Right-heavy tree
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Rotate left
                return leftRotate(node: node)
            } else {
                // Rotate right, then left
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // The tree is balanced; return without rotating
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Perform rotations to restore balance in this subtree */
    #rotate(node) {
        // Get the balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Rotate right
                return this.#rightRotate(node);
            } else {
                // Rotate left, then right
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Rotate left
                return this.#leftRotate(node);
            } else {
                // Rotate right, then left
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Perform rotations to restore balance in this subtree */
    rotate(node: TreeNode): TreeNode {
        // Get the balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Rotate right
                return this.rightRotate(node);
            } else {
                // Rotate left, then right
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Rotate left
                return this.leftRotate(node);
            } else {
                // Rotate right, then left
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Perform rotations to restore balance in this subtree */
    TreeNode? rotate(TreeNode? node) {
      // Get the balance factor of node
      int factor = balanceFactor(node);
      // Left-heavy tree
      if (factor > 1) {
        if (balanceFactor(node!.left) >= 0) {
          // Rotate right
          return rightRotate(node);
        } else {
          // Rotate left, then right
          node.left = leftRotate(node.left);
          return rightRotate(node);
        }
      }
      // Right-heavy tree
      if (factor < -1) {
        if (balanceFactor(node!.right) <= 0) {
          // Rotate left
          return leftRotate(node);
        } else {
          // Rotate right, then left
          node.right = rightRotate(node.right);
          return leftRotate(node);
        }
      }
      // The tree is balanced; return without rotating
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Perform rotations to restore balance in this subtree */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // Get the balance factor of node
        let balance_factor = Self::balance_factor(node.clone());
        // Left-heavy tree
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // Rotate right
                Self::right_rotate(Some(node))
            } else {
                // Rotate left, then right
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // Right-heavy tree
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // Rotate left
                Self::left_rotate(Some(node))
            } else {
                // Rotate right, then left
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // The tree is balanced; return without rotating
            node
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Perform rotations to restore balance in this subtree */
    TreeNode *rotate(TreeNode *node) {
        // Get the balance factor of node
        int bf = balanceFactor(node);
        // Left-heavy tree
        if (bf > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Rotate right
                return rightRotate(node);
            } else {
                // Rotate left, then right
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Right-heavy tree
        if (bf < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Rotate left
                return leftRotate(node);
            } else {
                // Rotate right, then left
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Perform rotations to restore balance in this subtree */
    fun rotate(node: TreeNode): TreeNode {
        // Get the balance factor of node
        val balanceFactor = balanceFactor(node)
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Rotate right
                return rightRotate(node)
            } else {
                // Rotate left, then right
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Rotate left
                return leftRotate(node)
            } else {
                // Rotate right, then left
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // The tree is balanced; return without rotating
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Perform rotations to restore balance in this subtree ###
    def rotate(node)
      # Get the balance factor of node
      balance_factor = balance_factor(node)
      # Left-heavy tree
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Rotate right
          return right_rotate(node)
        else
          # Rotate left, then right
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Right-heavy tree
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Rotate left
          return left_rotate(node)
        else
          # Rotate right, then left
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # The tree is balanced; return without rotating
      node
    end
    ```

## 7.5.3 &nbsp; Common AVL tree operations

### 1. &nbsp; Inserting a node

Insertion largely follows the binary-search-tree procedure. The difference is that inserting a node may unbalance nodes along the path to the root. **Starting at the inserted node, work upward and perform rotations to restore balance at every affected node**:

=== "Python"

    ```python title="avl_tree.py"
    def insert(self, val):
        """Insert a node"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """Insert a node recursively (helper method)"""
        if node is None:
            return TreeNode(val)
        # 1. Find the insertion position and insert the node
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # Return without inserting a duplicate node
            return node
        # Update the node height
        self.update_height(node)
        # 2. Perform rotations to restore balance in this subtree
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Insert a node */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Insert a node recursively (helper method) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Return without inserting a duplicate node
        updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Insert a node */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Insert a node recursively (helper method) */
    TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // Return without inserting a duplicate node
        updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the subtree root
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Insert a node */
    void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Insert a node recursively (helper method) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Return without inserting a duplicate node
        UpdateHeight(node);  // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = Rotate(node);
        // Return the subtree root
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Insert a node */
    func (t *aVLTree) insert(val int) {
        t.root = t.insertHelper(t.root, val)
    }

    /* Insert a node recursively (helper function) */
    func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return NewTreeNode(val)
        }
        /* 1. Find the insertion position and insert the node */
        if val < node.Val.(int) {
            node.Left = t.insertHelper(node.Left, val)
        } else if val > node.Val.(int) {
            node.Right = t.insertHelper(node.Right, val)
        } else {
            // Return without inserting a duplicate node
            return node
        }
        // Update the node height
        t.updateHeight(node)
        /* 2. Perform rotations to restore balance in this subtree */
        node = t.rotate(node)
        // Return the subtree root
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Insert a node */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* Insert a node recursively (helper method) */
    func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. Find the insertion position and insert the node */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Return without inserting a duplicate node
        }
        updateHeight(node: node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node: node)
        // Return the subtree root
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Insert a node */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* Insert a node recursively (helper method) */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // Return without inserting a duplicate node
        this.#updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = this.#rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Insert a node */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* Insert a node recursively (helper method) */
    insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // Return without inserting a duplicate node
        }
        this.updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = this.rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Insert a node */
    void insert(int val) {
      root = insertHelper(root, val);
    }

    /* Insert a node recursively (helper method) */
    TreeNode? insertHelper(TreeNode? node, int val) {
      if (node == null) return TreeNode(val);
      /* 1. Find the insertion position and insert the node */
      if (val < node.val)
        node.left = insertHelper(node.left, val);
      else if (val > node.val)
        node.right = insertHelper(node.right, val);
      else
        return node; // Return without inserting a duplicate node
      updateHeight(node); // Update the node height
      /* 2. Perform rotations to restore balance in this subtree */
      node = rotate(node);
      // Return the root of the subtree
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Insert a node */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* Insert a node recursively (helper method) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find the insertion position and insert the node */
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
                        return Some(node); // Return without inserting a duplicate node
                    }
                }
                Self::update_height(Some(node.clone())); // Update the node height

                /* 2. Perform rotations to restore balance in this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return the root of the subtree
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Insert a node */
    void insert(AVLTree *tree, int val) {
        tree->root = insertHelper(tree->root, val);
    }

    /* Recursively insert a node (helper function) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == NULL) {
            return newTreeNode(val);
        }
        /* 1. Find the insertion position and insert the node */
        if (val < node->val) {
            node->left = insertHelper(node->left, val);
        } else if (val > node->val) {
            node->right = insertHelper(node->right, val);
        } else {
            // Return without inserting a duplicate node
            return node;
        }
        // Update the node height
        updateHeight(node);
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Insert a node */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* Insert a node recursively (helper method) */
    fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. Find the insertion position and insert the node */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Return without inserting a duplicate node
        updateHeight(node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node)
        // Return the subtree root
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Insert a node ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    ### Insert a node recursively (helper method)###
    def insert_helper(node, val)
      return TreeNode.new(val) if node.nil?
      # 1. Find the insertion position and insert the node
      if val < node.val
        node.left = insert_helper(node.left, val)
      elsif val > node.val
        node.right = insert_helper(node.right, val)
      else
        # Return without inserting a duplicate node
        return node
      end
      # Update the node height
      update_height(node)
      # 2. Perform rotations to restore balance in this subtree
      rotate(node)
    end
    ```

### 2. &nbsp; Deleting a node

Similarly, extend binary-search-tree deletion with rotations from the bottom up to restore balance at every affected node:

=== "Python"

    ```python title="avl_tree.py"
    def remove(self, val: int):
        """Remove a node"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Remove a node recursively (helper method)"""
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
                # Number of children = 0: remove node and return
                if child is None:
                    return None
                # Number of children = 1: remove node directly
                else:
                    node = child
            else:
                # Number of children = 2: remove the inorder successor and use its value to replace the current node value
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Update the node height
        self.update_height(node)
        # 2. Perform rotations to restore balance in this subtree
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Remove a node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Remove a node recursively (helper method) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. Find and remove the node */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // Number of children = 0: remove node and return
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Number of children = 1: remove node directly
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Remove a node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Remove a node recursively (helper method) */
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
                // Number of children = 0: remove node and return
                if (child == null)
                    return null;
                // Number of children = 1: remove node directly
                else
                    node = child;
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the subtree root
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Remove a node */
    void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Remove a node recursively (helper method) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Find and remove the node */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // Number of children = 0: remove node and return
                if (child == null)
                    return null;
                // Number of children = 1: remove node directly
                else
                    node = child;
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = Rotate(node);
        // Return the subtree root
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Remove a node */
    func (t *aVLTree) remove(val int) {
        t.root = t.removeHelper(t.root, val)
    }

    /* Remove a node recursively (helper function) */
    func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return nil
        }
        /* 1. Find and remove the node */
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
                    // Number of children = 0: remove node and return
                    return nil
                } else {
                    // Number of children = 1: remove node directly
                    node = child
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                temp := node.Right
                for temp.Left != nil {
                    temp = temp.Left
                }
                node.Right = t.removeHelper(node.Right, temp.Val.(int))
                node.Val = temp.Val
            }
        }
        // Update the node height
        t.updateHeight(node)
        /* 2. Perform rotations to restore balance in this subtree */
        node = t.rotate(node)
        // Return the subtree root
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Remove a node */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Remove a node recursively (helper method) */
    func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Find and remove the node */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Number of children = 0: remove node and return
                if child == nil {
                    return nil
                }
                // Number of children = 1: remove node directly
                else {
                    node = child
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node: node)
        // Return the subtree root
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Remove a node */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* Remove a node recursively (helper method) */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. Find and remove the node */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Number of children = 0: remove node and return
                if (child === null) return null;
                // Number of children = 1: remove node directly
                else node = child;
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = this.#rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Remove a node */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Remove a node recursively (helper method) */
    removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. Find and remove the node */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Number of children = 0: remove node and return
                if (child === null) {
                    return null;
                } else {
                    // Number of children = 1: remove node directly
                    node = child;
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = this.rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Remove a node */
    void remove(int val) {
      root = removeHelper(root, val);
    }

    /* Remove a node recursively (helper method) */
    TreeNode? removeHelper(TreeNode? node, int val) {
      if (node == null) return null;
      /* 1. Find and remove the node */
      if (val < node.val)
        node.left = removeHelper(node.left, val);
      else if (val > node.val)
        node.right = removeHelper(node.right, val);
      else {
        if (node.left == null || node.right == null) {
          TreeNode? child = node.left ?? node.right;
          // Number of children = 0: remove node and return
          if (child == null)
            return null;
          // Number of children = 1: remove node directly
          else
            node = child;
        } else {
          // Number of children = 2: remove the inorder successor and use its value to replace the current node value
          TreeNode? temp = node.right;
          while (temp!.left != null) {
            temp = temp.left;
          }
          node.right = removeHelper(node.right, temp.val);
          node.val = temp.val;
        }
      }
      updateHeight(node); // Update the node height
      /* 2. Perform rotations to restore balance in this subtree */
      node = rotate(node);
      // Return the root of the subtree
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Remove a node */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* Remove a node recursively (helper method) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find and remove the node */
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
                        // Number of children = 0: remove node and return
                        None => {
                            return None;
                        }
                        // Number of children = 1: remove node directly
                        Some(child) => node = child,
                    }
                } else {
                    // Number of children = 2: remove the inorder successor and use its value to replace the current node value
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
                Self::update_height(Some(node.clone())); // Update the node height

                /* 2. Perform rotations to restore balance in this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return the root of the subtree
                Some(node)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Remove a node */
    // The name remove conflicts with the function declared in stdio.h
    void removeItem(AVLTree *tree, int val) {
        TreeNode *root = removeHelper(tree->root, val);
    }

    /* Recursively remove a node (helper function) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        TreeNode *child, *grandChild;
        if (node == NULL) {
            return NULL;
        }
        /* 1. Find and remove the node */
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
                // Number of children = 0: remove node and return
                if (child == NULL) {
                    return NULL;
                } else {
                    // Number of children = 1: remove node directly
                    node = child;
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                TreeNode *temp = node->right;
                while (temp->left != NULL) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        // Update the node height
        updateHeight(node);
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the root of the subtree
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Remove a node */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Remove a node recursively (helper method) */
    fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Find and remove the node */
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
                // Number of children = 0: remove node and return
                if (child == null)
                    return null
                // Number of children = 1: remove node directly
                else
                    node = child
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node)
        // Return the subtree root
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Remove a node ###
    def remove(val)
      @root = remove_helper(@root, val)
    end

    ### Remove a node recursively (helper method)###
    def remove_helper(node, val)
      return if node.nil?
      # 1. Find and remove the node
      if val < node.val
        node.left = remove_helper(node.left, val)
      elsif val > node.val
        node.right = remove_helper(node.right, val)
      else
        if node.left.nil? || node.right.nil?
          child = node.left || node.right
          # Number of children = 0: remove node and return
          return if child.nil?
          # Number of children = 1: remove node directly
          node = child
        else
          # Number of children = 2: remove the inorder successor and use its value to replace the current node value
          temp = node.right
          while !temp.left.nil?
            temp = temp.left
          end
          node.right = remove_helper(node.right, temp.val)
          node.val = temp.val
        end
      end
      # Update the node height
      update_height(node)
      # 2. Perform rotations to restore balance in this subtree
      rotate(node)
    end
    ```

### 3. &nbsp; Finding a node

Lookup is identical to binary-search-tree lookup, so we will not repeat it here.

## 7.5.4 &nbsp; Typical applications

- Organizing and storing large datasets, particularly when lookups are frequent and insertions and deletions are less frequent.
- Building database indexing systems.
- Red-black trees are another common kind of balanced binary search tree. Their balance requirements are looser than those of AVL trees, so insertion and deletion need fewer rotations and are more efficient on average.
