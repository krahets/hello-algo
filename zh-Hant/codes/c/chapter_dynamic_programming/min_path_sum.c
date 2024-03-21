/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

// 假設矩陣最大行列數為 100
#define MAX_SIZE 100

/* 求最小值 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 最小路徑和：暴力搜尋 */
int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
    // 若為左上角單元格，則終止搜尋
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // 返回從左上角到 (i, j) 的最小路徑代價
    return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
}

/* 最小路徑和：記憶化搜尋 */
int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
    // 若為左上角單元格，則終止搜尋
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 若已有記錄，則直接返回
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 左邊和上邊單元格的最小路徑代價
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 記錄並返回左上角到 (i, j) 的最小路徑代價
    mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* 最小路徑和：動態規劃 */
int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // 初始化 dp 表
    int **dp = malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        dp[i] = calloc(m, sizeof(int));
    }
    dp[0][0] = grid[0][0];
    // 狀態轉移：首行
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 狀態轉移：首列
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 狀態轉移：其餘行和列
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = myMin(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    int res = dp[n - 1][m - 1];
    // 釋放記憶體
    for (int i = 0; i < n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 最小路徑和：空間最佳化後的動態規劃 */
int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // 初始化 dp 表
    int *dp = calloc(m, sizeof(int));
    // 狀態轉移：首行
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 狀態轉移：其餘行
    for (int i = 1; i < n; i++) {
        // 狀態轉移：首列
        dp[0] = dp[0] + grid[i][0];
        // 狀態轉移：其餘列
        for (int j = 1; j < m; j++) {
            dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    int res = dp[m - 1];
    // 釋放記憶體
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int grid[MAX_SIZE][MAX_SIZE] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = 4, m = 4; // 矩陣容量為 MAX_SIZE * MAX_SIZE ，有效行列數為 n * m

    // 暴力搜尋
    int res = minPathSumDFS(grid, n - 1, m - 1);
    printf("從左上角到右下角的最小路徑和為 %d\n", res);

    // 記憶化搜尋
    int mem[MAX_SIZE][MAX_SIZE];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    printf("從左上角到右下角的最小路徑和為 %d\n", res);

    // 動態規劃
    res = minPathSumDP(grid, n, m);
    printf("從左上角到右下角的最小路徑和為 %d\n", res);

    // 空間最佳化後的動態規劃
    res = minPathSumDPComp(grid, n, m);
    printf("從左上角到右下角的最小路徑和為 %d\n", res);

    return 0;
}
