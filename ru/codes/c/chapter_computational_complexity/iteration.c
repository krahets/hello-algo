/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* Цикл for */
int forLoop(int n) {
    int res = 0;
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
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
char *nestedForLoop(int n) {
    // n * n это число соответствующих точек, а максимальная длина строки "(i, j), " равна 6+10*2; дополнительно учитывается завершающий нулевой символ \0
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // Цикл i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // Цикл j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nРезультат суммирования в цикле for res = %d\n", res);

    res = whileLoop(n);
    printf("\nРезультат суммирования в цикле while res = %d\n", res);

    res = whileLoopII(n);
    printf("\nРезультат суммирования в цикле while (с двумя обновлениями) res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\nРезультат обхода двойным циклом for %s\r\n", resStr);
    free(resStr);

    return 0;
}
