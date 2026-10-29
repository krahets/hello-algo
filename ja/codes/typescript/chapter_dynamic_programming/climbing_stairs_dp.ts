/**
 * File: climbing_stairs_dp.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 階段の上り方：動的計画法 */
function climbingStairsDP(n: number): number {
    if (n === 1 || n === 2) return n;
    // 部分問題の解を格納する dp テーブルを初期化する
    const dp = new Array(n + 1).fill(-1);
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 階段の上り方：空間を最適化した動的計画法 */
function climbingStairsDPComp(n: number): number {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* 実行用コード */
const n = 9;
let res = climbingStairsDP(n);
console.log(`${n} 段の階段を上る方法は全部で ${res} 通り`);
res = climbingStairsDPComp(n);
console.log(`${n} 段の階段を上る方法は全部で ${res} 通り`);

export {};
