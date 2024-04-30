# Summary

- Dynamic programming decomposes problems and improves computational efficiency by avoiding redundant computations through storing solutions of subproblems.
- Without considering time, all dynamic programming problems can be solved using backtracking (brute force search), but the recursion tree has many overlapping subproblems, resulting in very low efficiency. By introducing a memorization list, it's possible to store solutions of all computed subproblems, ensuring that overlapping subproblems are only computed once.
- Memorization search is a top-down recursive solution, whereas dynamic programming corresponds to a bottom-up iterative approach, akin to "filling out a table." Since the current state only depends on certain local states, we can eliminate one dimension of the dp table to reduce space complexity.
- Decomposition of subproblems is a universal algorithmic approach, differing in characteristics among divide and conquer, dynamic programming, and backtracking.
- Dynamic programming problems have three main characteristics: overlapping subproblems, optimal substructure, and no aftereffects.
- If the optimal solution of the original problem can be constructed from the optimal solutions of its subproblems, it has an optimal substructure.
- No aftereffects mean that the future development of a state depends only on the current state and not on all past states experienced. Many combinatorial optimization problems do not have this property and cannot be quickly solved using dynamic programming.

**Knapsack problem**

- The knapsack problem is one of the most typical dynamic programming problems, with variants including the 0-1 knapsack, unbounded knapsack, and multiple knapsacks.
- The state definition of the 0-1 knapsack is the maximum value in a knapsack of capacity $c$ with the first $i$ items. Based on decisions not to include or to include an item in the knapsack, optimal substructures can be identified and state transition equations constructed. In space optimization, since each state depends on the state directly above and to the upper left, the list should be traversed in reverse order to avoid overwriting the upper left state.
- In the unbounded knapsack problem, there is no limit on the number of each kind of item that can be chosen, thus the state transition for including items differs from the 0-1 knapsack. Since the state depends on the state directly above and to the left, space optimization should involve forward traversal.
- The coin change problem is a variant of the unbounded knapsack problem, shifting from seeking the “maximum” value to seeking the “minimum” number of coins, thus the state transition equation should change $\max()$ to $\min()$. From pursuing “not exceeding” the capacity of the knapsack to seeking exactly the target amount, thus use $amt + 1$ to represent the invalid solution of “unable to make up the target amount.”
- Coin Change Problem II shifts from seeking the “minimum number of coins” to seeking the “number of coin combinations,” changing the state transition equation accordingly from $\min()$ to summation operator.

**Edit distance problem**

- Edit distance (Levenshtein distance) measures the similarity between two strings, defined as the minimum number of editing steps needed to change one string into another, with editing operations including adding, deleting, or replacing.
- The state definition for the edit distance problem is the minimum number of editing steps needed to change the first $i$ characters of $s$ into the first $j$ characters of $t$. When $s[i] \ne t[j]$, there are three decisions: add, delete, replace, each with their corresponding residual subproblems. From this, optimal substructures can be identified, and state transition equations built. When $s[i] = t[j]$, no editing of the current character is necessary.
- In edit distance, the state depends on the state directly above, to the left, and to the upper left. Therefore, after space optimization, neither forward nor reverse traversal can correctly perform state transitions. To address this, we use a variable to temporarily store the upper left state, making it equivalent to the situation in the unbounded knapsack problem, allowing for forward traversal after space optimization.
