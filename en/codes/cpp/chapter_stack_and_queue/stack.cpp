/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Initialize stack */
    stack<int> stack;

    /* Element push */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "Stack stack = ";
    printStack(stack);

    /* Access stack top element */
    int top = stack.top();
    cout << "Top element of the stack top = " << top << endl;

    /* Element pop */
    stack.pop(); // No return value
    cout << "Element popped from the stack = " << top << ", after popping";
    printStack(stack);

    /* Get the length of the stack */
    int size = stack.size();
    cout << "Length of the stack size = " << size << endl;

    /* Determine if it's empty */
    bool empty = stack.empty();
    cout << "Is the stack empty = " << empty << endl;

    return 0;
}
