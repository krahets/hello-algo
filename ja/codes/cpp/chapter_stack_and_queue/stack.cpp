/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 実行例 */
int main() {
    /* スタックを初期化する */
    stack<int> stack;

    /* 要素をプッシュする */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "スタック stack = ";
    printStack(stack);

    /* スタックのトップを参照する */
    int top = stack.top();
    cout << "スタックのトップの要素 top = " << top << endl;

    /* 要素をポップする */
    stack.pop(); // 戻り値なし
    cout << "ポップした要素 pop = " << top << "、ポップ後の stack = ";
    printStack(stack);

    /* スタックの要素数を取得する */
    int size = stack.size();
    cout << "スタックの要素数 size = " << size << endl;

    /* 空かどうかを判定する */
    bool empty = stack.empty();
    cout << "スタックは空か = " << empty << endl;

    return 0;
}
