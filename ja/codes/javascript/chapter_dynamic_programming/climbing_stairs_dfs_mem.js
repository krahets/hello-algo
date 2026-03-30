/**
 * File: climbing_stairs_dfs_mem.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* メモ化探索 */
function dfs(i, mem) {
    // dp[1] と dp[2] は既知なので返す
    if (i === 1 || i === 2) return i;
    // dp[i] の記録があれば、それをそのまま返す
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    return count;
}

/* 階段登り：メモ化探索 */
function climbingStairsDFSMem(n) {
    // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`${n} 階の階段を上る方法は全部で ${res} 通り`);
