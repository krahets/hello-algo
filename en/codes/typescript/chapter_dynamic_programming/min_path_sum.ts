/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Minimum path sum: brute-force search */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // Stop searching at the top-left cell
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // If a row or column index is out of bounds, return a cost of +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Calculate the minimum path costs from the top-left corner to (i-1, j) and (i, j-1)
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // Return the minimum path cost from the top-left corner to (i, j)
    return Math.min(left, up) + grid[i][j];
}

/* Minimum path sum: memoized search */
function minPathSumDFSMem(
    grid: Array<Array<number>>,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // Stop searching at the top-left cell
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // If a row or column index is out of bounds, return a cost of +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // If a result has already been recorded, return it directly
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Minimum path costs to the cells on the left and above
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Record and return the minimum path cost from the top-left corner to (i, j)
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* Minimum path sum: dynamic programming */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Initialize the dp table
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // State transitions: first row
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transitions: first column
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transitions: remaining rows and columns
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Minimum path sum: space-optimized dynamic programming */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Initialize the dp table
    const dp = new Array(m);
    // State transitions: first row
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transitions: remaining rows
    for (let i = 1; i < n; i++) {
        // State transitions: first column
        dp[0] = dp[0] + grid[i][0];
        // State transitions: remaining columns
        for (let j = 1; j < m; j++) {
            dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver code */
const grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
];
const n = grid.length,
    m = grid[0].length;
// Brute-force search
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`Minimum path sum from the top-left to the bottom-right: ${res}`);

// Memoized search
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`Minimum path sum from the top-left to the bottom-right: ${res}`);

// Dynamic programming
res = minPathSumDP(grid);
console.log(`Minimum path sum from the top-left to the bottom-right: ${res}`);

// Space-optimized dynamic programming
res = minPathSumDPComp(grid);
console.log(`Minimum path sum from the top-left to the bottom-right: ${res}`);

export {};
