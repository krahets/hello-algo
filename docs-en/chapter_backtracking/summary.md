# Summary

### Highlights

- The backtracking algorithm is essentially an exhaustive method, which searches for a solution that meets the conditions by performing a depth-first traversal of the solution space. During the search process, solutions that satisfy the conditions are encountered and recorded until all solutions are found or the traversal is completed.
- The search process of the backtracking algorithm consists of two parts: trying and backtracking. It tries various choices by depth-first search, and when it encounters a situation that does not satisfy the constraints, it undoes the previous step, falls back to the previous state, and continues to try other choices. Trying and backtracking are two operations in opposite directions.
- Backtracking problems usually contain multiple constraints which can be used to implement pruning operations. Pruning can dramatically improve search efficiency by ending unnecessary search branches early.
- Backtracking algorithms can be used primarily to solve search problems and constraint satisfaction problems. Combinatorial optimization problems, although they can be solved with backtracking algorithms, often have solutions that are more efficient or better.
- The permutations problem aims to search for all possible permutations of a given set. We keep track of whether each element is selected or not with the help of an array, pruning out search branches that select the same element repeatedly, ensuring that each element is selected only once.
- In the permutations problem, if there are duplicate elements in the set, the end result will be a duplicate permutation. We need to constraint that equal elements can be selected only once in each round, which is usually done with the help of a hash table.
- The goal of the subset-sum problem is to find all subsets of a given set whose sum is the target value. The set does not distinguish between the order of the elements, and the search process outputs results in all orders, producing duplicate subsets. We prune the search branches that generate duplicate subsets by sorting the data before backtracking and setting a variable to indicate the starting point of each round of traversal.
- For the subset-sum problem, equal elements in the array produce duplicate sets. We utilize the precondition that the array has been sorted to achieve pruning by determining whether neighboring elements are equal, thus ensuring that equal elements can only be selected once in each round.
- $n$ Queens aims to find solutions that place $n$ queens onto a $n \times n$ sized chessboard, requiring that all queens cannot attack each other two by two. The constraints of this problem are row constraints, column constraints, primary diagonal and secondary diagonal constraints. To satisfy the row constraints, we use a row-by-row placement strategy that guarantees that one queen is placed in each row.
- Column constraints and diagonal constraints are handled similarly. For column constraints, we utilize an array to record whether there is a queen in each column, thus indicating whether the selected grid is legal or not. For diagonal constraints, we use two arrays to record whether there are queens in the main and sub-diagonals respectively; the difficulty lies in finding the row-column indexing laws that are satisfied by the lattice on the same main (sub) diagonal.

### Q & A

!!! Question "How to understand the relationship between backtracking and recursion?"

    In general, backtracking is an "algorithmic strategy", while recursion is more of a "tool".

    - Backtracking algorithms are usually based on recursion implementations. However, backtracking is one of the application scenarios of recursion, an application of recursion to search problems.
    - The structure of recursion reflects the "subproblem decomposition" solution paradigm, and is commonly used to solve problems such as divide and conquer, backtracking, and dynamic programming (memoized recursion).
