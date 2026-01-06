/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

// Assume max matrix rows and columns is 100
#define MAX_SIZE 100

/* Find minimum value */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Minimum path sum: Brute-force search */
int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
    // If it's the top-left cell, terminate the search
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // If row or column index is out of bounds, return +∞ cost
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // Return the minimum path cost from top-left to (i, j)
    return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
}

/* Minimum path sum: Memoization search */
int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
    // If it's the top-left cell, terminate the search
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // If row or column index is out of bounds, return +∞ cost
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // If there's a record, return it directly
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Minimum path cost for left and upper cells
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Record and return the minimum path cost from top-left to (i, j)
    mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* Minimum path sum: Dynamic programming */
int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // Initialize dp table
    int **dp = malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        dp[i] = calloc(m, sizeof(int));
    }
    dp[0][0] = grid[0][0];
    // State transition: first row
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transition: first column
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transition: rest of the rows and columns
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = myMin(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    int res = dp[n - 1][m - 1];
    // Free memory
    for (int i = 0; i < n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Minimum path sum: Space-optimized dynamic programming */
int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // Initialize dp table
    int *dp = calloc(m, sizeof(int));
    // State transition: first row
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transition: rest of the rows
    for (int i = 1; i < n; i++) {
        // State transition: first column
        dp[0] = dp[0] + grid[i][0];
        // State transition: rest of the columns
        for (int j = 1; j < m; j++) {
            dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    int res = dp[m - 1];
    // Free memory
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int grid[MAX_SIZE][MAX_SIZE] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = 4, m = 4; // Matrix capacity is MAX_SIZE * MAX_SIZE, valid rows and columns are n * m

    // Brute-force search
    int res = minPathSumDFS(grid, n - 1, m - 1);
    printf("Minimum path sum from top-left to bottom-right is %d\n", res);

    // Memoization search
    int mem[MAX_SIZE][MAX_SIZE];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    printf("Minimum path sum from top-left to bottom-right is %d\n", res);

    // Dynamic programming
    res = minPathSumDP(grid, n, m);
    printf("Minimum path sum from top-left to bottom-right is %d\n", res);

    // Space-optimized dynamic programming
    res = minPathSumDPComp(grid, n, m);
    printf("Minimum path sum from top-left to bottom-right is %d\n", res);

    return 0;
}
