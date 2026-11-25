/**
 * File: climbing_stairs_dfs_mem.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 記憶化搜尋 */
function dfs(i: number, mem: number[]): number {
    // 已知 dp[1] 和 dp[2]，直接回傳對應的值
    if (i === 1 || i === 2) return i;
    // 若已有 dp[i] 的紀錄，就直接回傳該值
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 記錄 dp[i]
    mem[i] = count;
    return count;
}

/* 爬樓梯：記憶化搜尋 */
function climbingStairsDFSMem(n: number): number {
    // mem[i] 記錄爬到第 i 階的走法總數，-1 表示尚無紀錄
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* 主程式 */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`爬 ${n} 階樓梯共有 ${res} 種走法`);

export {};
