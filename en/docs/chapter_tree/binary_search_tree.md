---
comments: true
---

# 7.4 &nbsp; Binary search tree

As shown in Figure 7-16, a <u>binary search tree</u> satisfies the following conditions.

1. For the root node, the value of all nodes in the left subtree $<$ the value of the root node $<$ the value of all nodes in the right subtree.
2. The left and right subtrees of any node are also binary search trees, i.e., they satisfy condition `1.` as well.

![Binary search tree](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-16 &nbsp; Binary search tree </p>

## 7.4.1 &nbsp; Operations on a binary search tree

We encapsulate the binary search tree as a class `BinarySearchTree` and declare a member variable `root`, pointing to the tree's root node.

### 1. &nbsp; Searching for a node

Given a target node value `num`, one can search according to the properties of the binary search tree. As shown in Figure 7-17, we declare a node `cur` and start from the binary tree's root node `root`, looping to compare the size relationship between the node value `cur.val` and `num`.

- If `cur.val < num`, it means the target node is in `cur`'s right subtree, thus execute `cur = cur.right`.
- If `cur.val > num`, it means the target node is in `cur`'s left subtree, thus execute `cur = cur.left`.
- If `cur.val = num`, it means the target node is found, exit the loop and return the node.

=== "<1>"
    ![Example of searching for a node in a binary search tree](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-17 &nbsp; Example of searching for a node in a binary search tree </p>

The search operation in a binary search tree works on the same principle as the binary search algorithm, eliminating half of the possibilities in each round. The number of loops is at most the height of the binary tree. When the binary tree is balanced, it uses $O(\log n)$ time. Example code is as follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """Search node"""
        cur = self._root
        # Loop find, break after passing leaf nodes
        while cur is not None:
            # Target node is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Target node is in cur's left subtree
            elif cur.val > num:
                cur = cur.left
            # Found target node, break loop
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Search node */
    TreeNode search(int num) {
        TreeNode cur = root;
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num)
                cur = cur.left;
            // Found target node, break loop
            else
                break;
        }
        // Return target node
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    [class]{BinarySearchTree}-[func]{Search}
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    [class]{binarySearchTree}-[func]{search}
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "C"

    ```c title="binary_search_tree.c"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    [class]{BinarySearchTree}-[func]{search}
    ```

### 2. &nbsp; Inserting a node

Given an element `num` to be inserted, to maintain the property of the binary search tree "left subtree < root node < right subtree," the insertion operation proceeds as shown in Figure 7-18.

1. **Finding the insertion position**: Similar to the search operation, start from the root node and loop downwards according to the size relationship between the current node value and `num` until passing through the leaf node (traversing to `None`) then exit the loop.
2. **Insert the node at that position**: Initialize the node `num` and place it where `None` was.

![Inserting a node into a binary search tree](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> Figure 7-18 &nbsp; Inserting a node into a binary search tree </p>

In the code implementation, note the following two points.

- The binary search tree does not allow duplicate nodes; otherwise, it will violate its definition. Therefore, if the node to be inserted already exists in the tree, the insertion is not performed, and it directly returns.
- To perform the insertion operation, we need to use the node `pre` to save the node from the last loop. This way, when traversing to `None`, we can get its parent node, thus completing the node insertion operation.

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """Insert node"""
        # If tree is empty, initialize root node
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Loop find, break after passing leaf nodes
        cur, pre = self._root, None
        while cur is not None:
            # Found duplicate node, thus return
            if cur.val == num:
                return
            pre = cur
            # Insertion position is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Insertion position is in cur's left subtree
            else:
                cur = cur.left
        # Insert node
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Insert node */
    void insert(int num) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Found duplicate node, thus return
            if (cur.val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Insertion position is in cur's left subtree
            else
                cur = cur.left;
        }
        // Insert node
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    [class]{BinarySearchTree}-[func]{Insert}
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    [class]{binarySearchTree}-[func]{insert}
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "C"

    ```c title="binary_search_tree.c"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    [class]{BinarySearchTree}-[func]{insert}
    ```

Similar to searching for a node, inserting a node uses $O(\log n)$ time.

### 3. &nbsp; Removing a node

First, find the target node in the binary tree, then remove it. Similar to inserting a node, we need to ensure that after the removal operation is completed, the property of the binary search tree "left subtree < root node < right subtree" is still satisfied. Therefore, based on the number of child nodes of the target node, we divide it into 0, 1, and 2 cases, performing the corresponding node removal operations.

As shown in Figure 7-19, when the degree of the node to be removed is $0$, it means the node is a leaf node, and it can be directly removed.

![Removing a node in a binary search tree (degree 0)](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> Figure 7-19 &nbsp; Removing a node in a binary search tree (degree 0) </p>

As shown in Figure 7-20, when the degree of the node to be removed is $1$, replacing the node to be removed with its child node is sufficient.

![Removing a node in a binary search tree (degree 1)](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> Figure 7-20 &nbsp; Removing a node in a binary search tree (degree 1) </p>

When the degree of the node to be removed is $2$, we cannot remove it directly, but need to use a node to replace it. To maintain the property of the binary search tree "left subtree $<$ root node $<$ right subtree," **this node can be either the smallest node of the right subtree or the largest node of the left subtree**.

Assuming we choose the smallest node of the right subtree (the next node in in-order traversal), then the removal operation proceeds as shown in Figure 7-21.

1. Find the next node in the "in-order traversal sequence" of the node to be removed, denoted as `tmp`.
2. Replace the value of the node to be removed with `tmp`'s value, and recursively remove the node `tmp` in the tree.

=== "<1>"
    ![Removing a node in a binary search tree (degree 2)](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-21 &nbsp; Removing a node in a binary search tree (degree 2) </p>

The operation of removing a node also uses $O(\log n)$ time, where finding the node to be removed requires $O(\log n)$ time, and obtaining the in-order traversal successor node requires $O(\log n)$ time. Example code is as follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """Remove node"""
        # If tree is empty, return
        if self._root is None:
            return
        # Loop find, break after passing leaf nodes
        cur, pre = self._root, None
        while cur is not None:
            # Found node to be removed, break loop
            if cur.val == num:
                break
            pre = cur
            # Node to be removed is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Node to be removed is in cur's left subtree
            else:
                cur = cur.left
        # If no node to be removed, return
        if cur is None:
            return

        # Number of child nodes = 0 or 1
        if cur.left is None or cur.right is None:
            # When the number of child nodes = 0/1, child = null/that child node
            child = cur.left or cur.right
            # Remove node cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # If the removed node is the root, reassign the root
                self._root = child
        # Number of child nodes = 2
        else:
            # Get the next node in in-order traversal of cur
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Recursively remove node tmp
            self.remove(tmp.val)
            # Replace cur with tmp
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Remove node */
    void remove(int num) {
        // If tree is empty, return
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Loop find, break after passing leaf nodes
        while (cur != null) {
            // Found node to be removed, break loop
            if (cur.val == num)
                break;
            pre = cur;
            // Node to be removed is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Node to be removed is in cur's left subtree
            else
                cur = cur.left;
        }
        // If no node to be removed, return
        if (cur == null)
            return;
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When the number of child nodes = 0/1, child = null/that child node
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Remove node cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If the removed node is the root, reassign the root
                root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get the next node in in-order traversal of cur
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively remove node tmp
            remove(tmp.val);
            // Replace cur with tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    [class]{BinarySearchTree}-[func]{Remove}
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    [class]{binarySearchTree}-[func]{remove}
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "C"

    ```c title="binary_search_tree.c"
    [class]{BinarySearchTree}-[func]{removeItem}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    [class]{BinarySearchTree}-[func]{remove}
    ```

### 4. &nbsp; In-order traversal is ordered

As shown in Figure 7-22, the in-order traversal of a binary tree follows the "left $\rightarrow$ root $\rightarrow$ right" traversal order, and a binary search tree satisfies the size relationship "left child node $<$ root node $<$ right child node".

This means that in-order traversal in a binary search tree always traverses the next smallest node first, thus deriving an important property: **The in-order traversal sequence of a binary search tree is ascending**.

Using the ascending property of in-order traversal, obtaining ordered data in a binary search tree requires only $O(n)$ time, without the need for additional sorting operations, which is very efficient.

![In-order traversal sequence of a binary search tree](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> Figure 7-22 &nbsp; In-order traversal sequence of a binary search tree </p>

## 7.4.2 &nbsp; Efficiency of binary search trees

Given a set of data, we consider using an array or a binary search tree for storage. Observing Table 7-2, the operations on a binary search tree all have logarithmic time complexity, which is stable and efficient. Only in scenarios of high-frequency addition and low-frequency search and removal, arrays are more efficient than binary search trees.

<p align="center"> Table 7-2 &nbsp; Efficiency comparison between arrays and search trees </p>

<div class="center-table" markdown>

|                | Unsorted array | Binary search tree |
| -------------- | -------------- | ------------------ |
| Search element | $O(n)$         | $O(\log n)$        |
| Insert element | $O(1)$         | $O(\log n)$        |
| Remove element | $O(n)$         | $O(\log n)$        |

</div>

In ideal conditions, the binary search tree is "balanced," thus any node can be found within $\log n$ loops.

However, continuously inserting and removing nodes in a binary search tree may lead to the binary tree degenerating into a chain list as shown in Figure 7-23, at which point the time complexity of various operations also degrades to $O(n)$.

![Degradation of a binary search tree](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> Figure 7-23 &nbsp; Degradation of a binary search tree </p>

## 7.4.3 &nbsp; Common applications of binary search trees

- Used as multi-level indexes in systems to implement efficient search, insertion, and removal operations.
- Serves as the underlying data structure for certain search algorithms.
- Used to store data streams to maintain their ordered state.
