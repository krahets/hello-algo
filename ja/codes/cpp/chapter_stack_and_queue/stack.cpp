/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* ドライバーコード */
int main() {
    /* スタックを初期化 */
    stack<int> stack;

    /* 要素プッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "Stack stack = ";
    printStack(stack);

    /* スタックトップ要素にアクセス */
    int top = stack.top();
    cout << "Top element of the stack top = " << top << endl;

    /* 要素ポップ */
    stack.pop(); // 戻り値なし
    cout << "Element popped from the stack = " << top << ", after popping";
    printStack(stack);

    /* スタックの長さを取得 */
    int size = stack.size();
    cout << "Length of the stack size = " << size << endl;

    /* 空かどうかを判定 */
    bool empty = stack.empty();
    cout << "Is the stack empty = " << empty << endl;

    return 0;
}