/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Array-backed stack */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* Get the stack size */
    int size() {
        return stack.size();
    }

    /* Check whether the stack is empty */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* Push an element onto the stack */
    void push(int num) {
        stack.push_back(num);
    }

    /* Remove and return the top element */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* Peek at the top element */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stack.back();
    }

    /* Return a copy of the backing vector */
    vector<int> toVector() {
        return stack;
    }
};

/* Driver code */
int main() {
    /* Initialize the stack */
    ArrayStack *stack = new ArrayStack();

    /* Push elements onto the stack */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "stack = ";
    printVector(stack->toVector());

    /* Peek at the top element */
    int top = stack->top();
    cout << "Top element (top) = " << top << endl;

    /* Pop the top element */
    top = stack->pop();
    cout << "Popped element (pop) = " << top << ", stack after the pop = ";
    printVector(stack->toVector());

    /* Get the stack size */
    int size = stack->size();
    cout << "Stack size = " << size << endl;

    /* Check whether the stack is empty */
    bool empty = stack->isEmpty();
    cout << "Stack is empty = " << empty << endl;

    // Free the allocated memory
    delete stack;

    return 0;
}
