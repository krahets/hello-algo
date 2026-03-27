/**
 * File: unbounded_knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Найти максимум */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* Полный рюкзак: динамическое программирование */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Инициализация таблицы dp
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Полный рюкзак: динамическое программирование с оптимизацией памяти */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Инициализация таблицы dp
    int *dp = calloc(cap + 1, sizeof(int));
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // Освободить память
    free(dp);
    return res;
}

/* Driver code */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // Динамическое программирование
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна %d\n", res);

    // Динамическое программирование с оптимизацией памяти
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна %d\n", res);

    return 0;
}
