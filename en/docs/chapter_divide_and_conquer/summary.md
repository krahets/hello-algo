# Summary

- Divide and conquer is a common algorithm design strategy that consists of two stages—divide (partition) and conquer (merge)—and is generally implemented using recursion.
- To determine whether a problem is suited for a divide and conquer approach, we check if the problem can be decomposed, whether the subproblems are independent, and whether the subproblems can be merged.
- Merge sort is a typical example of the divide and conquer strategy. It recursively splits an array into two equal-length subarrays until only one element remains, and then merges these subarrays layer by layer to complete the sorting.
- Introducing the divide and conquer strategy often improves algorithm efficiency. On one hand, it reduces the number of operations; on the other hand, it facilitates parallel optimization of the system after division.
- Divide and conquer can be applied to numerous algorithmic problems and is widely used in data structures and algorithm design, appearing in many scenarios.
- Compared to brute force search, adaptive search is more efficient. Search algorithms with a time complexity of $O(\log n)$ are typically based on the divide and conquer strategy.
- Binary search is another classic application of the divide-and-conquer strategy. It does not involve merging subproblem solutions and can be implemented via a recursive divide-and-conquer approach.
- In the problem of constructing binary trees, building the tree (the original problem) can be divided into building the left subtree and right subtree (the subproblems). This can be achieved by partitioning the index ranges of the preorder and inorder traversals.
- In the Tower of Hanoi problem, a problem of size $n$ can be broken down into two subproblems of size $n-1$ and one subproblem of size $1$. By solving these three subproblems in sequence, the original problem is resolved.
