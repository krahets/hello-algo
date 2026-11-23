/**
 * File: climbing_stairs_dfs_mem.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Memoized search */
function dfs(i, mem) {
    // The values of dp[1] and dp[2] are known; return them
    if (i === 1 || i === 2) return i;
    // If dp[i] has been recorded, return it directly
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: memoized search */
function climbingStairsDFSMem(n) {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`Number of ways to climb ${n} stairs: ${res}`);
