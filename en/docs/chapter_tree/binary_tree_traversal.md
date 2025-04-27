# Binary tree traversal

From a physical structure perspective, a tree is a data structure based on linked lists. Hence, its traversal method involves accessing nodes one by one through pointers. However, a tree is a non-linear data structure, which makes traversing a tree more complex than traversing a linked list, requiring the assistance of search algorithms.

The common traversal methods for binary trees include level-order traversal, pre-order traversal, in-order traversal, and post-order traversal.

## Level-order traversal

As shown in the figure below, <u>level-order traversal</u> traverses the binary tree from top to bottom, layer by layer. Within each level, it visits nodes from left to right.

Level-order traversal is essentially a type of  <u>breadth-first traversal</u>, also known as <u>breadth-first search (BFS)</u>, which embodies a "circumferentially outward expanding" layer-by-layer traversal method.

![Level-order traversal of a binary tree](binary_tree_traversal.assets/binary_tree_bfs.png)

### Code implementation

Breadth-first traversal is usually implemented with the help of a "queue". The queue follows the "first in, first out" rule, while breadth-first traversal follows the "layer-by-layer progression" rule, the underlying ideas of the two are consistent. The implementation code is as follows:

```src
[file]{binary_tree_bfs}-[class]{}-[func]{level_order}
```

### Complexity analysis

- **Time complexity is $O(n)$**: All nodes are visited once, taking $O(n)$ time, where $n$ is the number of nodes.
- **Space complexity is $O(n)$**: In the worst case, i.e., a full binary tree, before traversing to the bottom level, the queue can contain at most $(n + 1) / 2$ nodes simultaneously, occupying $O(n)$ space.

## Preorder, in-order, and post-order traversal

Correspondingly, pre-order, in-order, and post-order traversal all belong to <u>depth-first traversal</u>, also known as <u>depth-first search (DFS)</u>, which embodies a "proceed to the end first, then backtrack and continue" traversal method.

The figure below shows the working principle of performing a depth-first traversal on a binary tree. **Depth-first traversal is like "walking" around the entire binary tree**, encountering three positions at each node, corresponding to pre-order, in-order, and post-order traversal.

![Preorder, in-order, and post-order traversal of a binary search tree](binary_tree_traversal.assets/binary_tree_dfs.png)

### Code implementation

Depth-first search is usually implemented based on recursion:

```src
[file]{binary_tree_dfs}-[class]{}-[func]{post_order}
```

!!! tip

    Depth-first search can also be implemented based on iteration, interested readers can study this on their own.

The figure below shows the recursive process of pre-order traversal of a binary tree, which can be divided into two opposite parts: "recursion" and "return".

1. "Recursion" means starting a new method, the program accesses the next node in this process.
2. "Return" means the function returns, indicating the current node has been fully accessed.

=== "<1>"
    ![The recursive process of pre-order traversal](binary_tree_traversal.assets/preorder_step1.png)

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

- **Time complexity is $O(n)$**: All nodes are visited once, using $O(n)$ time.
- **Space complexity is $O(n)$**: In the worst case, i.e., the tree degenerates into a linked list, the recursion depth reaches $n$, the system occupies $O(n)$ stack frame space.
