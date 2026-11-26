/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Рекурсия */
int recur(int n) {
    // Условие остановки
    if (n == 1)
        return 1;
    // Спуск: рекурсивный вызов
    int res = recur(n - 1);
    // Возврат: передача результата
    return n + res;
}

/* Моделирование рекурсии с помощью итерации */
int forLoopRecur(int n) {
    int stack[1000]; // Представить стек с помощью большого массива
    int top = -1;    // Индекс вершины стека
    int res = 0;
    // Спуск: рекурсивный вызов
    for (int i = n; i > 0; i--) {
        // Добавление в стек моделирует спуск
        stack[1 + top++] = i;
    }
    // Возврат: передача результата
    while (top >= 0) {
        // Извлечение из стека моделирует возврат
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* Хвостовая рекурсия */
int tailRecur(int n, int res) {
    // Условие остановки
    if (n == 0)
        return res;
    // Хвостовой рекурсивный вызов
    return tailRecur(n - 1, res + n);
}

/* Числа Фибоначчи: рекурсия */
int fib(int n) {
    // Базовые случаи: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

/* Основная программа */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\nСумма при рекурсии: res = %d\n", res);

    res = forLoopRecur(n);
    printf("\nСумма при итеративном моделировании рекурсии: res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\nСумма при хвостовой рекурсии: res = %d\n", res);

    res = fib(n);
    printf("\nЧисло Фибоначчи с номером %d равно %d\n", n, res);

    return 0;
}
