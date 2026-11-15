/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    // [region]{init_stack}
    /* Initialize the stack */
    stack<int> stack;
    // [endregion]{init_stack}

    // [region]{push}
    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    cout << "Stack stack = ";
    printStack(stack);

    // [region]{peek}
    /* Access the top element */
    int top = stack.top();
    // [endregion]{peek}
    cout << "Top element top = " << top << endl;

    // [region]{pop}
    /* Pop an element from the stack */
    stack.pop(); // No return value
    // [endregion]{pop}
    cout << "Popped element pop = " << top << "; after popping, stack = ";
    printStack(stack);

    // [region]{size}
    /* Get the stack size */
    int size = stack.size();
    // [endregion]{size}
    cout << "Stack size = " << size << endl;

    // [region]{is_empty}
    /* Check whether it is empty */
    bool empty = stack.empty();
    // [endregion]{is_empty}
    cout << "Is the stack empty = " << empty << endl;

    return 0;
}
