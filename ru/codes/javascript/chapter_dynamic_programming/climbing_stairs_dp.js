/**
 * File: climbing_stairs_dp.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Подъём по лестнице: динамическое программирование */
function climbingStairsDP(n) {
    if (n === 1 || n === 2) return n;
    // Создать таблицу dp для решений подзадач
    const dp = new Array(n + 1).fill(-1);
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход: решать подзадачи от меньших к большим
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
function climbingStairsDPComp(n) {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Основная программа */
const n = 9;
let res = climbingStairsDP(n);
console.log(`Число способов подняться на лестницу из ${n} ступеней: ${res}.`);
res = climbingStairsDPComp(n);
console.log(`Число способов подняться на лестницу из ${n} ступеней: ${res}.`);
