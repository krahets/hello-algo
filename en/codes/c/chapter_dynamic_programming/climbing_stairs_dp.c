/**
 * File: climbing_stairs_dp.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Climbing stairs with dynamic programming */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Initialize the dp table to store subproblem solutions
    int *dp = (int *)malloc((n + 1) * sizeof(int));
    // Base cases: set the solutions to the smallest subproblems
    dp[1] = 1;
    dp[2] = 2;
    // State transition: solve larger subproblems using smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    int result = dp[n];
    free(dp);
    return result;
}

/* Climbing stairs with space-optimized dynamic programming */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    printf("Ways to climb %d stairs: %d\n", n, res);

    res = climbingStairsDPComp(n);
    printf("Ways to climb %d stairs: %d\n", n, res);

    return 0;
}