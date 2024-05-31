/**
 * File: climbing_stairs_constraint_dp.java
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* Constrained climbing stairs: Dynamic programming */
    static int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Initialize dp table, used to store subproblem solutions
        int[][] dp = new int[n + 1][3];
        // Initial state: preset the smallest subproblem solution
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // State transition: gradually solve larger subproblems from smaller ones
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsConstraintDP(n);
        System.out.println(String.format("There are %d solutions to climb %d stairs", n, res));
    }
}
