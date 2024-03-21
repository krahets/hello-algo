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
    // 初始化首列
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超過目標金額，則不選硬幣 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不選和選硬幣 i 這兩種方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 零錢兌換 II：狀態壓縮後的動態規劃 */
function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // 初始化 dp 表
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超過目標金額，則不選硬幣 i
                dp[a] = dp[a];
            } else {
                // 不選和選硬幣 i 這兩種方案之和
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 5;

// 動態規劃
let res = coinChangeIIDP(coins, amt);
console.log(`湊出目標金額的硬幣組合數量為 ${res}`);

// 狀態壓縮後的動態規劃
res = coinChangeIIDPComp(coins, amt);
console.log(`湊出目標金額的硬幣組合數量為 ${res}`);

export {};
