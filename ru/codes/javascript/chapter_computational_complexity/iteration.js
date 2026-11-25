/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Цикл for */
function forLoop(n) {
    let res = 0;
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Цикл while */
function whileLoop(n) {
    let res = 0;
    let i = 1; // Задать начальное значение переменной условия
    // Сложить числа 1, 2, ..., n-1, n в цикле
    while (i <= n) {
        res += i;
        i++; // Обновить переменную условия
    }
    return res;
}

/* Цикл while с двумя обновлениями */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // Задать начальное значение переменной условия
    // Сложить числа 1, 4, 10, ... в цикле
    while (i <= n) {
        res += i;
        // Обновить переменную условия
        i++;
        i *= 2;
    }
    return res;
}

/* Вложенные циклы for */
function nestedForLoop(n) {
    let res = '';
    // Перебрать i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // Перебрать j = 1, 2, ..., n-1, n
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Основная программа */
const n = 5;
let res;

res = forLoop(n);
console.log(`Сумма в цикле for: res = ${res}`);

res = whileLoop(n);
console.log(`Сумма в цикле while: res = ${res}`);

res = whileLoopII(n);
console.log(`Сумма в цикле while с двумя обновлениями: res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`Результат обхода вложенными циклами for: ${resStr}`);
