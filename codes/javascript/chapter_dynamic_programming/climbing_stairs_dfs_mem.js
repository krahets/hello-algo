/**
 * File: climbing_stairs_dfs_mem.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 记忆化搜索 */
function dfs(i, mem) {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i === 1 || i === 2) return i;
    // 若存在记录 dp[i] ，则直接返回之
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 记录 dp[i]
    mem[i] = count;
    return count;
}

/* 爬楼梯：记忆化搜索 */
function climbingStairsDFSMem(n) {
    // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`爬 ${n} 阶楼梯共有 ${res} 种方案`);
