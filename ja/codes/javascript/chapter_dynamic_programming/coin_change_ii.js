/**
 * File: coin_change_ii.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* コイン両替 II：動的計画法 */
function coinChangeIIDP(coins, amt) {
    const n = coins.length;
    // dp テーブルを初期化
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 先頭列を初期化する
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // コイン i を選ばない場合と選ぶ場合の和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* コイン両替 II：空間最適化した動的計画法 */
function coinChangeIIDPComp(coins, amt) {
    const n = coins.length;
    // dp テーブルを初期化
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a];
            } else {
                // コイン i を選ばない場合と選ぶ場合の和
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 5;

// 動的計画法
let res = coinChangeIIDP(coins, amt);
console.log(`目標金額を作る硬貨の組み合わせ数は ${res}`);

// 空間最適化後の動的計画法
res = coinChangeIIDPComp(coins, amt);
console.log(`目標金額を作る硬貨の組み合わせ数は ${res}`);
