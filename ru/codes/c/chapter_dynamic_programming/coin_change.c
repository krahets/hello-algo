/**
 * File: coin_change.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Найти минимум */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Размен монет: динамическое программирование */
int coinChangeDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // Инициализация таблицы dp
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // Переход состояний: первая строка и первый столбец
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход состояний: остальные строки и столбцы
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
int coinChangeDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // Инициализация таблицы dp
    int *dp = malloc((amt + 1) * sizeof(int));
    for (int j = 1; j <= amt; j++) {
        dp[j] = MAX;
    } 
    dp[0] = 0;

    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[amt] != MAX ? dp[amt] : -1;
    // Освободить память
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 4;

    // Динамическое программирование
    int res = coinChangeDP(coins, amt, coinsSize);
    printf("Минимальное количество монет для целевой суммы = %d\n", res);

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeDPComp(coins, amt, coinsSize);
    printf("Минимальное количество монет для целевой суммы = %d\n", res);

    return 0;
}
