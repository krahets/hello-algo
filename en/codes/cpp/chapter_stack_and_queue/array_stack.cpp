/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack class based on array */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* Get the length of the stack */
    int size() {
        return stack.size();
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stack.back();
    }

    /* Return Vector */
    vector<int> toVector() {
        return stack;
    }
};

/* Driver Code */
int main() {
    /* Initialize stack */
    ArrayStack *stack = new ArrayStack();

    /* Element push */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Stack stack = ";
    printVector(stack->toVector());

    /* Access stack top element */
    int top = stack->top();
    cout << "Top element of the stack top = " << top << endl;

    /* Element pop */
    top = stack->pop();
    cout << "Element popped from the stack = " << top << ", after popping";
    printVector(stack->toVector());

    /* Get the length of the stack */
    int size = stack->size();
    cout << "Length of the stack size = " << size << endl;

    /* Determine if it's empty */
    bool empty = stack->isEmpty();
    cout << "Is the stack empty = " << empty << endl;

    // Free memory
    delete stack;

    return 0;
}
