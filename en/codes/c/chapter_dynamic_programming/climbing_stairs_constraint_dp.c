/**
 * File: climbing_stairs_constraint_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Climbing stairs with constraint: Dynamic programming */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // Initialize dp table, used to store solutions to subproblems
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(3, sizeof(int));
    }
    // Initial state: preset the solution to the smallest subproblem
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transition: gradually solve larger subproblems from smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    int res = dp[n][1] + dp[n][2];
    // Free memory
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    printf("Climbing %d stairs has %d solutions\n", n, res);

    return 0;
}
