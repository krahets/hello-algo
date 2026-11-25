/**
 * File: coin_change.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Coin change with dynamic programming */
function coinChangeDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Initialize the dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // State transitions for the first row and column
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // State transitions for the remaining rows and columns
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Skip coin i if its value exceeds the target amount
                dp[i][a] = dp[i - 1][a];
            } else {
                // Take the minimum of the counts for skipping and taking coin i
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Coin change with space-optimized dynamic programming */
function coinChangeDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Initialize the dp table
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Skip coin i if its value exceeds the target amount
                dp[a] = dp[a];
            } else {
                // Take the minimum of the counts for skipping and taking coin i
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
