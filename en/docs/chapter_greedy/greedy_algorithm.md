# Greedy Algorithm

<u>Greedy algorithm</u> is a common algorithm for solving optimization problems. Its basic idea is to make the seemingly best choice at each decision stage of the problem, that is, to greedily make locally optimal decisions in hopes of obtaining a globally optimal solution. Greedy algorithms are simple and efficient, and are widely applied in many practical problems.

Greedy algorithms and dynamic programming are both commonly used to solve optimization problems. They share some similarities, such as both relying on the optimal substructure property, but they work differently.

- Dynamic programming considers all previous decisions when making the current decision, and uses solutions to past subproblems to construct the solution to the current subproblem.
- Greedy algorithms do not consider past decisions, but instead make greedy choices moving forward, continually reducing the problem size until the problem is solved.

We will first understand how greedy algorithms work through the example problem "coin change". This problem has already been introduced in the "Complete Knapsack Problem" chapter, so I believe you are not unfamiliar with it.

!!! question

    Given $n$ types of coins, where the denomination of the $i$-th type of coin is $coins[i - 1]$, and the target amount is $amt$, with each type of coin available for repeated selection, what is the minimum number of coins needed to make up the target amount? If it is impossible to make up the target amount, return $-1$.

The greedy strategy adopted for this problem is shown in the figure below. Given a target amount, **we greedily select the coin that is not greater than and closest to it**, and continuously repeat this step until the target amount is reached.

![Greedy strategy for coin change](greedy_algorithm.assets/coin_change_greedy_strategy.png)

The implementation code is as follows:

```src
[file]{coin_change_greedy}-[class]{}-[func]{coin_change_greedy}
```

You might exclaim: So clean! The greedy algorithm solves the coin change problem in about ten lines of code.

## Advantages and Limitations of Greedy Algorithms

**Greedy algorithms are not only straightforward and simple to implement, but are also usually very efficient**. In the code above, if the smallest coin denomination is $\min(coins)$, the greedy choice loops at most $amt / \min(coins)$ times, giving a time complexity of $O(amt / \min(coins))$. This is an order of magnitude smaller than the time complexity of the dynamic programming solution $O(n \times amt)$.

However, **for certain coin denomination combinations, greedy algorithms cannot find the optimal solution**. The figure below provides two examples.

- **Positive example $coins = [1, 5, 10, 20, 50, 100]$**: With this coin combination, given any $amt$, the greedy algorithm can find the optimal solution.
- **Negative example $coins = [1, 20, 50]$**: Suppose $amt = 60$, the greedy algorithm can only find the combination $50 + 1 \times 10$, totaling $11$ coins, but dynamic programming can find the optimal solution $20 + 20 + 20$, requiring only $3$ coins.
- **Negative example $coins = [1, 49, 50]$**: Suppose $amt = 98$, the greedy algorithm can only find the combination $50 + 1 \times 48$, totaling $49$ coins, but dynamic programming can find the optimal solution $49 + 49$, requiring only $2$ coins.

![Examples where greedy algorithms cannot find the optimal solution](greedy_algorithm.assets/coin_change_greedy_vs_dp.png)

In other words, for the coin change problem, greedy algorithms cannot guarantee finding the global optimal solution, and may even find very poor solutions. It is better suited for solving with dynamic programming.

Generally, the applicability of greedy algorithms falls into the following two situations.

1. **Can guarantee finding the optimal solution**: In this situation, greedy algorithms are often the best choice, because they tend to be more efficient than backtracking and dynamic programming.
2. **Can find an approximate optimal solution**: Greedy algorithms are also applicable in this situation. For many complex problems, finding the global optimal solution is very difficult, and being able to find a suboptimal solution with high efficiency is also very good.

## Characteristics of Greedy Algorithms

So the question arises: what kind of problems are suitable for solving with greedy algorithms? Or in other words, under what conditions can greedy algorithms guarantee finding the optimal solution?

Compared to dynamic programming, the conditions for using greedy algorithms are stricter, mainly focusing on two properties of the problem.

