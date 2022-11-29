/*
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../include/include.hpp"

/* 基于链表实现的栈 */
class LinkedListStack {
private:
    ListNode* stackTop; // 将头结点作为栈顶
    int stackSize;      // 栈的长度

public:
    LinkedListStack() {
        stackTop = nullptr;
        stackSize = 0;
    }

    /* 获取栈的长度 */
    int size() {
        return stackSize;
    }

    /* 判断栈是否为空 */
    bool empty() {
        return size() == 0;
    }

    /* 入栈 */
    void push(int num) {
        ListNode* node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stackSize++;
    }

    /* 出栈 */
    int pop() {
        if (size() == 0)
            throw out_of_range("栈为空");
        int num = stackTop->val;
        stackTop = stackTop->next;
        stackSize--;
        return num;
    }

    /* 访问栈顶元素 */
    int top() {
        if (size() == 0)
            throw out_of_range("栈为空");
        return stackTop->val;
    }

    /* 将 List 转化为 Array 并返回 */
    vector<int> toVector() {
        ListNode* node = stackTop;
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
    /* 初始化栈 */
    LinkedListStack* stack = new LinkedListStack();

    /* 元素入栈 */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "栈 stack = ";
    PrintUtil::printVector(stack->toVector());

    /* 访问栈顶元素 */
    int top = stack->top();
    cout << "栈顶元素 top = " << top << endl;

    /* 元素出栈 */
    int pop = stack->pop();
    cout << "出栈元素 pop = " << pop << "，出栈后 stack = ";
    PrintUtil::printVector(stack->toVector());

    /* 获取栈的长度 */
    int size = stack->size();
    cout << "栈的长度 size = " << size << endl;

    /* 判断是否为空 */
    bool empty = stack->empty();
    cout << "栈是否为空 = " << empty << endl;

    return 0;
}
