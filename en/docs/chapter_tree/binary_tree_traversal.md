---
comments: true
---

# 7.2 &nbsp; Binary Tree Traversal

From a physical structure perspective, a tree is a data structure based on linked lists. Hence, its traversal method involves accessing nodes one by one through pointers. However, a tree is a non-linear data structure, which makes traversing a tree more complex than traversing a linked list, requiring the assistance of search algorithms.

The common traversal methods for binary trees include level-order traversal, pre-order traversal, in-order traversal, and post-order traversal.

## 7.2.1 &nbsp; Level-Order Traversal

As shown in Figure 7-9, <u>level-order traversal</u> traverses the binary tree from top to bottom, layer by layer. Within each level, it visits nodes from left to right.

Level-order traversal is essentially <u>breadth-first traversal</u>, also known as <u>breadth-first search (BFS)</u>, which embodies a "expanding outward circle by circle" layer-by-layer traversal method.

![Level-order traversal of a binary tree](binary_tree_traversal.assets/binary_tree_bfs.png){ class="animation-figure" }

<p align="center"> Figure 7-9 &nbsp; Level-order traversal of a binary tree </p>

### 1. &nbsp; Code Implementation

Breadth-first traversal is typically implemented with the help of a "queue". The queue follows the "first in, first out" rule, while breadth-first traversal follows the "layer-by-layer progression" rule; the underlying ideas of the two are consistent. The implementation code is as follows:

=== "Python"

    ```python title="binary_tree_bfs.py"
    def level_order(root: TreeNode | None) -> list[int]:
        """Level-order traversal"""
        # Initialize queue, add root node
        queue: deque[TreeNode] = deque()
        queue.append(root)
        # Initialize a list to save the traversal sequence
        res = []
        while queue:
            node: TreeNode = queue.popleft()  # Dequeue
            res.append(node.val)  # Save node value
            if node.left is not None:
                queue.append(node.left)  # Left child node enqueue
            if node.right is not None:
                queue.append(node.right)  # Right child node enqueue
        return res
    ```

=== "C++"

    ```cpp title="binary_tree_bfs.cpp"
    /* Level-order traversal */
    vector<int> levelOrder(TreeNode *root) {
        // Initialize queue, add root node
        queue<TreeNode *> queue;
        queue.push(root);
        // Initialize a list to save the traversal sequence
        vector<int> vec;
        while (!queue.empty()) {
            TreeNode *node = queue.front();
            queue.pop();              // Dequeue
            vec.push_back(node->val); // Save node value
            if (node->left != nullptr)
                queue.push(node->left); // Left child node enqueue
            if (node->right != nullptr)
                queue.push(node->right); // Right child node enqueue
        }
        return vec;
    }
    ```

=== "Java"

    ```java title="binary_tree_bfs.java"
    /* Level-order traversal */
    List<Integer> levelOrder(TreeNode root) {
        // Initialize queue, add root node
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // Initialize a list to save the traversal sequence
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // Dequeue
            list.add(node.val);           // Save node value
            if (node.left != null)
                queue.offer(node.left);   // Left child node enqueue
            if (node.right != null)
                queue.offer(node.right);  // Right child node enqueue
        }
        return list;
    }
    ```

=== "C#"

    ```csharp title="binary_tree_bfs.cs"
    /* Level-order traversal */
    List<int> LevelOrder(TreeNode root) {
        // Initialize queue, add root node
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // Initialize a list to save the traversal sequence
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // Dequeue
            list.Add(node.val!.Value);       // Save node value
            if (node.left != null)
                queue.Enqueue(node.left);    // Left child node enqueue
            if (node.right != null)
                queue.Enqueue(node.right);   // Right child node enqueue
        }
        return list;
    }
    ```

=== "Go"

    ```go title="binary_tree_bfs.go"
    /* Level-order traversal */
    func levelOrder(root *TreeNode) []any {
        // Initialize queue, add root node
        queue := list.New()
        queue.PushBack(root)
        // Initialize a slice to save traversal sequence
        nums := make([]any, 0)
        for queue.Len() > 0 {
            // Dequeue
            node := queue.Remove(queue.Front()).(*TreeNode)
            // Save node value
            nums = append(nums, node.Val)
            if node.Left != nil {
                // Left child node enqueue
                queue.PushBack(node.Left)
            }
            if node.Right != nil {
                // Right child node enqueue
                queue.PushBack(node.Right)
            }
        }
        return nums
    }
    ```

