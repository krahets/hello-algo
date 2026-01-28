/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* Coin change II: Dynamic programming */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // Initialize dp table
        int[,] dp = new int[n + 1, amt + 1];
        // Initialize first column
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeds target amount, don't select coin i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Sum of the two options: not selecting and selecting coin i
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* Coin change II: Space-optimized dynamic programming */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // Initialize dp table
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // If exceeds target amount, don't select coin i
                    dp[a] = dp[a];
                } else {
                    // Sum of the two options: not selecting and selecting coin i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 5;

        // Dynamic programming
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("Number of coin combinations to make target amount is " + res);

        // Space-optimized dynamic programming
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("Number of coin combinations to make target amount is " + res);
    }
}
