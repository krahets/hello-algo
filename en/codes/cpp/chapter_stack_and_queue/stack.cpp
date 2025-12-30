/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Access top of the stack element */
    stack<int> stack;

    /* Element pop from stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "Stack stack = ";
    printStack(stack);

    /* Return list for printing */
    int top = stack.top();
    cout << "Stack top element top = " << top << endl;

    /* Check if it is empty */
    stack.pop(); // No return value
    cout << "Pop element pop = " << top << ", after pop, stack = ";
    printStack(stack);

    /* Get the length of the stack */
    int size = stack.size();
    cout << "Stack length size = " << size << endl;

    /* Check if empty */
    bool empty = stack.empty();
    cout << "Stack is empty = " << empty << endl;

    return 0;
}
