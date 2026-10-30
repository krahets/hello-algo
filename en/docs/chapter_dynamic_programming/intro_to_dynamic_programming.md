# Introduction to dynamic programming

<u>Dynamic programming</u> is an important algorithmic paradigm. It breaks a problem into smaller subproblems and stores their solutions to avoid repeated computation, greatly improving time efficiency.

We will start with a classic example, give a brute-force backtracking solution, identify its overlapping subproblems, and gradually derive a more efficient dynamic programming solution.

!!! question "Climbing stairs"

    Given a staircase with $n$ steps, you may climb $1$ or $2$ steps at a time. How many ways are there to reach the top?

As shown in the figure below, a staircase with $3$ steps has $3$ possible ways to reach the top.

![Number of ways to reach step 3](intro_to_dynamic_programming.assets/climbing_stairs_example.png)

The goal is to count solutions, so **we can use backtracking to enumerate every possibility**. View climbing as a sequence of choices: starting from the ground, choose to climb $1$ or $2$ steps each time. Add $1$ to the count whenever we reach the top, and prune any branch that goes beyond it. The code is as follows:

```src
[file]{climbing_stairs_backtrack}-[class]{}-[func]{climbing_stairs_backtrack}
```

## Method 1: Brute-force search

Backtracking usually does not explicitly decompose the problem. Instead, it treats a solution as a sequence of decisions and searches all possible solutions through trial and pruning.

Let's analyze this problem through decomposition. Let $dp[i]$ be the number of ways to reach step $i$. The original problem is $dp[i]$, and its subproblems include:

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

Since each move climbs $1$ or $2$ steps, when we stand on step $i$, we must previously have been on step $i - 1$ or $i - 2$. In other words, step $i$ can only be reached from step $i -1$ or $i - 2$.

This gives an important result: **the number of ways to reach step $i - 1$ plus the number of ways to reach step $i - 2$ equals the number of ways to reach step $i$**. In symbols:

$$
dp[i] = dp[i-1] + dp[i-2]
$$

Thus, the subproblems are linked by a recurrence: **the solution to the original problem can be constructed from subproblem solutions**. The figure below illustrates this relationship.

![Recurrence for the number of ways](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png)

The recurrence gives a brute-force search solution. Starting at $dp[n]$, **recursively express a larger problem as the sum of two smaller ones** until reaching $dp[1]$ or $dp[2]$. Their solutions are known: $dp[1] = 1$ and $dp[2] = 2$, meaning steps $1$ and $2$ can be reached in $1$ and $2$ ways, respectively.

Like the standard backtracking code, the following code performs depth-first search, but is more concise:

```src
[file]{climbing_stairs_dfs}-[class]{}-[func]{climbing_stairs_dfs}
```

The figure below shows the recursion tree for brute-force search. For $dp[n]$, its depth is $n$, and the time complexity is $O(2^n)$. Exponential growth is explosive, so a relatively large $n$ leads to a very long wait.

![Recursion tree for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png)

As the figure above shows, **overlapping subproblems cause the exponential time complexity**. For example, $dp[9]$ splits into $dp[8]$ and $dp[7]$, while $dp[8]$ splits into $dp[7]$ and $dp[6]$. Both contain $dp[7]$.

These subproblems in turn contain smaller overlapping subproblems, and the pattern repeats at deeper levels of the recursion tree. Most of the computation is wasted on solving the same subproblems repeatedly.

## Method 2: Memoized search

To improve efficiency, **we want every overlapping subproblem to be solved only once**. Introduce an array `mem` to record each solution and prune repeated subproblems during the search.

1. The first time we calculate $dp[i]$, store it in `mem[i]` for later use.
2. When $dp[i]$ is needed again, retrieve it directly from `mem[i]` instead of recomputing it.

The code is as follows:

```src
[file]{climbing_stairs_dfs_mem}-[class]{}-[func]{climbing_stairs_dfs_mem}
```

As shown in the figure below, **memoization makes every overlapping subproblem require only one computation, reducing the time complexity to $O(n)$**: a major improvement.

![Recursion tree for memoized search](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png)

## Method 3: Dynamic programming

**Memoized search is a top-down approach**: start with the original problem (the root), recursively divide larger subproblems into smaller ones until reaching the smallest subproblems with known solutions (the leaves), then collect their solutions as recursion returns to construct the solution to the original problem.

In contrast, **dynamic programming is a bottom-up approach**: start with the smallest subproblem solutions and iteratively build solutions to larger subproblems until the original problem is solved.

Because this dynamic programming process does not backtrack, it needs only iterative loops, not recursion. In the following code, the array `dp` stores subproblem solutions, serving the same role as `mem` in memoized search:

```src
[file]{climbing_stairs_dp}-[class]{}-[func]{climbing_stairs_dp}
```

The figure below traces the code's execution.

![Dynamic programming for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dp.png)

Like backtracking, dynamic programming uses states to represent stages of solving a problem. Each state corresponds to a subproblem and its locally optimal solution. For climbing stairs, the state is the current step number $i$.

We can now summarize some common dynamic programming terminology.

- The array `dp` is called the <u>dp table</u>, and $dp[i]$ stores the solution to the subproblem for state $i$.
- The states for the smallest subproblems (steps $1$ and $2$) are called the <u>initial states</u>.
- The recurrence $dp[i] = dp[i-1] + dp[i-2]$ is called the <u>state transition equation</u>.

## Space optimization

You may have noticed that **$dp[i]$ depends only on $dp[i-1]$ and $dp[i-2]$, so we do not need an entire `dp` array storing every subproblem solution**. Two variables updated as we proceed are enough. The code is as follows:

```src
[file]{climbing_stairs_dp}-[class]{}-[func]{climbing_stairs_dp_comp}
```

Removing the `dp` array reduces space complexity from $O(n)$ to $O(1)$.

In dynamic programming, a state often depends on only a limited number of preceding states. We can keep just those needed, reducing the storage dimensions to save memory. **This technique is called using rolling variables or a rolling array**.
