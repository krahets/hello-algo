/**
 * File: climbing_stairs_constraint_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Подъём по лестнице с ограничением: динамическое программирование */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // Создать таблицу dp для решений подзадач
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(3, sizeof(int));
    }
    // Начальные состояния: задать решения простейших подзадач
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // Переход: решать подзадачи от меньших к большим
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

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res);

    return 0;
}
