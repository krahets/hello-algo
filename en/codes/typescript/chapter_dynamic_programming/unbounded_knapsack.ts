/**
 * File: unbounded_knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Unbounded knapsack with dynamic programming */
function unboundedKnapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Initialize the dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value from skipping or taking item i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Unbounded knapsack with space-optimized dynamic programming */
function unboundedKnapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Initialize the dp table
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[c] = dp[c];
            } else {
                // Take the larger value from skipping or taking item i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver code */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// Dynamic programming
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`Maximum total item value within the weight limit: ${res}`);

// Space-optimized dynamic programming
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`Maximum total item value within the weight limit: ${res}`);

export {};
