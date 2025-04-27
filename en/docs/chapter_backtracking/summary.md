# Summary

### Key review

- The essence of the backtracking algorithm is exhaustive search. It seeks solutions that meet the conditions by performing a depth-first traversal of the solution space. During the search, if a satisfying solution is found, it is recorded, until all solutions are found or the traversal is completed.
- The search process of the backtracking algorithm includes trying and backtracking. It uses depth-first search to explore various choices, and when a choice does not meet the constraints, the previous choice is undone. Then it reverts to the previous state and continues to try other options. Trying and backtracking are operations in opposite directions.
- Backtracking problems usually contain multiple constraints. These constraints can be used to perform pruning operations. Pruning can terminate unnecessary search branches in advance, greatly enhancing search efficiency.
- The backtracking algorithm is mainly used to solve search problems and constraint satisfaction problems. Although combinatorial optimization problems can be solved using backtracking, there are often more efficient or effective solutions available.
- The permutation problem aims to search for all possible permutations of the elements in a given set. We use an array to record whether each element has been chosen, avoiding repeated selection of the same element. This ensures that each element is chosen only once.
- In permutation problems, if the set contains duplicate elements, the final result will include duplicate permutations. We need to restrict that identical elements can only be selected once in each round, which is usually implemented using a hash set.
- The subset-sum problem aims to find all subsets in a given set that sum to a target value. The set does not distinguish the order of elements, but the search process may generate duplicate subsets. This occurs because the algorithm explores different element orders as unique paths. Before backtracking, we sort the data and set a variable to indicate the starting point of the traversal for each round. This allows us to prune the search branches that generate duplicate subsets.
- For the subset-sum problem, equal elements in the array can produce duplicate sets. Using the precondition that the array is already sorted, we prune by determining if adjacent elements are equal. This ensures that equal elements are only selected once per round.
- The $n$ queens problem aims to find schemes to place $n$ queens on an $n \times n$ chessboard such that no two queens can attack each other. The constraints of the problem include row constraints, column constraints, and constraints on the main and secondary diagonals. To meet the row constraint, we adopt a strategy of placing one queen per row, ensuring each row has one queen placed.
- The handling of column constraints and diagonal constraints is similar. For column constraints, we use an array to record whether there is a queen in each column, thereby indicating whether the selected cell is legal. For diagonal constraints, we use two arrays to respectively record the presence of queens on the main and secondary diagonals. The challenge is to determine the relationship between row and column indices for cells on the same main or secondary diagonal.

### Q & A

**Q**: How can we understand the relationship between backtracking and recursion?

Overall, backtracking is an "algorithmic strategy," while recursion is more of a "tool."

- Backtracking algorithms are typically based on recursion. However, backtracking is one of the application scenarios of recursion, specifically in search problems.
- The structure of recursion reflects the problem-solving paradigm of "sub-problem decomposition." It is commonly used in solving problems involving divide and conquer, backtracking, and dynamic programming (memoized recursion).
