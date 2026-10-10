/**
 * File: coin_change.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class coin_change {
    /* コイン両替：動的計画法 */
    static int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // dp テーブルを初期化
        int[][] dp = new int[n + 1][amt + 1];
        // 状態遷移：先頭行と先頭列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移: 残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超えるなら硬貨 i は選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }

    /* コイン交換：空間最適化後の動的計画法 */
    static int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // dp テーブルを初期化
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超えるなら硬貨 i は選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 4;

        // 動的計画法
        int res = coinChangeDP(coins, amt);
        System.out.println("目標金額に必要な最小硬貨枚数は " + res);

        // 空間最適化後の動的計画法
        res = coinChangeDPComp(coins, amt);
        System.out.println("目標金額に必要な最小硬貨枚数は " + res);
    }
}
