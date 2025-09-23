/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* 完全ナップサック：動的プログラミング */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // DPテーブルを初期化
        int[][] dp = new int[n + 1][cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、アイテム i を選択しない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* 完全ナップサック：空間最適化動的プログラミング */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // DPテーブルを初期化
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、アイテム i を選択しない
                    dp[c] = dp[c];
                } else {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 1, 2, 3 };
        int[] val = { 5, 11, 15 };
        int cap = 4;

        // 動的プログラミング
        int res = unboundedKnapsackDP(wgt, val, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");

        // 空間最適化動的プログラミング
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");
    }
}