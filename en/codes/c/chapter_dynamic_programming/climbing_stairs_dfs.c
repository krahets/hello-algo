/**
 * File: climbing_stairs_dfs.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Search */
int dfs(int i) {
    // Known dp[1] and dp[2], return them
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Climbing stairs: Search */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    printf("Climbing %d stairs has %d solutions\n", n, res);

    return 0;
}