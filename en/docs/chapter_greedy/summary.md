# Summary

### Key Review

- Greedy algorithms are typically used to solve optimization problems. The principle is to make locally optimal decisions at each decision stage in hopes of obtaining a globally optimal solution.
- Greedy algorithms iteratively make one greedy choice after another, transforming the problem into a smaller subproblem in each round, until the problem is solved.
- Greedy algorithms are not only simple to implement, but also have high problem-solving efficiency. Compared to dynamic programming, greedy algorithms typically have lower time complexity.
- In the coin change problem, for certain coin combinations, greedy algorithms can guarantee finding the optimal solution; for other coin combinations, however, greedy algorithms may find very poor solutions.
- Problems suitable for solving with greedy algorithms have two major properties: greedy choice property and optimal substructure. The greedy choice property represents the effectiveness of the greedy strategy.
- For some complex problems, proving the greedy choice property is not simple. Relatively speaking, disproving it is easier, such as in the coin change problem.
- Solving greedy problems mainly consists of three steps: problem analysis, determining the greedy strategy, and correctness proof. Among these, determining the greedy strategy is the core step, and correctness proof is often the difficult point.
- The fractional knapsack problem, based on the 0-1 knapsack problem, allows selecting a portion of items, and therefore can be solved using greedy algorithms. The correctness of the greedy strategy can be proven using proof by contradiction.
- The max capacity problem can be solved using exhaustive enumeration with time complexity $O(n^2)$. By designing a greedy strategy to move the short partition inward in each round, the time complexity can be optimized to $O(n)$.
- In the max product cutting problem, we successively derive two greedy strategies: integers $\geq 4$ should all continue to be split, and the optimal splitting factor is $3$. The code includes exponentiation operations, and the time complexity depends on the implementation method of exponentiation, typically being $O(1)$ or $O(\log n)$.
