# Building a Binary Tree Problem

!!! question

    Given the preorder traversal `preorder` and inorder traversal `inorder` of a binary tree, construct the binary tree and return the root node of the binary tree. Assume there are no duplicate node values in the binary tree (as shown in the figure below).

![Example data for building a binary tree](build_binary_tree_problem.assets/build_tree_example.png)

### Determining If It Is a Divide and Conquer Problem

The original problem is defined as constructing a binary tree from `preorder` and `inorder`, which is a typical divide and conquer problem.

- **The problem can be decomposed**: From a divide and conquer perspective, we can divide the original problem into two subproblems: constructing the left subtree and constructing the right subtree, plus one operation: initializing the root node. For each subtree (subproblem), we can still reuse the above division method, dividing it into smaller subtrees (subproblems) until the smallest subproblem (empty subtree) is reached.
- **Subproblems are independent**: The left and right subtrees are independent of each other; there is no overlap between them. When constructing the left subtree, we only need to focus on the parts of the inorder and preorder traversals corresponding to the left subtree. The same applies to the right subtree.
- **Solutions of subproblems can be merged**: Once we have the left and right subtrees (solutions of subproblems), we can link them to the root node to obtain the solution to the original problem.

### How to Divide Subtrees

Based on the above analysis, this problem can be solved using divide and conquer, **but how do we divide the left and right subtrees through the preorder traversal `preorder` and inorder traversal `inorder`**?

According to the definition, both `preorder` and `inorder` can be divided into three parts.

- Preorder traversal: `[ Root Node | Left Subtree | Right Subtree ]`, for example, the tree in the figure above corresponds to `[ 3 | 9 | 2 1 7 ]`.
- Inorder traversal: `[ Left Subtree | Root Node ｜ Right Subtree ]`, for example, the tree in the figure above corresponds to `[ 9 | 3 | 1 2 7 ]`.

Using the data from the figure above as an example, we can obtain the division results through the steps shown in the figure below.

1. The first element 3 in the preorder traversal is the value of the root node.
2. Find the index of root node 3 in `inorder`, and use this index to divide `inorder` into `[ 9 | 3 ｜ 1 2 7 ]`.
3. Based on the division result of `inorder`, it is easy to determine that the left and right subtrees have 1 and 3 nodes respectively, allowing us to divide `preorder` into `[ 3 | 9 | 2 1 7 ]`.

![Dividing subtrees in preorder and inorder traversals](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png)

### Describing Subtree Intervals Based on Variables

Based on the above division method, **we have obtained the index intervals of the root node, left subtree, and right subtree in `preorder` and `inorder`**. To describe these index intervals, we need to use several pointer variables.

- Denote the index of the current tree's root node in `preorder` as $i$.
- Denote the index of the current tree's root node in `inorder` as $m$.
- Denote the index interval of the current tree in `inorder` as $[l, r]$.

As shown in the table below, through these variables we can represent the index of the root node in `preorder` and the index intervals of the subtrees in `inorder`.

<p align="center"> Table <id> &nbsp; Indices of root node and subtrees in preorder and inorder traversals </p>

|              | Root node index in `preorder` | Subtree index interval in `inorder` |
| ------------ | ----------------------------- | ----------------------------------- |
| Current tree | $i$                           | $[l, r]$                            |
| Left subtree | $i + 1$                       | $[l, m-1]$                          |
| Right subtree| $i + 1 + (m - l)$             | $[m+1, r]$                          |

Please note that $(m-l)$ in the right subtree root node index means "the number of nodes in the left subtree". It is recommended to understand this in conjunction with the figure below.

![Index interval representation of root node and left and right subtrees](build_binary_tree_problem.assets/build_tree_division_pointers.png)

### Code Implementation

To improve the efficiency of querying $m$, we use a hash table `hmap` to store the mapping from elements in the `inorder` array to their indices:

```src
[file]{build_tree}-[class]{}-[func]{build_tree}
```

The figure below shows the recursive process of building the binary tree. Each node is established during the downward "recursion" process, while each edge (reference) is established during the upward "return" process.

=== "<1>"
    ![Recursive process of building a binary tree](build_binary_tree_problem.assets/built_tree_step1.png)

=== "<2>"
    ![built_tree_step2](build_binary_tree_problem.assets/built_tree_step2.png)

=== "<3>"
    ![built_tree_step3](build_binary_tree_problem.assets/built_tree_step3.png)

=== "<4>"
    ![built_tree_step4](build_binary_tree_problem.assets/built_tree_step4.png)

=== "<5>"
    ![built_tree_step5](build_binary_tree_problem.assets/built_tree_step5.png)

=== "<6>"
    ![built_tree_step6](build_binary_tree_problem.assets/built_tree_step6.png)

=== "<7>"
    ![built_tree_step7](build_binary_tree_problem.assets/built_tree_step7.png)

=== "<8>"
    ![built_tree_step8](build_binary_tree_problem.assets/built_tree_step8.png)

=== "<9>"
    ![built_tree_step9](build_binary_tree_problem.assets/built_tree_step9.png)

The division results of the preorder traversal `preorder` and inorder traversal `inorder` within each recursive function are shown in the figure below.

![Division results in each recursive function](build_binary_tree_problem.assets/built_tree_overall.png)

Let the number of nodes in the tree be $n$. Initializing each node (executing one recursive function `dfs()`) takes $O(1)$ time. **Therefore, the overall time complexity is $O(n)$**.

The hash table stores the mapping from `inorder` elements to their indices, with a space complexity of $O(n)$. In the worst case, when the binary tree degenerates into a linked list, the recursion depth reaches $n$, using $O(n)$ stack frame space. **Therefore, the overall space complexity is $O(n)$**.
