# Properties of dynamic programming problems

In the previous section, we saw how dynamic programming solves a problem by breaking it into subproblems. This is a general algorithmic technique. Divide and conquer, dynamic programming, and backtracking each use it differently.

- Divide and conquer recursively splits a problem into independent subproblems until it reaches the smallest ones. As the recursion unwinds, it combines their solutions to solve the original problem.
- Dynamic programming also breaks problems down recursively. The main difference from divide and conquer is that its subproblems depend on one another, so many of them overlap.
- Backtracking enumerates all possible solutions by trying choices and undoing them. Pruning avoids unnecessary search branches. A solution consists of a series of decisions, and we can treat the sequence leading up to each decision as a subproblem.

Dynamic programming is often used for optimization problems. Along with overlapping subproblems, these problems have two other important properties: optimal substructure and the no-aftereffect property.

## Optimal substructure

Let's modify the stair-climbing problem slightly to illustrate optimal substructure.

!!! question "Minimum cost to climb stairs"

    On a staircase, each move takes you up $1$ or $2$ stairs. Each stair is labeled with a nonnegative integer, the cost of landing on it. Given a nonnegative integer array $cost$, where $cost[i]$ is the cost of stair $i$ and $cost[0]$ corresponds to the ground (the starting point), find the minimum total cost to reach the top.

In the figure below, stairs $1$, $2$, and $3$ cost $1$, $10$, and $1$, respectively. The minimum cost to climb from the ground to stair $3$ is $2$.

![Minimum cost to reach stair 3](dp_problem_features.assets/min_cost_cs_example.svg)

Let $dp[i]$ be the cumulative cost to reach stair $i$. We can reach stair $i$ only from stair $i - 1$ or $i - 2$, so $dp[i]$ must be either $dp[i - 1] + cost[i]$ or $dp[i - 2] + cost[i]$. To minimize the cost, we take the smaller value:

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

This illustrates optimal substructure: **an optimal solution to the original problem is built from optimal solutions to its subproblems**.

Our problem has optimal substructure: we choose the better of the two optimal subproblem solutions, $dp[i-1]$ and $dp[i-2]$, and use it to construct the optimal solution to $dp[i]$.

Does the stair-climbing problem in the previous section also have optimal substructure? Finding the number of ways seems like a counting problem. But try asking for the “maximum number of ways.” Now **the question is equivalent, yet the optimal substructure becomes apparent**: the maximum number of ways to reach stair $n$ equals the sum of the maximum numbers of ways to reach stairs $n-1$ and $n-2$. The interpretation of optimal substructure can vary with the problem.

With the recurrence and the initial states $dp[1] = cost[1]$ and $dp[2] = cost[2]$, we can write the dynamic programming solution:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp}
```

The figure below shows how the code fills the states.

![Finding the minimum cost to climb stairs with dynamic programming](dp_problem_features.assets/min_cost_cs_dp.svg)

We can also save space by replacing the one-dimensional array with scalar variables, reducing space complexity from $O(n)$ to $O(1)$:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp_comp}
```

## The no-aftereffect property

An important reason dynamic programming works is the no-aftereffect property: **given a state, what happens next depends only on that state, regardless of the states visited on the way there**.

In stair climbing, state $i$ can lead to $i+1$ or $i+2$ by climbing $1$ or $2$ stairs, respectively. Neither choice requires us to consider any state before $i$. Those states have no effect on what we can do from $i$.

Adding a constraint to the stair-climbing problem changes the picture.

!!! question "Climbing stairs with a constraint"

    A staircase has $n$ stairs. Each move climbs $1$ or $2$ stairs, **but you cannot climb $1$ stair twice in a row**. How many ways can you reach the top?

As the figure shows, only $2$ ways to reach stair $3$ remain. Climbing $1$ stair three times in a row violates the constraint and is ruled out.

![Number of ways to reach stair 3 with the constraint](dp_problem_features.assets/climbing_stairs_constraint_example.svg)

If the previous move climbed $1$ stair, the next move must climb $2$ stairs. Thus **the current state (the stair we are on) no longer determines the next choice by itself. The choice also depends on the previous state (the stair we came from)**.

With the state defined this way, the no-aftereffect property no longer holds and the recurrence $dp[i] = dp[i-1] + dp[i-2]$ breaks down. The term $dp[i-1]$ counts ways to make a final move of $1$ stair, including many where the preceding move also climbed $1$ stair. To respect the constraint, we cannot add all of $dp[i-1]$ to $dp[i]$.

We therefore extend the state definition: **state $[i, j]$ means we are on stair $i$ and the last move climbed $j$ stairs**, where $j \in \{1, 2\}$. Distinguishing a final move of $1$ stair from one of $2$ stairs lets us identify the possible predecessors.

- If the last move climbed $1$ stair, the preceding move must have climbed $2$ stairs. Thus $dp[i, 1]$ can come only from $dp[i-1, 2]$.
- If the last move climbed $2$ stairs, the preceding move could have climbed $1$ or $2$ stairs. Thus $dp[i, 2]$ can come from $dp[i-2, 1]$ or $dp[i-2, 2]$.

With this definition, $dp[i, j]$ counts the ways to reach state $[i, j]$, as shown below. The recurrence becomes:

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![Recurrence with the stair-climbing constraint](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.svg)

Finally, return $dp[n, 1] + dp[n, 2]$. The sum counts all ways to reach stair $n$:

```src
[file]{climbing_stairs_constraint_dp}-[class]{}-[func]{climbing_stairs_constraint_dp}
```

Here we needed information from just one earlier state. Extending the state definition restored the no-aftereffect property. In some problems, however, the influence of earlier states is much harder to capture.

!!! question "Climbing stairs with obstacles that appear along the way"

    A staircase has $n$ stairs, and each move climbs $1$ or $2$ stairs. **Whenever you land on stair $i$, the system places an obstacle on stair $2i$. You cannot land on stair $2i$ on any later move**. For example, if your first two moves land on stairs $2$ and $3$, then stairs $4$ and $6$ are off-limits thereafter. How many ways can you reach the top?

The next move depends on all previous states. Each move places an obstacle farther up the staircase and affects future moves. Dynamic programming often struggles with such problems.

Many complex combinatorial optimization problems, such as the traveling salesperson problem, exhibit this dependence on the past. For such problems, we often turn to methods such as heuristic search, genetic algorithms, or reinforcement learning to find a usable local optimum within a limited time.
