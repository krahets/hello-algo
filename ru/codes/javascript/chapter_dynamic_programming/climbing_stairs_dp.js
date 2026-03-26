/**
 * File: climbing_stairs_dp.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Подъем по лестнице: динамическое программирование */
function climbingStairsDP(n) {
    if (n === 1 || n === 2) return n;
    // Инициализировать таблицу dp для хранения решений подзадач
    const dp = new Array(n + 1).fill(-1);
    // Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
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

/* Driver Code */
const n = 9;
let res = climbingStairsDP(n);
console.log(`Для подъема по лестнице из ${n} ступеней существует ${res} способов`);
res = climbingStairsDPComp(n);
console.log(`Для подъема по лестнице из ${n} ступеней существует ${res} способов`);
