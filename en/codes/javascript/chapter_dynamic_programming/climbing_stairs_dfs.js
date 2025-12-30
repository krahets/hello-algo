/**
 * File: climbing_stairs_dfs.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Search */
function dfs(i) {
    // Known dp[1] and dp[2], return them
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Climbing stairs: Search */
function climbingStairsDFS(n) {
    return dfs(n);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);
