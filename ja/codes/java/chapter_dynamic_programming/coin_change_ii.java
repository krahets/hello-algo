/**
 * File: coin_change_ii.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class coin_change_ii {
    /* 硬貨の両替 II：動的計画法 */
    static int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // dp テーブルを初期化する
        int[][] dp = new int[n + 1][amt + 1];
        // 先頭列を初期化する
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }

    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    static int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // dp テーブルを初期化する
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 5;

        // 動的計画法
        int res = coinChangeIIDP(coins, amt);
        System.out.println("目標金額になる硬貨の組み合わせの数は " + res);

        // 空間を最適化した動的計画法
        res = coinChangeIIDPComp(coins, amt);
        System.out.println("目標金額になる硬貨の組み合わせの数は " + res);
    }
}
