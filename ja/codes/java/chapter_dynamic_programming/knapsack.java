/**
 * File: knapsack.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class knapsack {

    /* 0-1 ナップサック：ブルートフォース探索 */
    static int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // すべてのアイテムが選択されたか、ナップサックに残り容量がない場合、値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサックの容量を超える場合、ナップサックに入れないことしか選択できない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // アイテム i を入れない場合と入れる場合の最大値を計算
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの選択肢のより大きい値を返す
        return Math.max(no, yes);
    }

    /* 0-1 ナップサック：メモ化探索 */
    static int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // すべてのアイテムが選択されたか、ナップサックに残り容量がない場合、値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 記録がある場合、それを返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサックの容量を超える場合、ナップサックに入れないことしか選択できない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // アイテム i を入れない場合と入れる場合の最大値を計算
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの選択肢のより大きい値を記録して返す
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }

    /* 0-1 ナップサック：動的プログラミング */
    static int knapsackDP(int[] wgt, int[] val, int cap) {
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
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* 0-1 ナップサック：空間最適化動的プログラミング */
    static int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // DPテーブルを初期化
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順で走査
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
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

        // ブルートフォース探索
        int res = knapsackDFS(wgt, val, n, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");

        // メモ化探索
        int[][] mem = new int[n + 1][cap + 1];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = knapsackDFSMem(wgt, val, mem, n, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");

        // 動的プログラミング
        res = knapsackDP(wgt, val, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");

        // 空間最適化動的プログラミング
        res = knapsackDPComp(wgt, val, cap);
        System.out.println("ナップサック容量内での最大値は " + res + " です");
    }
}