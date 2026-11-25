/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* 編集距離：全探索 */
    static int editDistanceDFS(String s, String t, int i, int j) {
        // s と t がともに空なら 0 を返す
        if (i == 0 && j == 0)
            return 0;
        // s が空なら t の長さを返す
        if (i == 0)
            return j;
        // t が空なら s の長さを返す
        if (j == 0)
            return i;
        // 2 文字が等しければ、両方とも読み飛ばす
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // 最少編集回数 = 挿入・削除・置換の各場合の編集回数の最小値 + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // 最少編集回数を返す
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* 編集距離：メモ化探索 */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
        // s と t がともに空なら 0 を返す
        if (i == 0 && j == 0)
            return 0;
        // s が空なら t の長さを返す
        if (i == 0)
            return j;
        // t が空なら s の長さを返す
        if (j == 0)
            return i;
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1)
            return mem[i][j];
        // 2 文字が等しければ、両方とも読み飛ばす
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最少編集回数 = 挿入・削除・置換の各場合の編集回数の最小値 + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最少編集回数を記録して返す
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 編集距離：動的計画法 */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // 状態遷移：先頭行と先頭列
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 2 文字が等しければ、両方とも読み飛ばす
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編集回数 = 挿入・削除・置換の各場合の編集回数の最小値 + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* 編集距離：使用メモリを削減した動的計画法 */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // 状態遷移：先頭行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 状態遷移：残りの行
        for (int i = 1; i <= n; i++) {
            // 状態遷移：先頭列
            int leftup = dp[0]; // dp[i-1, j-1] を一時保存する
            dp[0] = i;
            // 状態遷移：残りの列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 2 文字が等しければ、両方とも読み飛ばす
                    dp[j] = leftup;
                } else {
                    // 最少編集回数 = 挿入・削除・置換の各場合の編集回数の最小値 + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 次の反復で使う dp[i-1, j-1] に更新する
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // 全探索
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("文字列 " + s + " を " + t + " に変えるのに必要な最少編集回数は " + res + " 回");

        // メモ化探索
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("文字列 " + s + " を " + t + " に変えるのに必要な最少編集回数は " + res + " 回");

        // 動的計画法
        res = editDistanceDP(s, t);
        System.out.println("文字列 " + s + " を " + t + " に変えるのに必要な最少編集回数は " + res + " 回");

        // 使用メモリを削減した動的計画法
        res = editDistanceDPComp(s, t);
        System.out.println("文字列 " + s + " を " + t + " に変えるのに必要な最少編集回数は " + res + " 回");
    }
}
