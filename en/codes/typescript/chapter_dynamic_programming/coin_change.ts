/**
 * File: coin_change.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Coin change: dynamic programming */
function coinChangeDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Initialize the dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // State transitions: first row and first column
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // State transitions: remaining rows and columns
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Coin change: space-optimized dynamic programming */
function coinChangeDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Initialize the dp table
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // State transitions
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Driver code */
const coins = [1, 2, 5];
const amt = 4;

// Dynamic programming
let res = coinChangeDP(coins, amt);
console.log(`Minimum number of coins needed to make the target amount: ${res}`);

// Space-optimized dynamic programming
res = coinChangeDPComp(coins, amt);
console.log(`Minimum number of coins needed to make the target amount: ${res}`);

export {};
