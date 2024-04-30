# Summary

### Key review

- The essence of the backtracking algorithm is an exhaustive search method, where the solution space is traversed deeply first to find solutions that meet the criteria. During the search, if a satisfying solution is found, it is recorded, until all solutions are found or the search is completed.
- The search process of the backtracking algorithm includes trying and retreating. It uses depth-first search to explore various choices, and when a choice does not meet the constraint conditions, the previous choice is undone, reverting to the previous state, and other options are then continued to be tried. Trying and retreating are operations in opposite directions.
- Backtracking problems usually contain multiple constraints, which can be used to perform pruning operations. Pruning can terminate unnecessary search branches early, greatly enhancing search efficiency.
- Backtracking algorithms are mainly used to solve search problems and constraint satisfaction problems. Although combinatorial optimization problems can be solved using backtracking, there are often more efficient or effective solutions available.
- The permutation problem aims to search for all possible permutations of a given set of elements. We use an array to record whether each element has been chosen, cutting off branches that repeatedly select the same element, ensuring each element is selected only once.
- In permutation problems, if the set contains duplicate elements, the final result will include duplicate permutations. We need to restrict that identical elements can only be selected once in each round, which is usually implemented using a hash set.
- The subset-sum problem aims to find all subsets in a given set that sum to a target value. The set does not distinguish the order of elements, but the search process outputs all ordered results, producing duplicate subsets. Before backtracking, we sort the data and set a variable to indicate the starting point of each round of traversal, thereby pruning the search branches that generate duplicate subsets.
- For the subset-sum problem, equal elements in the array can produce duplicate sets. Using the precondition that the array is already sorted, we prune by determining if adjacent elements are equal, thus ensuring equal elements are only selected once per round.
- The $n$ queens problem aims to find schemes to place $n$ queens on an $n \times n$ size chessboard in such a way that no two queens can attack each other. The constraints of the problem include row constraints, column constraints, main diagonal constraints, and secondary diagonal constraints. To meet the row constraint, we adopt a strategy of placing one queen per row, ensuring each row has one queen placed.
- The handling of column constraints and diagonal constraints is similar. For column constraints, we use an array to record whether there is a queen in each column, thereby indicating whether the selected cell is legal. For diagonal constraints, we use two arrays to respectively record the presence of queens on the main and secondary diagonals; the challenge is in identifying the row and column index patterns that satisfy the same primary (secondary) diagonal.

### Q & A

**Q**: How can we understand the relationship between backtracking and recursion?

Overall, backtracking is a "strategic algorithm," while recursion is more of a "tool."

- Backtracking algorithms are typically based on recursion. However, backtracking is one of the application scenarios of recursion, specifically in search problems.
- The structure of recursion reflects the "sub-problem decomposition" problem-solving paradigm, commonly used in solving problems involving divide and conquer, backtracking, and dynamic programming (memoized recursion).
