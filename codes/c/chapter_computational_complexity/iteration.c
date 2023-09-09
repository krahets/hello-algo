/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: MwumLi (mwumli@hotmail.com)
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
    // 循环求和 1, 4, ...
    while (i <= n) {
        res += i;
        // 更新条件变量
        i++;
        i *= 2;
    }
    return res;
}

char* nestedForLoop(int n) {
    char* res = (char*)malloc(1024); // 分配足够大的内存来存储结果
    memset(res, 0, 1024); // 初始化为零

    // 循环 i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // 循环 j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            char temp[32]; // 用于格式化 (i, j) 对的临时字符串
            sprintf(temp, "(%d, %d), ", i, j);
            strcat(res, temp); // 将临时字符串追加到结果字符串
        }
    }

    return res;
}

/* Driver Code */
int main() {
    int n = 10; // 你可以更改 n 的值
    int sum = forLoop(n);
    printf("for 循环 1 到 %d 的求和结果is: %d\n", n, sum);


    // while 循环执行jpgo
    sum = whileLoop(n);
    printf("while 循环 1 到 %d 求和结果: %d\n", n, sum);

    sum = whileLoopII(n);
    printf("while 循环 1 到 %d （两次更新）求和结果: %d\n", n, sum);

    char* result = nestedForLoop(n);
    printf("双层 for 循环的遍历结果: %s\n", result);
    free(result); // 释放动态分配的内存

    return 0;
} 