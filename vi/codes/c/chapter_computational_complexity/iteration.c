/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for loop */
int forLoop(int n) {
    int res = 0;
    // Sum 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while loop */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Initialize condition variable
    // Sum 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Update condition variable
    }
    return res;
}

/* while loop (two updates) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // Initialize condition variable
    // Sum 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Update condition variable
        i++;
        i *= 2;
    }
    return res;
}

/* Nested for loop */
char *nestedForLoop(int n) {
    // n * n is the number of points, "(i, j), " string max length is 6+10*2, plus extra space for null character \0
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // Loop i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // Loop j = 1, 2, ..., n-1, n
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
    printf("\nFor loop sum result res = %d\n", res);

    res = whileLoop(n);
    printf("\nWhile loop sum result res = %d\n", res);

    res = whileLoopII(n);
    printf("\nWhile loop (two updates) sum result res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\nNested for loop traversal result %s\r\n", resStr);
    free(resStr);

    return 0;
}
