/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for 迴圈 */
int forLoop(int n) {
    int res = 0;
    // 迴圈求和 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 迴圈 */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 初始化條件變數
    // 迴圈求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // 更新條件變數
    }
    return res;
}

/* while 迴圈（兩次更新） */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 初始化條件變數
    // 迴圈求和 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // 更新條件變數
        i++;
        i *= 2;
    }
    return res;
}

/* 雙層 for 迴圈 */
char *nestedForLoop(int n) {
    // n * n 為對應點數量，"(i, j), " 對應字串長最大為 6+10*2，加上最後一個空字元 \0 的額外空間
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // 迴圈 i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // 迴圈 j = 1, 2, ..., n-1, n
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
    printf("\nfor 迴圈的求和結果 res = %d\n", res);

    res = whileLoop(n);
    printf("\nwhile 迴圈的求和結果 res = %d\n", res);

    res = whileLoopII(n);
    printf("\nwhile 迴圈（兩次更新）求和結果 res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\n雙層 for 迴圈的走訪結果 %s\r\n", resStr);
    free(resStr);

    return 0;
}
