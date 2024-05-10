/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack class based on linked list */
class LinkedListStack {
  private:
    ListNode *stackTop; // Use the head node as the top of the stack
    int stkSize;        // Length of the stack

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Traverse the linked list, remove nodes, free memory
        freeMemoryLinkedList(stackTop);
    }

    /* Get the length of the stack */
    int size() {
        return stkSize;
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stackTop->val;
    }

    /* Convert the List to Array and return */
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

/* Driver Code */
int main() {
    /* Initialize stack */
    LinkedListStack *stack = new LinkedListStack();

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
