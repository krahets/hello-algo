/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* 零钱兑换 II：动态规划 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, amt + 1];
        // 初始化首列
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超过目标金额，则不选硬币 i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 不选和选硬币 i 这两种方案之和
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* 零钱兑换 II：空间优化后的动态规划 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超过目标金额，则不选硬币 i
                    dp[a] = dp[a];
                } else {
                    // 不选和选硬币 i 这两种方案之和
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

        // 动态规划
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("凑出目标金额的硬币组合数量为 " + res);

        // 空间优化后的动态规划
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("凑出目标金额的硬币组合数量为 " + res);
    }
}
