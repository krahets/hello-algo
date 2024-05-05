/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for loop */
int forLoop(int n) {
    int res = 0;
    // Loop sum 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while loop */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // Initialize condition variable
    // Loop sum 1, 2, ..., n-1, n
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
    // Loop sum 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Update condition variable
        i++;
        i *= 2;
    }
    return res;
}

/* Double for loop */
char *nestedForLoop(int n) {
    // n * n corresponds to the number of points, "(i, j), " maximum string length 6+10*2, plus extra space for the final null character \0
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
    printf("\nSum result of for loop res = %d\n", res);

    res = whileLoop(n);
    printf("\nSum result of while loop res = %d\n", res);

    res = whileLoopII(n);
    printf("\nSum result of while loop (two updates) res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\nResult of double for loop traversal %s\r\n", resStr);
    free(resStr);

    return 0;
}
