/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack based on array implementation */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* Get the length of the stack */
    int size() {
        return stack.size();
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
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
    /* Access top of the stack element */
    ArrayStack *stack = new ArrayStack();

    /* Elements push onto stack */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Stack stack = ";
    printVector(stack->toVector());

    /* Return list for printing */
    int top = stack->top();
    cout << "Stack top element top = " << top << endl;

    /* Element pop from stack */
    top = stack->pop();
    cout << "Pop element pop = " << top << ", after pop, stack = ";
    printVector(stack->toVector());

    /* Get the length of the stack */
    int size = stack->size();
    cout << "Stack length size = " << size << endl;

    /* Check if empty */
    bool empty = stack->isEmpty();
    cout << "Stack is empty = " << empty << endl;

    // Free memory
    delete stack;

    return 0;
}
