# Greedy algorithms

A <u>greedy algorithm</u> is a common approach to optimization problems. At each decision point, it chooses the option that looks best at that moment: it makes a locally optimal choice in the hope of reaching a globally optimal solution. Greedy algorithms are simple and efficient, with many practical applications.

Both greedy algorithms and dynamic programming are commonly used for optimization. They share some features, such as relying on optimal substructure, but work differently.

- Dynamic programming considers the current decision in light of all decisions from earlier stages, using solutions to earlier subproblems to build the solution to the current subproblem.
- A greedy algorithm does not reconsider past decisions. It keeps moving forward, making greedy choices and shrinking the problem until it is solved.

Let's explore how greedy algorithms work through the coin change problem, which you have already encountered in the section on the unbounded knapsack problem.

!!! question

    Given $n$ coin denominations, where denomination $i$ has value $coins[i - 1]$, and a target amount $amt$, you may use each denomination any number of times. What is the minimum number of coins needed to make the target amount? Return $-1$ if it cannot be made.

The greedy strategy is shown in the figure below. Given the remaining target amount, **we greedily choose the largest coin that does not exceed it**, repeating this step until we have made the target amount.

![Greedy strategy for coin change](greedy_algorithm.assets/coin_change_greedy_strategy.png)

The implementation is as follows:

```src
[file]{coin_change_greedy}-[class]{}-[func]{coin_change_greedy}
```

You might find yourself thinking, "So clean!" The greedy algorithm solves coin change in only about ten lines of code.

## Strengths and limitations of greedy algorithms

**Greedy algorithms are straightforward, easy to implement, and usually efficient**. In the code above, let $\min(coins)$ be the smallest coin denomination. At most $amt / \min(coins)$ greedy choices are made, giving a time complexity of $O(amt / \min(coins))$. This is an order of magnitude lower than the dynamic programming solution's $O(n \times amt)$ time complexity.

However, **for some sets of coin denominations, a greedy algorithm cannot find the optimal solution**. The figure below illustrates two examples.

- **Successful case: $coins = [1, 5, 10, 20, 50, 100]$**. For these denominations, the greedy algorithm finds an optimal solution for any $amt$.
- **Counterexample: $coins = [1, 20, 50]$**. For $amt = 60$, the greedy algorithm produces $50 + 1 \times 10$, using $11$ coins. Dynamic programming finds the optimal solution $20 + 20 + 20$, using only $3$ coins.
- **Counterexample: $coins = [1, 49, 50]$**. For $amt = 98$, the greedy algorithm produces $50 + 1 \times 48$, using $49$ coins. Dynamic programming finds the optimal solution $49 + 49$, using only $2$ coins.

![Examples where the greedy algorithm fails to find the optimal solution](greedy_algorithm.assets/coin_change_greedy_vs_dp.png)

In other words, a greedy algorithm cannot guarantee a globally optimal solution to coin change and may produce a very poor solution. Dynamic programming is better suited to this problem.

In general, greedy algorithms are useful in two situations.

1. **An optimal solution is guaranteed**: A greedy algorithm is often the best choice because it is usually more efficient than backtracking or dynamic programming.
2. **A near-optimal solution can be found**: A greedy algorithm can still be useful. For many complex problems, finding a globally optimal solution is very difficult, so finding a good suboptimal solution efficiently is valuable.

## Properties required by greedy algorithms

What kinds of problems are suitable for greedy algorithms? More specifically, when can a greedy algorithm guarantee an optimal solution?

Greedy algorithms have stricter requirements than dynamic programming. Two properties are particularly important.

- **Greedy-choice property**: A greedy algorithm can guarantee an optimal solution only when locally optimal choices always lead to a globally optimal solution.
- **Optimal substructure**: An optimal solution to the original problem contains optimal solutions to its subproblems.

Optimal substructure was covered in the dynamic programming chapter, so we will not repeat that discussion here. Some problems have optimal substructure that is not immediately apparent, yet can still be solved greedily.

We will focus on how to determine whether the greedy-choice property holds. Its description may sound simple, **but proving it is difficult for many problems**.

For coin change, for example, it is easy to give counterexamples that disprove the greedy-choice property, but proving it is harder. If asked **which conditions on the coin denominations allow a greedy solution**, we may be able to give only a vague answer based on intuition or examples, rather than a rigorous mathematical proof.

!!! quote

    One paper gives an $O(n^3)$-time algorithm for determining whether a set of coin denominations allows a greedy algorithm to find an optimal solution for every amount.

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## Steps for solving a problem greedily

Solving a greedy problem generally involves three steps.

1. **Analyze the problem**: Understand its properties, including the state definition, optimization objective, and constraints. This step also appears in backtracking and dynamic programming.
2. **Choose a greedy strategy**: Decide how to make a greedy choice at each step. Each choice should reduce the problem's size, eventually solving the whole problem.
3. **Prove correctness**: Usually, we must establish the greedy-choice property and optimal substructure. This may require a mathematical proof, such as induction or proof by contradiction.

Choosing the greedy strategy is the central step, but it can be difficult for the following reasons.

- **Greedy strategies vary greatly from problem to problem**. For many problems, the strategy is straightforward and can be found with a little thought and experimentation. For more complex problems, it may be well hidden, testing our problem-solving experience and algorithmic skills.
- **Some greedy strategies are misleading**. We may confidently devise a strategy, implement it, and submit the code, only to find that it fails some test cases. The strategy is only partially correct; the coin change problem above is a typical example.

To ensure correctness, we should give the greedy strategy a rigorous mathematical proof, **usually using contradiction or mathematical induction**.

However, such a proof can itself be difficult. When we do not know where to start, we often debug against test cases, gradually refining and checking the greedy strategy.

## Typical greedy problems

Greedy algorithms often solve optimization problems with the greedy-choice property and optimal substructure. Some typical examples follow.

- **Coin change**: For certain sets of coin denominations, a greedy algorithm always finds an optimal solution.
- **Interval scheduling**: Given tasks that each occupy a time interval, the goal is to complete as many tasks as possible. Always choosing the available task that finishes earliest yields an optimal solution.
- **Fractional knapsack**: Given items and a weight limit, choose items to maximize total value without exceeding the limit. Choosing the item with the highest value-to-weight ratio at each step can yield an optimal solution in some settings.
- **Stock trading**: Given historical stock prices, you may buy and sell multiple times, but cannot buy again while holding stock until you sell it. The goal is to maximize profit.
- **Huffman coding**: This greedy algorithm is used for lossless data compression. It builds a Huffman tree by repeatedly merging the two nodes with the lowest frequencies. The resulting tree has the minimum weighted path length (encoding length).
- **Dijkstra's algorithm**: This greedy algorithm finds shortest paths from a given source vertex to every other vertex in a graph whose edge weights are all nonnegative.
