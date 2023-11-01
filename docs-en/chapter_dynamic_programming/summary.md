# Summary

- Dynamic programming decomposes the problem and achieves efficient computational efficiency by storing solutions to subproblems to circumvent repeated computations.
- All dynamic programming problems can be solved using backtracking (brute force search) without taking time into account, but there are a large number of overlapping subproblems in the recursion tree, which is extremely inefficient. By introducing a memorized list, the solutions of all computed subproblems can be stored, thus ensuring that overlapping subproblems are computed only once.
- Memorized recursion is a top-to-bottom recursion, while its counterpart, dynamic programming, is a bottom-to-top recursion, which is like "filling in a table". Since the current state only depends on some local states, we can eliminate one dimension of the $dp$ table, thus reducing the space complexity.
- Subproblem decomposition is a generalized algorithmic idea with different properties in divide and conquer, dynamic programming, and backtracking algorithm.
- Three main properties of dynamic programming problems: overlapping subproblems, optimal substructure, and no posteriority.
- An original problem has an optimal substructure if its optimal solution can be constructed from the optimal solution of the subproblem.
- A posteriority-free approach means that for a state, its future development is related only to that state, independent of all past states it has experienced. Many combinatorial optimization problems are not posteriority free and cannot be solved quickly using dynamic programming.

**Knapsack problem**

- The knapsack problem is the most typical dynamic programming topic with variants of the problem such as 0-1 knapsack, complete knapsack, and multiple knapsack.
- 0-1 The state of the backpack is defined as the maximum value of the first $i$ items in the backpack with remaining capacity $c$. Based on the two decisions of not putting into the backpack and putting into the backpack, the optimal substructure can be obtained and the state-trasition equation is constructed. In spatial optimization, since each state depends on the states directly above and above left, it is necessary to traverse the list in inverse order to avoid the state above left being covered.
- A full backpack has an unlimited number of selections per item, so the state transfer for selecting items to put into it is different from that of a 0-1 backpack. Since the state depends on the states directly above and directly to the left, it should be traversed in positive order in spatial optimization.
- The change exchange problem is a variant of the knapsack problem. It changes from finding the "maximum" value to finding the "minimum" number of coins, so $\max()$ in the state-transition equation should be changed to $\min()$. From "not exceeding" the backpack capacity to "exactly" the target amount, so $amt + 1$ is used to denote an invalid solution that "fails to reach the target amount".
- The Change Exchange II problem was changed from "Minimum number of coins" to "Number of combinations of coins", and the state-transition equation was changed from $\min()$ to a summation operator.

**Edit distance problem**

- The edit distance (Levenshtein distance) is used to measure the similarity between two strings, which is defined as the minimum number of editing steps from one string to another, and the editing operations include add, delete, and replace.
- The state of the edit distance problem is defined as the minimum number of edit steps required to change the first $i$ characters of $s$ to the first $j$ characters of $t$. When $s[i] \ne t[j]$ has three decisions: add, delete, and replace, they all have corresponding remaining subproblems. Accordingly, the optimal substructure can be found with the construction of state-trasition equation. And when $s[i] = t[j]$, there is no need to edit the current character.
- In edit distance, the state depends on the states directly above, directly to the left, and above left of it, so that neither positive-order nor inverted-order traversal after spatial optimization can correctly transfer the state. For this reason, we use a variable to temporarily store the upper-left state, thus transforming it to a case equivalent to a complete backpack, which can be traversed in positive order after spatial optimization.
