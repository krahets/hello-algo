/**
 * File: coin_change.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* コイン両替：動的計画法 */
function coinChangeDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // dp テーブルを初期化
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 状態遷移：先頭行と先頭列
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 状態遷移: 残りの行と列
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* コイン交換：空間最適化後の動的計画法 */
function coinChangeDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // dp テーブルを初期化
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 4;

// 動的計画法
let res = coinChangeDP(coins, amt);
console.log(`目標金額を作るのに必要な最小コイン枚数は ${res}`);

// 空間最適化後の動的計画法
res = coinChangeDPComp(coins, amt);
console.log(`目標金額を作るのに必要な最小コイン枚数は ${res}`);

export {};
