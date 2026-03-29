/**
 * File: climbing_stairs_dfs_mem.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* メモ化探索 */
int dfs(int i, int *mem) {
    // dp[1] と dp[2] は既知なので返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] の記録があれば、それをそのまま返す
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    return count;
}

/* 階段登り：メモ化探索 */
int climbingStairsDFSMem(int n) {
    // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
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
    printf("%d 段の階段を登る方法は全部で %d 通りです\n", n, res);

    return 0;
}