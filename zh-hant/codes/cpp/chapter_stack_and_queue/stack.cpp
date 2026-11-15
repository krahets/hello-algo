/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_stack}
    /* 初始化堆疊 */
    stack<int> stack;
    // [endregion]{init_stack}

    // [region]{push}
    /* 元素入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    cout << "堆疊 stack = ";
    printStack(stack);

    // [region]{peek}
    /* 訪問堆疊頂元素 */
    int top = stack.top();
    // [endregion]{peek}
    cout << "堆疊頂元素 top = " << top << endl;

    // [region]{pop}
    /* 元素出堆疊 */
    stack.pop(); // 無返回值
    // [endregion]{pop}
    cout << "出堆疊元素 pop = " << top << "，出堆疊後 stack = ";
    printStack(stack);

    // [region]{size}
    /* 獲取堆疊的長度 */
    int size = stack.size();
    // [endregion]{size}
    cout << "堆疊的長度 size = " << size << endl;

    // [region]{is_empty}
    /* 判斷是否為空 */
    bool empty = stack.empty();
    // [endregion]{is_empty}
    cout << "堆疊是否為空 = " << empty << endl;

    return 0;
}
