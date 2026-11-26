/**
 * File: climbing_stairs_dp.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 爬樓梯：動態規劃 */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // 初始化 dp 表，用來儲存子問題的解
    int *dp = (int *)malloc((n + 1) * sizeof(int));
    // 初始狀態：設定最小子問題的解
    dp[1] = 1;
    dp[2] = 2;
    // 狀態轉移：從較小的子問題逐步求出較大子問題的解
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    int result = dp[n];
    free(dp);
    return result;
}

/* 爬樓梯：空間最佳化後的動態規劃 */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* 主程式 */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    printf("爬 %d 階樓梯共有 %d 種走法\n", n, res);

    res = climbingStairsDPComp(n);
    printf("爬 %d 階樓梯共有 %d 種走法\n", n, res);

    return 0;
}