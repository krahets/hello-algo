---
comments: true
---

# 14.1 &nbsp; Introduction to dynamic programming

<u>Dynamic programming</u> is an important algorithmic paradigm that decomposes a problem into a series of smaller subproblems, and stores the solutions of these subproblems to avoid redundant computations, thereby significantly improving time efficiency.

In this section, we start with a classic problem, first presenting its brute force backtracking solution, observing the overlapping subproblems contained within, and then gradually deriving a more efficient dynamic programming solution.

!!! question "Climbing stairs"

    Given a staircase with $n$ steps, where you can climb $1$ or $2$ steps at a time, how many different ways are there to reach the top?

As shown in Figure 14-1, there are $3$ ways to reach the top of a $3$-step staircase.

![Number of ways to reach the 3rd step](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> Figure 14-1 &nbsp; Number of ways to reach the 3rd step </p>

The goal of this problem is to determine the number of ways, **considering using backtracking to exhaust all possibilities**. Specifically, imagine climbing stairs as a multi-round choice process: starting from the ground, choosing to go up $1$ or $2$ steps each round, adding one to the count of ways upon reaching the top of the stairs, and pruning the process when exceeding the top. The code is as follows:

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """Backtracking"""
        # When climbing to the nth step, add 1 to the number of solutions
        if state == n:
            res[0] += 1
        # Traverse all choices
        for choice in choices:
            # Pruning: do not allow climbing beyond the nth step
            if state + choice > n:
                continue
            # Attempt: make a choice, update the state
            backtrack(choices, state + choice, n, res)
            # Retract

    def climbing_stairs_backtrack(n: int) -> int:
        """Climbing stairs: Backtracking"""
        choices = [1, 2]  # Can choose to climb up 1 step or 2 steps
        state = 0  # Start climbing from the 0th step
        res = [0]  # Use res[0] to record the number of solutions
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* Backtracking */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // When climbing to the nth step, add 1 to the number of solutions
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Traverse all choices
        for (Integer choice : choices) {
            // Pruning: do not allow climbing beyond the nth step
            if (state + choice > n)
                continue;
            // Attempt: make a choice, update the state
            backtrack(choices, state + choice, n, res);
            // Retract
        }
    }

    /* Climbing stairs: Backtracking */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Can choose to climb up 1 step or 2 steps
        int state = 0; // Start climbing from the 0th step
        List<Integer> res = new ArrayList<>();
        res.add(0); // Use res[0] to record the number of solutions
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
    [class]{climbing_stairs_backtrack}-[func]{Backtrack}

    [class]{climbing_stairs_backtrack}-[func]{ClimbingStairsBacktrack}
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "TS"

    ```typescript title="climbing_stairs_backtrack.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbing_stairs_backtrack}
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_backtrack.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbing_stairs_backtrack}
    ```

