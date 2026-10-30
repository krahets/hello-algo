# Properties of dynamic programming problems

The previous section showed how dynamic programming solves a problem by decomposing it into subproblems. Decomposition is a general algorithmic idea, but divide and conquer, dynamic programming, and backtracking use it differently.

- Divide and conquer recursively splits a problem into independent subproblems until the smallest ones are reached, then combines their solutions as the recursion returns to solve the original problem.
- Dynamic programming also decomposes problems recursively. Its main difference from divide and conquer is that its subproblems depend on one another, and many overlapping subproblems appear during decomposition.
- Backtracking enumerates possible solutions by trying choices and undoing them, using pruning to avoid unnecessary branches. A solution consists of a sequence of decisions, and the prefix before each decision can be viewed as a subproblem.

Dynamic programming is often used for optimization problems. Besides overlapping subproblems, these problems have two key properties: optimal substructure and the no-aftereffect property.

## Optimal substructure

Let's modify the climbing stairs problem slightly to illustrate optimal substructure more clearly.

!!! question "Minimum cost to climb stairs"

    Given a staircase, you can climb $1$ or $2$ steps at a time. Each step has a nonnegative integer indicating the cost paid on that step. A nonnegative integer array $cost$ gives the costs: $cost[i]$ is the cost of step $i$, and $cost[0]$ refers to the ground (the starting point). What is the minimum cost of reaching the top?

As shown in the figure below, if steps $1$, $2$, and $3$ cost $1$, $10$, and $1$, respectively, the minimum cost of reaching step $3$ from the ground is $2$.

![Minimum cost of reaching step 3](dp_problem_features.assets/min_cost_cs_example.png)

Let $dp[i]$ be the total cost of reaching step $i$. Since step $i$ can only be reached from step $i - 1$ or $i - 2$, $dp[i]$ must be either $dp[i - 1] + cost[i]$ or $dp[i - 2] + cost[i]$. To minimize the cost, choose the smaller of the two:

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

This introduces the meaning of optimal substructure: **an optimal solution to the original problem is constructed from optimal solutions to its subproblems**.

This problem clearly has optimal substructure: choose the better of $dp[i-1]$ and $dp[i-2]$ and use it to construct the optimal solution $dp[i]$.

Does the climbing stairs problem from the previous section also have optimal substructure? Its goal is to count solutions, so it seems to be a counting problem. But rephrase the goal as finding the maximum number of solutions, and **although the problem remains equivalent, optimal substructure becomes apparent**: the maximum number of ways to reach step $n$ is the sum of the maximum numbers for steps $n-1$ and $n-2$. The interpretation of optimal substructure is therefore flexible and can vary by problem.

The state transition equation, together with the initial states $dp[1] = cost[1]$ and $dp[2] = cost[2]$, gives the following dynamic programming code:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp}
```

The figure below illustrates this dynamic programming process.

![Dynamic programming for the minimum climbing cost](dp_problem_features.assets/min_cost_cs_dp.png)

We can also reduce the state storage from a one-dimensional array to scalar variables, lowering the space complexity from $O(n)$ to $O(1)$:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp_comp}
```

## No-aftereffect property

The no-aftereffect property is central to effective dynamic programming: **given a fully specified state, its future depends only on that state, not on the sequence of states that led to it**.

In the climbing stairs problem, state $i$ can lead to $i+1$ or $i+2$, corresponding to moves of $1$ or $2$ steps. Neither choice requires us to consider states before $i$: they do not affect the future of state $i$.

Adding a constraint changes the situation.

!!! question "Climbing stairs with a constraint"

    Given a staircase with $n$ steps, you may climb $1$ or $2$ steps at a time, **but may not make two consecutive moves of $1$ step**. How many ways are there to reach the top?

As shown in the figure below, only $2$ ways remain to reach step $3$: taking $1$ step three times in a row violates the constraint and is discarded.

![Number of ways to reach step 3 with the constraint](dp_problem_features.assets/climbing_stairs_constraint_example.png)

If the previous move climbed $1$ step, the next must climb $2$ steps. Thus, **the next choice cannot be determined by the current state (the current step number) alone; it also depends on the preceding state (the previous step number)**.

The no-aftereffect property no longer holds with this state definition, and $dp[i] = dp[i-1] + dp[i-2]$ is no longer valid. Using $dp[i-1]$ means taking $1$ step now, but it includes many ways in which the preceding move also took $1$ step. We cannot simply add all of $dp[i-1]$ to $dp[i]$ without violating the constraint.

We therefore expand the state definition: **state $[i, j]$ means we are on step $i$ and the previous move climbed $j$ steps**, where $j \in \{1, 2\}$. This distinguishes whether the preceding move climbed $1$ or $2$ steps, allowing us to determine how the current state could have been reached.

- If the previous move climbed $1$ step, the move before it must have climbed $2$ steps. Thus, $dp[i, 1]$ can only come from $dp[i-1, 2]$.
- If the previous move climbed $2$ steps, the move before it could have climbed $1$ or $2$ steps. Thus, $dp[i, 2]$ can come from $dp[i-2, 1]$ or $dp[i-2, 2]$.

As shown in the figure below, $dp[i, j]$ now counts the ways to reach state $[i, j]$. The state transition equations are:

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![Recurrence with the constraint](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png)

Finally, return $dp[n, 1] + dp[n, 2]$, the total number of ways to reach step $n$:

```src
[file]{climbing_stairs_constraint_dp}-[class]{}-[func]{climbing_stairs_constraint_dp}
```

In this example, only one preceding state mattered, so expanding the state definition restored the no-aftereffect property. Some problems, however, depend much more strongly on their history.

!!! question "Climbing stairs that generate obstacles"

    Given a staircase with $n$ steps, you may climb $1$ or $2$ steps at a time. **Whenever you reach step $i$, the system places an obstacle on step $2i$, and you may never land on step $2i$ afterward**. For example, if your first two moves land on steps $2$ and $3$, then steps $4$ and $6$ are blocked for all later moves. How many ways are there to reach the top?

Here, each next move depends on all previous states, because every move places an obstacle higher up and affects future moves. Such problems are often difficult to solve with dynamic programming.

Many complex combinatorial optimization problems, such as the traveling salesperson problem, do not satisfy the no-aftereffect property. For such problems, we often choose other methods, such as heuristic search, genetic algorithms, or reinforcement learning, to obtain useful locally optimal solutions within a limited time.
