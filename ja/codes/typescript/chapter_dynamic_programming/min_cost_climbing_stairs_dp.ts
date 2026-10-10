/**
 * File: min_cost_climbing_stairs_dp.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 階段登りの最小コスト：動的計画法 */
function minCostClimbingStairsDP(cost: Array<number>): number {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    const dp = new Array(n + 1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 階段昇りの最小コスト：空間最適化後の動的計画法 */
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
console.log(`入力された階段のコスト一覧：${cost}`);

let res = minCostClimbingStairsDP(cost);
console.log(`階段を登り切るための最小コスト：${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`階段を登り切るための最小コスト：${res}`);

export {};
