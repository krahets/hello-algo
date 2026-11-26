---
comments: true
---

# 7.7 &nbsp; Exercises

## 7.7.1 &nbsp; Check your understanding

### 1. &nbsp; Complete, full, and perfect binary trees

The two arrays below represent binary trees in level order. An `None` entry marks an empty position.

- Tree A: `[1, 2, 3, 4, 5, 6]`
- Tree B: `[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. Which tree is complete?
2. Which tree is full, meaning that every non-leaf node has two children?
3. Is either tree perfect? Explain your reasoning for each tree.

??? success "Sample answer"

    1. Tree A is complete. Only its bottom level is partially filled, and the nodes occupy consecutive positions starting on the left.
        Tree B is not complete because there are empty positions on the left of the bottom level with nodes farther to the right.

    2. Tree B is full. Nodes 1 and 3 each have two children, and all the other nodes are leaves.
        Tree A is not full because node 3 has only a left child, 6.

    3. Neither tree is perfect because neither has a full bottom level.

### 2. &nbsp; Three traversal orders for the same tree

Use the array `[1, 2, 3, 4, 5, 6, 7]` to fill a complete binary tree in level order.

<!-- numbered-subquestions -->

1. Draw the tree.
2. Write down its preorder, inorder, and postorder traversal sequences.
3. In the inorder sequence, which parts of the tree correspond to the values before and after the root, 1?

??? success "Sample answer"

    1. The tree looks like this:

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. Preorder: `1, 2, 4, 5, 3, 6, 7`.
        Inorder: `4, 2, 5, 1, 6, 3, 7`.
        Postorder: `4, 5, 2, 6, 7, 3, 1`.

    3. The sequence `4, 2, 5` before the root, 1, is the inorder traversal of the left subtree.
        The sequence `6, 3, 7` after the root is the inorder traversal of the right subtree.

### 3. &nbsp; Compare two binary search trees

For each sequence below, start with an empty binary search tree and insert the values from left to right.

- Sequence A: `[4, 2, 6, 1, 3, 5, 7]`
- Sequence B: `[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. For each tree, list the nodes visited when searching for 7.
2. If height is measured in edges from the root to the farthest leaf, what is the height of each tree?
3. Based on your previous two answers, is searching for 7 equally efficient in both trees? Explain using the tree shapes and search paths.

??? success "Sample answer"

    1. In the tree built from sequence A, the search path is `4 → 6 → 7`.
        In the tree built from sequence B, the search path is `1 → 2 → 3 → 4 → 5 → 6 → 7`.

    2. Every level of the first tree is full, so its height is 2. The second tree has only right children, so its height is 6.

    3. Searching for 7 takes different amounts of work in the two trees. The insertion order changes the shape and height of a binary search tree. The search for 7 visits just 3 nodes in the first tree,
        but it visits all 7 nodes in order in the second tree. The taller the tree, the more nodes a search must compare along a path in the worst case.

## 7.7.2 &nbsp; Programming exercises

### 1. &nbsp; Maximum depth of a binary tree

You are given the root `root` of a binary tree. Each node holds an integer and references to its left and right children.

The maximum depth of a binary tree is the **number of nodes** on the path from the root to the farthest leaf. Return the maximum depth of the tree. An empty tree has a maximum depth of 0.
Use recursion.

??? tip "Hints"

    1. Count depth in nodes. A tree with just a root has a maximum depth of 1.
    2. Have the recursive function return the maximum depth of the subtree rooted at the current node.
    3. For a null node, return 0. Otherwise, return max(depth(left), depth(right)) + 1.

[LeetCode](https://leetcode.com/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Traverse a binary tree level by level

You are given the root `root` of a binary tree. Use a queue to visit all nodes level by level from top to bottom, working from left to right within each level.

Return a two-dimensional array. The first subarray holds the values at the root level, the second holds the values at the next level, and so on.
If the tree is empty, return an empty array.

??? tip "Hints"

    1. Use a queue so that nodes are visited in the order they enter it.
    2. At the start of each round, the queue holds exactly the nodes at one level.
    3. Record the queue length first, then dequeue that many nodes, adding their children to the queue as you go.

[LeetCode](https://leetcode.com/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 3. &nbsp; The kth smallest element in a binary search tree

A binary search tree has `n` nodes, all with distinct values.
Sort the node values in ascending order and number their positions starting at 1.

Given the root `root` and an integer `k` satisfying `1 <= k <= n`, return the node value at position `k`.
Find the answer during an inorder traversal without first collecting all the node values.

??? tip "Hints"

    1. An inorder traversal visits the values in a binary search tree in ascending order.
    2. In inorder traversal, process the left subtree, the current node, and then the right subtree. Increment the count when you visit the current node.
    3. The first time the count reaches k, the current node holds the answer. You can stop the traversal.

[LeetCode](https://leetcode.com/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
