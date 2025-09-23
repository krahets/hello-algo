/**
 * File: min_path_sum.cpp
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 最小パス和：ブルートフォース探索 */
int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
    // 左上のセルの場合、探索を終了
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外の場合、+∞ のコストを返す
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 左上から (i-1, j) と (i, j-1) への最小パスコストを計算
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // 左上から (i, j) への最小パスコストを返す
    return min(left, up) + grid[i][j];
}

/* 最小パス和：動的プログラミング */
int minPathSumDP(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // DPテーブルを初期化
    vector<vector<int>> dp(n, vector<int>(m));
    dp[0][0] = grid[0][0];
    // 状態遷移：最初の行
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状態遷移：最初の列
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状態遷移：残りの行と列
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* ドライバーコード */
int main() {
    vector<vector<int>> grid = {
        {1, 3, 1, 5},
        {2, 2, 4, 2},
        {5, 3, 2, 1},
        {4, 3, 5, 2}
    };
    int n = grid.size(), m = grid[0].size();

    // ブルートフォース探索
    int res = minPathSumDFS(grid, n - 1, m - 1);
    cout << "左上角から右下角への最小パス和は " << res << " です" << endl;

    // 動的プログラミング
    res = minPathSumDP(grid);
    cout << "左上角から右下角への最小パス和は " << res << " です" << endl;

    return 0;
}