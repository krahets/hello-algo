/**
 * File: min_cost_climbing_stairs_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Минимальная стоимость подъема по лестнице: динамическое программирование */
function minCostClimbingStairsDP(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // Инициализация таблицы dp для хранения решений подзадач
    const dp = new Array(n + 1);
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
function minCostClimbingStairsDPComp(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    let a = cost[1],
        b = cost[2];
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = Math.min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver Code */
const cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
console.log('Список стоимостей ступеней =', cost);

let res = minCostClimbingStairsDP(cost);
console.log(`Минимальная стоимость подъема по лестнице = ${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`Минимальная стоимость подъема по лестнице = ${res}`);
