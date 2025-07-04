/**
 * File: coin_change_ii.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 零钱兑换 II：动态规划 */
function coinChangeIIDP(coins, amt) {
    const n = coins.length;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 初始化首列
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 状态转移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 零钱兑换 II：空间优化后的动态规划 */
function coinChangeIIDPComp(coins, amt) {
    const n = coins.length;
    // 初始化 dp 表
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 状态转移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 5;

// 动态规划
let res = coinChangeIIDP(coins, amt);
console.log(`凑出目标金额的硬币组合数量为 ${res}`);

// 空间优化后的动态规划
res = coinChangeIIDPComp(coins, amt);
console.log(`凑出目标金额的硬币组合数量为 ${res}`);
