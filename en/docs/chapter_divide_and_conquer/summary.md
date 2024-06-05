# Summary

- Divide and conquer is a common algorithm design strategy, which includes dividing (partitioning) and conquering (merging) two stages, usually implemented based on recursion.
- The basis for judging whether it is a divide and conquer algorithm problem includes: whether the problem can be decomposed, whether the subproblems are independent, and whether the subproblems can be merged.
- Merge sort is a typical application of the divide and conquer strategy, which recursively divides the array into two equal-length subarrays until only one element remains, and then starts merging layer by layer to complete the sorting.
- Introducing the divide and conquer strategy can often improve algorithm efficiency. On one hand, the divide and conquer strategy reduces the number of operations; on the other hand, it is conducive to parallel optimization of the system after division.
- Divide and conquer can solve many algorithm problems and is widely used in data structure and algorithm design, where its presence is ubiquitous.
- Compared to brute force search, adaptive search is more efficient. Search algorithms with a time complexity of $O(\log n)$ are usually based on the divide and conquer strategy.
- Binary search is another typical application of the divide and conquer strategy, which does not include the step of merging the solutions of subproblems. We can implement binary search through recursive divide and conquer.
- In the problem of constructing binary trees, building the tree (original problem) can be divided into building the left and right subtree (subproblems), which can be achieved by partitioning the index intervals of the pre-order and in-order traversals.
- In the Tower of Hanoi problem, a problem of size $n$ can be divided into two subproblems of size $n-1$ and one subproblem of size $1$. By solving these three subproblems in sequence, the original problem is consequently resolved.
