/**
* File: coin_change.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change {
    /* Coin change with dynamic programming */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Initialize the dp table
        int[,] dp = new int[n + 1, amt + 1];
        // State transitions for the first row and column
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // State transitions for the remaining rows and columns
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Skip coin i if its value exceeds the target amount
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Take the minimum of the counts for skipping and taking coin i
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }

    /* Coin change with space-optimized dynamic programming */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Initialize the dp table
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Skip coin i if its value exceeds the target amount
                    dp[a] = dp[a];
                } else {
                    // Take the minimum of the counts for skipping and taking coin i
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 4;

        // Dynamic programming
        int res = CoinChangeDP(coins, amt);
        Console.WriteLine("Minimum number of coins needed to make the target amount: " + res);

        // Space-optimized dynamic programming
        res = CoinChangeDPComp(coins, amt);
        Console.WriteLine("Minimum number of coins needed to make the target amount: " + res);
    }
}
