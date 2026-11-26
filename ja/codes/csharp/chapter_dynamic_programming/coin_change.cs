/**
* File: coin_change.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change {
    /* 硬貨の両替：動的計画法 */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int[,] dp = new int[n + 1, amt + 1];
        // 状態遷移：先頭行と先頭列
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合は硬貨 i を使わない
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 硬貨 i を使う場合と使わない場合の小さい方を取る
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }

    /* 硬貨の両替：使用メモリを削減した動的計画法 */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合は硬貨 i を使わない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を使う場合と使わない場合の小さい方を取る
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

        // 動的計画法
        int res = CoinChangeDP(coins, amt);
        Console.WriteLine("目標金額を作るのに必要な硬貨の最少枚数は " + res);

        // 使用メモリを削減した動的計画法
        res = CoinChangeDPComp(coins, amt);
        Console.WriteLine("目標金額を作るのに必要な硬貨の最少枚数は " + res);
    }
}
