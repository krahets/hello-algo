/**
 * File: min_cost_climbing_stairs_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 爬樓梯最小代價：動態規劃 */
function minCostClimbingStairsDP(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // 初始化 dp 表，用於儲存子問題的解
    const dp = new Array(n + 1);
    // 初始狀態：預設最小子問題的解
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 爬樓梯最小代價：狀態壓縮後的動態規劃 */
function minCostClimbingStairsDPComp(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    let a = cost[1],
        b = cost[2];
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = Math.min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver Code */
const cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
console.log('輸入樓梯的代價串列為：', cost);

let res = minCostClimbingStairsDP(cost);
console.log(`爬完樓梯的最低代價為：${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`爬完樓梯的最低代價為：${res}`);
