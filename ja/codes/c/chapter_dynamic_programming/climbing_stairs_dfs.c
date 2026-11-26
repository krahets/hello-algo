/**
 * File: climbing_stairs_dfs.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 探索 */
int dfs(int i) {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 階段の登り方：探索 */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* 実行例 */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    printf("全 %d 段の階段の登り方は %d 通り\n", n, res);

    return 0;
}