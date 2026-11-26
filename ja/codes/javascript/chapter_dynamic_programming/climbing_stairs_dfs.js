/**
 * File: climbing_stairs_dfs.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 探索 */
function dfs(i) {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 階段の登り方：探索 */
function climbingStairsDFS(n) {
    return dfs(n);
}

/* 実行例 */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`全 ${n} 段の階段の登り方は ${res} 通り`);
