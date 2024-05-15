/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 最小路徑和：暴力搜尋 */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 若為左上角單元格，則終止搜尋
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // 返回從左上角到 (i, j) 的最小路徑代價
    return Math.min(left, up) + grid[i][j];
}

/* 最小路徑和：記憶化搜尋 */
function minPathSumDFSMem(
    grid: Array<Array<number>>,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 若為左上角單元格，則終止搜尋
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 若已有記錄，則直接返回
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 左邊和上邊單元格的最小路徑代價
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 記錄並返回左上角到 (i, j) 的最小路徑代價
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* 最小路徑和：動態規劃 */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // 初始化 dp 表
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // 狀態轉移：首行
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 狀態轉移：首列
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 狀態轉移：其餘行和列
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* 最小路徑和：空間最佳化後的動態規劃 */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // 初始化 dp 表
    const dp = new Array(m);
    // 狀態轉移：首行
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 狀態轉移：其餘行
    for (let i = 1; i < n; i++) {
        // 狀態轉移：首列
        dp[0] = dp[0] + grid[i][0];
        // 狀態轉移：其餘列
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
// 暴力搜尋
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`從左上角到右下角的最小路徑和為 ${res}`);

// 記憶化搜尋
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`從左上角到右下角的最小路徑和為 ${res}`);

// 動態規劃
res = minPathSumDP(grid);
console.log(`從左上角到右下角的最小路徑和為 ${res}`);

// 空間最佳化後的動態規劃
res = minPathSumDPComp(grid);
console.log(`從左上角到右下角的最小路徑和為 ${res}`);

export {};
