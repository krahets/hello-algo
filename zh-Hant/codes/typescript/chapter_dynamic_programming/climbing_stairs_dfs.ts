/**
 * File: climbing_stairs_dfs.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 搜尋 */
function dfs(i: number): number {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 爬樓梯：搜尋 */
function climbingStairsDFS(n: number): number {
    return dfs(n);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`爬 ${n} 階樓梯共有 ${res} 種方案`);

export {};
