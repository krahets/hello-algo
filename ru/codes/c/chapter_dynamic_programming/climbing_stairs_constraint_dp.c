/**
 * File: climbing_stairs_constraint_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Подъем по лестнице с ограничениями: динамическое программирование */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // Инициализация таблицы dp для хранения решений подзадач
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(3, sizeof(int));
    }
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    int res = dp[n][1] + dp[n][2];
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    printf("Количество способов подняться по лестнице из %d ступеней: %d\n", n, res);

    return 0;
}
