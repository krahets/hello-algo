/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{init_stack}
    /* スタックを初期化する */
    stack<int> stack;
    // [endregion]{init_stack}

    // [region]{push}
    /* 要素をプッシュする */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    cout << "スタック stack = ";
    printStack(stack);

    // [region]{peek}
    /* スタックの先頭要素にアクセスする */
    int top = stack.top();
    // [endregion]{peek}
    cout << "スタックの先頭要素 top = " << top << endl;

    // [region]{pop}
    /* 要素をポップする */
    stack.pop(); // 戻り値なし
    // [endregion]{pop}
    cout << "ポップした要素 pop = " << top << "、ポップ後 stack = ";
    printStack(stack);

    // [region]{size}
    /* スタックの長さを取得する */
    int size = stack.size();
    // [endregion]{size}
    cout << "スタックの長さ size = " << size << endl;

    // [region]{is_empty}
    /* 空かどうかを判定する */
    bool empty = stack.empty();
    // [endregion]{is_empty}
    cout << "スタックは空か = " << empty << endl;

    return 0;
}
