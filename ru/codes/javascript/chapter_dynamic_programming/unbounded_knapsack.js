/**
 * File: unbounded_knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Неограниченный рюкзак: динамическое программирование */
function unboundedKnapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // Переход состояния
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, не брать предмет i
                dp[i][c] = dp[i - 1][c];
            } else {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Неограниченный рюкзак: динамическое программирование с оптимизацией памяти */
function unboundedKnapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // Переход состояния
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, не брать предмет i
                dp[c] = dp[c];
            } else {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// Динамическое программирование
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна ${res}`);

// Динамическое программирование с оптимизацией по памяти
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна ${res}`);
