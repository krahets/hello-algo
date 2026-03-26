/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Цикл for */
int forLoop(int n) {
    int res = 0;
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* Цикл while */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Инициализировать управляющую переменную
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Обновить управляющую переменную
    }
    return res;
}

/* Цикл while (с двумя обновлениями) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Инициализировать управляющую переменную
    // В цикле вычислить сумму 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Обновить управляющую переменную
        i++;
        i *= 2;
    }
    return res;
}

/* Двойной цикл for */
string nestedForLoop(int n) {
    ostringstream res;
    // Цикл i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // Цикл j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nРезультат суммирования в цикле for res = " << res << endl;

    res = whileLoop(n);
    cout << "\nРезультат суммирования в цикле while res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nРезультат суммирования в цикле while (с двумя обновлениями) res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\nРезультат обхода двойным циклом for " << resStr << endl;

    return 0;
}
