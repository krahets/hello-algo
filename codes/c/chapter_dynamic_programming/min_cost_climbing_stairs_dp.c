/**
 * File: min_cost_climbing_stairs_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "common.h"

/* 爬楼梯最小代价：动态规划 */
int minCostClimbingStairsDP(vector *cost) {
    int n = cost->size - 1;
    if (n == 1 || n == 2)
        return *(int *)cost->data[n];
    // 初始化 dp 表，用于存储子问题的解
    int *temp = malloc(sizeof(int));
    *temp = 0;
    vector *dp = _newVector(n + 1, temp, sizeof(int));
    // 初始状态：预设最小子问题的解
    vectorSet(dp, 1, cost->data[1], sizeof(int));
    vectorSet(dp, 2, cost->data[2], sizeof(int));
    // 状态转移：从较小子问题逐步求解较大子问题
    for (int i = 3; i <= n; i++) {
        int *a = dp->data[i - 1];
        int *b = dp->data[i - 2];
        int *c = cost->data[i];
        int *minNum = malloc(sizeof(int));
        *minNum = min(*a, *b) + *c;
        vectorSet(dp, i, minNum, sizeof(int));
    }
    return *(int *)dp->data[n];
}

/* 爬楼梯最小代价：空间优化后的动态规划 */
int minCostClimbingStairsDPComp(vector *cost) {
    int n = cost->size - 1;
    if (n == 1 || n == 2)
        return *(int *)cost->data[n];
    int *a = malloc(sizeof(int));
    *a = *(int *)cost->data[1];
    int *b = malloc(sizeof(int));
    *b = *(int *)cost->data[2];
    for (int i = 3; i <= n; i++) {
        int *tmp = malloc(sizeof(int));
        *tmp = *b;
        *b = min(*a, *tmp) + *(int *)cost->data[i];
        *a = *tmp;
    }
    return *b;
}

/*求最小值*/
int min(int a, int b) {
    return a < b ? a : b;
}

/* Driver Code */
int main() {
    int nums[] = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    vector *cost = newVector(); // int
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        vectorPushback(cost, &nums[i], sizeof(int));
    }
    printf("输入楼梯的代价列表为 ");
    printVector(cost, printFunc);

    int res = minCostClimbingStairsDP(cost);
    printf("爬完楼梯的最低代价为 %d\n", res);

    res = minCostClimbingStairsDPComp(cost);
    printf("爬完楼梯的最低代价为 %d\n", res);

    return 0;
}
