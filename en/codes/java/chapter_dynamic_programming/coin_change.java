/**
 * File: coin_change.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class coin_change {
    /* Coin change: Dynamic programming */
    static int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Initialize dp table
        int[][] dp = new int[n + 1][amt + 1];
        // State transition: first row and first column
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // State transition: the rest of the rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // The smaller value between not choosing and choosing coin i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }

    /* Coin change: Space-optimized dynamic programming */
    static int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Initialize dp table
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeding the target amount, do not choose coin i
                    dp[a] = dp[a];
                } else {
                    // The smaller value between not choosing and choosing coin i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 4;

        // Dynamic programming
        int res = coinChangeDP(coins, amt);
        System.out.println("The minimum number of coins required to make up the target amount is " + res);

        // Space-optimized dynamic programming
        res = coinChangeDPComp(coins, amt);
        System.out.println("The minimum number of coins required to make up the target amount is " + res);
    }
}
