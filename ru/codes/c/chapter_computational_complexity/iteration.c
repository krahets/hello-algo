/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* Цикл for */
int forLoop(int n) {
    int res = 0;
    // Циклическое суммирование 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Цикл while */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Инициализация условной переменной
    // Циклическое суммирование 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Обновить условную переменную
    }
    return res;
}

/* Цикл while (двойное обновление) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Инициализация условной переменной
    // Циклическое суммирование 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Обновить условную переменную
        i++;
        i *= 2;
    }
    return res;
}

/* Двойной цикл for */
char *nestedForLoop(int n) {
    // n * n — это число соответствующих точек, а максимальная длина строки "(i, j), " равна 6+10*2, плюс дополнительное место для завершающего нулевого символа \0
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // Цикл по i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // Цикл по j = 1, 2, ..., n-1, n
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
    printf("\nРезультат суммирования в цикле while (двойное обновление) res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\nРезультат двойного цикла for %s\r\n", resStr);
    free(resStr);

    return 0;
}
