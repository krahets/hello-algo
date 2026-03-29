/**
 * File: climbing_stairs_dp.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 階段登り：動的計画法 */
function climbingStairsDP(n) {
    if (n === 1 || n === 2) return n;
    // 部分問題の解を保存するために dp テーブルを初期化
    const dp = new Array(n + 1).fill(-1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 階段登り：空間最適化した動的計画法 */
function climbingStairsDPComp(n) {
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

/* Driver Code */
const n = 9;
let res = climbingStairsDP(n);
console.log(`${n} 階の階段を上る方法は全部で ${res} 通り`);
res = climbingStairsDPComp(n);
console.log(`${n} 階の階段を上る方法は全部で ${res} 通り`);
