/**
 * File: climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* Climbing stairs: Dynamic programming */
    public static int climbingStairsDP(int n) {
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

    /* Climbing stairs: Space-optimized dynamic programming */
    public static int climbingStairsDPComp(int n) {
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

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDP(n);
        System.out.println(String.format("There are %d solutions to climb %d stairs", n, res));

        res = climbingStairsDPComp(n);
        System.out.println(String.format("There are %d solutions to climb %d stairs", n, res));
    }
}
