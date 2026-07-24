/**
 * File: stack.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 规范写法、修复逻辑、现代C++风格
 */

#include "../utils/common.hpp"
#include <stack>
#include <iostream>

int main() {
    // 初始化栈
    std::stack<int> stk;

    // 元素入栈
    stk.push(1);
    stk.push(3);
    stk.push(2);
    stk.push(5);
    stk.push(4);
    std::cout << "栈 stack = ";
    printStack(stk);

    // 访问栈顶元素
    int topVal = stk.top();
    std::cout << "栈顶元素 top = " << topVal << '\n';

    // 先取值再出栈，修正输出逻辑
    int popVal = stk.top();
    stk.pop();
    std::cout << "出栈元素 pop = " << popVal << "，出栈后 stack = ";
    printStack(stk);

    // 获取栈长度，使用标准无符号类型
    size_t size = stk.size();
    std::cout << "栈的长度 size = " << size << '\n';

    // 判断栈是否为空
    bool isEmpty = stk.empty();
    std::cout << "栈是否为空 = " << std::boolalpha << isEmpty << '\n';

    return 0;
}
