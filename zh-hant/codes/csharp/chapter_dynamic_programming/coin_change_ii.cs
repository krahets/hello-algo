/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* 零錢兌換 II：動態規劃 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, amt + 1];
        // 初始化首列
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
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

        // 動態規劃
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("湊出目標金額的硬幣組合數量為 " + res);

        // 空間最佳化後的動態規劃
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("湊出目標金額的硬幣組合數量為 " + res);
    }
}