=== "Swift"

    ```swift title="binary_tree_bfs.swift"
    /* Level-order traversal */
    func levelOrder(root: TreeNode) -> [Int] {
        // Initialize queue, add root node
        var queue: [TreeNode] = [root]
        // Initialize a list to save the traversal sequence
        var list: [Int] = []
        while !queue.isEmpty {
            let node = queue.removeFirst() // Dequeue
            list.append(node.val) // Save node value
            if let left = node.left {
                queue.append(left) // Left child node enqueue
            }
            if let right = node.right {
                queue.append(right) // Right child node enqueue
            }
        }
        return list
    }
    ```

=== "JS"

    ```javascript title="binary_tree_bfs.js"
    /* Level-order traversal */
    function levelOrder(root) {
        // Initialize queue, add root node
        const queue = [root];
        // Initialize a list to save the traversal sequence
        const list = [];
        while (queue.length) {
            let node = queue.shift(); // Dequeue
            list.push(node.val); // Save node value
            if (node.left) queue.push(node.left); // Left child node enqueue
            if (node.right) queue.push(node.right); // Right child node enqueue
        }
        return list;
    }
    ```

=== "TS"

    ```typescript title="binary_tree_bfs.ts"
    /* Level-order traversal */
    function levelOrder(root: TreeNode | null): number[] {
        // Initialize queue, add root node
        const queue = [root];
        // Initialize a list to save the traversal sequence
        const list: number[] = [];
        while (queue.length) {
            let node = queue.shift() as TreeNode; // Dequeue
            list.push(node.val); // Save node value
            if (node.left) {
                queue.push(node.left); // Left child node enqueue
            }
            if (node.right) {
                queue.push(node.right); // Right child node enqueue
            }
        }
        return list;
    }
    ```

=== "Dart"

    ```dart title="binary_tree_bfs.dart"
    /* Level-order traversal */
    List<int> levelOrder(TreeNode? root) {
      // Initialize queue, add root node
      Queue<TreeNode?> queue = Queue();
      queue.add(root);
      // Initialize a list to save the traversal sequence
      List<int> res = [];
      while (queue.isNotEmpty) {
        TreeNode? node = queue.removeFirst(); // Dequeue
        res.add(node!.val); // Save node value
        if (node.left != null) queue.add(node.left); // Left child node enqueue
        if (node.right != null) queue.add(node.right); // Right child node enqueue
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="binary_tree_bfs.rs"
    /* Level-order traversal */
    fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
        // Initialize queue, add root node
        let mut que = VecDeque::new();
        que.push_back(root.clone());
        // Initialize a list to save the traversal sequence
        let mut vec = Vec::new();

        while let Some(node) = que.pop_front() {
            // Dequeue
            vec.push(node.borrow().val); // Save node value
            if let Some(left) = node.borrow().left.as_ref() {
                que.push_back(left.clone()); // Left child node enqueue
            }
            if let Some(right) = node.borrow().right.as_ref() {
                que.push_back(right.clone()); // Right child node enqueue
            };
        }
        vec
    }
    ```

=== "C"

    ```c title="binary_tree_bfs.c"
    /* Level-order traversal */
    int *levelOrder(TreeNode *root, int *size) {
        /* Auxiliary queue */
        int front, rear;
        int index, *arr;
        TreeNode *node;
        TreeNode **queue;

        /* Auxiliary queue */
        queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
        // Queue pointer
        front = 0, rear = 0;
        // Add root node
        queue[rear++] = root;
        // Initialize a list to save the traversal sequence
        /* Auxiliary array */
        arr = (int *)malloc(sizeof(int) * MAX_SIZE);
        // Array pointer
        index = 0;
        while (front < rear) {
            // Dequeue
            node = queue[front++];
            // Save node value
            arr[index++] = node->val;
            if (node->left != NULL) {
                // Left child node enqueue
                queue[rear++] = node->left;
            }
            if (node->right != NULL) {
                // Right child node enqueue
                queue[rear++] = node->right;
            }
        }
        // Update array length value
        *size = index;
        arr = realloc(arr, sizeof(int) * (*size));

        // Free auxiliary array space
        free(queue);
        return arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_bfs.kt"
    /* Level-order traversal */
    fun levelOrder(root: TreeNode?): MutableList<Int> {
        // Initialize queue, add root node
        val queue = LinkedList<TreeNode?>()
        queue.add(root)
        // Initialize a list to save the traversal sequence
        val list = mutableListOf<Int>()
        while (queue.isNotEmpty()) {
            val node = queue.poll()      // Dequeue
            list.add(node?._val!!)       // Save node value
            if (node.left != null)
                queue.offer(node.left)   // Left child node enqueue
            if (node.right != null)
                queue.offer(node.right)  // Right child node enqueue
        }
        return list
    }
    ```

