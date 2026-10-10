/**
 * File: coin_change.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find minimum value */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Coin change: Dynamic programming */
int coinChangeDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // Initialize dp table
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // State transition: first row and first column
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // State transition: rest of the rows and columns
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // The smaller value between not selecting and selecting coin i
                dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Coin change: Space-optimized dynamic programming */
int coinChangeDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // Initialize dp table
    int *dp = malloc((amt + 1) * sizeof(int));
    for (int j = 1; j <= amt; j++) {
        dp[j] = MAX;
    } 
    dp[0] = 0;

    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a];
            } else {
                // The smaller value between not selecting and selecting coin i
                dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[amt] != MAX ? dp[amt] : -1;
    // Free memory
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 4;

    // Dynamic programming
    int res = coinChangeDP(coins, amt, coinsSize);
    printf("Minimum number of coins needed to make target amount is %d\n", res);

    // Space-optimized dynamic programming
    res = coinChangeDPComp(coins, amt, coinsSize);
    printf("Minimum number of coins needed to make target amount is %d\n", res);

    return 0;
}
