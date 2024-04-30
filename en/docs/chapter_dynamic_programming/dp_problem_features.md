---
comments: true
---

# 14.2 &nbsp; Characteristics of dynamic programming problems

In the previous section, we learned how dynamic programming solves the original problem by decomposing it into subproblems. In fact, subproblem decomposition is a general algorithmic approach, with different emphases in divide and conquer, dynamic programming, and backtracking.

- Divide and conquer algorithms recursively divide the original problem into multiple independent subproblems until the smallest subproblems are reached, and combine the solutions of the subproblems during backtracking to ultimately obtain the solution to the original problem.
- Dynamic programming also decomposes the problem recursively, but the main difference from divide and conquer algorithms is that the subproblems in dynamic programming are interdependent, and many overlapping subproblems will appear during the decomposition process.
- Backtracking algorithms exhaust all possible solutions through trial and error and avoid unnecessary search branches by pruning. The solution to the original problem consists of a series of decision steps, and we can consider each sub-sequence before each decision step as a subproblem.

In fact, dynamic programming is commonly used to solve optimization problems, which not only include overlapping subproblems but also have two other major characteristics: optimal substructure and statelessness.

## 14.2.1 &nbsp; Optimal substructure

We make a slight modification to the stair climbing problem to make it more suitable to demonstrate the concept of optimal substructure.

!!! question "Minimum cost of climbing stairs"

    Given a staircase, you can step up 1 or 2 steps at a time, and each step on the staircase has a non-negative integer representing the cost you need to pay at that step. Given a non-negative integer array $cost$, where $cost[i]$ represents the cost you need to pay at the $i$-th step, $cost[0]$ is the ground (starting point). What is the minimum cost required to reach the top?

As shown in the Figure 14-6 , if the costs of the 1st, 2nd, and 3rd steps are $1$, $10$, and $1$ respectively, then the minimum cost to climb to the 3rd step from the ground is $2$.

![Minimum cost to climb to the 3rd step](dp_problem_features.assets/min_cost_cs_example.png){ class="animation-figure" }

<p align="center"> Figure 14-6 &nbsp; Minimum cost to climb to the 3rd step </p>

Let $dp[i]$ be the cumulative cost of climbing to the $i$-th step. Since the $i$-th step can only come from the $i-1$ or $i-2$ step, $dp[i]$ can only be either $dp[i-1] + cost[i]$ or $dp[i-2] + cost[i]$. To minimize the cost, we should choose the smaller of the two:

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

This leads us to the meaning of optimal substructure: **The optimal solution to the original problem is constructed from the optimal solutions of subproblems**.

This problem obviously has optimal substructure: we select the better one from the optimal solutions of the two subproblems, $dp[i-1]$ and $dp[i-2]$, and use it to construct the optimal solution for the original problem $dp[i]$.

So, does the stair climbing problem from the previous section have optimal substructure? Its goal is to solve for the number of solutions, which seems to be a counting problem, but if we ask in another way: "Solve for the maximum number of solutions". We surprisingly find that **although the problem has changed, the optimal substructure has emerged**: the maximum number of solutions at the $n$-th step equals the sum of the maximum number of solutions at the $n-1$ and $n-2$ steps. Thus, the interpretation of optimal substructure is quite flexible and will have different meanings in different problems.

