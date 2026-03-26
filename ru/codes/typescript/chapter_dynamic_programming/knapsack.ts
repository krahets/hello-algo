/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Рюкзак 0-1: полный перебор */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Вернуть вариант с большей стоимостью из двух возможных
    return Math.max(no, yes);
}

/* Рюкзак 0-1: поиск с мемоизацией */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // Если запись уже существует, вернуть ее напрямую
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Сохранить и вернуть более выгодный из двух вариантов
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* Рюкзак 0-1: динамическое программирование */
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
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Инициализировать таблицу dp
    const dp = Array(cap + 1).fill(0);
    // Переход состояния
    for (let i = 1; i <= n; i++) {
        // Обойти в обратном порядке
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Полный перебор
let res = knapsackDFS(wgt, val, n, cap);
console.log(`Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна ${res}`);

// Поиск с мемоизацией
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна ${res}`);

// Динамическое программирование
res = knapsackDP(wgt, val, cap);
console.log(`Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна ${res}`);

// Динамическое программирование с оптимизацией по памяти
res = knapsackDPComp(wgt, val, cap);
console.log(`Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна ${res}`);

export {};
