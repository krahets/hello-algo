/**
 * File: coin_change.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Размен монет: динамическое программирование */
function coinChangeDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // Переход: первая строка и первый столбец
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход: остальные строки и столбцы
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Размен монет: динамическое программирование с экономией памяти */
function coinChangeDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // Переход между состояниями
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[a] = dp[a];
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* Основная программа */
const coins = [1, 2, 5];
const amt = 4;

// Динамическое программирование
let res = coinChangeDP(coins, amt);
console.log(`Минимальное число монет для заданной суммы: ${res}`);

// Динамическое программирование с экономией памяти
res = coinChangeDPComp(coins, amt);
console.log(`Минимальное число монет для заданной суммы: ${res}`);

export {};
