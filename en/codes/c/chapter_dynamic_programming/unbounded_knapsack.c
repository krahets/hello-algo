/**
 * File: unbounded_knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find the maximum */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* Unbounded knapsack with dynamic programming */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Initialize the dp table
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value from skipping or taking item i
                dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // Free the memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Unbounded knapsack with space-optimized dynamic programming */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Initialize the dp table
    int *dp = calloc(cap + 1, sizeof(int));
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[c] = dp[c];
            } else {
                // Take the larger value from skipping or taking item i
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // Free the memory
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // Dynamic programming
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("Maximum total item value within the weight limit: %d\n", res);

    // Space-optimized dynamic programming
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("Maximum total item value within the weight limit: %d\n", res);

    return 0;
}
