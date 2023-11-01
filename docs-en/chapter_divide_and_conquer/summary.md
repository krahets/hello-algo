# Summary

- Partitioning algorithm is a common algorithm design strategy that consists of two phases, divide (divide) and conquer (merge), and is usually implemented based on recursion.
- The basis for determining whether a problem is a divide and conquer algorithm problem includes whether the problem can be divided and conquer, whether the subproblems are independent, and whether the subproblems can be merged.
- Merge sort is a typical application of the partition strategy, which recursively divides and conquers an array into two subarrays of equal length until only one element remains and starts merging them level by level, thus completing the sort.
- Introducing a divide and conquer strategy often leads to an increase in algorithm efficiency. On the one hand, the divide and conquer strategy reduces the number of operations; on the other hand, the partition facilitates the parallel optimization of the system.
- Divide and conquer is both a solution to many algorithmic problems and is widely used everywhere in data structure and algorithm design.
- Compared to brute-force search, adaptive search is more efficient. Searching algorithms with a time complexity of $O(\log n)$ are usually implemented based on a divide and conquer strategy.
- Binary search is another typical application of the divide and conquer strategy that does not include the step of combining the solutions of the subproblems. We can implement binary search by recursion division and conquer.
- In the constructed binary tree problem, the constructed tree (original problem) can be divided into constructed left subtrees and right subtrees (subproblems), which can be realized by dividing the index intervals of the preorder traversal and the middle order traversal.
- In the Hanota problem, a problem of size $n$ can be divided into two subproblems of size $n-1$ and one subproblem of size $1$. After solving these three subproblems in order, the original problem is then solved.
