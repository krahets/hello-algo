/**
 * File: climbing_stairs_dfs_mem.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* メモ化探索 */
int dfs(int i, int *mem) {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] が記録済みなら、その値を返す
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    return count;
}

/* 階段の登り方：メモ化探索 */
int climbingStairsDFSMem(int n) {
    // mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
    int *mem = (int *)malloc((n + 1) * sizeof(int));
    for (int i = 0; i <= n; i++) {
        mem[i] = -1;
    }
    int result = dfs(n, mem);
    free(mem);
    return result;
}

/* 実行例 */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    printf("全 %d 段の階段の登り方は %d 通り\n", n, res);

    return 0;
}