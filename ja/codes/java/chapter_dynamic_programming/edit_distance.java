/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* 編集距離：総当たり探索 */
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
        // 2 つの文字が等しければ、その 2 文字をそのままスキップする
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // 最小編集回数を返す
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
        // 記録済みなら、それをそのまま返す
        if (mem[i][j] != -1)
            return mem[i][j];
        // 2 つの文字が等しければ、その 2 文字をそのままスキップする
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最小編集回数を記録して返す
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
        // 状態遷移: 残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* 編集距離：空間最適化した動的計画法 */
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
                    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                    dp[j] = leftup;
                } else {
                    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 次の反復の dp[i-1, j-1] に更新する
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
        System.out.println(s + " を " + t + " に変更するには、最小で " + res + " 回の編集が必要");

        // メモ化探索
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println(s + " を " + t + " に変更するには、最小で " + res + " 回の編集が必要");

        // 動的計画法
        res = editDistanceDP(s, t);
        System.out.println(s + " を " + t + " に変更するには、最小で " + res + " 回の編集が必要");

        // 空間最適化後の動的計画法
        res = editDistanceDPComp(s, t);
        System.out.println(s + " を " + t + " に変更するには、最小で " + res + " 回の編集が必要");
    }
}
