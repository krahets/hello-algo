/**
 * File: climbing_stairs_constraint_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Подъём по лестнице с ограничением: динамическое программирование */
function climbingStairsConstraintDP(n) {
    if (n === 1 || n === 2) {
        return 1;
    }
    // Создать таблицу dp для решений подзадач
    const dp = Array.from(new Array(n + 1), () => new Array(3));
    // Начальные состояния: задать решения простейших подзадач
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // Переход: решать подзадачи от меньших к большим
    for (let i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* Основная программа */
const n = 9;
const res = climbingStairsConstraintDP(n);
console.log(`Число способов подняться на лестницу из ${n} ступеней: ${res}.`);
