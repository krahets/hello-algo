/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* Minimum path sum: Brute-force search */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // If it's the top-left cell, terminate the search
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // If row or column index is out of bounds, return +∞ cost
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // Return the minimum path cost from top-left to (i, j)
        return Math.Min(left, up) + grid[i][j];
    }

    /* Minimum path sum: Memoization search */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // If it's the top-left cell, terminate the search
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // If row or column index is out of bounds, return +∞ cost
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // If there's a record, return it directly
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // Minimum path cost for left and upper cells
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // Record and return the minimum path cost from top-left to (i, j)
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* Minimum path sum: Dynamic programming */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Initialize dp table
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // State transition: first row
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // State transition: first column
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // State transition: rest of the rows and columns
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }

    /* Minimum path sum: Space-optimized dynamic programming */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Initialize dp table
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // State transition: first row
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // State transition: rest of the rows
        for (int i = 1; i < n; i++) {
            // State transition: first column
            dp[0] = dp[0] + grid[i][0];
            // State transition: rest of the columns
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
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);

        // Memoization search
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);

        // Dynamic programming
        res = MinPathSumDP(grid);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);

        // Space-optimized dynamic programming
        res = MinPathSumDPComp(grid);
        Console.WriteLine("Minimum path sum from top-left to bottom-right is " + res);
    }
}
