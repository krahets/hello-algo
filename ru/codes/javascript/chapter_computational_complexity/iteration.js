/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Цикл for */
function forLoop(n) {
    let res = 0;
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Цикл while */
function whileLoop(n) {
    let res = 0;
    let i = 1; // Инициализировать управляющую переменную
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Обновить управляющую переменную
    }
    return res;
}

/* Цикл while (с двумя обновлениями) */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // Инициализировать управляющую переменную
    // В цикле вычислить сумму 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Обновить управляющую переменную
        i++;
        i *= 2;
    }
    return res;
}

/* Двойной цикл for */
function nestedForLoop(n) {
    let res = '';
    // Цикл i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // Цикл j = 1, 2, ..., n-1, n
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = forLoop(n);
console.log(`Результат суммирования в цикле for res = ${res}`);

res = whileLoop(n);
console.log(`Результат суммирования в цикле while res = ${res}`);

res = whileLoopII(n);
console.log(`Цикл while (с двумя обновлениями)суммированиерезультат res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`Результат обхода двойным циклом for ${resStr}`);
