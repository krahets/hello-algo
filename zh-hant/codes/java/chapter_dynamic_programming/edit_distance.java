/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* 編輯距離：暴力搜尋 */
    static int editDistanceDFS(String s, String t, int i, int j) {
        // 若 s 和 t 都為空，則返回 0
        if (i == 0 && j == 0)
            return 0;
        // 若 s 為空，則返回 t 長度
        if (i == 0)
            return j;
        // 若 t 為空，則返回 s 長度
        if (j == 0)
            return i;
        // 若兩字元相等，則直接跳過此兩字元
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // 返回最少編輯步數
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* 編輯距離：記憶化搜尋 */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
        // 若 s 和 t 都為空，則返回 0
        if (i == 0 && j == 0)
            return 0;
        // 若 s 為空，則返回 t 長度
        if (i == 0)
            return j;
        // 若 t 為空，則返回 s 長度
        if (j == 0)
            return i;
        // 若已有記錄，則直接返回之
        if (mem[i][j] != -1)
            return mem[i][j];
        // 若兩字元相等，則直接跳過此兩字元
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 記錄並返回最少編輯步數
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 編輯距離：動態規劃 */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // 狀態轉移：首行首列
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* 編輯距離：空間最佳化後的動態規劃 */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // 狀態轉移：首行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (int i = 1; i <= n; i++) {
            // 狀態轉移：首列
            int leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // 暴力搜尋
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("將 " + s + " 更改為 " + t + " 最少需要編輯 " + res + " 步");

        // 記憶化搜尋
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("將 " + s + " 更改為 " + t + " 最少需要編輯 " + res + " 步");

        // 動態規劃
        res = editDistanceDP(s, t);
        System.out.println("將 " + s + " 更改為 " + t + " 最少需要編輯 " + res + " 步");

        // 空間最佳化後的動態規劃
        res = editDistanceDPComp(s, t);
        System.out.println("將 " + s + " 更改為 " + t + " 最少需要編輯 " + res + " 步");
    }
}
