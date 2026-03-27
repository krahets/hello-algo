/**
 * File: min_cost_climbing_stairs_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Найти минимум */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование */
int minCostClimbingStairsDP(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // Инициализация таблицы dp для хранения решений подзадач
    int *dp = calloc(n + 1, sizeof(int));
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (int i = 3; i <= n; i++) {
        dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
    }
    int res = dp[n];
    // Освободить память
    free(dp);
    return res;
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
int minCostClimbingStairsDPComp(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = myMin(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver Code */
int main() {
    int cost[] = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    int costSize = sizeof(cost) / sizeof(cost[0]);
    printf("Список стоимостей ступеней = ");
    printArray(cost, costSize);

    int res = minCostClimbingStairsDP(cost, costSize);
    printf("Минимальная стоимость подъема по лестнице = %d\n", res);

    res = minCostClimbingStairsDPComp(cost, costSize);
    printf("Минимальная стоимость подъема по лестнице = %d\n", res);

    return 0;
}
