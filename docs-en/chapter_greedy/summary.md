# Summary

- Greedy algorithms are commonly used to solve optimization problems based on the principle of making locally optimal decisions at each decision stage in the expectation of obtaining a globally optimal solution.
- The greedy algorithm iteratively makes one greedy choice after another, transforming the problem into a smaller subproblem each round until the problem is solved.
- The greedy algorithm is not only simple to implement, but also highly efficient in solving problems. Compared to dynamic programming, greedy algorithms usually have lower time complexity.
- In the change exchange problem, the greedy algorithm is guaranteed to find an optimal solution for some coin combinations; for others it is not, and the greedy algorithm may find a very poor solution.
- Problems suitable for solution with greedy algorithms have two main properties: the greedy choice property and the optimal substructure. The greedy selection property represents the effectiveness of the greedy strategy.
- For some complex problems, proof of the nature of greedy choice is not simple. It is relatively easier to falsify, for example, the change exchange problem.
- Solving greedy problems is divided into three main steps: problem analysis, greedy strategy determination, and correctness proof. Among them, greedy strategy determination is the core step, and correctness proof is often the hard part.
- The fractional knapsack problem is based on the 0-1 knapsack and allows to select a fraction of the items, so it can be solved using a greedy algorithm. The correctness of the greedy strategy can be proved using the inverse method.
- The maximum capacity problem can be solved using the exhaustive enumeration method with a time complexity of $O(n^2)$ . The time complexity can be optimized to $O(n)$ by designing a greedy strategy that moves the short board inward each round.
- In the Maximum Tangent Product Problem, we successively reason about two greedy strategies: $\geq 4$ integers should all continue to be tangent, and the optimal tangent factor is $3$ . The code contains power operations, and the time complexity depends on how the power operations are implemented, usually $O(1)$ or $O(\log n)$ .
