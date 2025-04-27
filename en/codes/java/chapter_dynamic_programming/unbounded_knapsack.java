/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* Complete knapsack: Dynamic programming */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize dp table
        int[][] dp = new int[n + 1][cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Complete knapsack: Space-optimized dynamic programming */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[c] = dp[c];
                } else {
                    // The greater value between not choosing and choosing item i
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
        System.out.println("The maximum value within the bag capacity is " + res);

        // Space-optimized dynamic programming
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("The maximum value within the bag capacity is " + res);
    }
}
