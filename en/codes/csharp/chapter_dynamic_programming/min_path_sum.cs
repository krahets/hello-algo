/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* Minimum path sum with brute-force search */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // Stop searching at the top-left cell
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Return a cost of +∞ if either index is out of bounds
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Find the minimum path costs from the top left to (i-1, j) and (i, j-1)
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // Return the minimum path cost from the top left to (i, j)
        return Math.Min(left, up) + grid[i][j];
    }

    /* Minimum path sum with memoized search */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // Stop searching at the top-left cell
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Return a cost of +∞ if either index is out of bounds
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Return the cached result if available
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // Minimum path costs for the cells to the left and above
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // Cache and return the minimum path cost from the top left to (i, j)
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* Minimum path sum with dynamic programming */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Initialize the dp table
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // State transitions for the first row
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // State transitions for the first column
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // State transitions for the remaining rows and columns
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }

    /* Minimum path sum with space-optimized dynamic programming */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Initialize the dp table
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // State transitions for the first row
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // State transitions for the remaining rows
        for (int i = 1; i < n; i++) {
            // State transitions for the first column
            dp[0] = dp[0] + grid[i][0];
            // State transitions for the remaining columns
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

        // Brute-force search
        int res = MinPathSumDFS(grid, n - 1, m - 1);
        Console.WriteLine("Minimum path sum from the top left to the bottom right: " + res);

        // Memoized search
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("Minimum path sum from the top left to the bottom right: " + res);

        // Dynamic programming
        res = MinPathSumDP(grid);
        Console.WriteLine("Minimum path sum from the top left to the bottom right: " + res);

        // Space-optimized dynamic programming
        res = MinPathSumDPComp(grid);
        Console.WriteLine("Minimum path sum from the top left to the bottom right: " + res);
    }
}
