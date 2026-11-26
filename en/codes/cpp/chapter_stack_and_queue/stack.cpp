/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    /* Initialize the stack */
    stack<int> stack;

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "stack = ";
    printStack(stack);

    /* Peek at the top element */
    int top = stack.top();
    cout << "Top element (top) = " << top << endl;

    /* Pop the top element */
    stack.pop(); // Returns no value
    cout << "Popped element (pop) = " << top << ", stack after the pop = ";
    printStack(stack);

    /* Get the stack size */
    int size = stack.size();
    cout << "Stack size = " << size << endl;

    /* Check whether the stack is empty */
    bool empty = stack.empty();
    cout << "Stack is empty = " << empty << endl;

    return 0;
}
