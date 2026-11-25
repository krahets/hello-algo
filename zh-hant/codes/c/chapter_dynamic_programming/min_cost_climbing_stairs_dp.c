/**
 * File: min_cost_climbing_stairs_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最小值 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 爬樓梯的最低成本：動態規劃 */
int minCostClimbingStairsDP(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 初始化 dp 表，用來儲存子問題的解
    int *dp = calloc(n + 1, sizeof(int));
    // 初始狀態：設定最小子問題的解
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 狀態轉移：從較小的子問題逐步求出較大子問題的解
    for (int i = 3; i <= n; i++) {
        dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
    }
    int res = dp[n];
    // 釋放記憶體
    free(dp);
    return res;
}

/* 爬樓梯的最低成本：空間最佳化後的動態規劃 */
int minCostClimbingStairsDPComp(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = myMin(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* 主程式 */
int main() {
    int cost[] = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    int costSize = sizeof(cost) / sizeof(cost[0]);
    printf("輸入的各階樓梯成本為：");
    printArray(cost, costSize);

    int res = minCostClimbingStairsDP(cost, costSize);
    printf("爬完樓梯的最低成本為 %d\n", res);

    res = minCostClimbingStairsDPComp(cost, costSize);
    printf("爬完樓梯的最低成本為 %d\n", res);

    return 0;
}
