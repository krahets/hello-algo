/**
 * File: min_path_sum.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_path_sum {
    /* 最小路徑和：暴力搜尋 */
    static int minPathSumDFS(int[][] grid, int i, int j) {
        // 若已到達左上角的格子，就結束搜尋
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 若列或欄的索引超出範圍，就回傳成本 +∞
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑成本
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 回傳從左上角到 (i, j) 的最小路徑成本
        return Math.min(left, up) + grid[i][j];
    }

    /* 最小路徑和：記憶化搜尋 */
    static int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 若已到達左上角的格子，就結束搜尋
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 若列或欄的索引超出範圍，就回傳成本 +∞
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 若已有紀錄，直接回傳該值
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左方與上方格子的最小路徑成本
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 記錄並回傳從左上角到 (i, j) 的最小路徑成本
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* 最小路徑和：動態規劃 */
    static int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // 初始化 dp 表
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // 狀態轉移：第一列
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 狀態轉移：第一欄
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 狀態轉移：其餘各列與各欄
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }

    /* 最小路徑和：空間最佳化後的動態規劃 */
    static int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // 初始化 dp 表
        int[] dp = new int[m];
        // 狀態轉移：第一列
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 狀態轉移：其餘各列
        for (int i = 1; i < n; i++) {
            // 狀態轉移：第一欄
            dp[0] = dp[0] + grid[i][0];
            // 狀態轉移：其餘各欄
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

        // 暴力搜尋
        int res = minPathSumDFS(grid, n - 1, m - 1);
        System.out.println("從左上角到右下角的最小路徑和為 " + res);

        // 記憶化搜尋
        int[][] mem = new int[n][m];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
        System.out.println("從左上角到右下角的最小路徑和為 " + res);

        // 動態規劃
        res = minPathSumDP(grid);
        System.out.println("從左上角到右下角的最小路徑和為 " + res);

        // 空間最佳化後的動態規劃
        res = minPathSumDPComp(grid);
        System.out.println("從左上角到右下角的最小路徑和為 " + res);
    }
}
