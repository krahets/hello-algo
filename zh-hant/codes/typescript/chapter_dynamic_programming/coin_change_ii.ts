/**
 * File: coin_change_ii.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 零錢兌換 II：動態規劃 */
function coinChangeIIDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 初始化第一欄
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若面額超過目標金額，就不選硬幣 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 零錢兌換 II：空間最佳化後的動態規劃 */
function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // 初始化 dp 表
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若面額超過目標金額，就不選硬幣 i
                dp[a] = dp[a];
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* 主程式 */
const coins = [1, 2, 5];
const amt = 5;

// 動態規劃
let res = coinChangeIIDP(coins, amt);
console.log(`湊出目標金額的硬幣組合數為 ${res}`);

// 空間最佳化後的動態規劃
res = coinChangeIIDPComp(coins, amt);
console.log(`湊出目標金額的硬幣組合數為 ${res}`);

export {};
