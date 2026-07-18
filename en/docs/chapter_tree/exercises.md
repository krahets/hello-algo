# Exercises

## Concept Review

### Complete, Full, and Perfect Binary Trees

The following two arrays represent binary trees in level order, where `None` marks an empty position:

- Tree A: `[1, 2, 3, 4, 5, 6]`
- Tree B: `[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. Which tree is a complete binary tree?
2. Which tree is a full binary tree, meaning every non-leaf node has two children?
3. Is either tree a perfect binary tree? Explain the reason for each tree.

??? success "Answer"

    1. Tree A is a complete binary tree. Only its lowest level is not full, and the nodes on that level occupy consecutive positions from left to right.
        Tree B is not complete because there are empty positions on the left of the lowest level while nodes still appear on the right.

    2. Tree B is a full binary tree: nodes 1 and 3 each have two children, and all other nodes are leaves.
        Tree A is not full because node 3 has only one child, its left child 6.

    3. Neither tree is perfect because the lowest level of each tree is not completely filled.

### Three Traversal Orders for the Same Tree

Store the array `[1, 2, 3, 4, 5, 6, 7]` in level order in a complete binary tree.

<!-- numbered-subquestions -->

1. Draw the tree.
2. Write its preorder, inorder, and postorder traversal sequences.
3. In the inorder sequence, which parts of the tree correspond to the subsequences to the left and right of root node 1?

??? success "Answer"

    1. The tree is:

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. The preorder traversal is `1, 2, 4, 5, 3, 6, 7`;
        the inorder traversal is `4, 2, 5, 1, 6, 3, 7`;
        the postorder traversal is `4, 5, 2, 6, 7, 3, 1`.

    3. The sequence `4, 2, 5` to the left of root node 1 is the inorder traversal of the left subtree;
        the sequence `6, 3, 7` to its right is the inorder traversal of the right subtree.

### Compare Two Binary Search Trees

Insert each of the following sequences from left to right into an empty binary search tree:

- Sequence A: `[4, 2, 6, 1, 3, 5, 7]`
- Sequence B: `[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. For each tree, write the nodes visited when searching for 7.
2. If height is measured by the number of edges from the root node to the farthest leaf node, what is the height of each tree?
3. Based on the first two questions, is searching for 7 equally efficient in the two trees? Explain using the trees' shapes and search paths.

??? success "Answer"

    1. In the tree built from Sequence A, the search path is `4 → 6 → 7`.
        In the tree built from Sequence B, the search path is `1 → 2 → 3 → 4 → 5 → 6 → 7`.

    2. Every level of the first tree is full, and its height is 2. The second tree has only right children, and its height is 6.

    3. Searching for 7 is not equally efficient in the two trees. The insertion order changes the shape and height of a binary search tree. The search visits only 3 nodes in the first tree
        but all 7 nodes in the second. The taller the tree, the more nodes may need to be compared along a path in the worst case.

## Programming Exercises

### Maximum Depth of a Binary Tree

You are given the root node `root` of a binary tree. Each node contains an integer value and references to its left and right children.

The maximum depth is the **number of nodes** on the path from the root node to the farthest leaf node. Return the maximum depth of the tree; the maximum depth of an empty tree is 0.
Use recursion.

??? tip "Hints"

    1. Depth is measured by the number of nodes in this exercise, so a tree containing only a root node has a maximum depth of 1
    2. Let the recursive function return the maximum depth of the subtree rooted at the current node
    3. Return 0 for an empty node; for a nonempty node, return max(depth(left), depth(right)) + 1

[LeetCode](https://leetcode.com/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Traverse a Binary Tree Level by Level

Given the root node `root` of a binary tree, use a queue to visit all nodes level by level from top to bottom and from left to right within each level.

Return a two-dimensional array: the first subarray stores the values at the root's level, the second stores the values at the next level, and so on.
If the tree is empty, return an empty array.

??? tip "Hints"

    1. Level-order traversal visits earlier enqueued nodes first, so use a queue
    2. At the beginning of each round, all nodes currently in the queue belong to the same level
    3. First record the queue's length, then remove exactly that many nodes and enqueue their children

[LeetCode](https://leetcode.com/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Kth Smallest Element in a Binary Search Tree

A binary search tree contains `n` nodes with distinct values.
If all node values are arranged from smallest to largest, their positions are numbered starting from 1.

Given the root node `root` and an integer `k` satisfying `1 <= k <= n`, return the value at position `k`.
Find the answer directly during an inorder traversal rather than collecting all node values first.

??? tip "Hints"

    1. An inorder traversal of a binary search tree visits node values from smallest to largest
    2. Inorder traversal processes the left subtree, the current node, and then the right subtree; increment the count when visiting the current node
    3. When the count first equals k, the current node's value is the answer, so no further traversal is needed

[LeetCode](https://leetcode.com/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
