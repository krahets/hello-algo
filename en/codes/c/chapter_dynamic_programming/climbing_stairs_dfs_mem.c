/**
 * File: climbing_stairs_dfs_mem.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Memoized search */
int dfs(int i, int *mem) {
    // Known dp[1] and dp[2], return them
    if (i == 1 || i == 2)
        return i;
    // If there is a record for dp[i], return it
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: Memoized search */
int climbingStairsDFSMem(int n) {
    // mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
    int *mem = (int *)malloc((n + 1) * sizeof(int));
    for (int i = 0; i <= n; i++) {
        mem[i] = -1;
    }
    int result = dfs(n, mem);
    free(mem);
    return result;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    printf("Climbing %d stairs has %d possible solutions\n", n, res);

    return 0;
}