/**
 * File: coin_change_ii.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Coin change II: Dynamic programming */
int coinChangeIIDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // Initialize dp table
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // Initialize first column
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    int res = dp[n][amt];
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Coin change II: Space-optimized dynamic programming */
int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // Initialize dp table
    int *dp = calloc(amt + 1, sizeof(int));
    dp[0] = 1;
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a];
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    int res = dp[amt];
    // Free memory
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
    printf("Number of coin combinations to make target amount is %d\n", res);

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(coins, amt, coinsSize);
    printf("Number of coin combinations to make target amount is %d\n", res);

    return 0;
}
