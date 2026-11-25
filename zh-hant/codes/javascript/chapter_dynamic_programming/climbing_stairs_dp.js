/**
 * File: climbing_stairs_dp.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 爬樓梯：動態規劃 */
function climbingStairsDP(n) {
    if (n === 1 || n === 2) return n;
    // 初始化 dp 表，用來儲存子問題的解
    const dp = new Array(n + 1).fill(-1);
    // 初始狀態：設定最小子問題的解
    dp[1] = 1;
    dp[2] = 2;
    // 狀態轉移：從較小的子問題逐步求出較大子問題的解
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 爬樓梯：空間最佳化後的動態規劃 */
function climbingStairsDPComp(n) {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* 主程式 */
const n = 9;
let res = climbingStairsDP(n);
console.log(`爬 ${n} 階樓梯共有 ${res} 種走法`);
res = climbingStairsDPComp(n);
console.log(`爬 ${n} 階樓梯共有 ${res} 種走法`);
