/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_stack}
    /* 初始化栈 */
    stack<int> stack;
    // [endregion]{init_stack}

    // [region]{push}
    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    cout << "栈 stack = ";
    printStack(stack);

    // [region]{peek}
    /* 访问栈顶元素 */
    int top = stack.top();
    // [endregion]{peek}
    cout << "栈顶元素 top = " << top << endl;

    // [region]{pop}
    /* 元素出栈 */
    stack.pop(); // 无返回值
    // [endregion]{pop}
    cout << "出栈元素 pop = " << top << "，出栈后 stack = ";
    printStack(stack);

    // [region]{size}
    /* 获取栈的长度 */
    int size = stack.size();
    // [endregion]{size}
    cout << "栈的长度 size = " << size << endl;

    // [region]{is_empty}
    /* 判断是否为空 */
    bool empty = stack.empty();
    // [endregion]{is_empty}
    cout << "栈是否为空 = " << empty << endl;

    return 0;
}
