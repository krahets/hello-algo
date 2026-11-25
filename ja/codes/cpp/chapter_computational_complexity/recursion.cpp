/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 再帰 */
int recur(int n) {
    // 終了条件
    if (n == 1)
        return 1;
    // 行き：再帰呼び出し
    int res = recur(n - 1);
    // 帰り：結果を返す
    return n + res;
}

/* 反復で再帰を模擬 */
int forLoopRecur(int n) {
    // 明示的なスタックでシステムの呼び出しスタックを模擬
    stack<int> stack;
    int res = 0;
    // 行き：再帰呼び出し
    for (int i = n; i > 0; i--) {
        // プッシュで「行き」を模擬
        stack.push(i);
    }
    // 帰り：結果を返す
    while (!stack.empty()) {
        // ポップで「帰り」を模擬
        res += stack.top();
        stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* 末尾再帰 */
int tailRecur(int n, int res) {
    // 終了条件
    if (n == 0)
        return res;
    // 末尾再帰呼び出し
    return tailRecur(n - 1, res + n);
}

/* フィボナッチ数列：再帰 */
int fib(int n) {
    // 終了条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // 再帰呼び出し f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // 結果 f(n) を返す
    return res;
}

/* 実行例 */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    cout << "\n再帰関数による総和 res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\n反復で再帰を模擬して求めた総和 res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\n末尾再帰関数による総和 res = " << res << endl;

    res = fib(n);
    cout << "\nフィボナッチ数列の第 " << n << " 項は " << res << endl;

    return 0;
}
