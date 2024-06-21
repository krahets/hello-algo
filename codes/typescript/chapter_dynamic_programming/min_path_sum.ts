/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 最小路径和：暴力搜索 */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 若为左上角单元格，则终止搜索
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // 返回从左上角到 (i, j) 的最小路径代价
    return Math.min(left, up) + grid[i][j];
}

/* 最小路径和：记忆化搜索 */
function minPathSumDFSMem(
    grid: Array<Array<number>>,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 若为左上角单元格，则终止搜索
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 若已有记录，则直接返回
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 左边和上边单元格的最小路径代价
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 记录并返回左上角到 (i, j) 的最小路径代价
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* 最小路径和：动态规划 */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // 初始化 dp 表
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // 状态转移：首行
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状态转移：首列
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状态转移：其余行和列
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* 最小路径和：空间优化后的动态规划 */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // 初始化 dp 表
    const dp = new Array(m);
    // 状态转移：首行
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状态转移：其余行
    for (let i = 1; i < n; i++) {
        // 状态转移：首列
        dp[0] = dp[0] + grid[i][0];
        // 状态转移：其余列
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
// 暴力搜索
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`从左上角到右下角的最小路径和为 ${res}`);

// 记忆化搜索
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`从左上角到右下角的最小路径和为 ${res}`);

// 动态规划
res = minPathSumDP(grid);
console.log(`从左上角到右下角的最小路径和为 ${res}`);

// 空间优化后的动态规划
res = minPathSumDPComp(grid);
console.log(`从左上角到右下角的最小路径和为 ${res}`);

export {};
