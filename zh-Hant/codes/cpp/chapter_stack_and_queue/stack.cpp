/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化堆疊 */
    stack<int> stack;

    /* 元素入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "堆疊 stack = ";
    printStack(stack);

    /* 訪問堆疊頂元素 */
    int top = stack.top();
    cout << "堆疊頂元素 top = " << top << endl;

    /* 元素出堆疊 */
    stack.pop(); // 無返回值
    cout << "出堆疊元素 pop = " << top << "，出堆疊後 stack = ";
    printStack(stack);

    /* 獲取堆疊的長度 */
    int size = stack.size();
    cout << "堆疊的長度 size = " << size << endl;

    /* 判斷是否為空 */
    bool empty = stack.empty();
    cout << "堆疊是否為空 = " << empty << endl;

    return 0;
}
