# Characteristics of Dynamic Programming Problems

In the previous section, we learned how dynamic programming solves the original problem by decomposing it into subproblems. In fact, subproblem decomposition is a general algorithmic approach, with different emphases in divide and conquer, dynamic programming, and backtracking.

- Divide and conquer algorithms recursively divide the original problem into multiple independent subproblems until the smallest subproblems are reached, and merge the solutions to the subproblems during backtracking to ultimately obtain the solution to the original problem.
- Dynamic programming also recursively decomposes problems, but the main difference from divide and conquer algorithms is that subproblems in dynamic programming are interdependent, and many overlapping subproblems appear during the decomposition process.
- Backtracking algorithms enumerate all possible solutions through trial and error, and avoid unnecessary search branches through pruning. The solution to the original problem consists of a series of decision steps, and we can regard the subsequence before each decision step as a subproblem.

In fact, dynamic programming is commonly used to solve optimization problems, which not only contain overlapping subproblems but also have two other major characteristics: optimal substructure and no aftereffects.

## Optimal Substructure

We make a slight modification to the stair climbing problem to make it more suitable for demonstrating the concept of optimal substructure.

!!! question "Climbing stairs with minimum cost"

    Given a staircase, where you can climb $1$ or $2$ steps at a time, and each step has a non-negative integer representing the cost you need to pay at that step. Given a non-negative integer array $cost$, where $cost[i]$ represents the cost at the $i$-th step, and $cost[0]$ is the ground (starting point). What is the minimum cost required to reach the top?

As shown in the figure below, if the costs of the $1$st, $2$nd, and $3$rd steps are $1$, $10$, and $1$ respectively, then climbing from the ground to the $3$rd step requires a minimum cost of $2$.

![Minimum cost to climb to the 3rd step](dp_problem_features.assets/min_cost_cs_example.png)

Let $dp[i]$ be the accumulated cost of climbing to the $i$-th step. Since the $i$-th step can only come from the $i-1$-th or $i-2$-th step, $dp[i]$ can only equal $dp[i-1] + cost[i]$ or $dp[i-2] + cost[i]$. To minimize the cost, we should choose the smaller of the two:

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

This leads us to the meaning of optimal substructure: **the optimal solution to the original problem is constructed from the optimal solutions to the subproblems**.

This problem clearly has optimal substructure: we select the better one from the optimal solutions to the two subproblems $dp[i-1]$ and $dp[i-2]$, and use it to construct the optimal solution to the original problem $dp[i]$.

So, does the stair climbing problem from the previous section have optimal substructure? Its goal is to find the number of ways, which seems to be a counting problem, but if we change the question: "Find the maximum number of ways". We surprisingly discover that **although the problem before and after modification are equivalent, the optimal substructure has emerged**: the maximum number of ways for the $n$-th step equals the sum of the maximum number of ways for the $n-1$-th and $n-2$-th steps. Therefore, the interpretation of optimal substructure is quite flexible and will have different meanings in different problems.

According to the state transition equation and the initial states $dp[1] = cost[1]$ and $dp[2] = cost[2]$, we can obtain the dynamic programming code:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp}
```

The figure below shows the dynamic programming process for the above code.

![Dynamic programming process for climbing stairs with minimum cost](dp_problem_features.assets/min_cost_cs_dp.png)

This problem can also be space-optimized, compressing from one dimension to zero, reducing the space complexity from $O(n)$ to $O(1)$:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp_comp}
```

## No Aftereffects

No aftereffects is one of the important characteristics that enable dynamic programming to solve problems effectively. Its definition is: **given a certain state, its future development is only related to the current state and has nothing to do with all past states**.

Taking the stair climbing problem as an example, given state $i$, it will develop into states $i+1$ and $i+2$, corresponding to jumping $1$ step and jumping $2$ steps, respectively. When making these two choices, we do not need to consider the states before state $i$, as they have no effect on the future of state $i$.

However, if we add a constraint to the stair climbing problem, the situation changes.

!!! question "Climbing stairs with constraint"

    Given a staircase with $n$ steps, where you can climb $1$ or $2$ steps at a time, **but you cannot jump $1$ step in two consecutive rounds**. How many ways are there to climb to the top?

As shown in the figure below, there are only $2$ feasible ways to climb to the $3$rd step. The way of jumping $1$ step three consecutive times does not satisfy the constraint and is therefore discarded.

![Number of ways to climb to the 3rd step with constraint](dp_problem_features.assets/climbing_stairs_constraint_example.png)

In this problem, if the previous round was a jump of $1$ step, then the next round must jump $2$ steps. This means that **the next choice cannot be determined solely by the current state (current stair step number), but also depends on the previous state (the stair step number from the previous round)**.

It is not difficult to see that this problem no longer satisfies no aftereffects, and the state transition equation $dp[i] = dp[i-1] + dp[i-2]$ also fails, because $dp[i-1]$ represents jumping $1$ step in this round, but it includes many solutions where "the previous round was a jump of $1$ step", which cannot be directly counted in $dp[i]$ to satisfy the constraint.

For this reason, we need to expand the state definition: **state $[i, j]$ represents being on the $i$-th step with the previous round having jumped $j$ steps**, where $j \in \{1, 2\}$. This state definition effectively distinguishes whether the previous round was a jump of $1$ step or $2$ steps, allowing us to determine where the current state came from.

- When the previous round jumped $1$ step, the round before that could only choose to jump $2$ steps, i.e., $dp[i, 1]$ can only be transferred from $dp[i-1, 2]$.
- When the previous round jumped $2$ steps, the round before that could choose to jump $1$ step or $2$ steps, i.e., $dp[i, 2]$ can be transferred from $dp[i-2, 1]$ or $dp[i-2, 2]$.

As shown in the figure below, under this definition, $dp[i, j]$ represents the number of ways for state $[i, j]$. The state transition equation is then:

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![Recurrence relation considering constraints](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png)

Finally, return $dp[n, 1] + dp[n, 2]$, where the sum of the two represents the total number of ways to climb to the $n$-th step:

```src
[file]{climbing_stairs_constraint_dp}-[class]{}-[func]{climbing_stairs_constraint_dp}
```

In the above case, since we only need to consider one more preceding state, we can still make the problem satisfy no aftereffects by expanding the state definition. However, some problems have very severe "aftereffects".

!!! question "Climbing stairs with obstacle generation"

    Given a staircase with $n$ steps, where you can climb $1$ or $2$ steps at a time. **It is stipulated that when climbing to the $i$-th step, the system will automatically place an obstacle on the $2i$-th step, and thereafter no round is allowed to jump to the $2i$-th step**. For example, if the first two rounds jump to the $2$nd and $3$rd steps, then afterwards you cannot jump to the $4$th and $6$th steps. How many ways are there to climb to the top?

In this problem, the next jump depends on all past states, because each jump places obstacles on higher steps, affecting future jumps. For such problems, dynamic programming is often difficult to solve.

In fact, many complex combinatorial optimization problems (such as the traveling salesman problem) do not satisfy no aftereffects. For such problems, we usually choose to use other methods, such as heuristic search, genetic algorithms, reinforcement learning, etc., to obtain usable local optimal solutions within a limited time.
