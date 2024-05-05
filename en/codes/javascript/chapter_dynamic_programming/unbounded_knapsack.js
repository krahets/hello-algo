/**
 * File: unbounded_knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Complete knapsack: Dynamic programming */
function unboundedKnapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // Initialize dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c];
            } else {
                // The greater value between not choosing and choosing item i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Complete Knapsack: Space-optimized dynamic programming */
function unboundedKnapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // Initialize dp table
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[c] = dp[c];
            } else {
                // The greater value between not choosing and choosing item i
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

// Dynamic programming
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);

// Space-optimized dynamic programming
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);
