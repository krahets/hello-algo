/**
 * File: coin_change.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Размен монет: динамическое программирование */
function coinChangeDP(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // Переход состояния: первая строка и первый столбец
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход состояния: остальные строки и столбцы
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Выбрать меньшее из двух вариантов: не брать или взять монету i
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
function coinChangeDPComp(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // Переход состояния
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[a] = dp[a];
            } else {
                // Выбрать меньшее из двух вариантов: не брать или взять монету i
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 4;

// Динамическое программирование
let res = coinChangeDP(coins, amt);
console.log(`Минимальное число монет, необходимое для получения целевой суммы, равно ${res}`);

// Динамическое программирование с оптимизацией по памяти
res = coinChangeDPComp(coins, amt);
console.log(`Минимальное число монет, необходимое для получения целевой суммы, равно ${res}`);
