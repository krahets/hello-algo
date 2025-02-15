# Building a binary tree problem

!!! question

    Given the pre-order traversal `pre-order` and the in-order traversal `in-order` of a binary tree, construct the binary tree and return its root node. Assume there are no duplicate node values in the binary tree (as shown in the figure below).

![Example data for building a binary tree](build_binary_tree_problem.assets/build_tree_example.png)

### Determining if it is a divide-and-conquer problem

The original task of building a binary tree from `pre-order` and `in-order` is a typical divide and conquer problem.

- **The problem can be decomposed**: From the perspective of divide and conquer, we can divide the original problem into two subproblems—building the left subtree and building the right subtree—plus one operation of initializing the root node. For each subtree (subproblem), we continue applying the same approach, partitioning it into smaller subtrees (subproblems), until reaching the smallest subproblem (an empty subtree).
- **The subproblems are independent**: The left and right subtrees do not overlap. When building the left subtree, we only need the segments of the in-order and pre-order traversals that correspond to the left subtree. The same approach applies to the right subtree.
- **Solutions to subproblems can be combined**: Once we have constructed the left and right subtrees (the subproblem solutions), we can attach them to the root node to obtain the solution to the original problem.

### How to divide the subtrees

Based on the above analysis, this problem can be solved using divide and conquer. **However, how do we use the pre-order traversal `pre-order` and the in-order traversal `in-order` to divide the left and right subtrees?**

By definition, both `pre-order` and `in-order` can be divided into three parts:

- Pre-order traversal: `[ Root | Left Subtree | Right Subtree ]`. For example, in the figure, the tree corresponds to `[ 3 | 9 | 2 1 7 ]`.
- In-order traversal: `[ Left Subtree | Root | Right Subtree ]`. For example, in the figure, the tree corresponds to `[ 9 | 3 | 1 2 7 ]`.

Using the data from the preceding figure, we can follow the steps shown in the next figure to obtain the division results:

1. The first element 3 in the pre-order traversal is the value of the root node.
2. Find the index of the root node 3 in `in-order`, and use this index to split `in-order` into `[ 9 | 3 ｜ 1 2 7 ]`.
3. According to the split of `in-order`, it is straightforward to determine that the left and right subtrees contain 1 and 3 nodes, respectively, so we can split `pre-order` into `[ 3 | 9 | 2 1 7 ]` accordingly.

![Dividing the subtrees in pre-order and in-order traversals](build_binary_tree_problem.assets/build_tree_pre-order_in-order_division.png)

### Describing subtree ranges based on variables

Based on the above division method, **we have now obtained the index ranges of the root, left subtree, and right subtree in `pre-order` and `in-order`**. To describe these index ranges, we use several pointer variables.

- Let the index of the current tree's root node in `pre-order` be denoted as $i$.
- Let the index of the current tree's root node in `in-order` be denoted as $m$.
- Let the index range of the current tree in `in-order` be denoted as $[l, r]$.

As shown in the table below, these variables represent the root node’s index in `pre-order` and the index ranges of the subtrees in `in-order`.

<p align="center"> Table <id> &nbsp; Indexes of the root node and subtrees in pre-order and in-order traversals </p>

|               | Root node index in `pre-order` | Subtree index range in `in-order`    |
| ------------- | ----------------------------- | ----------------------------------- |
| Current tree  | $i$                           | $[l, r]$                            |
| Left subtree  | $i + 1$                       | $[l, m-1]$                          |
| Right subtree | $i + 1 + (m - l)$             | $[m+1, r]$                          |

Please note that $(m-l)$ in the right subtree root index represents “the number of nodes in the left subtree.” It may help to consult the figure below for a clearer understanding.

![Indexes of the root node and left and right subtrees](build_binary_tree_problem.assets/build_tree_division_pointers.png)

### Code implementation

To improve the efficiency of querying $m$, we use a hash table `hmap` to store the mapping from elements in `in-order` to their indexes:

```src
[file]{build_tree}-[class]{}-[func]{build_tree}
```

The figure below shows the recursive process of building the binary tree. Each node is created during the "descending" phase of the recursion, and each edge (reference) is formed during the "ascending" phase.

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

Each recursive function's division of `pre-order` and `in-order` is illustrated in the figure below.

![Division in each recursive function](build_binary_tree_problem.assets/built_tree_overall.png)

Assuming the binary tree has $n$ nodes, initializing each node (calling the recursive function `dfs()`) takes $O(1)$ time. **Therefore, the overall time complexity is $O(n)$**.

Because the hash table stores the mapping from `in-order` elements to their indexes, it requires $O(n)$ space. In the worst case, if the binary tree degenerates into a linked list, the recursive depth can reach $n$, consuming $O(n)$ stack space. **Hence, the overall space complexity is $O(n)$**.
