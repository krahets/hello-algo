/**
 * File: coin_change.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 零錢兌換：動態規劃 */
function coinChangeDP(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 狀態轉移：第一列和第一欄
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 狀態轉移：其餘各列與各欄
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若面額超過目標金額，就不選硬幣 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 取不選與選取硬幣 i 兩種情況中的較小值
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* 零錢兌換：空間最佳化後的動態規劃 */
function coinChangeDPComp(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // 初始化 dp 表
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若面額超過目標金額，就不選硬幣 i
                dp[a] = dp[a];
            } else {
                // 取不選與選取硬幣 i 兩種情況中的較小值
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* 主程式 */
const coins = [1, 2, 5];
const amt = 4;

// 動態規劃
let res = coinChangeDP(coins, amt);
console.log(`湊出目標金額所需的最少硬幣數為 ${res}`);

// 空間最佳化後的動態規劃
res = coinChangeDPComp(coins, amt);
console.log(`湊出目標金額所需的最少硬幣數為 ${res}`);
