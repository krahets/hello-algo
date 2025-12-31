---
comments: true
---

# 14.1 &nbsp; Introduction to Dynamic Programming

<u>Dynamic programming</u> is an important algorithmic paradigm that decomposes a problem into a series of smaller subproblems and avoids redundant computation by storing the solutions to subproblems, thereby significantly improving time efficiency.

In this section, we start with a classic example, first presenting its brute force backtracking solution, observing the overlapping subproblems within it, and then gradually deriving a more efficient dynamic programming solution.

!!! question "Climbing stairs"

    Given a staircase with $n$ steps, where you can climb $1$ or $2$ steps at a time, how many different ways are there to reach the top?

As shown in Figure 14-1, for a $3$-step staircase, there are $3$ different ways to reach the top.

![Number of ways to reach the 3rd step](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> Figure 14-1 &nbsp; Number of ways to reach the 3rd step </p>

The goal of this problem is to find the number of ways, **we can consider using backtracking to enumerate all possibilities**. Specifically, imagine climbing stairs as a multi-round selection process: starting from the ground, choosing to go up $1$ or $2$ steps in each round, incrementing the count by $1$ whenever the top of the stairs is reached, and pruning when exceeding the top. The code is as follows:

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """Backtracking"""
        # When climbing to the n-th stair, add 1 to the solution count
        if state == n:
            res[0] += 1
        # Traverse all choices
        for choice in choices:
            # Pruning: not allowed to go beyond the n-th stair
            if state + choice > n:
                continue
            # Attempt: make a choice, update state
            backtrack(choices, state + choice, n, res)
            # Backtrack

    def climbing_stairs_backtrack(n: int) -> int:
        """Climbing stairs: Backtracking"""
        choices = [1, 2]  # Can choose to climb up 1 or 2 stairs
        state = 0  # Start climbing from the 0-th stair
        res = [0]  # Use res[0] to record the solution count
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    /* Backtracking */
    void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res[0]++;
        // Traverse all choices
        for (auto &choice : choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n)
                continue;
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    int climbingStairsBacktrack(int n) {
        vector<int> choices = {1, 2}; // Can choose to climb up 1 or 2 stairs
        int state = 0;                // Start climbing from the 0-th stair
        vector<int> res = {0};        // Use res[0] to record the solution count
        backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* Backtracking */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Traverse all choices
        for (Integer choice : choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n)
                continue;
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Can choose to climb up 1 or 2 stairs
        int state = 0; // Start climbing from the 0-th stair
        List<Integer> res = new ArrayList<>();
        res.add(0); // Use res[0] to record the solution count
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
    /* Backtracking */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res[0]++;
        // Traverse all choices
        foreach (int choice in choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n)
                continue;
            // Attempt: make choice, update state
            Backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
        int state = 0; // Start climbing from the 0-th stair
        List<int> res = [0]; // Use res[0] to record the solution count
        Backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    /* Backtracking */
    func backtrack(choices []int, state, n int, res []int) {
        // When climbing to the n-th stair, add 1 to the solution count
        if state == n {
            res[0] = res[0] + 1
        }
        // Traverse all choices
        for _, choice := range choices {
            // Pruning: not allowed to go beyond the n-th stair
            if state+choice > n {
                continue
            }
            // Attempt: make choice, update state
            backtrack(choices, state+choice, n, res)
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    func climbingStairsBacktrack(n int) int {
        // Can choose to climb up 1 or 2 stairs
        choices := []int{1, 2}
        // Start climbing from the 0-th stair
        state := 0
        res := make([]int, 1)
        // Use res[0] to record the solution count
        res[0] = 0
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    /* Backtracking */
    func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
        // When climbing to the n-th stair, add 1 to the solution count
        if state == n {
            res[0] += 1
        }
        // Traverse all choices
        for choice in choices {
            // Pruning: not allowed to go beyond the n-th stair
            if state + choice > n {
                continue
            }
            // Attempt: make choice, update state
            backtrack(choices: choices, state: state + choice, n: n, res: &res)
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    func climbingStairsBacktrack(n: Int) -> Int {
        let choices = [1, 2] // Can choose to climb up 1 or 2 stairs
        let state = 0 // Start climbing from the 0-th stair
        var res: [Int] = []
        res.append(0) // Use res[0] to record the solution count
        backtrack(choices: choices, state: state, n: n, res: &res)
        return res[0]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    /* Backtracking */
    function backtrack(choices, state, n, res) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state === n) res.set(0, res.get(0) + 1);
        // Traverse all choices
        for (const choice of choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n) continue;
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    function climbingStairsBacktrack(n) {
        const choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
        const state = 0; // Start climbing from the 0-th stair
        const res = new Map();
        res.set(0, 0); // Use res[0] to record the solution count
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_backtrack.ts"
    /* Backtracking */
    function backtrack(
        choices: number[],
        state: number,
        n: number,
        res: Map<0, any>
    ): void {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state === n) res.set(0, res.get(0) + 1);
        // Traverse all choices
        for (const choice of choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n) continue;
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    function climbingStairsBacktrack(n: number): number {
        const choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
        const state = 0; // Start climbing from the 0-th stair
        const res = new Map();
        res.set(0, 0); // Use res[0] to record the solution count
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    /* Backtracking */
    void backtrack(List<int> choices, int state, int n, List<int> res) {
      // When climbing to the n-th stair, add 1 to the solution count
      if (state == n) {
        res[0]++;
      }
      // Traverse all choices
      for (int choice in choices) {
        // Pruning: not allowed to go beyond the n-th stair
        if (state + choice > n) continue;
        // Attempt: make choice, update state
        backtrack(choices, state + choice, n, res);
        // Backtrack
      }
    }

    /* Climbing stairs: Backtracking */
    int climbingStairsBacktrack(int n) {
      List<int> choices = [1, 2]; // Can choose to climb up 1 or 2 stairs
      int state = 0; // Start climbing from the 0-th stair
      List<int> res = [];
      res.add(0); // Use res[0] to record the solution count
      backtrack(choices, state, n, res);
      return res[0];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    /* Backtracking */
    fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
        // When climbing to the n-th stair, add 1 to the solution count
        if state == n {
            res[0] = res[0] + 1;
        }
        // Traverse all choices
        for &choice in choices {
            // Pruning: not allowed to go beyond the n-th stair
            if state + choice > n {
                continue;
            }
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    fn climbing_stairs_backtrack(n: usize) -> i32 {
        let choices = vec![1, 2]; // Can choose to climb up 1 or 2 stairs
        let state = 0; // Start climbing from the 0-th stair
        let mut res = Vec::new();
        res.push(0); // Use res[0] to record the solution count
        backtrack(&choices, state, n as i32, &mut res);
        res[0]
    }
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    /* Backtracking */
    void backtrack(int *choices, int state, int n, int *res, int len) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res[0]++;
        // Traverse all choices
        for (int i = 0; i < len; i++) {
            int choice = choices[i];
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n)
                continue;
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res, len);
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    int climbingStairsBacktrack(int n) {
        int choices[2] = {1, 2}; // Can choose to climb up 1 or 2 stairs
        int state = 0;           // Start climbing from the 0-th stair
        int *res = (int *)malloc(sizeof(int));
        *res = 0; // Use res[0] to record the solution count
        int len = sizeof(choices) / sizeof(int);
        backtrack(choices, state, n, res, len);
        int result = *res;
        free(res);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_backtrack.kt"
    /* Backtracking */
    fun backtrack(
        choices: MutableList<Int>,
        state: Int,
        n: Int,
        res: MutableList<Int>
    ) {
        // When climbing to the n-th stair, add 1 to the solution count
        if (state == n)
            res[0] = res[0] + 1
        // Traverse all choices
        for (choice in choices) {
            // Pruning: not allowed to go beyond the n-th stair
            if (state + choice > n) continue
            // Attempt: make choice, update state
            backtrack(choices, state + choice, n, res)
            // Backtrack
        }
    }

    /* Climbing stairs: Backtracking */
    fun climbingStairsBacktrack(n: Int): Int {
        val choices = mutableListOf(1, 2) // Can choose to climb up 1 or 2 stairs
        val state = 0 // Start climbing from the 0-th stair
        val res = mutableListOf<Int>()
        res.add(0) // Use res[0] to record the solution count
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    ### Backtracking ###
    def backtrack(choices, state, n, res)
      # When climbing to the n-th stair, add 1 to the solution count
      res[0] += 1 if state == n
      # Traverse all choices
      for choice in choices
        # Pruning: not allowed to go beyond the n-th stair
        next if state + choice > n

        # Attempt: make choice, update state
        backtrack(choices, state + choice, n, res)
      end
      # Backtrack
    end

    ### Climbing stairs: backtracking ###
    def climbing_stairs_backtrack(n)
      choices = [1, 2] # Can choose to climb up 1 or 2 stairs
      state = 0 # Start climbing from the 0-th stair
      res = [0] # Use res[0] to record the solution count
      backtrack(choices, state, n, res)
      res.first
    end
    ```

## 14.1.1 &nbsp; Method 1: Brute Force Search

Backtracking algorithms typically do not explicitly decompose problems, but rather treat solving the problem as a series of decision steps, searching for all possible solutions through trial and pruning.

We can try to analyze this problem from the perspective of problem decomposition. Let the number of ways to climb to the $i$-th step be $dp[i]$, then $dp[i]$ is the original problem, and its subproblems include:

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

Since we can only go up $1$ or $2$ steps in each round, when we stand on the $i$-th step, we could only have been on the $i-1$-th or $i-2$-th step in the previous round. In other words, we can only reach the $i$-th step from the $i-1$-th or $i-2$-th step.

This leads to an important conclusion: **the number of ways to climb to the $i-1$-th step plus the number of ways to climb to the $i-2$-th step equals the number of ways to climb to the $i$-th step**. The formula is as follows:

$$
dp[i] = dp[i-1] + dp[i-2]
$$

This means that in the stair climbing problem, there exists a recurrence relation among the subproblems, **the solution to the original problem can be constructed from the solutions to the subproblems**. Figure 14-2 illustrates this recurrence relation.

![Recurrence relation for the number of ways](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> Figure 14-2 &nbsp; Recurrence relation for the number of ways </p>

We can obtain a brute force search solution based on the recurrence formula. Starting from $dp[n]$, **recursively decompose a larger problem into the sum of two smaller problems**, until reaching the smallest subproblems $dp[1]$ and $dp[2]$ and returning. Among them, the solutions to the smallest subproblems are known, namely $dp[1] = 1$ and $dp[2] = 2$, representing $1$ and $2$ ways to climb to the $1$st and $2$nd steps, respectively.

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
    /* Search */
    int DFS(int i) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* Climbing stairs: Search */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    /* Search */
    func dfs(i int) int {
        // Known dp[1] and dp[2], return them
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfs(i-1) + dfs(i-2)
        return count
    }

    /* Climbing stairs: Search */
    func climbingStairsDFS(n int) int {
        return dfs(n)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    /* Search */
    func dfs(i: Int) -> Int {
        // Known dp[1] and dp[2], return them
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1) + dfs(i: i - 2)
        return count
    }

    /* Climbing stairs: Search */
    func climbingStairsDFS(n: Int) -> Int {
        dfs(i: n)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    /* Search */
    function dfs(i) {
        // Known dp[1] and dp[2], return them
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Climbing stairs: Search */
    function climbingStairsDFS(n) {
        return dfs(n);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    /* Search */
    function dfs(i: number): number {
        // Known dp[1] and dp[2], return them
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Climbing stairs: Search */
    function climbingStairsDFS(n: number): number {
        return dfs(n);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    /* Search */
    int dfs(int i) {
      // Known dp[1] and dp[2], return them
      if (i == 1 || i == 2) return i;
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1) + dfs(i - 2);
      return count;
    }

    /* Climbing stairs: Search */
    int climbingStairsDFS(int n) {
      return dfs(n);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    /* Search */
    fn dfs(i: usize) -> i32 {
        // Known dp[1] and dp[2], return them
        if i == 1 || i == 2 {
            return i as i32;
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1) + dfs(i - 2);
        count
    }

    /* Climbing stairs: Search */
    fn climbing_stairs_dfs(n: usize) -> i32 {
        dfs(n)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
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

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    /* Search */
    fun dfs(i: Int): Int {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2) return i
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1) + dfs(i - 2)
        return count
    }

    /* Climbing stairs: Search */
    fun climbingStairsDFS(n: Int): Int {
        return dfs(n)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    ### Search ###
    def dfs(i)
      # Known dp[1] and dp[2], return them
      return i if i == 1 || i == 2
      # dp[i] = dp[i-1] + dp[i-2]
      dfs(i - 1) + dfs(i - 2)
    end

    ### Climbing stairs: search ###
    def climbing_stairs_dfs(n)
      dfs(n)
    end
    ```

Figure 14-3 shows the recursion tree formed by brute force search. For the problem $dp[n]$, the depth of its recursion tree is $n$, with a time complexity of $O(2^n)$. Exponential order represents explosive growth; if we input a relatively large $n$, we will fall into a long wait.

![Recursion tree for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-3 &nbsp; Recursion tree for climbing stairs </p>

Observing the above figure, **the exponential time complexity is caused by "overlapping subproblems"**. For example, $dp[9]$ is decomposed into $dp[8]$ and $dp[7]$, and $dp[8]$ is decomposed into $dp[7]$ and $dp[6]$, both of which contain the subproblem $dp[7]$.

And so on, subproblems contain smaller overlapping subproblems, ad infinitum. The vast majority of computational resources are wasted on these overlapping subproblems.

## 14.1.2 &nbsp; Method 2: Memoization

To improve algorithm efficiency, **we want all overlapping subproblems to be computed only once**. For this purpose, we declare an array `mem` to record the solution to each subproblem and prune overlapping subproblems during the search process.

1. When computing $dp[i]$ for the first time, we record it in `mem[i]` for later use.
2. When we need to compute $dp[i]$ again, we can directly retrieve the result from `mem[i]`, thereby avoiding redundant computation of that subproblem.

The code is as follows:

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """Memoization search"""
        # Known dp[1] and dp[2], return them
        if i == 1 or i == 2:
            return i
        # If record dp[i] exists, return it directly
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # Record dp[i]
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """Climbing stairs: Memoization search"""
        # mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    /* Memoization search */
    int dfs(int i, vector<int> &mem) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    int climbingStairsDFSMem(int n) {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        vector<int> mem(n + 1, -1);
        return dfs(n, mem);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* Memoization search */
    int dfs(int i, int[] mem) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    int climbingStairsDFSMem(int n) {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    /* Memoization search */
    int DFS(int i, int[] mem) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    /* Memoization search */
    func dfsMem(i int, mem []int) int {
        // Known dp[1] and dp[2], return them
        if i == 1 || i == 2 {
            return i
        }
        // If record dp[i] exists, return it directly
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
        // Record dp[i]
        mem[i] = count
        return count
    }

    /* Climbing stairs: Memoization search */
    func climbingStairsDFSMem(n int) int {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        mem := make([]int, n+1)
        for i := range mem {
            mem[i] = -1
        }
        return dfsMem(n, mem)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    /* Memoization search */
    func dfs(i: Int, mem: inout [Int]) -> Int {
        // Known dp[1] and dp[2], return them
        if i == 1 || i == 2 {
            return i
        }
        // If record dp[i] exists, return it directly
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
        // Record dp[i]
        mem[i] = count
        return count
    }

    /* Climbing stairs: Memoization search */
    func climbingStairsDFSMem(n: Int) -> Int {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        var mem = Array(repeating: -1, count: n + 1)
        return dfs(i: n, mem: &mem)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    /* Memoization search */
    function dfs(i, mem) {
        // Known dp[1] and dp[2], return them
        if (i === 1 || i === 2) return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    function climbingStairsDFSMem(n) {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    /* Memoization search */
    function dfs(i: number, mem: number[]): number {
        // Known dp[1] and dp[2], return them
        if (i === 1 || i === 2) return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    function climbingStairsDFSMem(n: number): number {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    /* Memoization search */
    int dfs(int i, List<int> mem) {
      // Known dp[1] and dp[2], return them
      if (i == 1 || i == 2) return i;
      // If record dp[i] exists, return it directly
      if (mem[i] != -1) return mem[i];
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1, mem) + dfs(i - 2, mem);
      // Record dp[i]
      mem[i] = count;
      return count;
    }

    /* Climbing stairs: Memoization search */
    int climbingStairsDFSMem(int n) {
      // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
      List<int> mem = List.filled(n + 1, -1);
      return dfs(n, mem);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    /* Memoization search */
    fn dfs(i: usize, mem: &mut [i32]) -> i32 {
        // Known dp[1] and dp[2], return them
        if i == 1 || i == 2 {
            return i as i32;
        }
        // If record dp[i] exists, return it directly
        if mem[i] != -1 {
            return mem[i];
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        count
    }

    /* Climbing stairs: Memoization search */
    fn climbing_stairs_dfs_mem(n: usize) -> i32 {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        let mut mem = vec![-1; n + 1];
        dfs(n, &mut mem)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    /* Memoization search */
    int dfs(int i, int *mem) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    int climbingStairsDFSMem(int n) {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        int *mem = (int *)malloc((n + 1) * sizeof(int));
        for (int i = 0; i <= n; i++) {
            mem[i] = -1;
        }
        int result = dfs(n, mem);
        free(mem);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs_mem.kt"
    /* Memoization search */
    fun dfs(i: Int, mem: IntArray): Int {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2) return i
        // If record dp[i] exists, return it directly
        if (mem[i] != -1) return mem[i]
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1, mem) + dfs(i - 2, mem)
        // Record dp[i]
        mem[i] = count
        return count
    }

    /* Climbing stairs: Memoization search */
    fun climbingStairsDFSMem(n: Int): Int {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        val mem = IntArray(n + 1)
        mem.fill(-1)
        return dfs(n, mem)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    ### Memoization search ###
    def dfs(i, mem)
      # Known dp[1] and dp[2], return them
      return i if i == 1 || i == 2
      # If record dp[i] exists, return it directly
      return mem[i] if mem[i] != -1

      # dp[i] = dp[i-1] + dp[i-2]
      count = dfs(i - 1, mem) + dfs(i - 2, mem)
      # Record dp[i]
      mem[i] = count
    end

    ### Climbing stairs: memoization search ###
    def climbing_stairs_dfs_mem(n)
      # mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
      mem = Array.new(n + 1, -1)
      dfs(n, mem)
    end
    ```

Observe Figure 14-4, **after memoization, all overlapping subproblems only need to be computed once, optimizing the time complexity to $O(n)$**, which is a tremendous leap.

![Recursion tree with memoization](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-4 &nbsp; Recursion tree with memoization </p>

## 14.1.3 &nbsp; Method 3: Dynamic Programming

**Memoization is a "top-down" method**: we start from the original problem (root node), recursively decompose larger subproblems into smaller ones, until reaching the smallest known subproblems (leaf nodes). Afterward, by backtracking, we collect the solutions to the subproblems layer by layer to construct the solution to the original problem.

In contrast, **dynamic programming is a "bottom-up" method**: starting from the solutions to the smallest subproblems, iteratively constructing solutions to larger subproblems until obtaining the solution to the original problem.

Since dynamic programming does not include a backtracking process, it only requires loop iteration for implementation and does not need recursion. In the following code, we initialize an array `dp` to store the solutions to subproblems, which serves the same recording function as the array `mem` in memoization:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """Climbing stairs: Dynamic programming"""
        if n == 1 or n == 2:
            return n
        # Initialize dp table, used to store solutions to subproblems
        dp = [0] * (n + 1)
        # Initial state: preset the solution to the smallest subproblem
        dp[1], dp[2] = 1, 2
        # State transition: gradually solve larger subproblems from smaller ones
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* Climbing stairs: Dynamic programming */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Initialize dp table, used to store solutions to subproblems
        vector<int> dp(n + 1);
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* Climbing stairs: Dynamic programming */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Initialize dp table, used to store solutions to subproblems
        int[] dp = new int[n + 1];
        // Initial state: preset the solution to the smallest subproblem
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
    /* Climbing stairs: Dynamic programming */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Initialize dp table, used to store solutions to subproblems
        int[] dp = new int[n + 1];
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* Climbing stairs: Dynamic programming */
    func climbingStairsDP(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        // Initialize dp table, used to store solutions to subproblems
        dp := make([]int, n+1)
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1
        dp[2] = 2
        // State transition: gradually solve larger subproblems from smaller ones
        for i := 3; i <= n; i++ {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* Climbing stairs: Dynamic programming */
    func climbingStairsDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        // Initialize dp table, used to store solutions to subproblems
        var dp = Array(repeating: 0, count: n + 1)
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1
        dp[2] = 2
        // State transition: gradually solve larger subproblems from smaller ones
        for i in 3 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* Climbing stairs: Dynamic programming */
    function climbingStairsDP(n) {
        if (n === 1 || n === 2) return n;
        // Initialize dp table, used to store solutions to subproblems
        const dp = new Array(n + 1).fill(-1);
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* Climbing stairs: Dynamic programming */
    function climbingStairsDP(n: number): number {
        if (n === 1 || n === 2) return n;
        // Initialize dp table, used to store solutions to subproblems
        const dp = new Array(n + 1).fill(-1);
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* Climbing stairs: Dynamic programming */
    int climbingStairsDP(int n) {
      if (n == 1 || n == 2) return n;
      // Initialize dp table, used to store solutions to subproblems
      List<int> dp = List.filled(n + 1, 0);
      // Initial state: preset the solution to the smallest subproblem
      dp[1] = 1;
      dp[2] = 2;
      // State transition: gradually solve larger subproblems from smaller ones
      for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* Climbing stairs: Dynamic programming */
    fn climbing_stairs_dp(n: usize) -> i32 {
        // Known dp[1] and dp[2], return them
        if n == 1 || n == 2 {
            return n as i32;
        }
        // Initialize dp table, used to store solutions to subproblems
        let mut dp = vec![-1; n + 1];
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for i in 3..=n {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* Climbing stairs: Dynamic programming */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Initialize dp table, used to store solutions to subproblems
        int *dp = (int *)malloc((n + 1) * sizeof(int));
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1;
        dp[2] = 2;
        // State transition: gradually solve larger subproblems from smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        int result = dp[n];
        free(dp);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* Climbing stairs: Dynamic programming */
    fun climbingStairsDP(n: Int): Int {
        if (n == 1 || n == 2) return n
        // Initialize dp table, used to store solutions to subproblems
        val dp = IntArray(n + 1)
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = 1
        dp[2] = 2
        // State transition: gradually solve larger subproblems from smaller ones
        for (i in 3..n) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### Climbing stairs: dynamic programming ###
    def climbing_stairs_dp(n)
      return n  if n == 1 || n == 2

      # Initialize dp table, used to store solutions to subproblems
      dp = Array.new(n + 1, 0)
      # Initial state: preset the solution to the smallest subproblem
      dp[1], dp[2] = 1, 2
      # State transition: gradually solve larger subproblems from smaller ones
      (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

      dp[n]
    end
    ```

Figure 14-5 simulates the execution process of the above code.

![Dynamic programming process for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> Figure 14-5 &nbsp; Dynamic programming process for climbing stairs </p>

Like backtracking algorithms, dynamic programming also uses the "state" concept to represent specific stages of problem solving, with each state corresponding to a subproblem and its corresponding local optimal solution. For example, the state in the stair climbing problem is defined as the current stair step number $i$.

Based on the above content, we can summarize the commonly used terminology in dynamic programming.

- The array `dp` is called the <u>dp table</u>, where $dp[i]$ represents the solution to the subproblem corresponding to state $i$.
- The states corresponding to the smallest subproblems (the $1$st and $2$nd steps) are called <u>initial states</u>.
- The recurrence formula $dp[i] = dp[i-1] + dp[i-2]$ is called the <u>state transition equation</u>.

## 14.1.4 &nbsp; Space Optimization

Observant readers may have noticed that **since $dp[i]$ is only related to $dp[i-1]$ and $dp[i-2]$, we do not need to use an array `dp` to store the solutions to all subproblems**, but can simply use two variables to roll forward. The code is as follows:

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
    /* Climbing stairs: Space-optimized dynamic programming */
    int ClimbingStairsDPComp(int n) {
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

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* Climbing stairs: Space-optimized dynamic programming */
    func climbingStairsDPComp(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        a, b := 1, 2
        // State transition: gradually solve larger subproblems from smaller ones
        for i := 3; i <= n; i++ {
            a, b = b, a+b
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* Climbing stairs: Space-optimized dynamic programming */
    func climbingStairsDPComp(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        var a = 1
        var b = 2
        for _ in 3 ... n {
            (a, b) = (b, a + b)
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* Climbing stairs: Space-optimized dynamic programming */
    function climbingStairsDPComp(n) {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* Climbing stairs: Space-optimized dynamic programming */
    function climbingStairsDPComp(n: number): number {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* Climbing stairs: Space-optimized dynamic programming */
    int climbingStairsDPComp(int n) {
      if (n == 1 || n == 2) return n;
      int a = 1, b = 2;
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* Climbing stairs: Space-optimized dynamic programming */
    fn climbing_stairs_dp_comp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return n as i32;
        }
        let (mut a, mut b) = (1, 2);
        for _ in 3..=n {
            let tmp = b;
            b = a + b;
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
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

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* Climbing stairs: Space-optimized dynamic programming */
    fun climbingStairsDPComp(n: Int): Int {
        if (n == 1 || n == 2) return n
        var a = 1
        var b = 2
        for (i in 3..n) {
            val temp = b
            b += a
            a = temp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### Climbing stairs: space-optimized DP ###
    def climbing_stairs_dp_comp(n)
      return n if n == 1 || n == 2

      a, b = 1, 2
      (3...(n + 1)).each { a, b = b, a + b }

      b
    end
    ```

Observing the above code, since the space occupied by the array `dp` is saved, the space complexity is reduced from $O(n)$ to $O(1)$.

In dynamic programming problems, the current state often depends only on a limited number of preceding states, allowing us to retain only the necessary states and save memory space through "dimension reduction". **This space optimization technique is called "rolling variable" or "rolling array"**.
