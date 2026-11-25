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

/* Неограниченный рюкзак: динамическое программирование */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Инициализировать таблицу dp
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
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

/* Неограниченный рюкзак: динамическое программирование с экономией памяти */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Инициализировать таблицу dp
    int *dp = calloc(cap + 1, sizeof(int));
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[c] = dp[c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // Освободить память
    free(dp);
    return res;
}

/* Основная программа */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // Динамическое программирование
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("Максимальная стоимость предметов, помещающихся в рюкзак: %d\n", res);

    // Динамическое программирование с экономией памяти
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("Максимальная стоимость предметов, помещающихся в рюкзак: %d\n", res);

    return 0;
}
