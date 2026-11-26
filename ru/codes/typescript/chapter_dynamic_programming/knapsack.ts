/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Рюкзак 0–1: полный перебор */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Вернуть большую из двух стоимостей
    return Math.max(no, yes);
}

/* Рюкзак 0–1: поиск с мемоизацией */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // Если результат сохранён, сразу вернуть его
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* Рюкзак 0–1: динамическое программирование */
function knapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
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
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Рюкзак 0–1: динамическое программирование с экономией памяти */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Инициализировать таблицу dp
    const dp = Array(cap + 1).fill(0);
    // Переход между состояниями
    for (let i = 1; i <= n; i++) {
        // Обход в обратном порядке
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Основная программа */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Полный перебор
let res = knapsackDFS(wgt, val, n, cap);
console.log(`Максимальная стоимость предметов, помещающихся в рюкзак: ${res}`);

// Поиск с мемоизацией
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`Максимальная стоимость предметов, помещающихся в рюкзак: ${res}`);

// Динамическое программирование
res = knapsackDP(wgt, val, cap);
console.log(`Максимальная стоимость предметов, помещающихся в рюкзак: ${res}`);

// Динамическое программирование с экономией памяти
res = knapsackDPComp(wgt, val, cap);
console.log(`Максимальная стоимость предметов, помещающихся в рюкзак: ${res}`);

export {};
