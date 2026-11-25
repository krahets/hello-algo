/**
 * File: coin_change_ii.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Coin change II with dynamic programming */
int coinChangeIIDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // Initialize the dp table
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // Initialize the first column
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Skip coin i if its value exceeds the target amount
                dp[i][a] = dp[i - 1][a];
            } else {
                // Add the counts for skipping and taking coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    int res = dp[n][amt];
    // Free the memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Coin change II with space-optimized dynamic programming */
int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // Initialize the dp table
    int *dp = calloc(amt + 1, sizeof(int));
    dp[0] = 1;
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Skip coin i if its value exceeds the target amount
                dp[a] = dp[a];
            } else {
                // Add the counts for skipping and taking coin i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    int res = dp[amt];
    // Free the memory
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 5;

    // Dynamic programming
    int res = coinChangeIIDP(coins, amt, coinsSize);
    printf("Number of coin combinations that make the target amount: %d\n", res);

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(coins, amt, coinsSize);
    printf("Number of coin combinations that make the target amount: %d\n", res);

    return 0;
}
