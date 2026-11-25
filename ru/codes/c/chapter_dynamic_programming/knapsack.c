/**
 * File: knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Найти максимум */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* Рюкзак 0–1: полный перебор */
int knapsackDFS(int wgt[], int val[], int i, int c) {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Вернуть большую из двух стоимостей
    return myMax(no, yes);
}

/* Рюкзак 0–1: поиск с мемоизацией */
int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Если результат сохранён, сразу вернуть его
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = myMax(no, yes);
    return mem[i][c];
}

/* Рюкзак 0–1: динамическое программирование */
int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
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
                dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
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

/* Рюкзак 0–1: динамическое программирование с экономией памяти */
int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // Инициализировать таблицу dp
    int *dp = calloc(cap + 1, sizeof(int));
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        // Обход в обратном порядке
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
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
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = sizeof(wgt) / sizeof(wgt[0]);
    int wgtSize = n;

    // Полный перебор
    int res = knapsackDFS(wgt, val, n, cap);
    printf("Максимальная стоимость предметов, помещающихся в рюкзак: %d\n", res);

    // Поиск с мемоизацией
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((cap + 1) * sizeof(int));
        memset(mem[i], -1, (cap + 1) * sizeof(int));
    }
    res = knapsackDFSMem(wgt, val, cap + 1, mem, n, cap);
    printf("Максимальная стоимость предметов, помещающихся в рюкзак: %d\n", res);
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // Динамическое программирование
    res = knapsackDP(wgt, val, cap, wgtSize);
    printf("Максимальная стоимость предметов, помещающихся в рюкзак: %d\n", res);

    // Динамическое программирование с экономией памяти
    res = knapsackDPComp(wgt, val, cap, wgtSize);
    printf("Максимальная стоимость предметов, помещающихся в рюкзак: %d\n", res);

    return 0;
}
