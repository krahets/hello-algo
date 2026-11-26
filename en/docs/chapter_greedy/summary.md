# Summary

### Key points

- Greedy algorithms typically solve optimization problems by making a locally optimal choice at each decision point in the hope of reaching a global optimum.
- A greedy algorithm makes one choice after another. Each choice reduces the problem to a smaller subproblem, and the process continues until the problem is solved.
- Greedy algorithms are easy to implement and efficient. They usually have lower time complexity than dynamic programming.
- For some sets of coin denominations, greedy coin change is guaranteed to find an optimal solution. For other sets, it can give a very poor solution.
- Problems suited to greedy algorithms have two properties: the greedy-choice property and optimal substructure. The greedy-choice property is what makes the greedy strategy valid.
- For some complex problems, the greedy-choice property is difficult to prove. It can be easier to disprove, as the coin change example shows.
- Solving a greedy problem involves three main steps: analyze the problem, choose a greedy strategy, and prove correctness. Choosing the strategy is the central step, and proving correctness is often the hardest part.
- Fractional knapsack extends 0-1 knapsack by allowing a fraction of an item to be taken. This makes a greedy solution possible. Its correctness can be proved by contradiction.
- An exhaustive search for maximum capacity takes $O(n^2)$ time. Moving the pointer at the shorter board inward at each step gives a greedy strategy that reduces the time to $O(n)$.
- For the maximum product after cutting, we derived two greedy rules: keep splitting integers $\geq 4$, and favor factors of $3$. The code uses exponentiation, so its time complexity depends on the implementation of that operation, usually $O(1)$ or $O(\log n)$.
