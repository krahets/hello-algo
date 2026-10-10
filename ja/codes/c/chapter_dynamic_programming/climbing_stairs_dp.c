/**
 * File: climbing_stairs_dp.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 階段登り：動的計画法 */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // 部分問題の解を保存するために dp テーブルを初期化
    int *dp = (int *)malloc((n + 1) * sizeof(int));
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    int result = dp[n];
    free(dp);
    return result;
}

/* 階段登り：空間最適化した動的計画法 */
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

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    printf("%d 段の階段を登る方法は全部で %d 通りです\n", n, res);

    res = climbingStairsDPComp(n);
    printf("%d 段の階段を登る方法は全部で %d 通りです\n", n, res);

    return 0;
}