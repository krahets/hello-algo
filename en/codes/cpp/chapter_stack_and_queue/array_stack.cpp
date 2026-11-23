/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack implemented with an array */
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

    /* Push */
    void push(int num) {
        stack.push_back(num);
    }

    /* Pop */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* Access the top element */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stack.back();
    }

    /* Return a vector */
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
    cout << "Stack stack = ";
    printVector(stack->toVector());

    /* Access the top element */
    int top = stack->top();
    cout << "Top element top = " << top << endl;

    /* Pop an element from the stack */
    top = stack->pop();
    cout << "Popped element pop = " << top << "; after popping, stack = ";
    printVector(stack->toVector());

    /* Get the stack size */
    int size = stack->size();
    cout << "Stack size = " << size << endl;

    /* Check whether it is empty */
    bool empty = stack->isEmpty();
    cout << "Is the stack empty = " << empty << endl;

    // Free memory
    delete stack;

    return 0;
}
