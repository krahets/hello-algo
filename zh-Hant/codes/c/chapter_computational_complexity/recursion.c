/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 递归 */
int recur(int n) {
    // 终止条件
    if (n == 1)
        return 1;
    // 递：递归调用
    int res = recur(n - 1);
    // 归：返回结果
    return n + res;
}

/* 使用迭代模拟递归 */
int forLoopRecur(int n) {
    int stack[1000]; // 借助一个大数组来模拟栈
    int top = -1;    // 栈顶索引
    int res = 0;
    // 递：递归调用
    for (int i = n; i > 0; i--) {
        // 通过“入栈操作”模拟“递”
        stack[1 + top++] = i;
    }
    // 归：返回结果
    while (top >= 0) {
        // 通过“出栈操作”模拟“归”
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* 尾递归 */
int tailRecur(int n, int res) {
    // 终止条件
    if (n == 0)
        return res;
    // 尾递归调用
    return tailRecur(n - 1, res + n);
}

/* 斐波那契数列：递归 */
int fib(int n) {
    // 终止条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // 递归调用 f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // 返回结果 f(n)
    return res;
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\n递归函数的求和结果 res = %d\n", res);

    res = forLoopRecur(n);
    printf("\n使用迭代模拟递归求和结果 res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\n尾递归函数的求和结果 res = %d\n", res);

    res = fib(n);
    printf("\n斐波那契数列的第 %d 项为 %d\n", n, res);

    return 0;
}
