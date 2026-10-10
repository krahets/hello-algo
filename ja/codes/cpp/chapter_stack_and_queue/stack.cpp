/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* スタックを初期化 */
    stack<int> stack;

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "スタック stack = ";
    printStack(stack);

    /* スタックトップの要素にアクセス */
    int top = stack.top();
    cout << "トップ要素 top = " << top << endl;

    /* 要素をポップ */
    stack.pop(); // 戻り値なし
    cout << "取り出した要素 pop = " << top << "、取り出し後の stack = ";
    printStack(stack);

    /* スタックの長さを取得 */
    int size = stack.size();
    cout << "スタックの長さ size = " << size << endl;

    /* 空かどうかを判定 */
    bool empty = stack.empty();
    cout << "スタックが空かどうか = " << empty << endl;

    return 0;
}
