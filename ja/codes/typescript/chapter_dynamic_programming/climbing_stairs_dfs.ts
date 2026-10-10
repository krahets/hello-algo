/**
 * File: climbing_stairs_dfs.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 検索 */
function dfs(i: number): number {
    // dp[1] と dp[2] は既知なので返す
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 階段登り：探索 */
function climbingStairsDFS(n: number): number {
    return dfs(n);
}

/* Driver Code */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`${n} 段の階段を登る方法は ${res} 通り`);

export {};