- **Greedy choice property**: Only when locally optimal choices can always lead to a globally optimal solution can greedy algorithms guarantee obtaining the optimal solution.
- **Optimal substructure**: The optimal solution to the original problem contains the optimal solutions to subproblems.

Optimal substructure has already been introduced in the "Dynamic Programming" chapter, so we won't elaborate on it here. It's worth noting that the optimal substructure of some problems is not obvious, but they can still be solved using greedy algorithms.

We mainly explore methods for determining the greedy choice property. Although its description seems relatively simple, **in practice, for many problems, proving the greedy choice property is not easy**.

For example, in the coin change problem, although we can easily provide counterexamples to disprove the greedy choice property, proving it is quite difficult. If asked: **what conditions must a coin combination satisfy to be solvable using a greedy algorithm**? We often can only rely on intuition or examples to give an ambiguous answer, and find it difficult to provide a rigorous mathematical proof.

!!! quote

    There is a paper that presents an algorithm with $O(n^3)$ time complexity for determining whether a coin combination can use a greedy algorithm to find the optimal solution for any amount.

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## Steps for Solving Problems with Greedy Algorithms

The problem-solving process for greedy problems can generally be divided into the following three steps.

1. **Problem analysis**: Sort out and understand the problem characteristics, including state definition, optimization objectives, and constraints, etc. This step is also involved in backtracking and dynamic programming.
2. **Determine the greedy strategy**: Determine how to make greedy choices at each step. This strategy should be able to reduce the problem size at each step, ultimately solving the entire problem.
3. **Correctness proof**: It is usually necessary to prove that the problem has both greedy choice property and optimal substructure. This step may require mathematical proofs, such as mathematical induction or proof by contradiction.

Determining the greedy strategy is the core step in solving the problem, but it may not be easy to implement, mainly for the following reasons.

- **Greedy strategies differ greatly between different problems**. For many problems, the greedy strategy is relatively straightforward, and we can derive it through some general thinking and attempts. However, for some complex problems, the greedy strategy may be very elusive, which really tests one's problem-solving experience and algorithmic ability.
- **Some greedy strategies are highly misleading**. When we confidently design a greedy strategy, write the solution code and submit it for testing, we may find that some test cases cannot pass. This is because the designed greedy strategy is only "partially correct", as exemplified by the coin change problem discussed above.

To ensure correctness, we should rigorously mathematically prove the greedy strategy, **usually using proof by contradiction or mathematical induction**.

However, correctness proofs may also not be easy. If we have no clue, we usually choose to debug the code based on test cases, step by step modifying and verifying the greedy strategy.

## Typical Problems Solved by Greedy Algorithms

Greedy algorithms are often applied to optimization problems that satisfy greedy choice property and optimal substructure. Below are some typical greedy algorithm problems.

- **Coin change problem**: With certain coin combinations, greedy algorithms can always obtain the optimal solution.
- **Interval scheduling problem**: Suppose you have some tasks, each taking place during a period of time, and your goal is to complete as many tasks as possible. If you always choose the task that ends earliest, then the greedy algorithm can obtain the optimal solution.
- **Fractional knapsack problem**: Given a set of items and a carrying capacity, your goal is to select a set of items such that the total weight does not exceed the carrying capacity and the total value is maximized. If you always choose the item with the highest value-to-weight ratio (value / weight), then the greedy algorithm can obtain the optimal solution in some cases.
- **Stock trading problem**: Given a set of historical stock prices, you can make multiple trades, but if you already hold stocks, you cannot buy again before selling, and the goal is to obtain the maximum profit.
- **Huffman coding**: Huffman coding is a greedy algorithm used for lossless data compression. By constructing a Huffman tree and always merging the two nodes with the lowest frequency, the resulting Huffman tree has the minimum weighted path length (encoding length).
- **Dijkstra's algorithm**: It is a greedy algorithm for solving the shortest path problem from a given source vertex to all other vertices.
