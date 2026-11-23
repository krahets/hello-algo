/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Рекурсия */
function recur(n) {
    // Условие завершения
    if (n === 1) return 1;
    // Рекурсия: рекурсивный вызов
    const res = recur(n - 1);
    // Возврат: вернуть результат
    return n + res;
}

/* Имитация рекурсии итерацией */
function forLoopRecur(n) {
    // Использовать явный стек для имитации системного стека вызовов
    const stack = [];
    let res = 0;
    // Рекурсия: рекурсивный вызов
    for (let i = n; i > 0; i--) {
        // Имитировать «рекурсию» с помощью операции помещения в стек
        stack.push(i);
    }
    // Возврат: вернуть результат
    while (stack.length) {
        // Имитировать «возврат» с помощью операции извлечения из стека
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Хвостовая рекурсия */
function tailRecur(n, res) {
    // Условие завершения
    if (n === 0) return res;
    // Хвостовой рекурсивный вызов
    return tailRecur(n - 1, res + n);
}

/* Последовательность Фибоначчи: рекурсия */
function fib(n) {
    // Условие завершения: f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = recur(n);
console.log(`Результат суммирования в рекурсивной функции res = ${res}`);

res = forLoopRecur(n);
console.log(`Результат суммирования при имитации рекурсии итерацией res = ${res}`);

res = tailRecur(n, 0);
console.log(`Результат суммирования в хвостовой рекурсии res = ${res}`);

res = fib(n);
console.log(`Член последовательности Фибоначчи с номером ${n} = ${res}`);

