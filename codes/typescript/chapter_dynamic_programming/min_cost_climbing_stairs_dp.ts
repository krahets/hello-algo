/**
 * File: min_cost_climbing_stairs_dp.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 爬楼梯最小代价：动态规划 */
function minCostClimbingStairsDP(cost: Array<number>): number {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // 初始化 dp 表，用于存储子问题的解
    const dp = new Array(n + 1);
    // 初始状态：预设最小子问题的解
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状态转移：从较小子问题逐步求解较大子问题
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 爬楼梯最小代价：空间优化后的动态规划 */
function minCostClimbingStairsDPComp(cost: Array<number>): number {
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
console.log(`输入楼梯的代价列表为：${cost}`);

let res = minCostClimbingStairsDP(cost);
console.log(`爬完楼梯的最低代价为：${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`爬完楼梯的最低代价为：${res}`);

export {};
