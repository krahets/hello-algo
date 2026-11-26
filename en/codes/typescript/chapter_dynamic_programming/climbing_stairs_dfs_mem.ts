/**
 * File: climbing_stairs_dfs_mem.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Memoized search */
function dfs(i: number, mem: number[]): number {
    // Return the known value for dp[1] or dp[2]
    if (i === 1 || i === 2) return i;
    // Return dp[i] directly if it is cached
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Cache dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs with memoized search */
function climbingStairsDFSMem(n: number): number {
    // mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`Climbing ${n} stairs: ${res} ways`);

export {};
