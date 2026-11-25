/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 範例程式 */
int main() {
    /* 初始化堆疊 */
    stack<int> stack;

    /* 將元素推入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "堆疊 stack = ";
    printStack(stack);

    /* 讀取堆疊頂端的元素 */
    int top = stack.top();
    cout << "堆疊頂端元素 top = " << top << endl;

    /* 移除堆疊頂端的元素 */
    stack.pop(); // 沒有回傳值
    cout << "彈出的元素 pop = " << top << "，彈出後 stack = ";
    printStack(stack);

    /* 取得堆疊長度 */
    int size = stack.size();
    cout << "堆疊長度 size = " << size << endl;

    /* 判斷堆疊是否為空 */
    bool empty = stack.empty();
    cout << "堆疊是否為空 = " << empty << endl;

    return 0;
}
