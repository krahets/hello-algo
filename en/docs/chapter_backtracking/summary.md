---
comments: true
---

# 13.5 &nbsp; Summary

### 1. &nbsp; Key takeaways

- Backtracking is fundamentally exhaustive search. It traverses the solution space depth first to find solutions meeting the requirements, records them when found, and continues until all solutions are found or traversal is complete.
- Backtracking alternates between trying a choice and undoing it. It explores choices through depth-first search; when a constraint is violated, it undoes the last choice, restores the previous state, and tries another choice. Trying and undoing are opposite operations.
- Backtracking problems usually have multiple constraints that enable pruning. Pruning stops unnecessary branches early and can greatly improve search efficiency.
- Backtracking is mainly used for search and constraint satisfaction problems. It can also solve combinatorial optimization problems, though more efficient or more effective approaches often exist.
- The permutations problem asks for every possible ordering of a collection's elements. An array tracks whether each element has been selected, pruning branches that select the same element again and ensuring each is used only once.
- If the input contains equal elements, permutation generation produces duplicate results. We must try each value only once per round, usually by using a hash set.
- The subset sum problem asks for all subsets of a collection whose sum equals a target. Subsets disregard order, but the search generates all orderings, producing duplicates. Sorting the data before backtracking and using a variable to mark each round's starting index allows us to prune duplicate-generating branches.
- Equal elements also produce duplicate subsets. Because the array is sorted, we can prune by comparing adjacent elements, ensuring that each value is tried only once per round.
- The $n$-queens problem asks for arrangements of $n$ queens on an $n \times n$ chessboard such that no two queens can attack each other. It imposes row, column, and both diagonal constraints. Placing queens row by row ensures exactly one queen per row.
- Column and diagonal constraints are handled similarly. An array records whether each column contains a queen, indicating whether a chosen square is valid. Two more arrays track queens on diagonals in each direction. The main challenge is identifying the relationship between row and column indices for squares on the same diagonal.

### 2. &nbsp; Q & A

**Q**: How are backtracking and recursion related?

Broadly speaking, backtracking is an algorithmic strategy, while recursion is a tool.

- Backtracking is usually implemented recursively. It is one application of recursion, specifically to search problems.
- Recursion expresses the idea of decomposing a problem into subproblems. It is commonly used in divide and conquer, backtracking, and dynamic programming (memoized recursion).
