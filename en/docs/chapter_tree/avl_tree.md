---
comments: true
---

# 7.5 &nbsp; Avl Tree *

In the "Binary Search Tree" section, we mentioned that after multiple insertion and removal operations, a binary search tree may degenerate into a linked list. In this case, the time complexity of all operations degrades from $O(\log n)$ to $O(n)$.

As shown in Figure 7-24, after two node removal operations, this binary search tree will degrade into a linked list.

![Degradation of an AVL tree after removing nodes](avl_tree.assets/avltree_degradation_from_removing_node.png){ class="animation-figure" }

<p align="center"> Figure 7-24 &nbsp; Degradation of an AVL tree after removing nodes </p>

For example, in the perfect binary tree shown in Figure 7-25, after inserting two nodes, the tree will lean heavily to the left, and the time complexity of search operations will also degrade.

![Degradation of an AVL tree after inserting nodes](avl_tree.assets/avltree_degradation_from_inserting_node.png){ class="animation-figure" }

<p align="center"> Figure 7-25 &nbsp; Degradation of an AVL tree after inserting nodes </p>

In 1962, G. M. Adelson-Velsky and E. M. Landis proposed the <u>AVL tree</u> in their paper "An algorithm for the organization of information". The paper described in detail a series of operations ensuring that after continuously adding and removing nodes, the AVL tree does not degenerate, thus keeping the time complexity of various operations at the $O(\log n)$ level. In other words, in scenarios requiring frequent insertions, deletions, searches, and modifications, the AVL tree can always maintain efficient data operation performance, making it very valuable in applications.

## 7.5.1 &nbsp; Common Terminology in Avl Trees

An AVL tree is both a binary search tree and a balanced binary tree, simultaneously satisfying all the properties of these two types of binary trees, hence it is a <u>balanced binary search tree</u>.

