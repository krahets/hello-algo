/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Рекурсия */
function recur(n) {
    // Условие остановки
    if (n === 1) return 1;
    // Спуск: рекурсивный вызов
    const res = recur(n - 1);
    // Возврат: передача результата
    return n + res;
}

/* Моделирование рекурсии с помощью итерации */
function forLoopRecur(n) {
    // Смоделировать стек вызовов с помощью явного стека
    const stack = [];
    let res = 0;
    // Спуск: рекурсивный вызов
    for (let i = n; i > 0; i--) {
        // Добавление в стек моделирует спуск
        stack.push(i);
    }
    // Возврат: передача результата
    while (stack.length) {
        // Извлечение из стека моделирует возврат
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Хвостовая рекурсия */
function tailRecur(n, res) {
    // Условие остановки
    if (n === 0) return res;
    // Хвостовой рекурсивный вызов
    return tailRecur(n - 1, res + n);
}

/* Числа Фибоначчи: рекурсия */
function fib(n) {
    // Базовые случаи: f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

/* Основная программа */
const n = 5;
let res;

res = recur(n);
console.log(`Сумма при рекурсии: res = ${res}`);

res = forLoopRecur(n);
console.log(`Сумма при итеративном моделировании рекурсии: res = ${res}`);

res = tailRecur(n, 0);
console.log(`Сумма при хвостовой рекурсии: res = ${res}`);

res = fib(n);
console.log(`Число Фибоначчи с номером ${n} равно ${res}`);

