/**
 * File: recursion.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <stack>
using namespace std;

/* 普通递归：求和 1+2+...+n */
int recur(int n) {
    // 终止条件
    if (n == 1)
        return 1;
    // 递：递归调用
    int res = recur(n - 1);
    // 归：返回结果
    return n + res;
}

/* 迭代模拟递归：用栈模拟递归过程 */
int forLoopRecur(int n) {
    stack<int> stack;
    int res = 0;

    // 递：入栈
    for (int i = n; i > 0; --i) {
        stack.push(i);
    }
    // 归：出栈累加
    while (!stack.empty()) {
        res += stack.top();
        stack.pop();
    }
    return res;
}

/* 尾递归：累加结果通过参数传递 */
int tailRecur(int n, int res) {
    if (n == 0)
        return res;
    // 尾递归调用
    return tailRecur(n - 1, res + n);
}

/* 斐波那契数列：递归 */
int fib(int n) {
    // 终止条件
    if (n == 1 || n == 2)
        return n - 1;
    // 递归公式
    return fib(n - 1) + fib(n - 2);
}

/* 主函数测试 */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    cout << "\n普通递归 求和结果 = " << res << endl;

    res = forLoopRecur(n);
    cout << "\n迭代模拟递归 结果 = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\n尾递归 求和结果 = " << res << endl;

    res = fib(n);
    cout << "\n斐波那契第 " << n << " 项 = " << res << endl;

    return 0;
}
