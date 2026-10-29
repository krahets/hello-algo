/**
 * File: coin_change.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 最小値を求める */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 硬貨の両替：動的計画法 */
int coinChangeDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // dp テーブルを初期化する
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // 状態遷移：先頭行と先頭列
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 状態遷移：残りの行と列
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* 硬貨の両替：空間を最適化した動的計画法 */
int coinChangeDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // dp テーブルを初期化する
    int *dp = malloc((amt + 1) * sizeof(int));
    for (int j = 1; j <= amt; j++) {
        dp[j] = MAX;
    } 
    dp[0] = 0;

    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[amt] != MAX ? dp[amt] : -1;
    // メモリを解放する
    free(dp);
    return res;
}

/* 実行用コード */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 4;

    // 動的計画法
    int res = coinChangeDP(coins, amt, coinsSize);
    printf("目標金額にするために必要な硬貨の最小枚数は %d\n", res);

    // 空間を最適化した動的計画法
    res = coinChangeDPComp(coins, amt, coinsSize);
    printf("目標金額にするために必要な硬貨の最小枚数は %d\n", res);

    return 0;
}
