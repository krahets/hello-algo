/**
 * File: climbing_stairs_dfs_mem.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Memoized search */
int dfs(int i, int *mem) {
    // Return the known value for dp[1] or dp[2]
    if (i == 1 || i == 2)
        return i;
    // Return dp[i] directly if it is cached
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Cache dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs with memoized search */
int climbingStairsDFSMem(int n) {
    // mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
    int *mem = (int *)malloc((n + 1) * sizeof(int));
    for (int i = 0; i <= n; i++) {
        mem[i] = -1;
    }
    int result = dfs(n, mem);
    free(mem);
    return result;
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    printf("Ways to climb %d stairs: %d\n", n, res);

    return 0;
}