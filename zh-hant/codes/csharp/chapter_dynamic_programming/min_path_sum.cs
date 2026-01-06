/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* 最小路徑和：暴力搜尋 */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // 若為左上角單元格，則終止搜尋
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 若行列索引越界，則返回 +∞ 代價
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // 返回從左上角到 (i, j) 的最小路徑代價
        return Math.Min(left, up) + grid[i][j];
    }

    /* 最小路徑和：記憶化搜尋 */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 若為左上角單元格，則終止搜尋
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 若行列索引越界，則返回 +∞ 代價
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 若已有記錄，則直接返回
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左邊和上邊單元格的最小路徑代價
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // 記錄並返回左上角到 (i, j) 的最小路徑代價
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* 最小路徑和：動態規劃 */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // 初始化 dp 表
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // 狀態轉移：首行
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // 狀態轉移：首列
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }

    /* 最小路徑和：空間最佳化後的動態規劃 */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // 初始化 dp 表
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // 狀態轉移：首行
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 狀態轉移：其餘行
        for (int i = 1; i < n; i++) {
            // 狀態轉移：首列
            dp[0] = dp[0] + grid[i][0];
            // 狀態轉移：其餘列
            for (int j = 1; j < m; j++) {
                dp[j] = Math.Min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    [Test]
    public void Test() {
        int[][] grid =
        [
            [1, 3, 1, 5],
            [2, 2, 4, 2],
            [5, 3, 2, 1],
            [4, 3, 5, 2]
        ];

        int n = grid.Length, m = grid[0].Length;

        // 暴力搜尋
        int res = MinPathSumDFS(grid, n - 1, m - 1);
        Console.WriteLine("從左上角到右下角的最小路徑和為 " + res);

        // 記憶化搜尋
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("從左上角到右下角的最小路徑和為 " + res);

        // 動態規劃
        res = MinPathSumDP(grid);
        Console.WriteLine("從左上角到右下角的最小路徑和為 " + res);

        // 空間最佳化後的動態規劃
        res = MinPathSumDPComp(grid);
        Console.WriteLine("從左上角到右下角的最小路徑和為 " + res);
    }
}
