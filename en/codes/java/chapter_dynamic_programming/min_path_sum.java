/**
 * File: min_path_sum.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_path_sum {
    /* Minimum path sum with brute-force search */
    static int minPathSumDFS(int[][] grid, int i, int j) {
        // Stop searching at the top-left cell
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Return a cost of +∞ if either index is out of bounds
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // Find the minimum path costs from the top left to (i-1, j) and (i, j-1)
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // Return the minimum path cost from the top left to (i, j)
        return Math.min(left, up) + grid[i][j];
    }

    /* Minimum path sum with memoized search */
    static int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // Stop searching at the top-left cell
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Return a cost of +∞ if either index is out of bounds
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // Return the cached result if available
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // Minimum path costs for the cells to the left and above
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // Cache and return the minimum path cost from the top left to (i, j)
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* Minimum path sum with dynamic programming */
    static int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // Initialize the dp table
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // State transitions for the first row
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // State transitions for the first column
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // State transitions for the remaining rows and columns
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }

    /* Minimum path sum with space-optimized dynamic programming */
    static int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // Initialize the dp table
        int[] dp = new int[m];
        // State transitions for the first row
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // State transitions for the remaining rows
        for (int i = 1; i < n; i++) {
            // State transitions for the first column
            dp[0] = dp[0] + grid[i][0];
            // State transitions for the remaining columns
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

        // Brute-force search
        int res = minPathSumDFS(grid, n - 1, m - 1);
        System.out.println("Minimum path sum from the top left to the bottom right: " + res);

        // Memoized search
        int[][] mem = new int[n][m];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
        System.out.println("Minimum path sum from the top left to the bottom right: " + res);

        // Dynamic programming
        res = minPathSumDP(grid);
        System.out.println("Minimum path sum from the top left to the bottom right: " + res);

        // Space-optimized dynamic programming
        res = minPathSumDPComp(grid);
        System.out.println("Minimum path sum from the top left to the bottom right: " + res);
    }
}
