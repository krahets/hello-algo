/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

// 行列の最大行数・列数を 100 と仮定する
#define MAX_SIZE 100

/* 最小値を求める */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 最小経路和：全探索 */
int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
    // 左上のセルなら探索を終了する
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // 左上隅から (i, j) までの最小経路コストを返す
    return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
}

/* 最小経路和：メモ化探索 */
int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
    // 左上のセルなら探索を終了する
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 既に記録があればそのまま返す
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 左と上のセルからの最小経路コスト
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 左上から (i, j) までの最小経路コストを記録して返す
    mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* 最小経路和：動的計画法 */
int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // dp テーブルを初期化
    int **dp = malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        dp[i] = calloc(m, sizeof(int));
    }
    dp[0][0] = grid[0][0];
    // 状態遷移：先頭行
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状態遷移：先頭列
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状態遷移: 残りの行と列
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = myMin(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    int res = dp[n - 1][m - 1];
    // メモリを解放する
    for (int i = 0; i < n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 最小経路和：空間最適化後の動的計画法 */
int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // dp テーブルを初期化
    int *dp = calloc(m, sizeof(int));
    // 状態遷移：先頭行
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状態遷移：残りの行
    for (int i = 1; i < n; i++) {
        // 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0];
        // 状態遷移：残りの列
        for (int j = 1; j < m; j++) {
            dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    int res = dp[m - 1];
    // メモリを解放する
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int grid[MAX_SIZE][MAX_SIZE] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = 4, m = 4; // 行列の容量は `MAX_SIZE * MAX_SIZE`、有効な行数と列数は `n * m`

    // 全探索
    int res = minPathSumDFS(grid, n - 1, m - 1);
    printf("左上から右下までの最小経路和は %d\n", res);

    // メモ化探索
    int mem[MAX_SIZE][MAX_SIZE];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    printf("左上から右下までの最小経路和は %d\n", res);

    // 動的計画法
    res = minPathSumDP(grid, n, m);
    printf("左上から右下までの最小経路和は %d\n", res);

    // 空間最適化後の動的計画法
    res = minPathSumDPComp(grid, n, m);
    printf("左上から右下までの最小経路和は %d\n", res);

    return 0;
}
