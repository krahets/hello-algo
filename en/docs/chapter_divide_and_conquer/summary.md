# Summary

### Key takeaways

- Divide and conquer is a common algorithm design strategy with two stages: divide (split) and conquer (combine). It is usually implemented recursively.
- To recognize a divide-and-conquer problem, ask whether it can be divided, whether the subproblems are independent, and whether their solutions can be combined.
- Merge sort is a classic example. It recursively splits an array into two halves until only single elements remain, then merges them level by level to produce a sorted array.
- Divide and conquer often improves efficiency in two ways: it reduces the number of operations, and it creates opportunities for parallel processing.
- Divide and conquer solves many algorithmic problems and appears throughout the design of algorithms and data structures.
- Adaptive search is more efficient than brute-force search. Algorithms that search in $O(\log n)$ time commonly use divide and conquer.
- Binary search is another classic example. It needs no step to combine subproblem solutions and can be implemented recursively using divide and conquer.
- To reconstruct a binary tree, split the original problem into building its left and right subtrees. Split the index ranges of the preorder and inorder traversals to identify those subproblems.
- In the Tower of Hanoi, a problem of size $n$ splits into two subproblems of size $n-1$ and one of size $1$. Solving the three in order solves the original problem.
