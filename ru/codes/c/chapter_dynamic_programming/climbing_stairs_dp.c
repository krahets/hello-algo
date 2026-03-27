/**
 * File: climbing_stairs_dp.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Подъем по лестнице: динамическое программирование */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Инициализация таблицы dp для хранения решений подзадач
    int *dp = (int *)malloc((n + 1) * sizeof(int));
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    int result = dp[n];
    free(dp);
    return result;
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    printf("Количество способов подняться по лестнице из %d ступеней: %d\n", n, res);

    res = climbingStairsDPComp(n);
    printf("Количество способов подняться по лестнице из %d ступеней: %d\n", n, res);

    return 0;
}