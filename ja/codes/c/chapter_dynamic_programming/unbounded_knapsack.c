/**
 * File: unbounded_knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 最大値を求める */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 完全ナップサック問題：動的計画法 */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp テーブルを初期化
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 完全ナップサック問題：空間最適化後の動的計画法 */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp テーブルを初期化
    int *dp = calloc(cap + 1, sizeof(int));
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[c] = dp[c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // メモリを解放する
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // 動的計画法
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("ナップサック容量を超えない最大価値は %d\n", res);

    // 空間最適化後の動的計画法
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("ナップサック容量を超えない最大価値は %d\n", res);

    return 0;
}
