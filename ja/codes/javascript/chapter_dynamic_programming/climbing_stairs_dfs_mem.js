/**
 * File: climbing_stairs_dfs_mem.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* メモ化探索 */
function dfs(i, mem) {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if (i === 1 || i === 2) return i;
    // dp[i] が記録済みなら、その値を返す
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    return count;
}

/* 階段の登り方：メモ化探索 */
function climbingStairsDFSMem(n) {
    // mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* 実行例 */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`全 ${n} 段の階段の登り方は ${res} 通り`);
