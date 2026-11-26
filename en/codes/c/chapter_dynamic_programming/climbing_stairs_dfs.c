/**
 * File: climbing_stairs_dfs.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Search */
int dfs(int i) {
    // Return the known value for dp[1] or dp[2]
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Climbing stairs with search */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    printf("Ways to climb %d stairs: %d\n", n, res);

    return 0;
}