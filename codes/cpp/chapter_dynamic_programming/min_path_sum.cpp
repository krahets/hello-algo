/**
 * File: min_path_sum.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>
using namespace std;

/* 最小路径和：暴力搜索 */
int minPathSumDFS(vector<vector<int>>& grid, int i, int j) {
    // 到达左上角，终止递归
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 越界，返回无穷大表示无效路径
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 来自上方 + 来自左方，取最小路径
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);

    return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
}

/* 最小路径和：记忆化搜索 */
int minPathSumDFSMem(vector<vector<int>>& grid, vector<vector<int>>& mem, int i, int j) {
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 已缓存，直接返回
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);

    mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* 最小路径和：动态规划 */
int minPathSumDP(vector<vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();
    vector<vector<int>> dp(n, vector<int>(m));

    // 起点
    dp[0][0] = grid[0][0];
    // 初始化第一行
    for (int j = 1; j < m; ++j) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 初始化第一列
    for (int i = 1; i < n; ++i) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状态转移
    for (int i = 1; i < n; ++i) {
        for (int j = 1; j < m; ++j) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* 最小路径和：空间优化 DP（一维数组）*/
int minPathSumDPComp(vector<vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();
    vector<int> dp(m);

    // 初始化第一行
    dp[0] = grid[0][0];
    for (int j = 1; j < m; ++j) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 逐行更新
    for (int i = 1; i < n; ++i) {
        dp[0] += grid[i][0];
        for (int j = 1; j < m; ++j) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* 主函数测试 */
int main() {
    vector<vector<int>> grid = {
        {1, 3, 1, 5},
        {2, 2, 4, 2},
        {5, 3, 2, 1},
        {4, 3, 5, 2}
    };
    int n = grid.size();
    int m = grid[0].size();

    // 暴力搜索
    int res = minPathSumDFS(grid, n - 1, m - 1);
    cout << "暴力搜索    最小路径和 = " << res << endl;

    // 记忆化搜索
    vector<vector<int>> mem(n, vector<int>(m, -1));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    cout << "记忆化搜索  最小路径和 = " << res << endl;

    // 动态规划
    res = minPathSumDP(grid);
    cout << "动态规划    最小路径和 = " << res << endl;

    // 空间优化 DP
    res = minPathSumDPComp(grid);
    cout << "优化 DP     最小路径和 = " << res << endl;

    return 0;
}
