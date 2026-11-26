---
comments: true
---

# 13.5 &nbsp; Summary

### 1. &nbsp; Key takeaways

- Backtracking is a form of exhaustive search. It explores the solution space depth first, recording each solution that satisfies the conditions, until it has found all solutions or exhausted the search.
- The search alternates between trying choices and backtracking. It explores choices depth first. If a constraint fails, it undoes the last choice, restores the previous state, and tries another choice. Trying a choice and undoing it move in opposite directions.
- Backtracking problems often have several constraints that can serve as pruning rules. Cutting off unproductive branches early can make the search much more efficient.
- Backtracking is especially useful for search and constraint satisfaction problems. It can also solve combinatorial optimization problems, although other methods often run faster or give better results.
- The permutations problem asks for every ordering of a given collection of elements. An array tracks which elements have already been chosen. Pruning branches that would reuse an element ensures that each element is chosen only once.
- If the input contains equal values, the permutation search can produce duplicates. Try each distinct value only once per round, typically by tracking the values tried in a hash set.
- Subset sum asks for every subset whose elements add up to a target. Order does not matter in a subset, but the search generates different orderings and thus duplicates. Sort the input before backtracking and use a variable to mark the starting index for each round. This prunes branches that would generate duplicate subsets.
- Equal array elements can also produce duplicate subsets. Because the array is sorted, we can prune by comparing adjacent elements, ensuring that each distinct value is tried only once per round.
- The $n$-queens problem asks how to place $n$ queens on an $n \times n$ board so that no two attack each other. We must check rows, columns, main diagonals, and secondary diagonals. Placing one queen per row enforces the row constraint.
- The column and diagonal constraints work similarly. Track occupied columns in an array to check whether a candidate square is valid. Two more arrays track occupied main and secondary diagonals. The challenge is to identify the relationship between the row and column indices of squares on the same diagonal in each direction.

### 2. &nbsp; Q & A

**Q**: How are backtracking and recursion related?

Backtracking is an algorithmic strategy. Recursion is a tool for implementing algorithms.

- Backtracking is usually implemented with recursion. It is one application of recursion, specifically to search problems.
- Recursion expresses a problem in terms of subproblems. It is common in divide and conquer, backtracking, and dynamic programming (through memoized recursion).
