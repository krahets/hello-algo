/**
 * File: coin_change_ii.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class coin_change_ii {
    /* 硬貨両替 II：動的プログラミング */
    static int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // DPテーブルを初期化
        int[][] dp = new int[n + 1][amt + 1];
        // 最初の列を初期化
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }

    /* 硬貨両替 II：空間最適化動的プログラミング */
    static int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // DPテーブルを初期化
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 5;

        // 動的プログラミング
        int res = coinChangeIIDP(coins, amt);
        System.out.println("目標金額を作る硬貨の組み合わせ数は " + res + " です");

        // 空間最適化動的プログラミング
        res = coinChangeIIDPComp(coins, amt);
        System.out.println("目標金額を作る硬貨の組み合わせ数は " + res + " です");
    }
}