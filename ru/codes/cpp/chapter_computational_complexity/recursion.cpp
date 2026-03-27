/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Рекурсия */
int recur(int n) {
    // Условие завершения
    if (n == 1)
        return 1;
    // Рекурсивный шаг: выполнить рекурсивный вызов
    int res = recur(n - 1);
    // Шаг возврата: вернуть результат
    return n + res;
}

/* Имитировать рекурсию с помощью итерации */
int forLoopRecur(int n) {
    // Использовать явный стек для имитации системного стека вызовов
    stack<int> stack;
    int res = 0;
    // Рекурсивный шаг: выполнить рекурсивный вызов
    for (int i = n; i > 0; i--) {
        // Смоделировать шаг «спуск» с помощью операции помещения в стек
        stack.push(i);
    }
    // Шаг возврата: вернуть результат
    while (!stack.empty()) {
        // Смоделировать шаг «подъем» с помощью операции извлечения из стека
        res += stack.top();
        stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Хвостовая рекурсия */
int tailRecur(int n, int res) {
    // Условие завершения
    if (n == 0)
        return res;
    // Вызов хвостовой рекурсии
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
    cout << "\nРезультат суммирования рекурсивной функции res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\nИмитировать рекурсию с помощью итерациисуммированиерезультат res =" << res << endl;

    res = tailRecur(n, 0);
    cout << "\nРезультат суммирования хвостовой рекурсией res = " << res << endl;

    res = fib(n);
    cout << "\n" << n << "-й элемент последовательности Фибоначчи равен " << res << endl;

    return 0;
}
