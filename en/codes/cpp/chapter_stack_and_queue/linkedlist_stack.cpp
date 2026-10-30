/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack implemented with a linked list */
class LinkedListStack {
  private:
    ListNode *stackTop; // Use the head node as the stack top
    int stkSize;        // Stack size

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Traverse the linked list and delete each node to free its memory
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

    /* Push */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* Pop */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // Free memory
        delete tmp;
        stkSize--;
        return num;
    }

    /* Access the top element */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stackTop->val;
    }

    /* Convert the linked list to a vector and return it */
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