=== "Ruby"

    ```ruby title="binary_tree_bfs.rb"
    ### Level-order traversal ###
    def level_order(root)
      # Initialize queue, add root node
      queue = [root]
      # Initialize a list to save the traversal sequence
      res = []
      while !queue.empty?
        node = queue.shift # Dequeue
        res << node.val # Save node value
        queue << node.left unless node.left.nil? # Left child node enqueue
        queue << node.right unless node.right.nil? # Right child node enqueue
      end
      res
    end
    ```

### 2. &nbsp; Complexity Analysis

- **Time complexity is $O(n)$**: All nodes are visited once, using $O(n)$ time, where $n$ is the number of nodes.
- **Space complexity is $O(n)$**: In the worst case, i.e., a full binary tree, before traversing to the bottom level, the queue contains at most $(n + 1) / 2$ nodes simultaneously, occupying $O(n)$ space.

## 7.2.2 &nbsp; Preorder, Inorder, and Postorder Traversal

Correspondingly, preorder, inorder, and postorder traversals all belong to <u>depth-first traversal</u>, also known as <u>depth-first search (DFS)</u>, which embodies a "first go to the end, then backtrack and continue" traversal method.

Figure 7-10 shows how depth-first traversal works on a binary tree. **Depth-first traversal is like "walking" around the perimeter of the entire binary tree**, encountering three positions at each node, corresponding to preorder, inorder, and postorder traversal.

![Preorder, inorder, and postorder traversal of a binary tree](binary_tree_traversal.assets/binary_tree_dfs.png){ class="animation-figure" }

<p align="center"> Figure 7-10 &nbsp; Preorder, inorder, and postorder traversal of a binary tree </p>

### 1. &nbsp; Code Implementation

Depth-first search is usually implemented based on recursion:

=== "Python"

    ```python title="binary_tree_dfs.py"
    def pre_order(root: TreeNode | None):
        """Preorder traversal"""
        if root is None:
            return
        # Visit priority: root node -> left subtree -> right subtree
        res.append(root.val)
        pre_order(root=root.left)
        pre_order(root=root.right)

    def in_order(root: TreeNode | None):
        """Inorder traversal"""
        if root is None:
            return
        # Visit priority: left subtree -> root node -> right subtree
        in_order(root=root.left)
        res.append(root.val)
        in_order(root=root.right)

    def post_order(root: TreeNode | None):
        """Postorder traversal"""
        if root is None:
            return
        # Visit priority: left subtree -> right subtree -> root node
        post_order(root=root.left)
        post_order(root=root.right)
        res.append(root.val)
    ```

=== "C++"

    ```cpp title="binary_tree_dfs.cpp"
    /* Preorder traversal */
    void preOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // Visit priority: root node -> left subtree -> right subtree
        vec.push_back(root->val);
        preOrder(root->left);
        preOrder(root->right);
    }

    /* Inorder traversal */
    void inOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root->left);
        vec.push_back(root->val);
        inOrder(root->right);
    }

    /* Postorder traversal */
    void postOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root->left);
        postOrder(root->right);
        vec.push_back(root->val);
    }
    ```

=== "Java"

    ```java title="binary_tree_dfs.java"
    /* Preorder traversal */
    void preOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: root node -> left subtree -> right subtree
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* Inorder traversal */
    void inOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* Postorder traversal */
    void postOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }
    ```

=== "C#"

    ```csharp title="binary_tree_dfs.cs"
    /* Preorder traversal */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // Visit priority: root node -> left subtree -> right subtree
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* Inorder traversal */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // Visit priority: left subtree -> root node -> right subtree
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* Postorder traversal */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // Visit priority: left subtree -> right subtree -> root node
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }
    ```

