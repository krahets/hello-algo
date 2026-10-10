/**
 * File: climbing_stairs_dfs_mem.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Memoization search */
function dfs(i: number, mem: number[]): number {
    // Known dp[1] and dp[2], return them
    if (i === 1 || i === 2) return i;
    // If record dp[i] exists, return it directly
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: Memoization search */
function climbingStairsDFSMem(n: number): number {
    // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`Climbing ${n} stairs has ${res} solutions`);

export {};
