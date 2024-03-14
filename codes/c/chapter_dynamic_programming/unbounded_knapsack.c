/**
 * File: unbounded_knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最大值 */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 完全背包：动态规划 */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // 释放内存
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 完全背包：空间优化后的动态规划 */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int *dp = calloc(cap + 1, sizeof(int));
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[c] = dp[c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // 释放内存
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // 动态规划
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("不超过背包容量的最大物品价值为 %d\n", res);

    // 空间优化后的动态规划
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("不超过背包容量的最大物品价值为 %d\n", res);

    return 0;
}
