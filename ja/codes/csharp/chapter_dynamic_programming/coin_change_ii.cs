/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* コイン両替 II：動的計画法 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // dp テーブルを初期化
        int[,] dp = new int[n + 1, amt + 1];
        // 先頭列を初期化する
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超えるなら硬貨 i は選ばない
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // コイン i を選ばない場合と選ぶ場合の和
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* コイン両替 II：空間最適化した動的計画法 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // dp テーブルを初期化
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超えるなら硬貨 i は選ばない
                    dp[a] = dp[a];
                } else {
                    // コイン i を選ばない場合と選ぶ場合の和
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

        // 動的計画法
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("目標金額を作る硬貨の組み合わせ数は " + res);

        // 空間最適化後の動的計画法
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("目標金額を作る硬貨の組み合わせ数は " + res);
    }
}
