/**
 * File: knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最大值 */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 0-1 背包：暴力搜尋 */
int knapsackDFS(int wgt[], int val[], int i, int c) {
    // 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // 若重量超過背包容量，就只能選擇不放入
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 分別計算不放入與放入物品 i 可取得的最大價值
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 回傳兩種選法中較大的價值
    return myMax(no, yes);
}

/* 0-1 背包：記憶化搜尋 */
int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
    // 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // 若已有紀錄，直接回傳該值
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 若重量超過背包容量，就只能選擇不放入
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    }
    // 分別計算不放入與放入物品 i 可取得的最大價值
    int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 記錄並回傳兩種選法中較大的價值
    mem[i][c] = myMax(no, yes);
    return mem[i][c];
}

/* 0-1 背包：動態規劃 */
int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
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
                // 若重量超過背包容量，就不選物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
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

/* 0-1 背包：空間最佳化後的動態規劃 */
int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // 初始化 dp 表
    int *dp = calloc(cap + 1, sizeof(int));
    // 狀態轉移
    for (int i = 1; i <= n; i++) {
        // 反向走訪
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // 釋放記憶體
    free(dp);
    return res;
}

/* 主程式 */
int main() {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = sizeof(wgt) / sizeof(wgt[0]);
    int wgtSize = n;

    // 暴力搜尋
    int res = knapsackDFS(wgt, val, n, cap);
    printf("在背包容量限制內，物品的最大總價值為 %d\n", res);

    // 記憶化搜尋
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((cap + 1) * sizeof(int));
        memset(mem[i], -1, (cap + 1) * sizeof(int));
    }
    res = knapsackDFSMem(wgt, val, cap + 1, mem, n, cap);
    printf("在背包容量限制內，物品的最大總價值為 %d\n", res);
    // 釋放記憶體
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // 動態規劃
    res = knapsackDP(wgt, val, cap, wgtSize);
    printf("在背包容量限制內，物品的最大總價值為 %d\n", res);

    // 空間最佳化後的動態規劃
    res = knapsackDPComp(wgt, val, cap, wgtSize);
    printf("在背包容量限制內，物品的最大總價值為 %d\n", res);

    return 0;
}
