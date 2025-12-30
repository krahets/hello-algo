/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Stack based on linked list implementation */
class LinkedListStack {
  private:
    ListNode *stackTop; // Use head node as stack top
    int stkSize;        // Stack length

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Traverse linked list to delete nodes and free memory
        freeMemoryLinkedList(stackTop);
    }

    /* Get the length of the stack */
    int size() {
        return stkSize;
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stackTop->val;
    }

    /* Convert List to Array and return */
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
    /* Access top of the stack element */
    LinkedListStack *stack = new LinkedListStack();

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
