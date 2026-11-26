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
    // Переход между состояниями
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Неограниченный рюкзак: динамическое программирование с экономией памяти */
function unboundedKnapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // Переход между состояниями
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[c] = dp[c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Основная программа */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// Динамическое программирование
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`Максимальная стоимость предметов, помещающихся в рюкзак: ${res}`);

// Динамическое программирование с экономией памяти
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`Максимальная стоимость предметов, помещающихся в рюкзак: ${res}`);
