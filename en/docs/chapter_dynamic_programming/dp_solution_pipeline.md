---
comments: true
---

# 14.3 &nbsp; Dynamic programming problem-solving approach

The last two sections introduced the main characteristics of dynamic programming problems. Next, let's explore two more practical issues together.

1. How to determine whether a problem is a dynamic programming problem?
2. What are the complete steps to solve a dynamic programming problem?

## 14.3.1 &nbsp; Problem determination

Generally speaking, if a problem contains overlapping subproblems, optimal substructure, and exhibits no aftereffects, it is usually suitable for dynamic programming solutions. However, it is often difficult to directly extract these characteristics from the problem description. Therefore, we usually relax the conditions and **first observe whether the problem is suitable for resolution using backtracking (exhaustive search)**.

**Problems suitable for backtracking usually fit the "decision tree model"**, which can be described using a tree structure, where each node represents a decision, and each path represents a sequence of decisions.

In other words, if the problem contains explicit decision concepts, and the solution is produced through a series of decisions, then it fits the decision tree model and can usually be solved using backtracking.

On this basis, there are some "bonus points" for determining dynamic programming problems.

- The problem contains descriptions of maximization (minimization) or finding the most (least) optimal solution.
- The problem's states can be represented using a list, multi-dimensional matrix, or tree, and a state has a recursive relationship with its surrounding states.

Correspondingly, there are also some "penalty points".

- The goal of the problem is to find all possible solutions, not just the optimal solution.
- The problem description has obvious characteristics of permutations and combinations, requiring the return of specific multiple solutions.

If a problem fits the decision tree model and has relatively obvious "bonus points", we can assume it is a dynamic programming problem and verify it during the solution process.

## 14.3.2 &nbsp; Problem-solving steps

The dynamic programming problem-solving process varies with the nature and difficulty of the problem but generally follows these steps: describe decisions, define states, establish a $dp$ table, derive state transition equations, and determine boundary conditions, etc.

To illustrate the problem-solving steps more vividly, we use a classic problem, "Minimum Path Sum", as an example.

!!! question

    Given an $n \times m$ two-dimensional grid `grid`, each cell in the grid contains a non-negative integer representing the cost of that cell. The robot starts from the top-left cell and can only move down or right at each step until it reaches the bottom-right cell. Return the minimum path sum from the top-left to the bottom-right.

Figure 14-10 shows an example, where the given grid's minimum path sum is $13$.

![Minimum Path Sum Example Data](dp_solution_pipeline.assets/min_path_sum_example.png){ class="animation-figure" }

<p align="center"> Figure 14-10 &nbsp; Minimum Path Sum Example Data </p>

**First step: Think about each round of decisions, define the state, and thereby obtain the $dp$ table**

Each round of decisions in this problem is to move one step down or right from the current cell. Suppose the row and column indices of the current cell are $[i, j]$, then after moving down or right, the indices become $[i+1, j]$ or $[i, j+1]$. Therefore, the state should include two variables: the row index and the column index, denoted as $[i, j]$.

The state $[i, j]$ corresponds to the subproblem: the minimum path sum from the starting point $[0, 0]$ to $[i, j]$, denoted as $dp[i, j]$.

Thus, we obtain the two-dimensional $dp$ matrix shown in Figure 14-11, whose size is the same as the input grid $grid$.

![State definition and DP table](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png){ class="animation-figure" }

<p align="center"> Figure 14-11 &nbsp; State definition and DP table </p>

!!! note

    Dynamic programming and backtracking can be described as a sequence of decisions, while a state consists of all decision variables. It should include all variables that describe the progress of solving the problem, containing enough information to derive the next state.

    Each state corresponds to a subproblem, and we define a $dp$ table to store the solutions to all subproblems. Each independent variable of the state is a dimension of the $dp$ table. Essentially, the $dp$ table is a mapping between states and solutions to subproblems.

**Second step: Identify the optimal substructure, then derive the state transition equation**

For the state $[i, j]$, it can only be derived from the cell above $[i-1, j]$ or the cell to the left $[i, j-1]$. Therefore, the optimal substructure is: the minimum path sum to reach $[i, j]$ is determined by the smaller of the minimum path sums of $[i, j-1]$ and $[i-1, j]$.

