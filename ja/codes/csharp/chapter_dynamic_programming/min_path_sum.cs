/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* 最小経路和：全探索 */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
        return Math.Min(left, up) + grid[i][j];
    }

    /* 最小経路和：メモ化探索 */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* 最小経路和：動的計画法 */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp テーブルを初期化
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // 状態遷移: 残りの行と列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }

    /* 最小経路和：空間最適化後の動的計画法 */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp テーブルを初期化
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
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

        // 全探索
        int res = MinPathSumDFS(grid, n - 1, m - 1);
        Console.WriteLine("左上から右下までの最小経路和は " + res);

        // メモ化探索
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("左上から右下までの最小経路和は " + res);

        // 動的計画法
        res = MinPathSumDP(grid);
        Console.WriteLine("左上から右下までの最小経路和は " + res);

        // 空間最適化後の動的計画法
        res = MinPathSumDPComp(grid);
        Console.WriteLine("左上から右下までの最小経路和は " + res);
    }
}
