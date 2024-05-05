---
comments: true
---

# 7.2 &nbsp; Binary tree traversal

From the perspective of physical structure, a tree is a data structure based on linked lists, hence its traversal method involves accessing nodes one by one through pointers. However, a tree is a non-linear data structure, which makes traversing a tree more complex than traversing a linked list, requiring the assistance of search algorithms to achieve.

Common traversal methods for binary trees include level-order traversal, preorder traversal, inorder traversal, and postorder traversal, among others.

## 7.2.1 &nbsp; Level-order traversal

As shown in Figure 7-9, <u>level-order traversal</u> traverses the binary tree from top to bottom, layer by layer, and accesses nodes in each layer in a left-to-right order.

Level-order traversal essentially belongs to <u>breadth-first traversal</u>, also known as <u>breadth-first search (BFS)</u>, which embodies a "circumferentially outward expanding" layer-by-layer traversal method.

![Level-order traversal of a binary tree](binary_tree_traversal.assets/binary_tree_bfs.png){ class="animation-figure" }

<p align="center"> Figure 7-9 &nbsp; Level-order traversal of a binary tree </p>

### 1. &nbsp; Code implementation

Breadth-first traversal is usually implemented with the help of a "queue". The queue follows the "first in, first out" rule, while breadth-first traversal follows the "layer-by-layer progression" rule, the underlying ideas of the two are consistent. The implementation code is as follows:

=== "Python"

    ```python title="binary_tree_bfs.py"
    def level_order(root: TreeNode | None) -> list[int]:
        """Level-order traversal"""
        # Initialize queue, add root node
        queue: deque[TreeNode] = deque()
        queue.append(root)
        # Initialize a list to store the traversal sequence
        res = []
        while queue:
            node: TreeNode = queue.popleft()  # Queue dequeues
            res.append(node.val)  # Save node value
            if node.left is not None:
                queue.append(node.left)  # Left child node enqueues
            if node.right is not None:
                queue.append(node.right)  # Right child node enqueues
        return res
    ```

=== "C++"

    ```cpp title="binary_tree_bfs.cpp"
    [class]{}-[func]{levelOrder}
    ```

=== "Java"

    ```java title="binary_tree_bfs.java"
    /* Level-order traversal */
    List<Integer> levelOrder(TreeNode root) {
        // Initialize queue, add root node
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // Initialize a list to store the traversal sequence
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // Queue dequeues
            list.add(node.val);           // Save node value
            if (node.left != null)
                queue.offer(node.left);   // Left child node enqueues
            if (node.right != null)
                queue.offer(node.right);  // Right child node enqueues
        }
        return list;
    }
    ```

=== "C#"

    ```csharp title="binary_tree_bfs.cs"
    [class]{binary_tree_bfs}-[func]{LevelOrder}
    ```

=== "Go"

    ```go title="binary_tree_bfs.go"
    [class]{}-[func]{levelOrder}
    ```

=== "Swift"

    ```swift title="binary_tree_bfs.swift"
    [class]{}-[func]{levelOrder}
    ```

=== "JS"

    ```javascript title="binary_tree_bfs.js"
    [class]{}-[func]{levelOrder}
    ```

=== "TS"

    ```typescript title="binary_tree_bfs.ts"
    [class]{}-[func]{levelOrder}
    ```

=== "Dart"

    ```dart title="binary_tree_bfs.dart"
    [class]{}-[func]{levelOrder}
    ```

=== "Rust"

    ```rust title="binary_tree_bfs.rs"
    [class]{}-[func]{level_order}
    ```

=== "C"

    ```c title="binary_tree_bfs.c"
    [class]{}-[func]{levelOrder}
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_bfs.kt"
    [class]{}-[func]{levelOrder}
    ```

=== "Ruby"

    ```ruby title="binary_tree_bfs.rb"
    [class]{}-[func]{level_order}
    ```

=== "Zig"

    ```zig title="binary_tree_bfs.zig"
    [class]{}-[func]{levelOrder}
    ```

### 2. &nbsp; Complexity analysis

