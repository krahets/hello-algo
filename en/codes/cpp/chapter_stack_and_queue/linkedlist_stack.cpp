/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack backed by a linked list */
class LinkedListStack {
  private:
    ListNode *stackTop; // Use the head node as the top of the stack
    int stkSize;        // Stack size

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Walk the list and delete each node to free its memory
        freeMemoryLinkedList(stackTop);
    }

    /* Get the stack size */
    int size() {
        return stkSize;
    }

    /* Check whether the stack is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Push an element onto the stack */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* Remove and return the top element */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // Free the allocated memory
        delete tmp;
        stkSize--;
        return num;
    }

    /* Peek at the top element */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stackTop->val;
    }

    /* Return the linked list elements as a vector */
    vector<int> toVector() {
        ListNode *node = stackTop;
        vector<int> res(size());
        for (int i = res.size() - 1; i >= 0; i--) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver code */
int main() {
    /* Initialize the stack */
    LinkedListStack *stack = new LinkedListStack();

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
