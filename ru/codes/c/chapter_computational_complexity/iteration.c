/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* Цикл for */
int forLoop(int n) {
    int res = 0;
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for (int i = 1; i <= n; i++) {
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
char *nestedForLoop(int n) {
    // Всего n * n точек. Строка "(i, j), " занимает до 6+10*2 символов. Ещё один символ нужен для завершающего нуля \0
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // Перебрать i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // Перебрать j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* Основная программа */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nСумма в цикле for: res = %d\n", res);

    res = whileLoop(n);
    printf("\nСумма в цикле while: res = %d\n", res);

    res = whileLoopII(n);
    printf("\nСумма в цикле while с двумя обновлениями: res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\nРезультат обхода вложенными циклами for: %s\r\n", resStr);
    free(resStr);

    return 0;
}
