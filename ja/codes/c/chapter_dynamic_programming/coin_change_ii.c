/**
 * File: coin_change_ii.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 硬貨の両替 II：動的計画法 */
int coinChangeIIDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // dp テーブルを初期化する
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // 先頭列を初期化する
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    int res = dp[n][amt];
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* 硬貨の両替 II：空間を最適化した動的計画法 */
int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // dp テーブルを初期化する
    int *dp = calloc(amt + 1, sizeof(int));
    dp[0] = 1;
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    int res = dp[amt];
    // メモリを解放する
    free(dp);
    return res;
}

/* 実行用コード */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 5;

    // 動的計画法
    int res = coinChangeIIDP(coins, amt, coinsSize);
    printf("目標金額になる硬貨の組み合わせの数は %d\n", res);

    // 空間を最適化した動的計画法
    res = coinChangeIIDPComp(coins, amt, coinsSize);
    printf("目標金額になる硬貨の組み合わせの数は %d\n", res);

    return 0;
}
