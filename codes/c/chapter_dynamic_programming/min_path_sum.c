/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最小值 */
int min(int a, int b) {
    return a < b ? a : b;
}

/* 最小路径和：暴力搜索 */
int minPathSumDFS(int gridCols, int grid[][gridCols], int i, int j) {
    // 若为左上角单元格，则终止搜索
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    int up = minPathSumDFS(gridCols, grid, i - 1, j);
    int left = minPathSumDFS(gridCols, grid, i, j - 1);
    // 返回从左上角到 (i, j) 的最小路径代价
    return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
}

/* 最小路径和：记忆化搜索 */
int minPathSumDFSMem(int gridCols, int grid[][gridCols], int mem[][gridCols], int i, int j) {
    // 若为左上角单元格，则终止搜索
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 若已有记录，则直接返回
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 左边和上边单元格的最小路径代价
    int up = minPathSumDFSMem(gridCols, grid, mem, i - 1, j);
    int left = minPathSumDFSMem(gridCols, grid, mem, i, j - 1);
    // 记录并返回左上角到 (i, j) 的最小路径代价
    mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* 最小路径和：动态规划 */
int minPathSumDP(int gridCols, int grid[][gridCols], int n, int m) {
    // 初始化 dp 表
    int dp[n][m];
    dp[0][0] = grid[0][0];
    // 状态转移：首行
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状态转移：首列
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状态转移：其余行列
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* 最小路径和：空间优化后的动态规划 */
int minPathSumDPComp(int gridCols, int grid[][gridCols], int n, int m) {
    // 初始化 dp 表
    int dp[m];
    // 状态转移：首行
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状态转移：其余行
    for (int i = 1; i < n; i++) {
        // 状态转移：首列
        dp[0] = dp[0] + grid[i][0];
        // 状态转移：其余列
        for (int j = 1; j < m; j++) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
int main() {
    int grid[][4] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = sizeof(grid) / sizeof(grid[0]), m = sizeof(grid[0]) / sizeof(grid[0][0]);

    // 暴力搜索
    int res = minPathSumDFS(m, grid, n - 1, m - 1);
    printf("从左上角到右下角的最小路径和为 %d\n", res);

    // 记忆化搜索
    int mem[n][m];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(m, grid, mem, n - 1, m - 1);
    printf("从左上角到右下角的最小路径和为 %d\n", res);

    // 动态规划
    res = minPathSumDP(m, grid, n, m);
    printf("从左上角到右下角的最小路径和为 %d\n", res);

    // 空间优化后的动态规划
    res = minPathSumDPComp(m, grid, n, m);
    printf("从左上角到右下角的最小路径和为 %d\n", res);

    return 0;
}
