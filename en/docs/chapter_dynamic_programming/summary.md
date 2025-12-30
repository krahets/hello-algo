# Summary

### Key Review

- Dynamic programming decomposes problems and avoids redundant computation by storing the solutions to subproblems, thereby significantly improving computational efficiency.
- Without considering time constraints, all dynamic programming problems can be solved using backtracking (brute force search), but the recursion tree contains a large number of overlapping subproblems, resulting in extremely low efficiency. By introducing a memo list, we can store the solutions to all computed subproblems, ensuring that overlapping subproblems are only computed once.
- Memoization is a top-down recursive solution, while the corresponding dynamic programming is a bottom-up iterative solution, similar to "filling in a table". Since the current state only depends on certain local states, we can eliminate one dimension of the $dp$ table to reduce space complexity.
- Subproblem decomposition is a general algorithmic approach, with different properties in divide and conquer, dynamic programming, and backtracking.
- Dynamic programming problems have three major characteristics: overlapping subproblems, optimal substructure, and no aftereffects.
- If the optimal solution to the original problem can be constructed from the optimal solutions to the subproblems, then it has optimal substructure.
- No aftereffects means that for a given state, its future development is only related to that state and has nothing to do with all past states. Many combinatorial optimization problems do not have no aftereffects and cannot be quickly solved using dynamic programming.

**Knapsack problem**

- The knapsack problem is one of the most typical dynamic programming problems, with variants such as the 0-1 knapsack, unbounded knapsack, and multiple knapsack.
- The state definition for the 0-1 knapsack is the maximum value among the first $i$ items in a knapsack of capacity $c$. Based on the two decisions of not putting an item in the knapsack and putting it in, the optimal substructure can be identified and the state transition equation constructed. In space optimization, since each state depends on the state directly above and to the upper-left, the list needs to be traversed in reverse order to avoid overwriting the upper-left state.
- The unbounded knapsack problem has no limit on the selection quantity of each type of item, so the state transition for choosing to put in an item differs from the 0-1 knapsack problem. Since the state depends on the state directly above and directly to the left, space optimization should use forward traversal.
- The coin change problem is a variant of the unbounded knapsack problem. It changes from seeking the "maximum" value to seeking the "minimum" number of coins, so $\max()$ in the state transition equation should be changed to $\min()$. It changes from seeking "not exceeding" the knapsack capacity to seeking "exactly" making up the target amount, so $amt + 1$ is used to represent the invalid solution of "unable to make up the target amount".
- Coin change problem II changes from seeking the "minimum number of coins" to seeking the "number of coin combinations", so the state transition equation correspondingly changes from $\min()$ to a summation operator.

**Edit distance problem**

- Edit distance (Levenshtein distance) is used to measure the similarity between two strings, defined as the minimum number of edit steps from one string to another, with edit operations including insert, delete, and replace.
- The state definition for the edit distance problem is the minimum number of edit steps required to change the first $i$ characters of $s$ into the first $j$ characters of $t$. When $s[i] \ne t[j]$, there are three decisions: insert, delete, replace, each with corresponding remaining subproblems. From this, the optimal substructure can be identified and the state transition equation constructed. When $s[i] = t[j]$, no edit is required for the current character.
- In edit distance, the state depends on the state directly above, directly to the left, and to the upper-left, so after space optimization, neither forward nor reverse traversal can correctly perform state transitions. For this reason, we use a variable to temporarily store the upper-left state, thus transforming to a situation equivalent to the unbounded knapsack problem, allowing for forward traversal after space optimization.
