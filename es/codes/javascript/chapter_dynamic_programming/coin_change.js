/**
 * File: coin_change.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 零钱兑换：动态规划 */
function coinChangeDP(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 状态转移：首行首列
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 状态转移：其余行和列
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* 零钱兑换：空间优化后的动态规划 */
function coinChangeDPComp(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // 初始化 dp 表
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // 状态转移
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 4;

// 动态规划
let res = coinChangeDP(coins, amt);
console.log(`凑到目标金额所需的最少硬币数量为 ${res}`);

// 空间优化后的动态规划
res = coinChangeDPComp(coins, amt);
console.log(`凑到目标金额所需的最少硬币数量为 ${res}`);