=== "Go"

    ```go title="binary_tree_dfs.go"
    /* Preorder traversal */
    func preOrder(node *TreeNode) {
        if node == nil {
            return
        }
        // Visit priority: root node -> left subtree -> right subtree
        nums = append(nums, node.Val)
        preOrder(node.Left)
        preOrder(node.Right)
    }

    /* Inorder traversal */
    func inOrder(node *TreeNode) {
        if node == nil {
            return
        }
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(node.Left)
        nums = append(nums, node.Val)
        inOrder(node.Right)
    }

    /* Postorder traversal */
    func postOrder(node *TreeNode) {
        if node == nil {
            return
        }
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(node.Left)
        postOrder(node.Right)
        nums = append(nums, node.Val)
    }
    ```

=== "Swift"

    ```swift title="binary_tree_dfs.swift"
    /* Preorder traversal */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // Visit priority: root node -> left subtree -> right subtree
        list.append(root.val)
        preOrder(root: root.left)
        preOrder(root: root.right)
    }

    /* Inorder traversal */
    func inOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root: root.left)
        list.append(root.val)
        inOrder(root: root.right)
    }

    /* Postorder traversal */
    func postOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root: root.left)
        postOrder(root: root.right)
        list.append(root.val)
    }
    ```

=== "JS"

    ```javascript title="binary_tree_dfs.js"
    /* Preorder traversal */
    function preOrder(root) {
        if (root === null) return;
        // Visit priority: root node -> left subtree -> right subtree
        list.push(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* Inorder traversal */
    function inOrder(root) {
        if (root === null) return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left);
        list.push(root.val);
        inOrder(root.right);
    }

    /* Postorder traversal */
    function postOrder(root) {
        if (root === null) return;
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root.left);
        postOrder(root.right);
        list.push(root.val);
    }
    ```

=== "TS"

    ```typescript title="binary_tree_dfs.ts"
    /* Preorder traversal */
    function preOrder(root: TreeNode | null): void {
        if (root === null) {
            return;
        }
        // Visit priority: root node -> left subtree -> right subtree
        list.push(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* Inorder traversal */
    function inOrder(root: TreeNode | null): void {
        if (root === null) {
            return;
        }
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left);
        list.push(root.val);
        inOrder(root.right);
    }

    /* Postorder traversal */
    function postOrder(root: TreeNode | null): void {
        if (root === null) {
            return;
        }
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root.left);
        postOrder(root.right);
        list.push(root.val);
    }
    ```

=== "Dart"

    ```dart title="binary_tree_dfs.dart"
    /* Preorder traversal */
    void preOrder(TreeNode? node) {
      if (node == null) return;
      // Visit priority: root node -> left subtree -> right subtree
      list.add(node.val);
      preOrder(node.left);
      preOrder(node.right);
    }

    /* Inorder traversal */
    void inOrder(TreeNode? node) {
      if (node == null) return;
      // Visit priority: left subtree -> root node -> right subtree
      inOrder(node.left);
      list.add(node.val);
      inOrder(node.right);
    }

    /* Postorder traversal */
    void postOrder(TreeNode? node) {
      if (node == null) return;
      // Visit priority: left subtree -> right subtree -> root node
      postOrder(node.left);
      postOrder(node.right);
      list.add(node.val);
    }
    ```

=== "Rust"

    ```rust title="binary_tree_dfs.rs"
    /* Preorder traversal */
    fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = vec![];

        fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
            if let Some(node) = root {
                // Visit priority: root node -> left subtree -> right subtree
                let node = node.borrow();
                res.push(node.val);
                dfs(node.left.as_ref(), res);
                dfs(node.right.as_ref(), res);
            }
        }
        dfs(root, &mut result);

        result
    }

    /* Inorder traversal */
    fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = vec![];

        fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
            if let Some(node) = root {
                // Visit priority: left subtree -> root node -> right subtree
                let node = node.borrow();
                dfs(node.left.as_ref(), res);
                res.push(node.val);
                dfs(node.right.as_ref(), res);
            }
        }
        dfs(root, &mut result);

        result
    }

    /* Postorder traversal */
    fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = vec![];

        fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
            if let Some(node) = root {
                // Visit priority: left subtree -> right subtree -> root node
                let node = node.borrow();
                dfs(node.left.as_ref(), res);
                dfs(node.right.as_ref(), res);
                res.push(node.val);
            }
        }

        dfs(root, &mut result);

        result
    }
    ```

