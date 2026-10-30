/**
 * File: climbing_stairs_dfs_mem.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Memoized search */
int dfs(int i, int *mem) {
    // The values of dp[1] and dp[2] are known; return them
    if (i == 1 || i == 2)
        return i;
    // If dp[i] has been recorded, return it directly
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: memoized search */
int climbingStairsDFSMem(int n) {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
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
    printf("Number of ways to climb %d stairs: %d\n", n, res);

    return 0;
}