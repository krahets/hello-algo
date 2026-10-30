/**
* File: min_cost_climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_cost_climbing_stairs_dp {
    /* Minimum cost to climb stairs: dynamic programming */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Initialize the dp table to store subproblem solutions
        int[] dp = new int[n + 1];
        // Initial states: set the solutions to the smallest subproblems
        dp[1] = cost[1];
        dp[2] = cost[2];
        // State transitions: solve progressively larger subproblems using smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* Minimum cost to climb stairs: space-optimized dynamic programming */
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

    [Test]
    public void Test() {
        int[] cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
        Console.WriteLine("Input stair costs:");
        PrintUtil.PrintList(cost);

        int res = MinCostClimbingStairsDP(cost);
        Console.WriteLine($"Minimum cost to finish climbing the stairs: {res}");

        res = MinCostClimbingStairsDPComp(cost);
        Console.WriteLine($"Minimum cost to finish climbing the stairs: {res}");
    }
}
