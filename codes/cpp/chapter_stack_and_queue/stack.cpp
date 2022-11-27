/*
 * File: stack.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

int main(){
    /* 初始化栈 */
    stack<int> stack;

    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout<<"栈 stack = ";
    PrintUtil::printStack(stack);

    /* 访问栈顶元素 */
    int top = stack.top();
    cout<<"栈顶元素 top = "<<top<<endl;

    /* 元素出栈 */
    stack.pop();
    cout<<"出栈元素 pop = "<< top <<"，出栈后 stack = ";
    PrintUtil::printStack(stack);

    /* 获取栈的长度 */
    int size = stack.size();
    cout<<"栈的长度 size = "<<size<<endl;;

    /* 判断是否为空 */
    bool empty = stack.empty();
    return 0;
}
