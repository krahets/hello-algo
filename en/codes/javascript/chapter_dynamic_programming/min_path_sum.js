/**
 * File: min_path_sum.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Minimum path sum: Brute-force search */
function minPathSumDFS(grid, i, j) {
    // If it's the top-left cell, terminate the search
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // If row or column index is out of bounds, return +∞ cost
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // Return the minimum path cost from top-left to (i, j)
    return Math.min(left, up) + grid[i][j];
}

/* Minimum path sum: Memoization search */
function minPathSumDFSMem(grid, mem, i, j) {
    // If it's the top-left cell, terminate the search
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // If row or column index is out of bounds, return +∞ cost
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // If there's a record, return it directly
    if (mem[i][j] !== -1) {
        return mem[i][j];
    }
    // Minimum path cost for left and upper cells
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Record and return the minimum path cost from top-left to (i, j)
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* Minimum path sum: Dynamic programming */
function minPathSumDP(grid) {
    const n = grid.length,
        m = grid[0].length;
    // Initialize dp table
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // State transition: first row
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transition: first column
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transition: rest of the rows and columns
    for (let i = 1; i < n; i++) {
        for (let j = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Minimum path sum: Space-optimized dynamic programming */
function minPathSumDPComp(grid) {
    const n = grid.length,
        m = grid[0].length;
    // Initialize dp table
    const dp = new Array(m);
    // State transition: first row
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transition: rest of the rows
    for (let i = 1; i < n; i++) {
        // State transition: first column
        dp[0] = dp[0] + grid[i][0];
        // State transition: rest of the columns
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
// Brute-force search
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

// Memoization search
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

// Dynamic programming
res = minPathSumDP(grid);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);

// Space-optimized dynamic programming
res = minPathSumDPComp(grid);
console.log(`Minimum path sum from top-left to bottom-right is ${res}`);
