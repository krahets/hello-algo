/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 遞迴 */
int recur(int n) {
    // 終止條件
    if (n == 1)
        return 1;
    // 遞：遞迴呼叫
    int res = recur(n - 1);
    // 迴：回傳結果
    return n + res;
}

/* 以迭代模擬遞迴 */
int forLoopRecur(int n) {
    // 自行建立堆疊，模擬系統的呼叫堆疊
    stack<int> stack;
    int res = 0;
    // 遞：遞迴呼叫
    for (int i = n; i > 0; i--) {
        // 以「推入堆疊」模擬「遞」
        stack.push(i);
    }
    // 迴：回傳結果
    while (!stack.empty()) {
        // 以「彈出堆疊」模擬「迴」
        res += stack.top();
        stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* 尾端遞迴 */
int tailRecur(int n, int res) {
    // 終止條件
    if (n == 0)
        return res;
    // 尾端遞迴呼叫
    return tailRecur(n - 1, res + n);
}

/* 費氏數列：遞迴 */
int fib(int n) {
    // 終止條件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // 回傳結果 f(n)
    return res;
}

/* 主程式 */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    cout << "\n遞迴函式的總和 res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\n以迭代模擬遞迴的總和 res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\n尾端遞迴函式的總和 res = " << res << endl;

    res = fib(n);
    cout << "\n費氏數列的第 " << n << " 項為 " << res << endl;

    return 0;
}
