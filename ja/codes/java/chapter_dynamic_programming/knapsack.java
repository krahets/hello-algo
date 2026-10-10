/**
 * File: knapsack.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class knapsack {

    /* 0-1 ナップサック：総当たり探索 */
    static int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return Math.max(no, yes);
    }

    /* 0-1 ナップサック：メモ化探索 */
    static int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }

    /* 0-1 ナップサック：動的計画法 */
    static int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp テーブルを初期化
        int[][] dp = new int[n + 1][cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    static int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp テーブルを初期化
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順に走査する
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;
        int n = wgt.length;

        // 全探索
        int res = knapsackDFS(wgt, val, n, cap);
        System.out.println("ナップサック容量を超えない最大価値は " + res);

        // メモ化探索
        int[][] mem = new int[n + 1][cap + 1];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = knapsackDFSMem(wgt, val, mem, n, cap);
        System.out.println("ナップサック容量を超えない最大価値は " + res);

        // 動的計画法
        res = knapsackDP(wgt, val, cap);
        System.out.println("ナップサック容量を超えない最大価値は " + res);

        // 空間最適化後の動的計画法
        res = knapsackDPComp(wgt, val, cap);
        System.out.println("ナップサック容量を超えない最大価値は " + res);
    }
}
