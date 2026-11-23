/**
* File: climbing_stairs_constraint_dp.cs
* Created Time: 2023-07-03
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* Climbing stairs with constraints: dynamic programming */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Initialize the dp table to store subproblem solutions
        int[,] dp = new int[n + 1, 3];
        // Initial states: set the solutions to the smallest subproblems
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // State transitions: solve progressively larger subproblems using smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsConstraintDP(n);
        Console.WriteLine($"Number of ways to climb {n} stairs: {res}");
    }
}
