/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for 循环 */
int forLoop(int n) {
    int res = 0;
    // 循环求和 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 循环 */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // 更新条件变量
    }
    return res;
}

/* while 循环（两次更新） */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // 更新条件变量
        i++;
        i *= 2;
    }
    return res;
}

/* 双层 for 循环 */
char *nestedForLoop(int n) {
    // n * n 为对应点数量，"(i, j), " 对应字符串长最大为 6+10*2，加上最后一个空字符 \0 的额外空间
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // 循环 i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; i++) {
        // 循环 j = 1, 2, ..., n-1, n
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
    printf("\nfor 循环的求和结果 res = %d\n", res);

    res = whileLoop(n);
    printf("\nwhile 循环的求和结果 res = %d\n", res);

    res = whileLoopII(n);
    printf("\nwhile 循环（两次更新）求和结果 res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\n双层 for 循环的遍历结果 %s\r\n", resStr);
    free(resStr);

    return 0;
}
