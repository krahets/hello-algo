/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
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

    /* スタックの先頭要素にアクセスする */
    int top = stack.top();
    cout << "スタックの先頭要素 top = " << top << endl;

    /* 要素をポップする */
    stack.pop(); // 戻り値なし
    cout << "ポップした要素 pop = " << top << "、ポップ後 stack = ";
    printStack(stack);

    /* スタックの長さを取得する */
    int size = stack.size();
    cout << "スタックの長さ size = " << size << endl;

    /* 空かどうかを判定する */
    bool empty = stack.empty();
    cout << "スタックは空か = " << empty << endl;

    return 0;
}