=== "Zig"

    ```zig title="climbing_stairs_backtrack.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

## 14.1.1 &nbsp; Method 1: Brute force search

Backtracking algorithms do not explicitly decompose the problem but treat solving the problem as a series of decision steps, searching for all possible solutions through exploration and pruning.

We can try to analyze this problem from the perspective of decomposition. Let $dp[i]$ be the number of ways to reach the $i^{th}$ step, then $dp[i]$ is the original problem, and its subproblems include:

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

Since each round can only advance $1$ or $2$ steps, when we stand on the $i^{th}$ step, the previous round must have been either on the $i-1^{th}$ or the $i-2^{th}$ step. In other words, we can only step from the $i-1^{th}$ or the $i-2^{th}$ step to the $i^{th}$ step.

This leads to an important conclusion: **the number of ways to reach the $i-1^{th}$ step plus the number of ways to reach the $i-2^{th}$ step equals the number of ways to reach the $i^{th}$ step**. The formula is as follows:

$$
dp[i] = dp[i-1] + dp[i-2]
$$

This means that in the stair climbing problem, there is a recursive relationship between the subproblems, **the solution to the original problem can be constructed from the solutions to the subproblems**. Figure 14-2 shows this recursive relationship.

![Recursive relationship of solution counts](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> Figure 14-2 &nbsp; Recursive relationship of solution counts </p>

We can obtain the brute force search solution according to the recursive formula. Starting with $dp[n]$, **recursively decompose a larger problem into the sum of two smaller problems**, until reaching the smallest subproblems $dp[1]$ and $dp[2]$ where the solutions are known, with $dp[1] = 1$ and $dp[2] = 2$, representing $1$ and $2$ ways to climb to the first and second steps, respectively.

Observe the following code, which, like standard backtracking code, belongs to depth-first search but is more concise:

=== "Python"

    ```python title="climbing_stairs_dfs.py"
    def dfs(i: int) -> int:
        """Search"""
        # Known dp[1] and dp[2], return them
        if i == 1 or i == 2:
            return i
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1) + dfs(i - 2)
        return count

    def climbing_stairs_dfs(n: int) -> int:
        """Climbing stairs: Search"""
        return dfs(n)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs.cpp"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Java"

    ```java title="climbing_stairs_dfs.java"
    /* Search */
    int dfs(int i) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Climbing stairs: Search */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs.cs"
    [class]{climbing_stairs_dfs}-[func]{DFS}

    [class]{climbing_stairs_dfs}-[func]{ClimbingStairsDFS}
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs}
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dfs.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

Figure 14-3 shows the recursive tree formed by brute force search. For the problem $dp[n]$, the depth of its recursive tree is $n$, with a time complexity of $O(2^n)$. Exponential order represents explosive growth, and entering a long wait if a relatively large $n$ is input.

![Recursive tree for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-3 &nbsp; Recursive tree for climbing stairs </p>

Observing Figure 14-3, **the exponential time complexity is caused by 'overlapping subproblems'**. For example, $dp[9]$ is decomposed into $dp[8]$ and $dp[7]$, $dp[8]$ into $dp[7]$ and $dp[6]$, both containing the subproblem $dp[7]$.

Thus, subproblems include even smaller overlapping subproblems, endlessly. A vast majority of computational resources are wasted on these overlapping subproblems.

## 14.1.2 &nbsp; Method 2: Memoized search

To enhance algorithm efficiency, **we hope that all overlapping subproblems are calculated only once**. For this purpose, we declare an array `mem` to record the solution of each subproblem, and prune overlapping subproblems during the search process.

1. When $dp[i]$ is calculated for the first time, we record it in `mem[i]` for later use.
2. When $dp[i]$ needs to be calculated again, we can directly retrieve the result from `mem[i]`, thus avoiding redundant calculations of that subproblem.

The code is as follows:

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """Memoized search"""
        # Known dp[1] and dp[2], return them
        if i == 1 or i == 2:
            return i
        # If there is a record for dp[i], return it
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # Record dp[i]
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """Climbing stairs: Memoized search"""
        # mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* Memoized search */
    int dfs(int i, int[] mem) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // If there is a record for dp[i], return it
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoized search */
    int climbingStairsDFSMem(int n) {
        // mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    [class]{climbing_stairs_dfs_mem}-[func]{DFS}

    [class]{climbing_stairs_dfs_mem}-[func]{ClimbingStairsDFSMem}
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    [class]{}-[func]{dfsMem}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs_mem}
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs_mem.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs_mem}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dfs_mem.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

Observe Figure 14-4, **after memoization, all overlapping subproblems need to be calculated only once, optimizing the time complexity to $O(n)$**, which is a significant leap.

![Recursive tree with memoized search](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-4 &nbsp; Recursive tree with memoized search </p>

## 14.1.3 &nbsp; Method 3: Dynamic programming

**Memoized search is a 'top-down' method**: we start with the original problem (root node), recursively decompose larger subproblems into smaller ones until the solutions to the smallest known subproblems (leaf nodes) are reached. Subsequently, by backtracking, we collect the solutions of the subproblems, constructing the solution to the original problem.

On the contrary, **dynamic programming is a 'bottom-up' method**: starting with the solutions to the smallest subproblems, iteratively construct the solutions to larger subproblems until the original problem is solved.

Since dynamic programming does not include a backtracking process, it only requires looping iteration to implement, without needing recursion. In the following code, we initialize an array `dp` to store the solutions to the subproblems, serving the same recording function as the array `mem` in memoized search:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """Climbing stairs: Dynamic programming"""
        if n == 1 or n == 2:
            return n
        # Initialize dp table, used to store subproblem solutions
        dp = [0] * (n + 1)
        # Initial state: preset the smallest subproblem solution
        dp[1], dp[2] = 1, 2
        # State transition: gradually solve larger subproblems from smaller ones
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* Climbing stairs: Dynamic programming */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Initialize dp table, used to store subproblem solutions
        int[] dp = new int[n + 1];
        // Initial state: preset the smallest subproblem solution
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    [class]{climbing_stairs_dp}-[func]{ClimbingStairsDP}
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    [class]{}-[func]{climbing_stairs_dp}
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    [class]{}-[func]{climbing_stairs_dp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dp.zig"
    [class]{}-[func]{climbingStairsDP}
    ```

Figure 14-5 simulates the execution process of the above code.

![Dynamic programming process for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> Figure 14-5 &nbsp; Dynamic programming process for climbing stairs </p>

Like the backtracking algorithm, dynamic programming also uses the concept of "states" to represent specific stages in problem solving, each state corresponding to a subproblem and its local optimal solution. For example, the state of the climbing stairs problem is defined as the current step number $i$.

Based on the above content, we can summarize the commonly used terminology in dynamic programming.

- The array `dp` is referred to as the <u>DP table</u>, with $dp[i]$ representing the solution to the subproblem corresponding to state $i$.
- The states corresponding to the smallest subproblems (steps $1$ and $2$) are called <u>initial states</u>.
- The recursive formula $dp[i] = dp[i-1] + dp[i-2]$ is called the <u>state transition equation</u>.

## 14.1.4 &nbsp; Space optimization

Observant readers may have noticed that **since $dp[i]$ is only related to $dp[i-1]$ and $dp[i-2]$, we do not need to use an array `dp` to store the solutions to all subproblems**, but can simply use two variables to progress iteratively. The code is as follows:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp_comp(n: int) -> int:
        """Climbing stairs: Space-optimized dynamic programming"""
        if n == 1 or n == 2:
            return n
        a, b = 1, 2
        for _ in range(3, n + 1):
            a, b = b, a + b
        return b
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* Climbing stairs: Space-optimized dynamic programming */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    [class]{climbing_stairs_dp}-[func]{ClimbingStairsDPComp}
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    [class]{}-[func]{climbing_stairs_dp_comp}
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    [class]{}-[func]{climbing_stairs_dp_comp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dp.zig"
    [class]{}-[func]{climbingStairsDPComp}
    ```

Observing the above code, since the space occupied by the array `dp` is eliminated, the space complexity is reduced from $O(n)$ to $O(1)$.

In dynamic programming problems, the current state is often only related to a limited number of previous states, allowing us to retain only the necessary states and save memory space by "dimension reduction". **This space optimization technique is known as 'rolling variable' or 'rolling array'**.
