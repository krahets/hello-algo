/**
 * File: coin_change_ii.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Coin change II: Dynamic programming */
function coinChangeIIDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // Initialize dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // Initialize first column
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* Coin change II: Space-optimized dynamic programming */
function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // Initialize dp table
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a];
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 5;

// Dynamic programming
let res = coinChangeIIDP(coins, amt);
console.log(`Number of coin combinations to make target amount is ${res}`);

// Space-optimized dynamic programming
res = coinChangeIIDPComp(coins, amt);
console.log(`Number of coin combinations to make target amount is ${res}`);

export {};
