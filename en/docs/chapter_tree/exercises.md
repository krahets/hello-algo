---
comments: true
---

# 7.7 &nbsp; Exercises

## 7.7.1 &nbsp; Check your understanding

### 1. &nbsp; Complete, full, and perfect binary trees

The following arrays represent binary trees in level order, with `None` marking an empty position:

- Tree A: `[1, 2, 3, 4, 5, 6]`
- Tree B: `[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. Which tree is a complete binary tree?
2. Which is a full binary tree, meaning that every non-leaf node has two children?
3. Is either tree a perfect binary tree? Explain for each tree.

??? success "Reference answer"

    1. Tree A is complete. Only its bottom level is not full, and the nodes occupy consecutive positions from left to right.
        Tree B is not complete: its bottom level has empty positions on the left but still has nodes farther to the right.

    2. Tree B is full: nodes 1 and 3 each have two children, and all the other nodes are leaves.
        Tree A is not full because node 3 has only its left child, 6.

    3. Neither tree is perfect, because neither has a completely filled bottom level.

### 2. &nbsp; Three traversal orders for the same tree

Store the array `[1, 2, 3, 4, 5, 6, 7]` in a complete binary tree in level order.

<!-- numbered-subquestions -->

1. Draw the tree.
2. Write its preorder, inorder, and postorder traversal sequences.
3. In the inorder sequence, which parts of the tree do the sequences to the left and right of root node 1 correspond to?

??? success "Reference answer"

    1. The tree is:

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. Preorder: `1, 2, 4, 5, 3, 6, 7`;
        inorder: `4, 2, 5, 1, 6, 3, 7`;
        postorder: `4, 5, 2, 6, 7, 3, 1`.

    3. The sequence `4, 2, 5` to the left of root node 1 is the inorder traversal of the left subtree.
        The sequence `6, 3, 7` to its right is the inorder traversal of the right subtree.

### 3. &nbsp; Comparing two binary search trees

Insert each of the following sequences from left to right into an empty binary search tree:

- Sequence A: `[4, 2, 6, 1, 3, 5, 7]`
- Sequence B: `[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. Write the nodes visited when searching for 7 in each tree.
2. If height is measured by the number of edges from the root to the farthest leaf, what is each tree's height?
3. Based on your answers, do the two trees search for 7 equally efficiently? Explain using their shapes and search paths.

??? success "Reference answer"

    1. In the tree built from sequence A, the search path is `4 → 6 → 7`.
        In the tree built from sequence B, it is `1 → 2 → 3 → 4 → 5 → 6 → 7`.

    2. The first tree has every level filled and a height of 2. The second tree has only right children and a height of 6.

    3. The searches for 7 are not equally efficient. Insertion order changes the shape and height of a binary search tree. Searching for 7 visits only three nodes in the first tree,
        but must visit seven in sequence in the second. The taller the tree, the more nodes may need to be compared along a path in the worst case.

## 7.7.2 &nbsp; Programming exercises

### 1. &nbsp; Maximum depth of a binary tree

You are given the root node `root` of a binary tree. Each node contains an integer value and references to its left and right children.

The maximum depth is the **number of nodes** on the path from the root to the farthest leaf. Return the maximum depth of the tree; an empty tree has maximum depth 0.
Use recursion.

??? tip "Hints"

    1. Depth is counted in nodes here. A tree containing only a root has maximum depth 1.
    2. Have the recursive function return the maximum depth of the subtree rooted at the current node.
    3. Return 0 for an empty node; otherwise, return max(depth(left), depth(right)) + 1.

[LeetCode](https://leetcode.com/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Traversing a binary tree level by level

Given the root node `root` of a binary tree, use a queue to visit all nodes level by level from top to bottom, visiting each level from left to right.

Return a two-dimensional array: the first subarray contains the values on the root's level, the second contains those on the next level, and so on.
Return an empty array if the tree is empty.

??? tip "Hints"

    1. Level-order traversal visits earlier enqueued nodes first, so use a queue.
    2. At the start of each round, the nodes in the queue belong to exactly one level.
    3. Record the queue's length first, then dequeue that many nodes and enqueue their children.

[LeetCode](https://leetcode.com/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 3. &nbsp; The kth smallest element in a binary search tree

A binary search tree contains `n` nodes with distinct values.
If all node values are sorted in ascending order, their positions are numbered starting from 1.

Given the root node `root` and an integer `k` satisfying `1 <= k <= n`, return the node value in position `k`.
Find the answer directly during inorder traversal, without first collecting all node values.

??? tip "Hints"

    1. An inorder traversal of a binary search tree visits node values in ascending order.
    2. Inorder traversal processes the left subtree, the current node, and then the right subtree. Increment a counter by 1 when visiting the current node.
    3. When the counter first reaches k, the current node's value is the answer; there is no need to continue traversing.

[LeetCode](https://leetcode.com/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
