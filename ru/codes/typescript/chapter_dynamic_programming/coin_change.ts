/**
 * File: coin_change.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Размен монет: динамическое программирование */
function coinChangeDP(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Инициализация таблицы dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // Переход состояний: первая строка и первый столбец
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход состояний: остальные строки и столбцы
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
function coinChangeDPComp(coins: Array<number>, amt: number): number {
    const n = coins.length;
    const MAX = amt + 1;
    // Инициализация таблицы dp
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // Переход состояний
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
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
console.log(`Минимальное число монет для набора целевой суммы = ${res}`);

// Динамическое программирование с оптимизацией памяти
res = coinChangeDPComp(coins, amt);
console.log(`Минимальное число монет для набора целевой суммы = ${res}`);

export {};
