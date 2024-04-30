# Summary

- Greedy algorithms are often used to solve optimization problems, where the principle is to make locally optimal decisions at each decision stage in order to achieve a globally optimal solution.
- Greedy algorithms iteratively make one greedy choice after another, transforming the problem into a smaller sub-problem with each round, until the problem is resolved.
- Greedy algorithms are not only simple to implement but also have high problem-solving efficiency. Compared to dynamic programming, greedy algorithms generally have a lower time complexity.
- In the problem of coin change, greedy algorithms can guarantee the optimal solution for certain combinations of coins; for others, however, the greedy algorithm might find a very poor solution.
- Problems suitable for greedy algorithm solutions possess two main properties: greedy-choice property and optimal substructure. The greedy-choice property represents the effectiveness of the greedy strategy.
- For some complex problems, proving the greedy-choice property is not straightforward. Contrarily, proving the invalidity is often easier, such as with the coin change problem.
- Solving greedy problems mainly consists of three steps: problem analysis, determining the greedy strategy, and proving correctness. Among these, determining the greedy strategy is the key step, while proving correctness often poses the challenge.
- The fractional knapsack problem builds on the 0-1 knapsack problem by allowing the selection of a part of the items, hence it can be solved using a greedy algorithm. The correctness of the greedy strategy can be proved by contradiction.
- The maximum capacity problem can be solved using the exhaustive method, with a time complexity of $O(n^2)$. By designing a greedy strategy, each round moves inwardly shortening the board, optimizing the time complexity to $O(n)$.
- In the problem of maximum product after cutting, we deduce two greedy strategies: integers $\geq 4$ should continue to be cut, with the optimal cutting factor being $3$. The code includes power operations, and the time complexity depends on the method of implementing power operations, generally being $O(1)$ or $O(\log n)$.