According to the state transition equation, and the initial states $dp[1] = cost[1]$ and $dp[2] = cost[2]$, we can obtain the dynamic programming code:

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
        """爬楼梯最小代价：动态规划"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        # 初始化 dp 表，用于存储子问题的解
        dp = [0] * (n + 1)
        # 初始状态：预设最小子问题的解
        dp[1], dp[2] = cost[1], cost[2]
        # 状态转移：从较小子问题逐步求解较大子问题
        for i in range(3, n + 1):
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        return dp[n]
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* 爬楼梯最小代价：动态规划 */
    int minCostClimbingStairsDP(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 初始化 dp 表，用于存储子问题的解
        vector<int> dp(n + 1);
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* 爬楼梯最小代价：动态规划 */
    int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 初始化 dp 表，用于存储子问题的解
        int[] dp = new int[n + 1];
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* 爬楼梯最小代价：动态规划 */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 初始化 dp 表，用于存储子问题的解
        int[] dp = new int[n + 1];
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* 爬楼梯最小代价：动态规划 */
    func minCostClimbingStairsDP(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // 初始化 dp 表，用于存储子问题的解
        dp := make([]int, n+1)
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 状态转移：从较小子问题逐步求解较大子问题
        for i := 3; i <= n; i++ {
            dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* 爬楼梯最小代价：动态规划 */
    func minCostClimbingStairsDP(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        // 初始化 dp 表，用于存储子问题的解
        var dp = Array(repeating: 0, count: n + 1)
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 状态转移：从较小子问题逐步求解较大子问题
        for i in 3 ... n {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* 爬楼梯最小代价：动态规划 */
    function minCostClimbingStairsDP(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // 初始化 dp 表，用于存储子问题的解
        const dp = new Array(n + 1);
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* 爬楼梯最小代价：动态规划 */
    function minCostClimbingStairsDP(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // 初始化 dp 表，用于存储子问题的解
        const dp = new Array(n + 1);
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* 爬楼梯最小代价：动态规划 */
    int minCostClimbingStairsDP(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      // 初始化 dp 表，用于存储子问题的解
      List<int> dp = List.filled(n + 1, 0);
      // 初始状态：预设最小子问题的解
      dp[1] = cost[1];
      dp[2] = cost[2];
      // 状态转移：从较小子问题逐步求解较大子问题
      for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* 爬楼梯最小代价：动态规划 */
    fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        }
        // 初始化 dp 表，用于存储子问题的解
        let mut dp = vec![-1; n + 1];
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for i in 3..=n {
            dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* 爬楼梯最小代价：动态规划 */
    int minCostClimbingStairsDP(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 初始化 dp 表，用于存储子问题的解
        int *dp = calloc(n + 1, sizeof(int));
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
        }
        int res = dp[n];
        // 释放内存
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* 爬楼梯最小代价：动态规划 */
    fun minCostClimbingStairsDP(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        // 初始化 dp 表，用于存储子问题的解
        val dp = IntArray(n + 1)
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 状态转移：从较小子问题逐步求解较大子问题
        for (i in 3..n) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    [class]{}-[func]{min_cost_climbing_stairs_dp}
    ```

=== "Zig"

    ```zig title="min_cost_climbing_stairs_dp.zig"
    // 爬楼梯最小代价：动态规划
    fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
        comptime var n = cost.len - 1;
        if (n == 1 or n == 2) {
            return cost[n];
        }
        // 初始化 dp 表，用于存储子问题的解
        var dp = [_]i32{-1} ** (n + 1);
        // 初始状态：预设最小子问题的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (3..n + 1) |i| {
            dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%E6%9C%80%E5%B0%8F%E4%BB%A3%E4%BB%B7%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E5%82%A8%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%EF%BC%9A%E9%A2%84%E8%AE%BE%E6%9C%80%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E4%BB%8E%E8%BE%83%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BE%83%E5%A4%A7%E5%AD%90%E9%97%AE%E9%A2%98%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D,%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%A5%BC%E6%A2%AF%E7%9A%84%E4%BB%A3%E4%BB%B7%E5%88%97%E8%A1%A8%E4%B8%BA%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%E7%88%AC%E5%AE%8C%E6%A5%BC%E6%A2%AF%E7%9A%84%E6%9C%80%E4%BD%8E%E4%BB%A3%E4%BB%B7%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%E6%9C%80%E5%B0%8F%E4%BB%A3%E4%BB%B7%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E5%82%A8%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%EF%BC%9A%E9%A2%84%E8%AE%BE%E6%9C%80%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E4%BB%8E%E8%BE%83%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BE%83%E5%A4%A7%E5%AD%90%E9%97%AE%E9%A2%98%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D,%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%A5%BC%E6%A2%AF%E7%9A%84%E4%BB%A3%E4%BB%B7%E5%88%97%E8%A1%A8%E4%B8%BA%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%E7%88%AC%E5%AE%8C%E6%A5%BC%E6%A2%AF%E7%9A%84%E6%9C%80%E4%BD%8E%E4%BB%A3%E4%BB%B7%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The Figure 14-7  shows the dynamic programming process for the above code.

![Dynamic programming process for minimum cost of climbing stairs](dp_problem_features.assets/min_cost_cs_dp.png){ class="animation-figure" }

<p align="center"> Figure 14-7 &nbsp; Dynamic programming process for minimum cost of climbing stairs </p>

This problem can also be space-optimized, compressing one dimension to zero, reducing the space complexity from $O(n)$ to $O(1)$:

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
        """爬楼梯最小代价：空间优化后的动态规划"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        a, b = cost[1], cost[2]
        for i in range(3, n + 1):
            a, b = b, min(a, b) + cost[i]
        return b
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    int minCostClimbingStairsDPComp(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    int MinCostClimbingStairsDPComp(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.Min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    func minCostClimbingStairsDPComp(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // 初始状态：预设最小子问题的解
        a, b := cost[1], cost[2]
        // 状态转移：从较小子问题逐步求解较大子问题
        for i := 3; i <= n; i++ {
            tmp := b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        var (a, b) = (cost[1], cost[2])
        for i in 3 ... n {
            (a, b) = (b, min(a, b) + cost[i])
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* 爬楼梯最小代价：状态压缩后的动态规划 */
    function minCostClimbingStairsDPComp(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* 爬楼梯最小代价：状态压缩后的动态规划 */
    function minCostClimbingStairsDPComp(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    int minCostClimbingStairsDPComp(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      int a = cost[1], b = cost[2];
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        };
        let (mut a, mut b) = (cost[1], cost[2]);
        for i in 3..=n {
            let tmp = b;
            b = cmp::min(a, tmp) + cost[i];
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    int minCostClimbingStairsDPComp(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = myMin(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* 爬楼梯最小代价：空间优化后的动态规划 */
    fun minCostClimbingStairsDPComp(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        var a = cost[1]
        var b = cost[2]
        for (i in 3..n) {
            val tmp = b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    [class]{}-[func]{min_cost_climbing_stairs_dp_comp}
    ```

=== "Zig"

    ```zig title="min_cost_climbing_stairs_dp.zig"
    // 爬楼梯最小代价：空间优化后的动态规划
    fn minCostClimbingStairsDPComp(cost: []i32) i32 {
        var n = cost.len - 1;
        if (n == 1 or n == 2) {
            return cost[n];
        }
        var a = cost[1];
        var b = cost[2];
        // 状态转移：从较小子问题逐步求解较大子问题
        for (3..n + 1) |i| {
            var tmp = b;
            b = @min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%E6%9C%80%E5%B0%8F%E4%BB%A3%E4%BB%B7%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a,%20b%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20min%28a,%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%A5%BC%E6%A2%AF%E7%9A%84%E4%BB%A3%E4%BB%B7%E5%88%97%E8%A1%A8%E4%B8%BA%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%E7%88%AC%E5%AE%8C%E6%A5%BC%E6%A2%AF%E7%9A%84%E6%9C%80%E4%BD%8E%E4%BB%A3%E4%BB%B7%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%E6%9C%80%E5%B0%8F%E4%BB%A3%E4%BB%B7%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a,%20b%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20min%28a,%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%A5%BC%E6%A2%AF%E7%9A%84%E4%BB%A3%E4%BB%B7%E5%88%97%E8%A1%A8%E4%B8%BA%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%E7%88%AC%E5%AE%8C%E6%A5%BC%E6%A2%AF%E7%9A%84%E6%9C%80%E4%BD%8E%E4%BB%A3%E4%BB%B7%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 14.2.2 &nbsp; Statelessness

Statelessness is one of the important characteristics that make dynamic programming effective in solving problems. Its definition is: **Given a certain state, its future development is only related to the current state and unrelated to all past states experienced**.

Taking the stair climbing problem as an example, given state $i$, it will develop into states $i+1$ and $i+2$, corresponding to jumping 1 step and 2 steps respectively. When making these two choices, we do not need to consider the states before state $i$, as they do not affect the future of state $i$.

However, if we add a constraint to the stair climbing problem, the situation changes.

!!! question "Stair climbing with constraints"

    Given a staircase with $n$ steps, you can go up 1 or 2 steps each time, **but you cannot jump 1 step twice in a row**. How many ways are there to climb to the top?

As shown in the Figure 14-8 , there are only 2 feasible options for climbing to the 3rd step, among which the option of jumping 1 step three times in a row does not meet the constraint condition and is therefore discarded.

![Number of feasible options for climbing to the 3rd step with constraints](dp_problem_features.assets/climbing_stairs_constraint_example.png){ class="animation-figure" }

<p align="center"> Figure 14-8 &nbsp; Number of feasible options for climbing to the 3rd step with constraints </p>

In this problem, if the last round was a jump of 1 step, then the next round must be a jump of 2 steps. This means that **the next step choice cannot be independently determined by the current state (current stair step), but also depends on the previous state (last round's stair step)**.

It is not difficult to find that this problem no longer satisfies statelessness, and the state transition equation $dp[i] = dp[i-1] + dp[i-2]$ also fails, because $dp[i-1]$ represents this round's jump of 1 step, but it includes many "last round was a jump of 1 step" options, which, to meet the constraint, cannot be directly included in $dp[i]$.

For this, we need to expand the state definition: **State $[i, j]$ represents being on the $i$-th step and the last round was a jump of $j$ steps**, where $j \in \{1, 2\}$. This state definition effectively distinguishes whether the last round was a jump of 1 step or 2 steps, and we can judge accordingly where the current state came from.

- When the last round was a jump of 1 step, the round before last could only choose to jump 2 steps, that is, $dp[i, 1]$ can only be transferred from $dp[i-1, 2]$.
- When the last round was a jump of 2 steps, the round before last could choose to jump 1 step or 2 steps, that is, $dp[i, 2]$ can be transferred from $dp[i-2, 1]$ or $dp[i-2, 2]$.

As shown in the Figure 14-9 , $dp[i, j]$ represents the number of solutions for state $[i, j]$. At this point, the state transition equation is:

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![Recursive relationship considering constraints](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png){ class="animation-figure" }

<p align="center"> Figure 14-9 &nbsp; Recursive relationship considering constraints </p>

In the end, returning $dp[n, 1] + dp[n, 2]$ will do, the sum of the two representing the total number of solutions for climbing to the $n$-th step:

=== "Python"

    ```python title="climbing_stairs_constraint_dp.py"
    def climbing_stairs_constraint_dp(n: int) -> int:
        """带约束爬楼梯：动态规划"""
        if n == 1 or n == 2:
            return 1
        # 初始化 dp 表，用于存储子问题的解
        dp = [[0] * 3 for _ in range(n + 1)]
        # 初始状态：预设最小子问题的解
        dp[1][1], dp[1][2] = 1, 0
        dp[2][1], dp[2][2] = 0, 1
        # 状态转移：从较小子问题逐步求解较大子问题
        for i in range(3, n + 1):
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        return dp[n][1] + dp[n][2]
    ```

=== "C++"

    ```cpp title="climbing_stairs_constraint_dp.cpp"
    /* 带约束爬楼梯：动态规划 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        vector<vector<int>> dp(n + 1, vector<int>(3, 0));
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_constraint_dp.java"
    /* 带约束爬楼梯：动态规划 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        int[][] dp = new int[n + 1][3];
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_constraint_dp.cs"
    /* 带约束爬楼梯：动态规划 */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        int[,] dp = new int[n + 1, 3];
        // 初始状态：预设最小子问题的解
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_constraint_dp.go"
    /* 带约束爬楼梯：动态规划 */
    func climbingStairsConstraintDP(n int) int {
        if n == 1 || n == 2 {
            return 1
        }
        // 初始化 dp 表，用于存储子问题的解
        dp := make([][3]int, n+1)
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 状态转移：从较小子问题逐步求解较大子问题
        for i := 3; i <= n; i++ {
            dp[i][1] = dp[i-1][2]
            dp[i][2] = dp[i-2][1] + dp[i-2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_constraint_dp.swift"
    /* 带约束爬楼梯：动态规划 */
    func climbingStairsConstraintDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return 1
        }
        // 初始化 dp 表，用于存储子问题的解
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 状态转移：从较小子问题逐步求解较大子问题
        for i in 3 ... n {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_constraint_dp.js"
    /* 带约束爬楼梯：动态规划 */
    function climbingStairsConstraintDP(n) {
        if (n === 1 || n === 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        const dp = Array.from(new Array(n + 1), () => new Array(3));
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_constraint_dp.ts"
    /* 带约束爬楼梯：动态规划 */
    function climbingStairsConstraintDP(n: number): number {
        if (n === 1 || n === 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        const dp = Array.from({ length: n + 1 }, () => new Array(3));
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_constraint_dp.dart"
    /* 带约束爬楼梯：动态规划 */
    int climbingStairsConstraintDP(int n) {
      if (n == 1 || n == 2) {
        return 1;
      }
      // 初始化 dp 表，用于存储子问题的解
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
      // 初始状态：预设最小子问题的解
      dp[1][1] = 1;
      dp[1][2] = 0;
      dp[2][1] = 0;
      dp[2][2] = 1;
      // 状态转移：从较小子问题逐步求解较大子问题
      for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
      }
      return dp[n][1] + dp[n][2];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_constraint_dp.rs"
    /* 带约束爬楼梯：动态规划 */
    fn climbing_stairs_constraint_dp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return 1;
        };
        // 初始化 dp 表，用于存储子问题的解
        let mut dp = vec![vec![-1; 3]; n + 1];
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for i in 3..=n {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        dp[n][1] + dp[n][2]
    }
    ```

=== "C"

    ```c title="climbing_stairs_constraint_dp.c"
    /* 带约束爬楼梯：动态规划 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(3, sizeof(int));
        }
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        int res = dp[n][1] + dp[n][2];
        // 释放内存
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_constraint_dp.kt"
    /* 带约束爬楼梯：动态规划 */
    fun climbingStairsConstraintDP(n: Int): Int {
        if (n == 1 || n == 2) {
            return 1
        }
        // 初始化 dp 表，用于存储子问题的解
        val dp = Array(n + 1) { IntArray(3) }
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 状态转移：从较小子问题逐步求解较大子问题
        for (i in 3..n) {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_constraint_dp.rb"
    [class]{}-[func]{climbing_stairs_constraint_dp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_constraint_dp.zig"
    // 带约束爬楼梯：动态规划
    fn climbingStairsConstraintDP(comptime n: usize) i32 {
        if (n == 1 or n == 2) {
            return 1;
        }
        // 初始化 dp 表，用于存储子问题的解
        var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
        // 初始状态：预设最小子问题的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (3..n + 1) |i| {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B8%A6%E7%BA%A6%E6%9D%9F%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E5%82%A8%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%EF%BC%9A%E9%A2%84%E8%AE%BE%E6%9C%80%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D%5B1%5D,%20dp%5B1%5D%5B2%5D%20%3D%201,%200%0A%20%20%20%20dp%5B2%5D%5B1%5D,%20dp%5B2%5D%5B2%5D%20%3D%200,%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E4%BB%8E%E8%BE%83%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BE%83%E5%A4%A7%E5%AD%90%E9%97%AE%E9%A2%98%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%B8%A6%E7%BA%A6%E6%9D%9F%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E5%82%A8%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%EF%BC%9A%E9%A2%84%E8%AE%BE%E6%9C%80%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D%5B1%5D,%20dp%5B1%5D%5B2%5D%20%3D%201,%200%0A%20%20%20%20dp%5B2%5D%5B1%5D,%20dp%5B2%5D%5B2%5D%20%3D%200,%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E4%BB%8E%E8%BE%83%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BE%83%E5%A4%A7%E5%AD%90%E9%97%AE%E9%A2%98%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

In the above cases, since we only need to consider the previous state, we can still meet the statelessness by expanding the state definition. However, some problems have very serious "state effects".

!!! question "Stair climbing with obstacle generation"

    Given a staircase with $n$ steps, you can go up 1 or 2 steps each time. **It is stipulated that when climbing to the $i$-th step, the system automatically places an obstacle on the $2i$-th step, and thereafter all rounds are not allowed to jump to the $2i$-th step**. For example, if the first two rounds jump to the 2nd and 3rd steps, then later you cannot jump to the 4th and 6th steps. How many ways are there to climb to the top?

In this problem, the next jump depends on all past states, as each jump places obstacles on higher steps, affecting future jumps. For such problems, dynamic programming often struggles to solve.

In fact, many complex combinatorial optimization problems (such as the traveling salesman problem) do not satisfy statelessness. For these kinds of problems, we usually choose to use other methods, such as heuristic search, genetic algorithms, reinforcement learning, etc., to obtain usable local optimal solutions within a limited time.
