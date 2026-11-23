/**
 * File: unbounded_knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 個数制限なしナップサック問題：動的計画法 */
function unboundedKnapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // dp テーブルを初期化する
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサックの容量を超える場合、品物 i を選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
function unboundedKnapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // dp テーブルを初期化する
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサックの容量を超える場合、品物 i を選ばない
                dp[c] = dp[c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 実行用コード */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// 動的計画法
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);

// 空間を最適化した動的計画法
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);
