/**
 * File: coin_change.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Coin change: Dynamic programming */
function coinChangeDP(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // Initialize dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // State transition: first row and first column
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // State transition: rest of the rows and columns
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // The smaller value between not selecting and selecting coin i
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Coin change: Space-optimized dynamic programming */
function coinChangeDPComp(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // Initialize dp table
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a];
            } else {
                // The smaller value between not selecting and selecting coin i
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 4;

// Dynamic programming
let res = coinChangeDP(coins, amt);
console.log(`Minimum coins needed to make target amount is ${res}`);

// Space-optimized dynamic programming
res = coinChangeDPComp(coins, amt);
console.log(`Minimum coins needed to make target amount is ${res}`);
