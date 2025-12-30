# Summary

### Key Review

- The backtracking algorithm is fundamentally an exhaustive search method. It finds solutions that meet specified conditions by performing a depth-first traversal of the solution space. During the search process, when a solution satisfying the conditions is found, it is recorded. The search ends either after finding all solutions or when the traversal is complete.
- The backtracking algorithm search process consists of two parts: attempting and backtracking. It tries various choices through depth-first search. When encountering situations that violate constraints, it reverts the previous choice, returns to the previous state, and continues exploring other options. Attempting and backtracking are operations in opposite directions.
- Backtracking problems typically contain multiple constraints, which can be utilized to implement pruning operations. Pruning can terminate unnecessary search branches early, significantly improving search efficiency.
- The backtracking algorithm is primarily used to solve search problems and constraint satisfaction problems. While combinatorial optimization problems can be solved with backtracking, there are often more efficient or better-performing solutions available.
- The permutation problem aims to find all possible permutations of elements in a given set. We use an array to record whether each element has been selected, thereby pruning search branches that attempt to select the same element repeatedly, ensuring each element is selected exactly once.
- In the permutation problem, if the set contains duplicate elements, the final result will contain duplicate permutations. We need to impose a constraint so that equal elements can only be selected once per round, which is typically achieved using a hash set.
- The subset-sum problem aims to find all subsets of a given set that sum to a target value. Since the set is unordered but the search process outputs results in all orders, duplicate subsets are generated. We sort the data before backtracking and use a variable to indicate the starting point of each round's traversal, thereby pruning search branches that generate duplicate subsets.
- For the subset-sum problem, equal elements in the array produce duplicate sets. We leverage the precondition that the array is sorted by checking whether adjacent elements are equal to implement pruning, ensuring that equal elements can only be selected once per round.
- The $n$ queens problem aims to find placements of $n$ queens on an $n \times n$ chessboard such that no two queens can attack each other. The constraints of this problem include row constraints, column constraints, and main and anti-diagonal constraints. To satisfy row constraints, we adopt a row-by-row placement strategy, ensuring exactly one queen is placed in each row.
- The handling of column constraints and diagonal constraints is similar. For column constraints, we use an array to record whether each column has a queen, thereby indicating whether a selected cell is valid. For diagonal constraints, we use two arrays to separately record whether queens exist on each main or anti-diagonal. The challenge lies in finding the row-column index pattern that characterizes cells on the same main (anti-)diagonal.

### Q & A

**Q**: How should we understand the relationship between backtracking and recursion?

Overall, backtracking is an "algorithm strategy", while recursion is more like a "tool".

- The backtracking algorithm is typically implemented based on recursion. However, backtracking is one application scenario of recursion and represents the application of recursion in search problems.
- The structure of recursion embodies the "subproblem decomposition" problem-solving paradigm, commonly used to solve problems involving divide-and-conquer, backtracking, and dynamic programming (memoized recursion).
