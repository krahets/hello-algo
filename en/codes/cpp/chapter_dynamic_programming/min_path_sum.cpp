/**
 * File: min_path_sum.cpp
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Minimum path sum: Brute force search */
int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
    // If it's the top-left cell, terminate the search
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // If the row or column index is out of bounds, return a +∞ cost
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Calculate the minimum path cost from the top-left to (i-1, j) and (i, j-1)
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // Return the minimum path cost from the top-left to (i, j)
    return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
}

/* Minimum path sum: Memoized search */
int minPathSumDFSMem(vector<vector<int>> &grid, vector<vector<int>> &mem, int i, int j) {
    // If it's the top-left cell, terminate the search
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // If the row or column index is out of bounds, return a +∞ cost
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // If there is a record, return it
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // The minimum path cost from the left and top cells
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Record and return the minimum path cost from the top-left to (i, j)
    mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* Minimum path sum: Dynamic programming */
int minPathSumDP(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // Initialize dp table
    vector<vector<int>> dp(n, vector<int>(m));
    dp[0][0] = grid[0][0];
    // State transition: first row
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transition: first column
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transition: the rest of the rows and columns
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Minimum path sum: Space-optimized dynamic programming */
int minPathSumDPComp(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // Initialize dp table
    vector<int> dp(m);
    // State transition: first row
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transition: the rest of the rows
    for (int i = 1; i < n; i++) {
        // State transition: first column
        dp[0] = dp[0] + grid[i][0];
        // State transition: the rest of the columns
        for (int j = 1; j < m; j++) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
int main() {
    vector<vector<int>> grid = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = grid.size(), m = grid[0].size();

    // Brute force search
    int res = minPathSumDFS(grid, n - 1, m - 1);
    cout << "The minimum path sum from the top left corner to the bottom right corner is " << res << endl;

    // Memoized search
    vector<vector<int>> mem(n, vector<int>(m, -1));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    cout << "The minimum path sum from the top left corner to the bottom right corner is " << res << endl;

    // Dynamic programming
    res = minPathSumDP(grid);
    cout << "The minimum path sum from the top left corner to the bottom right corner is " << res << endl;

    // Space-optimized dynamic programming
    res = minPathSumDPComp(grid);
    cout << "The minimum path sum from the top left corner to the bottom right corner is " << res << endl;

    return 0;
}
