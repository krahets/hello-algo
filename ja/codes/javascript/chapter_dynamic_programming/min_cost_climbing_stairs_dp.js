/**
 * File: min_cost_climbing_stairs_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 階段を上る最小コスト：動的計画法 */
function minCostClimbingStairsDP(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    const dp = new Array(n + 1);
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 階段を上る最小コスト：空間を最適化した動的計画法 */
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

/* 実行用コード */
const cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
console.log('入力した階段のコストのリスト：', cost);

let res = minCostClimbingStairsDP(cost);
console.log(`階段を上り終える最小コストは：${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`階段を上り終える最小コストは：${res}`);