=== "C"

    ```c title="binary_tree_dfs.c"
    /* Preorder traversal */
    void preOrder(TreeNode *root, int *size) {
        if (root == NULL)
            return;
        // Visit priority: root node -> left subtree -> right subtree
        arr[(*size)++] = root->val;
        preOrder(root->left, size);
        preOrder(root->right, size);
    }

    /* Inorder traversal */
    void inOrder(TreeNode *root, int *size) {
        if (root == NULL)
            return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root->left, size);
        arr[(*size)++] = root->val;
        inOrder(root->right, size);
    }

    /* Postorder traversal */
    void postOrder(TreeNode *root, int *size) {
        if (root == NULL)
            return;
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root->left, size);
        postOrder(root->right, size);
        arr[(*size)++] = root->val;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_dfs.kt"
    /* Preorder traversal */
    fun preOrder(root: TreeNode?) {
        if (root == null) return
        // Visit priority: root node -> left subtree -> right subtree
        list.add(root._val)
        preOrder(root.left)
        preOrder(root.right)
    }

    /* Inorder traversal */
    fun inOrder(root: TreeNode?) {
        if (root == null) return
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left)
        list.add(root._val)
        inOrder(root.right)
    }

    /* Postorder traversal */
    fun postOrder(root: TreeNode?) {
        if (root == null) return
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root.left)
        postOrder(root.right)
        list.add(root._val)
    }
    ```

=== "Ruby"

    ```ruby title="binary_tree_dfs.rb"
    ### Pre-order traversal ###
    def pre_order(root)
      return if root.nil?

      # Visit priority: root node -> left subtree -> right subtree
      $res << root.val
      pre_order(root.left)
      pre_order(root.right)
    end

    ### In-order traversal ###
    def in_order(root)
      return if root.nil?

      # Visit priority: left subtree -> root node -> right subtree
      in_order(root.left)
      $res << root.val
      in_order(root.right)
    end

    ### Post-order traversal ###
    def post_order(root)
      return if root.nil?

      # Visit priority: left subtree -> right subtree -> root node
      post_order(root.left)
      post_order(root.right)
      $res << root.val
    end
    ```

!!! tip

    Depth-first search can also be implemented based on iteration, interested readers can study this on their own.

Figure 7-11 shows the recursive process of preorder traversal of a binary tree, which can be divided into two opposite parts: "recursion" and "return".

1. "Recursion" means opening a new method, where the program accesses the next node in this process.
2. "Return" means the function returns, indicating that the current node has been fully visited.

=== "<1>"
    ![The recursive process of preorder traversal](binary_tree_traversal.assets/preorder_step1.png){ class="animation-figure" }

=== "<2>"
    ![preorder_step2](binary_tree_traversal.assets/preorder_step2.png){ class="animation-figure" }

=== "<3>"
    ![preorder_step3](binary_tree_traversal.assets/preorder_step3.png){ class="animation-figure" }

=== "<4>"
    ![preorder_step4](binary_tree_traversal.assets/preorder_step4.png){ class="animation-figure" }

=== "<5>"
    ![preorder_step5](binary_tree_traversal.assets/preorder_step5.png){ class="animation-figure" }

=== "<6>"
    ![preorder_step6](binary_tree_traversal.assets/preorder_step6.png){ class="animation-figure" }

=== "<7>"
    ![preorder_step7](binary_tree_traversal.assets/preorder_step7.png){ class="animation-figure" }

=== "<8>"
    ![preorder_step8](binary_tree_traversal.assets/preorder_step8.png){ class="animation-figure" }

=== "<9>"
    ![preorder_step9](binary_tree_traversal.assets/preorder_step9.png){ class="animation-figure" }

=== "<10>"
    ![preorder_step10](binary_tree_traversal.assets/preorder_step10.png){ class="animation-figure" }

=== "<11>"
    ![preorder_step11](binary_tree_traversal.assets/preorder_step11.png){ class="animation-figure" }

<p align="center"> Figure 7-11 &nbsp; The recursive process of preorder traversal </p>

### 2. &nbsp; Complexity Analysis

- **Time complexity is $O(n)$**: All nodes are visited once, using $O(n)$ time.
- **Space complexity is $O(n)$**: In the worst case, i.e., the tree degenerates into a linked list, the recursion depth reaches $n$, and the system occupies $O(n)$ stack frame space.
