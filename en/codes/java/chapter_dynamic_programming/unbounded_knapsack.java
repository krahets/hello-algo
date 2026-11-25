/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* Unbounded knapsack with dynamic programming */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize the dp table
        int[][] dp = new int[n + 1][cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Skip item i if its weight exceeds the capacity
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Take the larger value from skipping or taking item i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Unbounded knapsack with space-optimized dynamic programming */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize the dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Skip item i if its weight exceeds the capacity
                    dp[c] = dp[c];
                } else {
                    // Take the larger value from skipping or taking item i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 1, 2, 3 };
        int[] val = { 5, 11, 15 };
        int cap = 4;

        // Dynamic programming
        int res = unboundedKnapsackDP(wgt, val, cap);
        System.out.println("Maximum total item value within the weight limit: " + res);

        // Space-optimized dynamic programming
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("Maximum total item value within the weight limit: " + res);
    }
}