### 1. &nbsp; Node Height

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
    /* AVL tree node */
    class TreeNode(val _val: Int) {  // Node value
        val height: Int = 0          // Node height
        val left: TreeNode? = null   // Left child
        val right: TreeNode? = null  // Right child
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
    /* Get node height */
    int height(TreeNode *node) {
        // Empty node height is -1, leaf node height is 0
        return node == nullptr ? -1 : node->height;
    }

    /* Update node height */
    void updateHeight(TreeNode *node) {
        // Node height equals the height of the tallest subtree + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }
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
    /* Get node height */
    int Height(TreeNode? node) {
        // Empty node height is -1, leaf node height is 0
        return node == null ? -1 : node.height;
    }

    /* Update node height */
    void UpdateHeight(TreeNode node) {
        // Node height equals the height of the tallest subtree + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Get node height */
    func (t *aVLTree) height(node *TreeNode) int {
        // Empty node height is -1, leaf node height is 0
        if node != nil {
            return node.Height
        }
        return -1
    }

    /* Update node height */
    func (t *aVLTree) updateHeight(node *TreeNode) {
        lh := t.height(node.Left)
        rh := t.height(node.Right)
        // Node height equals the height of the tallest subtree + 1
        if lh > rh {
            node.Height = lh + 1
        } else {
            node.Height = rh + 1
        }
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Get node height */
    func height(node: TreeNode?) -> Int {
        // Empty node height is -1, leaf node height is 0
        node?.height ?? -1
    }

    /* Update node height */
    func updateHeight(node: TreeNode?) {
        // Node height equals the height of the tallest subtree + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Get node height */
    height(node) {
        // Empty node height is -1, leaf node height is 0
        return node === null ? -1 : node.height;
    }

    /* Update node height */
    #updateHeight(node) {
        // Node height equals the height of the tallest subtree + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Get node height */
    height(node: TreeNode): number {
        // Empty node height is -1, leaf node height is 0
        return node === null ? -1 : node.height;
    }

    /* Update node height */
    updateHeight(node: TreeNode): void {
        // Node height equals the height of the tallest subtree + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Get node height */
    int height(TreeNode? node) {
      // Empty node height is -1, leaf node height is 0
      return node == null ? -1 : node.height;
    }

    /* Update node height */
    void updateHeight(TreeNode? node) {
      // Node height equals the height of the tallest subtree + 1
      node!.height = max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Get node height */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // Empty node height is -1, leaf node height is 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* Update node height */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // Node height equals the height of the tallest subtree + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Get node height */
    int height(TreeNode *node) {
        // Empty node height is -1, leaf node height is 0
        if (node != NULL) {
            return node->height;
        }
        return -1;
    }

    /* Update node height */
    void updateHeight(TreeNode *node) {
        int lh = height(node->left);
        int rh = height(node->right);
        // Node height equals the height of the tallest subtree + 1
        if (lh > rh) {
            node->height = lh + 1;
        } else {
            node->height = rh + 1;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Get node height */
    fun height(node: TreeNode?): Int {
        // Empty node height is -1, leaf node height is 0
        return node?.height ?: -1
    }

    /* Update node height */
    fun updateHeight(node: TreeNode?) {
        // Node height equals the height of the tallest subtree + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Get node height ###
    def height(node)
      # Empty node height is -1, leaf node height is 0
      return node.height unless node.nil?

      -1
    end

    ### Update node height ###
    def update_height(node)
      # Node height equals the height of the tallest subtree + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end
    ```

### 2. &nbsp; Node Balance Factor

The <u>balance factor</u> of a node is defined as the height of the node's left subtree minus the height of its right subtree, and the balance factor of a null node is defined as $0$. We also encapsulate the function to obtain the node's balance factor for convenient subsequent use:

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
    /* Get balance factor */
    int balanceFactor(TreeNode *node) {
        // Empty node balance factor is 0
        if (node == nullptr)
            return 0;
        // Node balance factor = left subtree height - right subtree height
        return height(node->left) - height(node->right);
    }
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
    /* Get balance factor */
    int BalanceFactor(TreeNode? node) {
        // Empty node balance factor is 0
        if (node == null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return Height(node.left) - Height(node.right);
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Get balance factor */
    func (t *aVLTree) balanceFactor(node *TreeNode) int {
        // Empty node balance factor is 0
        if node == nil {
            return 0
        }
        // Node balance factor = left subtree height - right subtree height
        return t.height(node.Left) - t.height(node.Right)
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Get balance factor */
    func balanceFactor(node: TreeNode?) -> Int {
        // Empty node balance factor is 0
        guard let node = node else { return 0 }
        // Node balance factor = left subtree height - right subtree height
        return height(node: node.left) - height(node: node.right)
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Get balance factor */
    balanceFactor(node) {
        // Empty node balance factor is 0
        if (node === null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Get balance factor */
    balanceFactor(node: TreeNode): number {
        // Empty node balance factor is 0
        if (node === null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Get balance factor */
    int balanceFactor(TreeNode? node) {
      // Empty node balance factor is 0
      if (node == null) return 0;
      // Node balance factor = left subtree height - right subtree height
      return height(node.left) - height(node.right);
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Get balance factor */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // Empty node balance factor is 0
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
    /* Get balance factor */
    int balanceFactor(TreeNode *node) {
        // Empty node balance factor is 0
        if (node == NULL) {
            return 0;
        }
        // Node balance factor = left subtree height - right subtree height
        return height(node->left) - height(node->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Get balance factor */
    fun balanceFactor(node: TreeNode?): Int {
        // Empty node balance factor is 0
        if (node == null) return 0
        // Node balance factor = left subtree height - right subtree height
        return height(node.left) - height(node.right)
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Get balance factor ###
    def balance_factor(node)
      # Empty node balance factor is 0
      return 0 if node.nil?

      # Node balance factor = left subtree height - right subtree height
      height(node.left) - height(node.right)
    end
    ```

!!! tip

    Let the balance factor be $f$, then the balance factor of any node in an AVL tree satisfies $-1 \le f \le 1$.

## 7.5.2 &nbsp; Rotations in Avl Trees

The characteristic of AVL trees lies in the "rotation" operation, which can restore balance to unbalanced nodes without affecting the inorder traversal sequence of the binary tree. In other words, **rotation operations can both maintain the property of a "binary search tree" and make the tree return to a "balanced binary tree"**.

We call nodes with a balance factor absolute value $> 1$ "unbalanced nodes". Depending on the imbalance situation, rotation operations are divided into four types: right rotation, left rotation, left rotation then right rotation, and right rotation then left rotation. Below we describe these rotation operations in detail.

### 1. &nbsp; Right Rotation

As shown in Figure 7-26, the value below the node is the balance factor. From bottom to top, the first unbalanced node in the binary tree is "node 3". We focus on the subtree with this unbalanced node as the root, denoting the node as `node` and its left child as `child`, and perform a "right rotation" operation. After the right rotation is completed, the subtree regains balance and still maintains the properties of a binary search tree.

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
        # Using child as pivot, rotate node to the right
        child.right = node
        node.left = grand_child
        # Update node height
        self.update_height(node)
        self.update_height(child)
        # Return root node of subtree after rotation
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Right rotation operation */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // Using child as pivot, rotate node to the right
        child->right = node;
        node->left = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Right rotation operation */
    TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Using child as pivot, rotate node to the right
        child.right = node;
        node.left = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Right rotation operation */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Using child as pivot, rotate node to the right
        child.right = node;
        node.left = grandChild;
        // Update node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Right rotation operation */
    func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
        child := node.Left
        grandChild := child.Right
        // Using child as pivot, rotate node to the right
        child.Right = node
        node.Left = grandChild
        // Update node height
        t.updateHeight(node)
        t.updateHeight(child)
        // Return root node of subtree after rotation
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Right rotation operation */
    func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Using child as pivot, rotate node to the right
        child?.right = node
        node?.left = grandChild
        // Update node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return root node of subtree after rotation
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Right rotation operation */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // Using child as pivot, rotate node to the right
        child.right = node;
        node.left = grandChild;
        // Update node height
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Right rotation operation */
    rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Using child as pivot, rotate node to the right
        child.right = node;
        node.left = grandChild;
        // Update node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Right rotation operation */
    TreeNode? rightRotate(TreeNode? node) {
      TreeNode? child = node!.left;
      TreeNode? grandChild = child!.right;
      // Using child as pivot, rotate node to the right
      child.right = node;
      node.left = grandChild;
      // Update node height
      updateHeight(node);
      updateHeight(child);
      // Return root node of subtree after rotation
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Right rotation operation */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // Using child as pivot, rotate node to the right
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // Update node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return root node of subtree after rotation
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Right rotation operation */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->left;
        grandChild = child->right;
        // Using child as pivot, rotate node to the right
        child->right = node;
        node->left = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Right rotation operation */
    fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Using child as pivot, rotate node to the right
        child.right = node
        node.left = grandChild
        // Update node height
        updateHeight(node)
        updateHeight(child)
        // Return root node of subtree after rotation
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Right rotation ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Using child as pivot, rotate node to the right
      child.right = node
      node.left = grand_child
      # Update node height
      update_height(node)
      update_height(child)
      # Return root node of subtree after rotation
      child
    end
    ```

### 2. &nbsp; Left Rotation

Correspondingly, if considering the "mirror" of the above unbalanced binary tree, the "left rotation" operation shown in Figure 7-28 needs to be performed.

![Left rotation operation](avl_tree.assets/avltree_left_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-28 &nbsp; Left rotation operation </p>

Similarly, as shown in Figure 7-29, when the `child` node has a left child (denoted as `grand_child`), a step needs to be added in the left rotation: set `grand_child` as the right child of `node`.

![Left rotation with grand_child](avl_tree.assets/avltree_left_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Figure 7-29 &nbsp; Left rotation with grand_child </p>

It can be observed that **right rotation and left rotation operations are mirror symmetric in logic, and the two imbalance cases they solve are also symmetric**. Based on symmetry, we only need to replace all `left` in the right rotation implementation code with `right`, and all `right` with `left`, to obtain the left rotation implementation code:

=== "Python"

    ```python title="avl_tree.py"
    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Left rotation operation"""
        child = node.right
        grand_child = child.left
        # Using child as pivot, rotate node to the left
        child.left = node
        node.right = grand_child
        # Update node height
        self.update_height(node)
        self.update_height(child)
        # Return root node of subtree after rotation
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Left rotation operation */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // Using child as pivot, rotate node to the left
        child->left = node;
        node->right = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Left rotation operation */
    TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Using child as pivot, rotate node to the left
        child.left = node;
        node.right = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Left rotation operation */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Using child as pivot, rotate node to the left
        child.left = node;
        node.right = grandChild;
        // Update node height
        UpdateHeight(node);
        UpdateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Left rotation operation */
    func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
        child := node.Right
        grandChild := child.Left
        // Using child as pivot, rotate node to the left
        child.Left = node
        node.Right = grandChild
        // Update node height
        t.updateHeight(node)
        t.updateHeight(child)
        // Return root node of subtree after rotation
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Left rotation operation */
    func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Using child as pivot, rotate node to the left
        child?.left = node
        node?.right = grandChild
        // Update node height
        updateHeight(node: node)
        updateHeight(node: child)
        // Return root node of subtree after rotation
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Left rotation operation */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // Using child as pivot, rotate node to the left
        child.left = node;
        node.right = grandChild;
        // Update node height
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Left rotation operation */
    leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Using child as pivot, rotate node to the left
        child.left = node;
        node.right = grandChild;
        // Update node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Left rotation operation */
    TreeNode? leftRotate(TreeNode? node) {
      TreeNode? child = node!.right;
      TreeNode? grandChild = child!.left;
      // Using child as pivot, rotate node to the left
      child.left = node;
      node.right = grandChild;
      // Update node height
      updateHeight(node);
      updateHeight(child);
      // Return root node of subtree after rotation
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Left rotation operation */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // Using child as pivot, rotate node to the left
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // Update node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return root node of subtree after rotation
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Left rotation operation */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->right;
        grandChild = child->left;
        // Using child as pivot, rotate node to the left
        child->left = node;
        node->right = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Left rotation operation */
    fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Using child as pivot, rotate node to the left
        child.left = node
        node.right = grandChild
        // Update node height
        updateHeight(node)
        updateHeight(child)
        // Return root node of subtree after rotation
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Left rotation ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Using child as pivot, rotate node to the left
      child.left = node
      node.right = grand_child
      # Update node height
      update_height(node)
      update_height(child)
      # Return root node of subtree after rotation
      child
    end
    ```

### 3. &nbsp; Left Rotation Then Right Rotation

For the unbalanced node 3 in Figure 7-30, using either left rotation or right rotation alone cannot restore the subtree to balance. In this case, a "left rotation" needs to be performed on `child` first, followed by a "right rotation" on `node`.

![Left-right rotation](avl_tree.assets/avltree_left_right_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-30 &nbsp; Left-right rotation </p>

### 4. &nbsp; Right Rotation Then Left Rotation

As shown in Figure 7-31, for the mirror case of the above unbalanced binary tree, a "right rotation" needs to be performed on `child` first, then a "left rotation" on `node`.

![Right-left rotation](avl_tree.assets/avltree_right_left_rotate.png){ class="animation-figure" }

<p align="center"> Figure 7-31 &nbsp; Right-left rotation </p>

### 5. &nbsp; Choice of Rotation

The four imbalances shown in Figure 7-32 correspond one-to-one with the above cases, requiring right rotation, left rotation then right rotation, right rotation then left rotation, and left rotation operations respectively.

![The four rotation cases of AVL tree](avl_tree.assets/avltree_rotation_cases.png){ class="animation-figure" }

<p align="center"> Figure 7-32 &nbsp; The four rotation cases of AVL tree </p>

As shown in Table 7-3, we determine which case the unbalanced node belongs to by judging the signs of the balance factor of the unbalanced node and the balance factor of its taller-side child node.

<p align="center"> Table 7-3 &nbsp; Conditions for Choosing Among the Four Rotation Cases </p>

<div class="center-table" markdown>

| Balance factor of the unbalanced node | Balance factor of the child node | Rotation method to apply          |
| -------------------------------------- | --------------------------------- | --------------------------------- |
| $> 1$ (left-leaning tree)              | $\geq 0$                          | Right rotation                    |
| $> 1$ (left-leaning tree)              | $<0$                              | Left rotation then right rotation |
| $< -1$ (right-leaning tree)            | $\leq 0$                          | Left rotation                     |
| $< -1$ (right-leaning tree)            | $>0$                              | Right rotation then left rotation |

</div>

For ease of use, we encapsulate the rotation operations into a function. **With this function, we can perform rotations for various imbalance situations, restoring balance to unbalanced nodes**. The code is as follows:

=== "Python"

    ```python title="avl_tree.py"
    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Perform rotation operation to restore balance to this subtree"""
        # Get balance factor of node
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
        # Balanced tree, no rotation needed, return directly
        return node
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Perform rotation operation to restore balance to this subtree */
    TreeNode *rotate(TreeNode *node) {
        // Get balance factor of node
        int _balanceFactor = balanceFactor(node);
        // Left-leaning tree
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Right rotation
                return rightRotate(node);
            } else {
                // First left rotation then right rotation
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Right-leaning tree
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Left rotation
                return leftRotate(node);
            } else {
                // First right rotation then left rotation
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Perform rotation operation to restore balance to this subtree */
    TreeNode rotate(TreeNode node) {
        // Get balance factor of node
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
        // Balanced tree, no rotation needed, return directly
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Perform rotation operation to restore balance to this subtree */
    TreeNode? Rotate(TreeNode? node) {
        // Get balance factor of node
        int balanceFactorInt = BalanceFactor(node);
        // Left-leaning tree
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Right rotation
                return RightRotate(node);
            } else {
                // First left rotation then right rotation
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Left rotation
                return LeftRotate(node);
            } else {
                // First right rotation then left rotation
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Perform rotation operation to restore balance to this subtree */
    func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
        // Get balance factor of node
        // Go recommends short variables, here bf refers to t.balanceFactor
        bf := t.balanceFactor(node)
        // Left-leaning tree
        if bf > 1 {
            if t.balanceFactor(node.Left) >= 0 {
                // Right rotation
                return t.rightRotate(node)
            } else {
                // First left rotation then right rotation
                node.Left = t.leftRotate(node.Left)
                return t.rightRotate(node)
            }
        }
        // Right-leaning tree
        if bf < -1 {
            if t.balanceFactor(node.Right) <= 0 {
                // Left rotation
                return t.leftRotate(node)
            } else {
                // First right rotation then left rotation
                node.Right = t.rightRotate(node.Right)
                return t.leftRotate(node)
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Perform rotation operation to restore balance to this subtree */
    func rotate(node: TreeNode?) -> TreeNode? {
        // Get balance factor of node
        let balanceFactor = balanceFactor(node: node)
        // Left-leaning tree
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Right rotation
                return rightRotate(node: node)
            } else {
                // First left rotation then right rotation
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Right-leaning tree
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Left rotation
                return leftRotate(node: node)
            } else {
                // First right rotation then left rotation
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Perform rotation operation to restore balance to this subtree */
    #rotate(node) {
        // Get balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Right rotation
                return this.#rightRotate(node);
            } else {
                // First left rotation then right rotation
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Left rotation
                return this.#leftRotate(node);
            } else {
                // First right rotation then left rotation
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Perform rotation operation to restore balance to this subtree */
    rotate(node: TreeNode): TreeNode {
        // Get balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Right rotation
                return this.rightRotate(node);
            } else {
                // First left rotation then right rotation
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Left rotation
                return this.leftRotate(node);
            } else {
                // First right rotation then left rotation
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Perform rotation operation to restore balance to this subtree */
    TreeNode? rotate(TreeNode? node) {
      // Get balance factor of node
      int factor = balanceFactor(node);
      // Left-leaning tree
      if (factor > 1) {
        if (balanceFactor(node!.left) >= 0) {
          // Right rotation
          return rightRotate(node);
        } else {
          // First left rotation then right rotation
          node.left = leftRotate(node.left);
          return rightRotate(node);
        }
      }
      // Right-leaning tree
      if (factor < -1) {
        if (balanceFactor(node!.right) <= 0) {
          // Left rotation
          return leftRotate(node);
        } else {
          // First right rotation then left rotation
          node.right = rightRotate(node.right);
          return leftRotate(node);
        }
      }
      // Balanced tree, no rotation needed, return directly
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Perform rotation operation to restore balance to this subtree */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // Get balance factor of node
        let balance_factor = Self::balance_factor(node.clone());
        // Left-leaning tree
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // Right rotation
                Self::right_rotate(Some(node))
            } else {
                // First left rotation then right rotation
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // Right-leaning tree
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // Left rotation
                Self::left_rotate(Some(node))
            } else {
                // First right rotation then left rotation
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // Balanced tree, no rotation needed, return directly
            node
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Perform rotation operation to restore balance to this subtree */
    TreeNode *rotate(TreeNode *node) {
        // Get balance factor of node
        int bf = balanceFactor(node);
        // Left-leaning tree
        if (bf > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Right rotation
                return rightRotate(node);
            } else {
                // First left rotation then right rotation
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Right-leaning tree
        if (bf < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Left rotation
                return leftRotate(node);
            } else {
                // First right rotation then left rotation
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Perform rotation operation to restore balance to this subtree */
    fun rotate(node: TreeNode): TreeNode {
        // Get balance factor of node
        val balanceFactor = balanceFactor(node)
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Right rotation
                return rightRotate(node)
            } else {
                // First left rotation then right rotation
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Left rotation
                return leftRotate(node)
            } else {
                // First right rotation then left rotation
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Perform rotation to rebalance subtree ###
    def rotate(node)
      # Get balance factor of node
      balance_factor = balance_factor(node)
      # Left-heavy tree
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Right rotation
          return right_rotate(node)
        else
          # First left rotation then right rotation
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Right-heavy tree
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Left rotation
          return left_rotate(node)
        else
          # First right rotation then left rotation
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # Balanced tree, no rotation needed, return directly
      node
    end
    ```

## 7.5.3 &nbsp; Common Operations in Avl Trees

### 1. &nbsp; Node Insertion

The node insertion operation in AVL trees is similar in principle to that in binary search trees. The only difference is that after inserting a node in an AVL tree, a series of unbalanced nodes may appear on the path from that node to the root. Therefore, **we need to start from this node and perform rotation operations from bottom to top, restoring balance to all unbalanced nodes**. The code is as follows:

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
            # Duplicate node not inserted, return directly
            return node
        # Update node height
        self.update_height(node)
        # 2. Perform rotation operation to restore balance to this subtree
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Insert node */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Recursively insert node (helper method) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Duplicate node not inserted, return directly
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }
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
            return node; // Duplicate node not inserted, return directly
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Insert node */
    void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Recursively insert node (helper method) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Duplicate node not inserted, return directly
        UpdateHeight(node);  // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = Rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Insert node */
    func (t *aVLTree) insert(val int) {
        t.root = t.insertHelper(t.root, val)
    }

    /* Recursively insert node (helper function) */
    func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return NewTreeNode(val)
        }
        /* 1. Find insertion position and insert node */
        if val < node.Val.(int) {
            node.Left = t.insertHelper(node.Left, val)
        } else if val > node.Val.(int) {
            node.Right = t.insertHelper(node.Right, val)
        } else {
            // Duplicate node not inserted, return directly
            return node
        }
        // Update node height
        t.updateHeight(node)
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = t.rotate(node)
        // Return root node of subtree
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Insert node */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* Recursively insert node (helper method) */
    func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. Find insertion position and insert node */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Duplicate node not inserted, return directly
        }
        updateHeight(node: node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node: node)
        // Return root node of subtree
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Insert node */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* Recursively insert node (helper method) */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // Duplicate node not inserted, return directly
        this.#updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = this.#rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Insert node */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* Recursively insert node (helper method) */
    insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // Duplicate node not inserted, return directly
        }
        this.updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = this.rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Insert node */
    void insert(int val) {
      root = insertHelper(root, val);
    }

    /* Recursively insert node (helper method) */
    TreeNode? insertHelper(TreeNode? node, int val) {
      if (node == null) return TreeNode(val);
      /* 1. Find insertion position and insert node */
      if (val < node.val)
        node.left = insertHelper(node.left, val);
      else if (val > node.val)
        node.right = insertHelper(node.right, val);
      else
        return node; // Duplicate node not inserted, return directly
      updateHeight(node); // Update node height
      /* 2. Perform rotation operation to restore balance to this subtree */
      node = rotate(node);
      // Return root node of subtree
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Insert node */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* Recursively insert node (helper method) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find insertion position and insert node */
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
                        return Some(node); // Duplicate node not inserted, return directly
                    }
                }
                Self::update_height(Some(node.clone())); // Update node height

                /* 2. Perform rotation operation to restore balance to this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return root node of subtree
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Insert node */
    void insert(AVLTree *tree, int val) {
        tree->root = insertHelper(tree->root, val);
    }

    /* Recursively insert node (helper function) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == NULL) {
            return newTreeNode(val);
        }
        /* 1. Find insertion position and insert node */
        if (val < node->val) {
            node->left = insertHelper(node->left, val);
        } else if (val > node->val) {
            node->right = insertHelper(node->right, val);
        } else {
            // Duplicate node not inserted, return directly
            return node;
        }
        // Update node height
        updateHeight(node);
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Insert node */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* Recursively insert node (helper method) */
    fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. Find insertion position and insert node */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Duplicate node not inserted, return directly
        updateHeight(node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node)
        // Return root node of subtree
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Insert node ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    ### Recursively insert node (helper method) ###
    def insert_helper(node, val)
      return TreeNode.new(val) if node.nil?
      # 1. Find insertion position and insert node
      if val < node.val
        node.left = insert_helper(node.left, val)
      elsif val > node.val
        node.right = insert_helper(node.right, val)
      else
        # Duplicate node not inserted, return directly
        return node
      end
      # Update node height
      update_height(node)
      # 2. Perform rotation operation to restore balance to this subtree
      rotate(node)
    end
    ```

### 2. &nbsp; Node Removal

Similarly, on the basis of the binary search tree's node removal method, rotation operations need to be performed from bottom to top to restore balance to all unbalanced nodes. The code is as follows:

=== "Python"

    ```python title="avl_tree.py"
    def remove(self, val: int):
        """Delete node"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Recursively delete node (helper method)"""
        if node is None:
            return None
        # 1. Find node and delete
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # Number of child nodes = 0, delete node directly and return
                if child is None:
                    return None
                # Number of child nodes = 1, delete node directly
                else:
                    node = child
            else:
                # Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Update node height
        self.update_height(node)
        # 2. Perform rotation operation to restore balance to this subtree
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Remove node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Recursively delete node (helper method) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. Find node and delete */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // Number of child nodes = 0, delete node directly and return
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Number of child nodes = 1, delete node directly
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Remove node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Recursively delete node (helper method) */
    TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. Find node and delete */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // Number of child nodes = 0, delete node directly and return
                if (child == null)
                    return null;
                // Number of child nodes = 1, delete node directly
                else
                    node = child;
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Remove node */
    void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Recursively delete node (helper method) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Find node and delete */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // Number of child nodes = 0, delete node directly and return
                if (child == null)
                    return null;
                // Number of child nodes = 1, delete node directly
                else
                    node = child;
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = Rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Remove node */
    func (t *aVLTree) remove(val int) {
        t.root = t.removeHelper(t.root, val)
    }

    /* Recursively remove node (helper function) */
    func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return nil
        }
        /* 1. Find node and delete */
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
                    // Number of child nodes = 0, delete node directly and return
                    return nil
                } else {
                    // Number of child nodes = 1, delete node directly
                    node = child
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                temp := node.Right
                for temp.Left != nil {
                    temp = temp.Left
                }
                node.Right = t.removeHelper(node.Right, temp.Val.(int))
                node.Val = temp.Val
            }
        }
        // Update node height
        t.updateHeight(node)
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = t.rotate(node)
        // Return root node of subtree
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Remove node */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Recursively delete node (helper method) */
    func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Find node and delete */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Number of child nodes = 0, delete node directly and return
                if child == nil {
                    return nil
                }
                // Number of child nodes = 1, delete node directly
                else {
                    node = child
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node: node)
        // Return root node of subtree
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Remove node */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* Recursively delete node (helper method) */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. Find node and delete */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Number of child nodes = 0, delete node directly and return
                if (child === null) return null;
                // Number of child nodes = 1, delete node directly
                else node = child;
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = this.#rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Remove node */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Recursively delete node (helper method) */
    removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. Find node and delete */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Number of child nodes = 0, delete node directly and return
                if (child === null) {
                    return null;
                } else {
                    // Number of child nodes = 1, delete node directly
                    node = child;
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = this.rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Remove node */
    void remove(int val) {
      root = removeHelper(root, val);
    }

    /* Recursively delete node (helper method) */
    TreeNode? removeHelper(TreeNode? node, int val) {
      if (node == null) return null;
      /* 1. Find node and delete */
      if (val < node.val)
        node.left = removeHelper(node.left, val);
      else if (val > node.val)
        node.right = removeHelper(node.right, val);
      else {
        if (node.left == null || node.right == null) {
          TreeNode? child = node.left ?? node.right;
          // Number of child nodes = 0, delete node directly and return
          if (child == null)
            return null;
          // Number of child nodes = 1, delete node directly
          else
            node = child;
        } else {
          // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
          TreeNode? temp = node.right;
          while (temp!.left != null) {
            temp = temp.left;
          }
          node.right = removeHelper(node.right, temp.val);
          node.val = temp.val;
        }
      }
      updateHeight(node); // Update node height
      /* 2. Perform rotation operation to restore balance to this subtree */
      node = rotate(node);
      // Return root node of subtree
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Remove node */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* Recursively delete node (helper method) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find node and delete */
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
                        // Number of child nodes = 0, delete node directly and return
                        None => {
                            return None;
                        }
                        // Number of child nodes = 1, delete node directly
                        Some(child) => node = child,
                    }
                } else {
                    // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
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
                Self::update_height(Some(node.clone())); // Update node height

                /* 2. Perform rotation operation to restore balance to this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return root node of subtree
                Some(node)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Remove node */
    // Cannot use remove keyword here due to stdio.h inclusion
    void removeItem(AVLTree *tree, int val) {
        TreeNode *root = removeHelper(tree->root, val);
    }

    /* Recursively remove node (helper function) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        TreeNode *child, *grandChild;
        if (node == NULL) {
            return NULL;
        }
        /* 1. Find node and delete */
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
                // Number of child nodes = 0, delete node directly and return
                if (child == NULL) {
                    return NULL;
                } else {
                    // Number of child nodes = 1, delete node directly
                    node = child;
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                TreeNode *temp = node->right;
                while (temp->left != NULL) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        // Update node height
        updateHeight(node);
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Remove node */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Recursively delete node (helper method) */
    fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Find node and delete */
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
                // Number of child nodes = 0, delete node directly and return
                if (child == null)
                    return null
                // Number of child nodes = 1, delete node directly
                else
                    node = child
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node)
        // Return root node of subtree
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
    ### Delete node ###
    def remove(val)
      @root = remove_helper(@root, val)
    end

    ### Recursively delete node (helper method) ###
    def remove_helper(node, val)
      return if node.nil?
      # 1. Find node and delete
      if val < node.val
        node.left = remove_helper(node.left, val)
      elsif val > node.val
        node.right = remove_helper(node.right, val)
      else
        if node.left.nil? || node.right.nil?
          child = node.left || node.right
          # Number of child nodes = 0, delete node directly and return
          return if child.nil?
          # Number of child nodes = 1, delete node directly
          node = child
        else
          # Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
          temp = node.right
          while !temp.left.nil?
            temp = temp.left
          end
          node.right = remove_helper(node.right, temp.val)
          node.val = temp.val
        end
      end
      # Update node height
      update_height(node)
      # 2. Perform rotation operation to restore balance to this subtree
      rotate(node)
    end
    ```

### 3. &nbsp; Node Search

The node search operation in AVL trees is consistent with that in binary search trees, and will not be elaborated here.

## 7.5.4 &nbsp; Typical Applications of Avl Trees

- Organizing and storing large-scale data, suitable for scenarios with high-frequency searches and low-frequency insertions and deletions.
- Used to build index systems in databases.
- Red-black trees are also a common type of balanced binary search tree. Compared to AVL trees, red-black trees have more relaxed balance conditions, require fewer rotation operations for node insertion and deletion, and have higher average efficiency for node addition and deletion operations.
