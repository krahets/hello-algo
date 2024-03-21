/**
 * File: min_path_sum.cpp
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 最小路徑和：暴力搜尋 */
int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
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
    return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
}

/* 最小路徑和：記憶化搜尋 */
int minPathSumDFSMem(vector<vector<int>> &grid, vector<vector<int>> &mem, int i, int j) {
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
    mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* 最小路徑和：動態規劃 */
int minPathSumDP(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // 初始化 dp 表
    vector<vector<int>> dp(n, vector<int>(m));
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
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* 最小路徑和：空間最佳化後的動態規劃 */
int minPathSumDPComp(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // 初始化 dp 表
    vector<int> dp(m);
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
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
int main() {
    vector<vector<int>> grid = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = grid.size(), m = grid[0].size();

    // 暴力搜尋
    int res = minPathSumDFS(grid, n - 1, m - 1);
    cout << "從左上角到右下角的最小路徑和為 " << res << endl;

    // 記憶化搜尋
    vector<vector<int>> mem(n, vector<int>(m, -1));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    cout << "從左上角到右下角的最小路徑和為 " << res << endl;

    // 動態規劃
    res = minPathSumDP(grid);
    cout << "從左上角到右下角的最小路徑和為 " << res << endl;

    // 空間最佳化後的動態規劃
    res = minPathSumDPComp(grid);
    cout << "從左上角到右下角的最小路徑和為 " << res << endl;

    return 0;
}
