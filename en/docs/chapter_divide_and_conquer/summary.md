# Summary

### Key Review

- Divide and conquer is a common algorithm design strategy, consisting of two phases: divide (partition) and conquer (merge), typically implemented based on recursion.
- The criteria for determining whether a problem is a divide and conquer problem include: whether the problem can be decomposed, whether subproblems are independent, and whether subproblems can be merged.
- Merge sort is a typical application of the divide and conquer strategy. It recursively divides an array into two equal-length subarrays until only one element remains, then merges them layer by layer to complete the sorting.
- Introducing the divide and conquer strategy can often improve algorithm efficiency. On one hand, the divide and conquer strategy reduces the number of operations; on the other hand, it facilitates parallel optimization of the system after division.
- Divide and conquer can both solve many algorithmic problems and is widely applied in data structure and algorithm design, appearing everywhere.
- Compared to brute-force search, adaptive search is more efficient. Search algorithms with time complexity of $O(\log n)$ are typically implemented based on the divide and conquer strategy.
- Binary search is another typical application of divide and conquer. It does not include the step of merging solutions of subproblems. We can implement binary search through recursive divide and conquer.
- In the problem of building a binary tree, building the tree (original problem) can be divided into building the left subtree and right subtree (subproblems), which can be achieved by dividing the index intervals of the preorder and inorder traversals.
- In the hanota problem, a problem of size $n$ can be divided into two subproblems of size $n-1$ and one subproblem of size $1$. After solving these three subproblems in order, the original problem is solved.
