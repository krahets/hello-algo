/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 最小経路和：全探索 */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 左上のセルなら探索を終了する
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // 左上隅から (i, j) までの最小経路コストを返す
    return Math.min(left, up) + grid[i][j];
}

/* 最小経路和：メモ化探索 */
function minPathSumDFSMem(
    grid: Array<Array<number>>,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 左上のセルなら探索を終了する
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 既に記録があればそのまま返す
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 左と上のセルからの最小経路コスト
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 左上から (i, j) までの最小経路コストを記録して返す
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* 最小経路和：動的計画法 */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // dp テーブルを初期化
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // 状態遷移：先頭行
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状態遷移：先頭列
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状態遷移: 残りの行と列
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* 最小経路和：空間最適化後の動的計画法 */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // dp テーブルを初期化
    const dp = new Array(m);
    // 状態遷移：先頭行
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状態遷移：残りの行
    for (let i = 1; i < n; i++) {
        // 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0];
        // 状態遷移：残りの列
        for (let j = 1; j < m; j++) {
            dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
const grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
];
const n = grid.length,
    m = grid[0].length;
// 全探索
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`左上から右下までの最小経路和は ${res}`);

// メモ化探索
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`左上から右下までの最小経路和は ${res}`);

// 動的計画法
res = minPathSumDP(grid);
console.log(`左上から右下までの最小経路和は ${res}`);

// 空間最適化後の動的計画法
res = minPathSumDPComp(grid);
console.log(`左上から右下までの最小経路和は ${res}`);

export {};