Based on the above analysis, the state transition equation shown in Figure 14-12 can be derived:

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![Optimal substructure and state transition equation](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png){ class="animation-figure" }

<p align="center"> Figure 14-12 &nbsp; Optimal substructure and state transition equation </p>

!!! note

    Based on the defined $dp$ table, think about the relationship between the original problem and the subproblems, and find out how to construct the optimal solution to the original problem from the optimal solutions to the subproblems, i.e., the optimal substructure.

    Once we have identified the optimal substructure, we can use it to build the state transition equation.

**Third step: Determine boundary conditions and state transition order**

In this problem, the states in the first row can only come from the states to their left, and the states in the first column can only come from the states above them, so the first row $i = 0$ and the first column $j = 0$ are the boundary conditions.

As shown in Figure 14-13, since each cell is derived from the cell to its left and the cell above it, we use loops to traverse the matrix, the outer loop iterating over the rows and the inner loop iterating over the columns.

![Boundary conditions and state transition order](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png){ class="animation-figure" }

<p align="center"> Figure 14-13 &nbsp; Boundary conditions and state transition order </p>

!!! note

    Boundary conditions are used in dynamic programming to initialize the $dp$ table, and in search to prune.
    
    The core of the state transition order is to ensure that when calculating the solution to the current problem, all the smaller subproblems it depends on have already been correctly calculated.

Based on the above analysis, we can directly write the dynamic programming code. However, the decomposition of subproblems is a top-down approach, so implementing it in the order of "brute-force search → memoized search → dynamic programming" is more in line with habitual thinking.

### 1. &nbsp; Method 1: Brute-force search

Start searching from the state $[i, j]$, constantly decomposing it into smaller states $[i-1, j]$ and $[i, j-1]$. The recursive function includes the following elements.

- **Recursive parameter**: state $[i, j]$.
- **Return value**: the minimum path sum from $[0, 0]$ to $[i, j]$ $dp[i, j]$.
- **Termination condition**: when $i = 0$ and $j = 0$, return the cost $grid[0, 0]$.
- **Pruning**: when $i < 0$ or $j < 0$ index out of bounds, return the cost $+\infty$, representing infeasibility.

Implementation code as follows:

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
        """Minimum path sum: Brute force search"""
        # If it's the top-left cell, terminate the search
        if i == 0 and j == 0:
            return grid[0][0]
        # If the row or column index is out of bounds, return a +∞ cost
        if i < 0 or j < 0:
            return inf
        # Calculate the minimum path cost from the top-left to (i-1, j) and (i, j-1)
        up = min_path_sum_dfs(grid, i - 1, j)
        left = min_path_sum_dfs(grid, i, j - 1)
        # Return the minimum path cost from the top-left to (i, j)
        return min(left, up) + grid[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* Minimum path sum: Brute force search */
    int minPathSumDFS(int[][] grid, int i, int j) {
        // If it's the top-left cell, terminate the search
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // If the row or column index is out of bounds, return a +∞ cost
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // Calculate the minimum path cost from the top-left to (i-1, j) and (i, j-1)
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // Return the minimum path cost from the top-left to (i, j)
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    [class]{min_path_sum}-[func]{MinPathSumDFS}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dfs}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dfs}
    ```

=== "Zig"

    ```zig title="min_path_sum.zig"
    [class]{}-[func]{minPathSumDFS}
    ```

Figure 14-14 shows the recursive tree rooted at $dp[2, 1]$, which includes some overlapping subproblems, the number of which increases sharply as the size of the grid `grid` increases.

Essentially, the reason for overlapping subproblems is: **there are multiple paths to reach a certain cell from the top-left corner**.

![Brute-force search recursive tree](dp_solution_pipeline.assets/min_path_sum_dfs.png){ class="animation-figure" }

<p align="center"> Figure 14-14 &nbsp; Brute-force search recursive tree </p>

Each state has two choices, down and right, so the total number of steps from the top-left corner to the bottom-right corner is $m + n - 2$, so the worst-case time complexity is $O(2^{m + n})$. Please note that this calculation method does not consider the situation near the grid edge, where there is only one choice left when reaching the network edge, so the actual number of paths will be less.

### 2. &nbsp; Method 2: Memoized search

We introduce a memo list `mem` of the same size as the grid `grid`, used to record the solutions to various subproblems, and prune overlapping subproblems:

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs_mem(
        grid: list[list[int]], mem: list[list[int]], i: int, j: int
    ) -> int:
        """Minimum path sum: Memoized search"""
        # If it's the top-left cell, terminate the search
        if i == 0 and j == 0:
            return grid[0][0]
        # If the row or column index is out of bounds, return a +∞ cost
        if i < 0 or j < 0:
            return inf
        # If there is a record, return it
        if mem[i][j] != -1:
            return mem[i][j]
        # The minimum path cost from the left and top cells
        up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
        left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
        # Record and return the minimum path cost from the top-left to (i, j)
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* Minimum path sum: Memoized search */
    int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // If it's the top-left cell, terminate the search
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // If the row or column index is out of bounds, return a +∞ cost
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // If there is a record, return it
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // The minimum path cost from the left and top cells
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // Record and return the minimum path cost from the top-left to (i, j)
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    [class]{min_path_sum}-[func]{MinPathSumDFSMem}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dfs_mem}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dfs_mem}
    ```

