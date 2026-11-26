/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Minimum path sum with brute-force search */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // Stop searching at the top-left cell
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // Return a cost of +∞ if either index is out of bounds
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Find the minimum path costs from the top left to (i-1, j) and (i, j-1)
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // Return the minimum path cost from the top left to (i, j)
    return Math.min(left, up) + grid[i][j];
}

/* Minimum path sum with memoized search */
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
    // Return a cost of +∞ if either index is out of bounds
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Return the cached result if available
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Minimum path costs for the cells to the left and above
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Cache and return the minimum path cost from the top left to (i, j)
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* Minimum path sum with dynamic programming */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Initialize the dp table
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // State transitions for the first row
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transitions for the first column
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transitions for the remaining rows and columns
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Minimum path sum with space-optimized dynamic programming */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Initialize the dp table
    const dp = new Array(m);
    // State transitions for the first row
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transitions for the remaining rows
    for (let i = 1; i < n; i++) {
        // State transitions for the first column
        dp[0] = dp[0] + grid[i][0];
        // State transitions for the remaining columns
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
console.log(`Minimum path sum from the top left to the bottom right: ${res}`);

// Memoized search
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`Minimum path sum from the top left to the bottom right: ${res}`);

// Dynamic programming
res = minPathSumDP(grid);
console.log(`Minimum path sum from the top left to the bottom right: ${res}`);

// Space-optimized dynamic programming
res = minPathSumDPComp(grid);
console.log(`Minimum path sum from the top left to the bottom right: ${res}`);

export {};
