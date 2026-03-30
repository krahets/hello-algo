/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Цикл for */
function forLoop(n) {
    let res = 0;
    // Циклическое суммирование 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Цикл while */
function whileLoop(n) {
    let res = 0;
    let i = 1; // Инициализация условной переменной
    // Циклическое суммирование 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Обновить условную переменную
    }
    return res;
}

/* Цикл while (двойное обновление) */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // Инициализация условной переменной
    // Циклическое суммирование 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Обновить условную переменную
        i++;
        i *= 2;
    }
    return res;
}

/* Двойной цикл for */
function nestedForLoop(n) {
    let res = '';
    // Цикл по i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // Цикл по j = 1, 2, ..., n-1, n
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
console.log(`Результат суммирования в цикле while (двойное обновление) res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`Результат обхода в двойном цикле for ${resStr}`);
