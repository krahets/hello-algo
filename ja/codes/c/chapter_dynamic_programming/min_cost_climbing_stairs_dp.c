/**
 * File: min_cost_climbing_stairs_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 最小値を求める */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 階段を上る最小コスト：動的計画法 */
int minCostClimbingStairsDP(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 部分問題の解を格納する dp テーブルを初期化する
    int *dp = calloc(n + 1, sizeof(int));
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (int i = 3; i <= n; i++) {
        dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
    }
    int res = dp[n];
    // メモリを解放する
    free(dp);
    return res;
}

/* 階段を上る最小コスト：空間を最適化した動的計画法 */
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

/* 実行用コード */
int main() {
    int cost[] = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    int costSize = sizeof(cost) / sizeof(cost[0]);
    printf("入力した階段のコストのリスト：");
    printArray(cost, costSize);

    int res = minCostClimbingStairsDP(cost, costSize);
    printf("階段を上り終える最小コストは %d\n", res);

    res = minCostClimbingStairsDPComp(cost, costSize);
    printf("階段を上り終える最小コストは %d\n", res);

    return 0;
}
