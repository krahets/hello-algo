/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Рекурсия */
int recur(int n) {
    // Условие завершения
    if (n == 1)
        return 1;
    // Рекурсия: рекурсивный вызов
    int res = recur(n - 1);
    // Возврат: вернуть результат
    return n + res;
}

/* Имитация рекурсии итерацией */
int forLoopRecur(int n) {
    int stack[1000]; // Использовать большой массив для имитации стека
    int top = -1;    // Индекс вершины стека
    int res = 0;
    // Рекурсия: рекурсивный вызов
    for (int i = n; i > 0; i--) {
        // Имитировать «рекурсию» с помощью операции помещения в стек
        stack[1 + top++] = i;
    }
    // Возврат: вернуть результат
    while (top >= 0) {
        // Имитировать «возврат» с помощью операции извлечения из стека
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* Хвостовая рекурсия */
int tailRecur(int n, int res) {
    // Условие завершения
    if (n == 0)
        return res;
    // Хвостовой рекурсивный вызов
    return tailRecur(n - 1, res + n);
}

/* Последовательность Фибоначчи: рекурсия */
int fib(int n) {
    // Условие завершения: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\nРезультат суммирования в рекурсивной функции res = %d\n", res);

    res = forLoopRecur(n);
    printf("\nРезультат суммирования с использованием итерации для имитации рекурсии res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\nРезультат суммирования в хвостовой рекурсии res = %d\n", res);

    res = fib(n);
    printf("\nЭлемент последовательности Фибоначчи с индексом %d = %d\n", n, res);

    return 0;
}
