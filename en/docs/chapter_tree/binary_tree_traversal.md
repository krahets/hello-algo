# Traversing a binary tree

In its physical representation, a tree is a linked data structure, so traversal follows pointers from node to node. Unlike a linked list, however, a tree is nonlinear. Traversing it is more complex and requires a search algorithm.

Common binary-tree traversals include level-order, preorder, inorder, and postorder traversal.

## Level-order traversal

As shown below, <u>level-order traversal</u> visits the tree level by level from top to bottom, moving from left to right within each level.

Level-order traversal is a form of <u>breadth-first traversal</u>, also called <u>breadth-first search (BFS)</u>. It explores outward one layer at a time.

![Level-order traversal of a binary tree](binary_tree_traversal.assets/binary_tree_bfs.png)

### Implementation

Breadth-first traversal usually uses a queue. A queue's first-in, first-out rule matches the traversal's level-by-level progression. The implementation follows:

```src
[file]{binary_tree_bfs}-[class]{}-[func]{level_order}
```

### Complexity analysis

- **Time complexity: $O(n)$**. Each of the $n$ nodes is visited once, taking $O(n)$ time.
- **Space complexity: $O(n)$**. In the worst case, a perfect binary tree, the queue holds up to $(n + 1) / 2$ nodes just before the lowest level is visited, requiring $O(n)$ space.

## Preorder, inorder, and postorder traversal

Preorder, inorder, and postorder traversal are forms of <u>depth-first traversal</u>, also called <u>depth-first search (DFS)</u>. They follow a path to its end, then backtrack and continue.

The figure below illustrates depth-first traversal. **Imagine walking once around the outside of the entire binary tree**. At each node, you encounter three positions corresponding to preorder, inorder, and postorder visits.

![Preorder, inorder, and postorder traversal of a binary search tree](binary_tree_traversal.assets/binary_tree_dfs.png)

### Implementation

Depth-first search is usually implemented recursively:

```src
[file]{binary_tree_dfs}-[class]{}-[func]{post_order}
```

!!! tip

    Depth-first search can also be implemented iteratively. Interested readers can explore this approach themselves.

The figure below shows the recursive process for preorder traversal, with two opposing phases: descending into calls and returning from them.

1. Descending starts a new function call and visits the next node.
2. Returning ends a function call, indicating that the current node has been fully processed.

=== "<1>"
    ![The recursive process of preorder traversal](binary_tree_traversal.assets/preorder_step1.png)

=== "<2>"
    ![preorder_step2](binary_tree_traversal.assets/preorder_step2.png)

=== "<3>"
    ![preorder_step3](binary_tree_traversal.assets/preorder_step3.png)

=== "<4>"
    ![preorder_step4](binary_tree_traversal.assets/preorder_step4.png)

=== "<5>"
    ![preorder_step5](binary_tree_traversal.assets/preorder_step5.png)

=== "<6>"
    ![preorder_step6](binary_tree_traversal.assets/preorder_step6.png)

=== "<7>"
    ![preorder_step7](binary_tree_traversal.assets/preorder_step7.png)

=== "<8>"
    ![preorder_step8](binary_tree_traversal.assets/preorder_step8.png)

=== "<9>"
    ![preorder_step9](binary_tree_traversal.assets/preorder_step9.png)

=== "<10>"
    ![preorder_step10](binary_tree_traversal.assets/preorder_step10.png)

=== "<11>"
    ![preorder_step11](binary_tree_traversal.assets/preorder_step11.png)

### Complexity analysis

- **Time complexity: $O(n)$**. Every node is visited once, taking $O(n)$ time.
- **Space complexity: $O(n)$**. In the worst case, the tree degenerates into a linked list, recursion reaches depth $n$, and stack frames require $O(n)$ space.
