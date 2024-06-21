/**
 * File: unbounded_knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 完全背包：动态规划 */
function unboundedKnapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 状态转移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 完全背包：空间优化后的动态规划 */
function unboundedKnapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // 状态转移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[c] = dp[c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// 动态规划
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);

// 空间优化后的动态规划
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);
