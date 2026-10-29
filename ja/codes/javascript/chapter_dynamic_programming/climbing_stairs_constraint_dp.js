/**
 * File: climbing_stairs_constraint_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 制約付きの階段の上り方：動的計画法 */
function climbingStairsConstraintDP(n) {
    if (n === 1 || n === 2) {
        return 1;
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    const dp = Array.from(new Array(n + 1), () => new Array(3));
    // 初期状態：最小の部分問題の解を設定する
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (let i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* 実行用コード */
const n = 9;
const res = climbingStairsConstraintDP(n);
console.log(`${n} 段の階段を上る方法は全部で ${res} 通り`);
