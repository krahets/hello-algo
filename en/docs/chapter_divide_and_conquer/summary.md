---
comments: true
---

# 12.5 &nbsp; Summary

### 1. &nbsp; Key takeaways

- Divide and conquer is a common algorithm design strategy with two stages: dividing the problem and combining solutions. It is usually implemented recursively.
- To recognize a divide-and-conquer problem, ask whether it can be divided, whether the subproblems are independent, and whether their solutions can be combined.
- Merge sort is a classic example. It recursively divides an array into two equally sized subarrays until each contains one element, then merges them level by level to complete the sort.
- Divide and conquer often improves efficiency by reducing the number of operations and making it easier to parallelize the work.
- Divide and conquer solves many algorithmic problems and appears widely in the design of data structures and algorithms.
- Adaptive search is more efficient than brute-force search. Search algorithms with $O(\log n)$ time complexity are usually based on divide and conquer.
- Binary search is another classic example, with no step for combining subproblem solutions. It can be implemented through recursive divide and conquer.
- Reconstructing a binary tree can be divided into building its left and right subtrees. This is achieved by partitioning index intervals in the preorder and inorder traversals.
- A Tower of Hanoi problem of size $n$ can be divided into two subproblems of size $n-1$ and one of size $1$. Solving these three subproblems in order solves the original problem.
