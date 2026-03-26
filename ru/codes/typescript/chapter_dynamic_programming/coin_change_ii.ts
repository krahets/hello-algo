/**
 * File: coin_change_ii.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Размен монет II: динамическое программирование */
function coinChangeIIDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // Инициализировать первый столбец
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // Переход состояния
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Сумма двух вариантов: не выбирать монету i и выбрать монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // Переход состояния
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[a] = dp[a];
            } else {
                // Сумма двух вариантов: не выбирать монету i и выбрать монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver Code */
const coins = [1, 2, 5];
const amt = 5;

// Динамическое программирование
let res = coinChangeIIDP(coins, amt);
console.log(`Количество комбинаций монет для получения целевой суммы равно ${res}`);

// Динамическое программирование с оптимизацией по памяти
res = coinChangeIIDPComp(coins, amt);
console.log(`Количество комбинаций монет для получения целевой суммы равно ${res}`);

export {};
