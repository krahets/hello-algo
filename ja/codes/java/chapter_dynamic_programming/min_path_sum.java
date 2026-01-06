/**
 * File: min_path_sum.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_path_sum {
    /* 最小パス和：ブルートフォース探索 */
    static int minPathSumDFS(int[][] grid, int i, int j) {
        // 左上のセルの場合、探索を終了
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、+∞ のコストを返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 左上から (i-1, j) と (i, j-1) への最小パスコストを計算
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) への最小パスコストを返す
        return Math.min(left, up) + grid[i][j];
    }

    /* 最小パス和：メモ化探索 */
    static int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 左上のセルの場合、探索を終了
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、+∞ のコストを返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 記録がある場合、それを返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小パスコスト
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) への最小パスコストを記録して返す
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* 最小パス和：動的プログラミング */
    static int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // DPテーブルを初期化
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // 状態遷移：最初の行
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：最初の列
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }

    /* 最小パス和：空間最適化動的プログラミング */
    static int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // DPテーブルを初期化
        int[] dp = new int[m];
        // 状態遷移：最初の行
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：最初の列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (int j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    public static void main(String[] args) {
        int[][] grid = {
                { 1, 3, 1, 5 },
                { 2, 2, 4, 2 },
                { 5, 3, 2, 1 },
                { 4, 3, 5, 2 }
        };
        int n = grid.length, m = grid[0].length;

        // ブルートフォース探索
        int res = minPathSumDFS(grid, n - 1, m - 1);
        System.out.println("左上角から右下角への最小パス和は " + res + " です");

        // メモ化探索
        int[][] mem = new int[n][m];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
        System.out.println("左上角から右下角への最小パス和は " + res + " です");

        // 動的プログラミング
        res = minPathSumDP(grid);
        System.out.println("左上角から右下角への最小パス和は " + res + " です");

        // 空間最適化動的プログラミング
        res = minPathSumDPComp(grid);
        System.out.println("左上角から右下角への最小パス和は " + res + " です");
    }
}