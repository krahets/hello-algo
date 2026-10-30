# Solving dynamic programming problems

The previous two sections introduced the main properties of dynamic programming problems. We will now explore two practical questions.

1. How can we recognize a dynamic programming problem?
2. Where should we start, and what are the steps for solving one?

## Recognizing the problem

In general, a problem is suitable for dynamic programming if it has overlapping subproblems, optimal substructure, and the no-aftereffect property. These can be difficult to identify directly from a problem statement, so we usually start with a broader test: **could backtracking (exhaustive search) solve it**?

**Problems suited to backtracking usually fit a decision tree model**. They can be represented as a tree in which each node is a decision and each path is a sequence of decisions.

In other words, if a problem has clear choices and a solution is produced through a sequence of them, it fits the decision tree model and can usually be solved by backtracking.

Beyond this, some signs make dynamic programming more promising.

- The problem asks for an optimum, such as a maximum, minimum, greatest number, or smallest number.
- States can be represented by a list, a multidimensional matrix, or a tree, and a recurrence relates each state to nearby states.

Other signs make it less promising.

- The goal is to find all possible solutions rather than an optimal one.
- The problem explicitly involves permutations or combinations and asks for multiple concrete arrangements.

If a problem fits the decision tree model and has clear positive signs, we can tentatively treat it as a dynamic programming problem and verify that assumption while solving it.

## Steps for solving the problem

The process varies with the problem's nature and difficulty, but usually includes describing the decisions, defining states, creating a $dp$ table, deriving a state transition equation, and identifying boundary conditions.

To make these steps concrete, we will use the classic minimum path sum problem.

!!! question

    Given an $n \times m$ grid `grid`, each cell contains a nonnegative integer representing its cost. A robot starts at the top-left cell and can move one cell down or right at a time until it reaches the bottom-right cell. Return the minimum path sum from the top-left to the bottom-right.

In the example shown in the figure below, the minimum path sum is $13$.

![Example input for minimum path sum](dp_solution_pipeline.assets/min_path_sum_example.png)

**Step 1: Identify each decision, define the state, and establish the $dp$ table**

Each decision moves one cell down or right. If the current cell has indices $[i, j]$, the next indices are $[i+1, j]$ or $[i, j+1]$. The state therefore contains two variables, the row and column indices, and is denoted by $[i, j]$.

State $[i, j]$ corresponds to the subproblem of finding the minimum path sum from the starting point $[0, 0]$ to $[i, j]$. Its solution is $dp[i, j]$.

This gives the two-dimensional $dp$ matrix shown in the figure below, with the same dimensions as the input $grid$.

![State definition and dp table](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png)

!!! note

    Dynamic programming and backtracking can be described as sequences of decisions. A state consists of the decision variables and should contain every variable needed to describe progress, with enough information to derive the next state.
    
    Each state corresponds to a subproblem. A $dp$ table stores the solutions to all subproblems, with one dimension of the $dp$ table for each independent state variable. In essence, the $dp$ table maps states to subproblem solutions.

**Step 2: Identify optimal substructure and derive the state transition equation**

State $[i, j]$ can only be reached from the cell above, $[i-1, j]$, or the cell to the left, $[i, j-1]$. The optimal substructure is therefore that the minimum path sum to $[i, j]$ is determined by the smaller of the minimum path sums to $[i, j-1]$ and $[i-1, j]$.

This gives the state transition equation illustrated in the figure below:

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![Optimal substructure and state transition equation](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png)

!!! note

    Using the defined $dp$ table, examine the relationship between the original problem and its subproblems. Find how to construct an optimal solution from optimal subproblem solutions: this is the optimal substructure.

    Once we identify optimal substructure, we can use it to build the state transition equation.

**Step 3: Determine the boundary conditions and evaluation order**

A state in the first row can only come from its left, and a state in the first column can only come from above. Thus, the first row $i = 0$ and first column $j = 0$ define the boundary conditions.

As shown in the figure below, each cell depends on the cells to its left and above. We therefore traverse the matrix with an outer loop over rows and an inner loop over columns.

![Boundary conditions and evaluation order](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png)

!!! note

    Boundary conditions initialize the $dp$ table in dynamic programming and support pruning in search.
    
    The key to choosing an evaluation order is ensuring that all smaller subproblems needed by the current state have already been solved correctly.

We could now write the dynamic programming solution directly. However, decomposing a problem is a top-down way of thinking, so implementing "brute-force search $\rightarrow$ memoized search $\rightarrow$ dynamic programming" often follows our reasoning more naturally.

### Method 1: Brute-force search

Starting from $[i, j]$, recursively decompose the problem into smaller states $[i-1, j]$ and $[i, j-1]$. The recursive function has the following elements.

- **Parameters**: The state $[i, j]$.
- **Return value**: The minimum path sum $dp[i, j]$ from $[0, 0]$ to $[i, j]$.
- **Base case**: When $i = 0$ and $j = 0$, return $grid[0, 0]$.
- **Pruning**: If $i < 0$ or $j < 0$, the indices are out of bounds. Return cost $+\infty$ to mark the path as infeasible.

The implementation is as follows:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dfs}
```

The figure below shows the recursion tree rooted at $dp[2, 1]$. It includes overlapping subproblems, whose number grows rapidly with the size of `grid`.

The underlying reason for overlapping subproblems is that **multiple paths can reach the same cell from the top-left corner**.

![Recursion tree for brute-force search](dp_solution_pipeline.assets/min_path_sum_dfs.png)

Each state offers two choices, down and right, and reaching the bottom-right corner takes $m + n - 2$ moves. The worst-case time complexity is therefore $O(2^{m + n})$, where $n$ and $m$ are the numbers of rows and columns. This estimate ignores the grid boundaries, where only one choice remains, so the actual number of paths is smaller.

### Method 2: Memoized search

Introduce a memoization table `mem` with the same dimensions as `grid` to store subproblem solutions and prune repeated subproblems:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dfs_mem}
```

As shown in the figure below, memoization ensures that every subproblem is solved only once. The time complexity is therefore determined by the number of states, the grid size $O(nm)$.

![Recursion tree for memoized search](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png)

### Method 3: Dynamic programming

The following code implements dynamic programming iteratively:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dp}
```

The figure below shows the state transitions for minimum path sum. They visit the entire grid, **so the time complexity is $O(nm)$**.

The array `dp` has dimensions $n \times m$, **so the space complexity is $O(nm)$**.

=== "<1>"
    ![Dynamic programming for minimum path sum](dp_solution_pipeline.assets/min_path_sum_dp_step1.png)

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.png)

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.png)

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.png)

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.png)

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.png)

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.png)

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.png)

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.png)

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.png)

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.png)

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.png)

### Space optimization

Each cell depends only on the cells to its left and above, so a single-row array is enough to represent the $dp$ table.

Because `dp` stores only one row of states, we cannot initialize the entire first column in advance. Instead, update its entry when processing each row:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dp_comp}
```
