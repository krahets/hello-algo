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

/* 完全背包：動態規劃 */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // 狀態轉移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超過背包容量，則不選物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // 釋放記憶體
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 完全背包：空間最佳化後的動態規劃 */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int *dp = calloc(cap + 1, sizeof(int));
    // 狀態轉移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超過背包容量，則不選物品 i
                dp[c] = dp[c];
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // 釋放記憶體
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // 動態規劃
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("不超過背包容量的最大物品價值為 %d\n", res);

    // 空間最佳化後的動態規劃
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("不超過背包容量的最大物品價值為 %d\n", res);

    return 0;
}
