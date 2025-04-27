/**
 * File: coin_change.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最小值 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 零錢兌換：動態規劃 */
int coinChangeDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // 初始化 dp 表
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // 狀態轉移：首行首列
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 狀態轉移：其餘行和列
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超過目標金額，則不選硬幣 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不選和選硬幣 i 這兩種方案的較小值
                dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
    // 釋放記憶體
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* 零錢兌換：空間最佳化後的動態規劃 */
int coinChangeDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // 初始化 dp 表
    int *dp = malloc((amt + 1) * sizeof(int));
    for (int j = 1; j <= amt; j++) {
        dp[j] = MAX;
    } 
    dp[0] = 0;

    // 狀態轉移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超過目標金額，則不選硬幣 i
                dp[a] = dp[a];
            } else {
                // 不選和選硬幣 i 這兩種方案的較小值
                dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[amt] != MAX ? dp[amt] : -1;
    // 釋放記憶體
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 4;

    // 動態規劃
    int res = coinChangeDP(coins, amt, coinsSize);
    printf("湊到目標金額所需的最少硬幣數量為 %d\n", res);

    // 空間最佳化後的動態規劃
    res = coinChangeDPComp(coins, amt, coinsSize);
    printf("湊到目標金額所需的最少硬幣數量為 %d\n", res);

    return 0;
}
