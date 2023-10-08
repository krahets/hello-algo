/**
 * File: unbounded_knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最大值 */
int max(int a, int b) {
    return a > b ? a : b;
}

/* 完全背包：动态规划 */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int dp[n + 1][cap + 1];
    memset(dp, 0, sizeof(dp));
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 完全背包：空间优化后的动态规划 */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int dp[cap + 1];
    memset(dp, 0, sizeof(dp));
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[c] = dp[c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
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
