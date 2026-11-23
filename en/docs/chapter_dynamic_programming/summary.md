# Summary

### Key takeaways

- Dynamic programming decomposes problems and stores subproblem solutions to avoid repeated computation and improve efficiency.
- Without a time limit, every dynamic programming problem can be solved by backtracking (brute-force search). However, the recursion tree contains many overlapping subproblems, making it very inefficient. Memoization stores computed solutions so that each overlapping subproblem is solved only once.
- Memoized search is a top-down recursive approach, while the corresponding dynamic programming solution works bottom up, like filling a table. Since the current state depends only on certain nearby states, removing a dimension from the $dp$ table can reduce space complexity.
- Decomposing a problem into subproblems is a general algorithmic idea with different characteristics in divide and conquer, dynamic programming, and backtracking.
- Dynamic programming problems have three key properties: overlapping subproblems, optimal substructure, and the no-aftereffect property.
- A problem has optimal substructure if its optimal solution can be constructed from optimal solutions to subproblems.
- The no-aftereffect property means a state's future depends only on that state, not on the history leading to it. Many combinatorial optimization problems lack this property and cannot be solved quickly with dynamic programming.

**Knapsack problems**

- Knapsack is one of the most typical dynamic programming problem families, with variants including 0-1, unbounded, and bounded knapsack.
- In 0-1 knapsack, the state value is the maximum value obtainable from the first $i$ items within capacity $c$. The choices to exclude or include an item reveal optimal substructure and give the state transition equation. After space optimization, backward iteration is necessary because each state depends on entries above and to the upper left, which must not be overwritten prematurely.
- Unbounded knapsack allows unlimited copies of each item, changing the transition for including an item. Because a state depends on entries directly above and to the left, space optimization requires forward iteration.
- Coin change is a variant of unbounded knapsack. Minimizing the number of coins instead of maximizing value changes $\max()$ to $\min()$ in the transition. Requiring the target amount exactly, rather than staying within a capacity, calls for using $amt + 1$ to represent an infeasible solution.
- Coin change II counts combinations instead of minimizing coin count, so the transition replaces $\min()$ with addition.

**Edit distance**

- Edit distance (Levenshtein distance) measures similarity between strings. It is the minimum number of edits needed to turn one string into another, allowing insertion, deletion, and replacement.
- The edit distance state is the minimum number of edits needed to transform the first $i$ characters of $s$ into the first $j$ characters of $t$. When $s[i-1] \ne t[j-1]$, insertion, deletion, and replacement each leave a corresponding subproblem, revealing optimal substructure and the state transition equation. When $s[i-1] = t[j-1]$, no edit is needed for those characters.
- Edit distance depends on states above, to the left, and to the upper left, so neither forward nor backward iteration alone works after space optimization. A temporary variable preserves the upper-left state, reducing the situation to one like unbounded knapsack and allowing forward iteration.
