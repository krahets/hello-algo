/**
 * File: unbounded_knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 完全背包：動態規劃 */
function unboundedKnapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若重量超過背包容量，就不選物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 完全背包：空間最佳化後的動態規劃 */
function unboundedKnapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若重量超過背包容量，就不選物品 i
                dp[c] = dp[c];
            } else {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 主程式 */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// 動態規劃
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

// 空間最佳化後的動態規劃
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

export {};
