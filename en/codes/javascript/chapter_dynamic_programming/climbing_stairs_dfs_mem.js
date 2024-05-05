/**
 * File: climbing_stairs_dfs_mem.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Memoized search */
function dfs(i, mem) {
    // Known dp[1] and dp[2], return them
    if (i === 1 || i === 2) return i;
    // If there is a record for dp[i], return it
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: Memoized search */
function climbingStairsDFSMem(n) {
    // mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`爬 ${n} 阶楼梯共有 ${res} 种方案`);
