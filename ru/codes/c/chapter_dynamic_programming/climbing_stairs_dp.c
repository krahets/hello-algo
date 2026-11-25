/**
 * File: climbing_stairs_dp.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Подъём по лестнице: динамическое программирование */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Создать таблицу dp для решений подзадач
    int *dp = (int *)malloc((n + 1) * sizeof(int));
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход: решать подзадачи от меньших к большим
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    int result = dp[n];
    free(dp);
    return result;
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
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

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res);

    res = climbingStairsDPComp(n);
    printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res);

    return 0;
}