/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 遞迴 */
int recur(int n) {
    // 終止條件
    if (n == 1)
        return 1;
    // 遞：遞迴呼叫
    int res = recur(n - 1);
    // 迴：返回結果
    return n + res;
}

/* 使用迭代模擬遞迴 */
int forLoopRecur(int n) {
    int stack[1000]; // 藉助一個大陣列來模擬堆疊
    int top = -1;    // 堆疊頂索引
    int res = 0;
    // 遞：遞迴呼叫
    for (int i = n; i > 0; i--) {
        // 透過“入堆疊操作”模擬“遞”
        stack[1 + top++] = i;
    }
    // 迴：返回結果
    while (top >= 0) {
        // 透過“出堆疊操作”模擬“迴”
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* 尾遞迴 */
int tailRecur(int n, int res) {
    // 終止條件
    if (n == 0)
        return res;
    // 尾遞迴呼叫
    return tailRecur(n - 1, res + n);
}

/* 費波那契數列：遞迴 */
int fib(int n) {
    // 終止條件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // 返回結果 f(n)
    return res;
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\n遞迴函式的求和結果 res = %d\n", res);

    res = forLoopRecur(n);
    printf("\n使用迭代模擬遞迴求和結果 res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\n尾遞迴函式的求和結果 res = %d\n", res);

    res = fib(n);
    printf("\n費波那契數列的第 %d 項為 %d\n", n, res);

    return 0;
}
