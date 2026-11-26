/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Цикл for */
int forLoop(int n) {
    int res = 0;
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* Цикл while */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Задать начальное значение переменной условия
    // Сложить числа 1, 2, ..., n-1, n в цикле
    while (i <= n) {
        res += i;
        i++; // Обновить переменную условия
    }
    return res;
}

/* Цикл while с двумя обновлениями */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Задать начальное значение переменной условия
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
string nestedForLoop(int n) {
    ostringstream res;
    // Перебрать i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // Перебрать j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* Основная программа */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nСумма в цикле for: res = " << res << endl;

    res = whileLoop(n);
    cout << "\nСумма в цикле while: res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nСумма в цикле while с двумя обновлениями: res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\nРезультат обхода вложенными циклами for: " << resStr << endl;

    return 0;
}
