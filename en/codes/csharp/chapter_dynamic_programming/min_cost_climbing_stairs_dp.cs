/**
* File: min_cost_climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_cost_climbing_stairs_dp {
    /* Minimum cost climbing stairs: Dynamic programming */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Initialize dp table, used to store solutions to subproblems
        int[] dp = new int[n + 1];
        // Initial state: preset the solution to the smallest subproblem
        dp[1] = cost[1];
        dp[2] = cost[2];
        // State transition: gradually solve larger subproblems from smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* Minimum cost climbing stairs: Space-optimized dynamic programming */
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
        Console.WriteLine("Input stair cost list is");
        PrintUtil.PrintList(cost);

        int res = MinCostClimbingStairsDP(cost);
        Console.WriteLine($"Minimum cost to climb stairs is {res}");

        res = MinCostClimbingStairsDPComp(cost);
        Console.WriteLine($"Minimum cost to climb stairs is {res}");
    }
}