=== "Zig"

    ```zig title="min_path_sum.zig"
    [class]{}-[func]{minPathSumDFSMem}
    ```

As shown in Figure 14-15, after introducing memoization, all subproblem solutions only need to be calculated once, so the time complexity depends on the total number of states, i.e., the grid size $O(nm)$.

![Memoized search recursive tree](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png){ class="animation-figure" }

<p align="center"> Figure 14-15 &nbsp; Memoized search recursive tree </p>

### 3. &nbsp; Method 3: Dynamic programming

Implement the dynamic programming solution iteratively, code as shown below:

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp(grid: list[list[int]]) -> int:
        """Minimum path sum: Dynamic programming"""
        n, m = len(grid), len(grid[0])
        # Initialize dp table
        dp = [[0] * m for _ in range(n)]
        dp[0][0] = grid[0][0]
        # State transition: first row
        for j in range(1, m):
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        # State transition: first column
        for i in range(1, n):
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        # State transition: the rest of the rows and columns
        for i in range(1, n):
            for j in range(1, m):
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        return dp[n - 1][m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* Minimum path sum: Dynamic programming */
    int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // Initialize dp table
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // State transition: first row
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // State transition: first column
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // State transition: the rest of the rows and columns
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    [class]{min_path_sum}-[func]{MinPathSumDP}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDP}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDP}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dp}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dp}
    ```

=== "Zig"

    ```zig title="min_path_sum.zig"
    [class]{}-[func]{minPathSumDP}
    ```

Figure 14-16 show the state transition process of the minimum path sum, traversing the entire grid, **thus the time complexity is $O(nm)$**.

The array `dp` is of size $n \times m$, **therefore the space complexity is $O(nm)$**.

=== "<1>"
    ![Dynamic programming process of minimum path sum](dp_solution_pipeline.assets/min_path_sum_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.png){ class="animation-figure" }

<p align="center"> Figure 14-16 &nbsp; Dynamic programming process of minimum path sum </p>

### 4. &nbsp; Space optimization

Since each cell is only related to the cell to its left and above, we can use a single-row array to implement the $dp$ table.

Please note, since the array `dp` can only represent the state of one row, we cannot initialize the first column state in advance, but update it as we traverse each row:

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
        """Minimum path sum: Space-optimized dynamic programming"""
        n, m = len(grid), len(grid[0])
        # Initialize dp table
        dp = [0] * m
        # State transition: first row
        dp[0] = grid[0][0]
        for j in range(1, m):
            dp[j] = dp[j - 1] + grid[0][j]
        # State transition: the rest of the rows
        for i in range(1, n):
            # State transition: first column
            dp[0] = dp[0] + grid[i][0]
            # State transition: the rest of the columns
            for j in range(1, m):
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        return dp[m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* Minimum path sum: Space-optimized dynamic programming */
    int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // Initialize dp table
        int[] dp = new int[m];
        // State transition: first row
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // State transition: the rest of the rows
        for (int i = 1; i < n; i++) {
            // State transition: first column
            dp[0] = dp[0] + grid[i][0];
            // State transition: the rest of the columns
            for (int j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    [class]{min_path_sum}-[func]{MinPathSumDPComp}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dp_comp}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dp_comp}
    ```

=== "Zig"

    ```zig title="min_path_sum.zig"
    [class]{}-[func]{minPathSumDPComp}
    ```
