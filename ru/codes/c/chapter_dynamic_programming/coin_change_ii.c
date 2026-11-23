/**
 * File: coin_change_ii.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Размен монет II: динамическое программирование */
int coinChangeIIDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // Инициализация таблицы dp
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // Инициализация первого столбца
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    int res = dp[n][amt];
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // Инициализация таблицы dp
    int *dp = calloc(amt + 1, sizeof(int));
    dp[0] = 1;
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    int res = dp[amt];
    // Освободить память
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 5;

    // Динамическое программирование
    int res = coinChangeIIDP(coins, amt, coinsSize);
    printf("Количество комбинаций монет для набора целевой суммы = %d\n", res);

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeIIDPComp(coins, amt, coinsSize);
    printf("Количество комбинаций монет для набора целевой суммы = %d\n", res);

    return 0;
}
