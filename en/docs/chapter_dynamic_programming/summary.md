---
comments: true
---

# 14.7 &nbsp; Summary

### 1. &nbsp; Key points

- Dynamic programming breaks a problem into subproblems and stores their solutions to avoid repeated work and improve efficiency.
- Given enough time, backtracking (brute-force search) can solve any dynamic programming problem. The many overlapping subproblems in its recursion tree make it highly inefficient. A cache stores solved subproblems so that each overlapping subproblem is calculated only once.
- Memoized search is a top-down recursive approach. Its bottom-up dynamic programming counterpart iterates through a recurrence, much like filling a table. When a state depends only on nearby states, we can remove a dimension from the $dp$ table to reduce space complexity.
- Breaking a problem into subproblems is a general algorithmic technique. Divide and conquer, dynamic programming, and backtracking use it in different ways.
- Dynamic programming problems have three main properties: overlapping subproblems, optimal substructure, and the no-aftereffect property.
- A problem has optimal substructure if an optimal solution can be built from optimal solutions to its subproblems.
- The no-aftereffect property means that what can happen next depends only on the current state, regardless of how we reached it. Many combinatorial optimization problems lack this property and cannot be solved quickly with dynamic programming.

**Knapsack problems**

- Knapsack is a classic dynamic programming problem. Its variants include 0-1, unbounded, and bounded knapsack.
- In 0-1 knapsack, the state value is the maximum value from the first $i$ items with capacity $c$. The choices of skipping or taking the current item reveal the optimal substructure and give the recurrence. When reducing space, traverse capacities in reverse because each state needs values directly above and to the upper left. This preserves the upper-left values until they are read.
- Unbounded knapsack allows unlimited copies of each item, so taking an item leads to a different transition from 0-1 knapsack. Each state depends on the cells above and to its left, so the space-optimized version traverses forward.
- Coin change is a variant of unbounded knapsack. We minimize the coin count instead of maximizing value, so $\max()$ becomes $\min()$ in the recurrence. We must make the target amount exactly rather than stay within a capacity limit, so $amt + 1$ marks an unreachable amount.
- Coin change II counts coin combinations rather than minimizing the number of coins. The recurrence replaces $\min()$ with addition.

**The edit distance problem**

- Edit distance (Levenshtein distance) measures string similarity. It is the fewest insertions, deletions, and replacements needed to change one string into another.
- An edit distance state gives the minimum edits to change the first $i$ characters of $s$ into the first $j$ characters of $t$. When $s[i-1] \ne t[j-1]$, the three choices are insertion, deletion, and replacement. Each leaves a corresponding subproblem, giving the optimal substructure and recurrence. When $s[i-1] = t[j-1]$, the current character needs no edit.
- An edit distance state depends on the cells immediately above, to the left, and diagonally above to the left. With one row, neither forward nor reverse traversal alone preserves all three. Saving the upper-left value in a variable leaves the same row dependencies as unbounded knapsack, allowing forward traversal.
