/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
    // Смоделировать стек вызовов с помощью явного стека
    stack<int> stack;
    int res = 0;
    // Спуск: рекурсивный вызов
    for (int i = n; i > 0; i--) {
        // Добавление в стек моделирует спуск
        stack.push(i);
    }
    // Возврат: передача результата
    while (!stack.empty()) {
        // Извлечение из стека моделирует возврат
        res += stack.top();
        stack.pop();
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
    cout << "\nСумма при рекурсии: res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\nСумма при итеративном моделировании рекурсии: res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\nСумма при хвостовой рекурсии: res = " << res << endl;

    res = fib(n);
    cout << "\nЧисло Фибоначчи с номером " << n << " равно " << res << endl;

    return 0;
}
