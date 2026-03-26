/**
 * File: recursion.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Рекурсия */
function recur(n: number): number {
    // Условие завершения
    if (n === 1) return 1;
    // Рекурсивный шаг: выполнить рекурсивный вызов
    const res = recur(n - 1);
    // Шаг возврата: вернуть результат
    return n + res;
}

/* Имитировать рекурсию с помощью итерации */
function forLoopRecur(n: number): number {
    // Использовать явный стек для имитации системного стека вызовов
    const stack: number[] = [];
    let res: number = 0;
    // Рекурсивный шаг: выполнить рекурсивный вызов
    for (let i = n; i > 0; i--) {
        // Смоделировать шаг «спуск» с помощью операции помещения в стек
        stack.push(i);
    }
    // Шаг возврата: вернуть результат
    while (stack.length) {
        // Смоделировать шаг «подъем» с помощью операции извлечения из стека
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Хвостовая рекурсия */
function tailRecur(n: number, res: number): number {
    // Условие завершения
    if (n === 0) return res;
    // Вызов хвостовой рекурсии
    return tailRecur(n - 1, res + n);
}

/* Последовательность Фибоначчи: рекурсия */
function fib(n: number): number {
    // Условие завершения: f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

/* Driver Code */
const n = 5;
let res: number;

res = recur(n);
console.log(`Результат суммирования рекурсивной функции res = ${res}`);

res = forLoopRecur(n);
console.log(`Результат суммирования при имитации рекурсии итерацией res = ${res}`);

res = tailRecur(n, 0);
console.log(`Результат суммирования хвостовой рекурсией res = ${res}`);

res = fib(n);
console.log(`${n}-й элемент последовательности Фибоначчи равен ${res}`);

export {};
