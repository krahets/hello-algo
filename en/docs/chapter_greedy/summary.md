# Summary

### Key takeaways

- Greedy algorithms are commonly used for optimization. At each decision point, they make a locally optimal choice in the hope of reaching a globally optimal solution.
- A greedy algorithm repeatedly makes greedy choices, turning the problem into a smaller subproblem at each step until it is solved.
- Greedy algorithms are easy to implement and efficient. Their time complexity is usually lower than that of dynamic programming.
- For some coin denominations, a greedy algorithm is guaranteed to find an optimal coin change solution. For others, it may produce a very poor solution.
- Problems suited to greedy algorithms have two properties: the greedy-choice property and optimal substructure. The greedy-choice property establishes that the strategy works.
- Proving the greedy-choice property can be difficult for complex problems. Disproving it is often easier, as coin change illustrates.
- Solving a greedy problem involves three main steps: analyze the problem, choose a greedy strategy, and prove correctness. Choosing the strategy is the central step, while proving correctness is often the hardest.
- The fractional knapsack problem extends 0-1 knapsack by allowing fractions of items, making a greedy solution possible. The strategy can be proved correct by contradiction.
- The maximum capacity problem can be solved by exhaustive search in $O(n^2)$ time. A greedy strategy that moves the shorter wall inward at each step reduces this to $O(n)$.
- For the maximum product cutting problem, we derived two greedy strategies: continue splitting integers $\geq 4$, and favor factors of $3$. The implementation uses exponentiation, so its time complexity depends on the exponentiation method, usually $O(1)$ or $O(\log n)$.