- **Time complexity is $O(n)$**: All nodes are visited once, using $O(n)$ time, where $n$ is the number of nodes.
- **Space complexity is $O(n)$**: In the worst case, i.e., a full binary tree, before traversing to the lowest level, the queue can contain at most $(n + 1) / 2$ nodes at the same time, occupying $O(n)$ space.

## 7.2.2 &nbsp; Preorder, inorder, and postorder traversal

Correspondingly, preorder, inorder, and postorder traversal all belong to <u>depth-first traversal</u>, also known as <u>depth-first search (DFS)</u>, which embodies a "proceed to the end first, then backtrack and continue" traversal method.

Figure 7-10 shows the working principle of performing a depth-first traversal on a binary tree. **Depth-first traversal is like walking around the perimeter of the entire binary tree**, encountering three positions at each node, corresponding to preorder traversal, inorder traversal, and postorder traversal.

![Preorder, inorder, and postorder traversal of a binary search tree](binary_tree_traversal.assets/binary_tree_dfs.png){ class="animation-figure" }

<p align="center"> Figure 7-10 &nbsp; Preorder, inorder, and postorder traversal of a binary search tree </p>

### 1. &nbsp; Code implementation

Depth-first search is usually implemented based on recursion:

=== "Python"

    ```python title="binary_tree_dfs.py"
    def pre_order(root: TreeNode | None):
        """Pre-order traversal"""
        if root is None:
            return
        # Visit priority: root node -> left subtree -> right subtree
        res.append(root.val)
        pre_order(root=root.left)
        pre_order(root=root.right)

    def in_order(root: TreeNode | None):
        """In-order traversal"""
        if root is None:
            return
        # Visit priority: left subtree -> root node -> right subtree
        in_order(root=root.left)
        res.append(root.val)
        in_order(root=root.right)

    def post_order(root: TreeNode | None):
        """Post-order traversal"""
        if root is None:
            return
        # Visit priority: left subtree -> right subtree -> root node
        post_order(root=root.left)
        post_order(root=root.right)
        res.append(root.val)
    ```

=== "C++"

    ```cpp title="binary_tree_dfs.cpp"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Java"

    ```java title="binary_tree_dfs.java"
    /* Pre-order traversal */
    void preOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: root node -> left subtree -> right subtree
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* In-order traversal */
    void inOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* Post-order traversal */
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
    [class]{binary_tree_dfs}-[func]{PreOrder}

    [class]{binary_tree_dfs}-[func]{InOrder}

    [class]{binary_tree_dfs}-[func]{PostOrder}
    ```

=== "Go"

    ```go title="binary_tree_dfs.go"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Swift"

    ```swift title="binary_tree_dfs.swift"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "JS"

    ```javascript title="binary_tree_dfs.js"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "TS"

    ```typescript title="binary_tree_dfs.ts"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Dart"

    ```dart title="binary_tree_dfs.dart"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Rust"

    ```rust title="binary_tree_dfs.rs"
    [class]{}-[func]{pre_order}

    [class]{}-[func]{in_order}

    [class]{}-[func]{post_order}
    ```

=== "C"

    ```c title="binary_tree_dfs.c"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_dfs.kt"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Ruby"

    ```ruby title="binary_tree_dfs.rb"
    [class]{}-[func]{pre_order}

    [class]{}-[func]{in_order}

    [class]{}-[func]{post_order}
    ```

=== "Zig"

    ```zig title="binary_tree_dfs.zig"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

!!! tip

    Depth-first search can also be implemented based on iteration, interested readers can study this on their own.

Figure 7-11 shows the recursive process of preorder traversal of a binary tree, which can be divided into two opposite parts: "recursion" and "return".

1. "Recursion" means starting a new method, the program accesses the next node in this process.
2. "Return" means the function returns, indicating the current node has been fully accessed.

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

### 2. &nbsp; Complexity analysis

- **Time complexity is $O(n)$**: All nodes are visited once, using $O(n)$ time.
- **Space complexity is $O(n)$**: In the worst case, i.e., the tree degrades into a linked list, the recursion depth reaches $n$, the system occupies $O(n)$ stack frame space.
