/**
 * File: min_cost_climbing_stairs_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Find the minimum */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Minimum cost to climb stairs: dynamic programming */
int minCostClimbingStairsDP(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // Initialize the dp table to store subproblem solutions
    int *dp = calloc(n + 1, sizeof(int));
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = cost[1];
    dp[2] = cost[2];
    // State transitions: solve progressively larger subproblems using smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
    }
    int res = dp[n];
    // Free memory
    free(dp);
    return res;
}

/* Minimum cost to climb stairs: space-optimized dynamic programming */
int minCostClimbingStairsDPComp(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = myMin(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver code */
int main() {
    int cost[] = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    int costSize = sizeof(cost) / sizeof(cost[0]);
    printf("Input list of stair costs:");
    printArray(cost, costSize);

    int res = minCostClimbingStairsDP(cost, costSize);
    printf("Minimum cost to climb the stairs: %d\n", res);

    res = minCostClimbingStairsDPComp(cost, costSize);
    printf("Minimum cost to climb the stairs: %d\n", res);

    return 0;
}
