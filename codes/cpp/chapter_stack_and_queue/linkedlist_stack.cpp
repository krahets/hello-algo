/**
 * File: linkedlist_stack.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、const 正确性、类型安全、内存安全
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>

/* 基于链表实现的栈 */
class LinkedListStack {
private:
    ListNode* stackTop = nullptr;  // 栈顶（头节点）
    size_t stkSize = 0;            // 栈大小（无符号类型）

public:
    LinkedListStack() = default;

    ~LinkedListStack() {
        freeMemoryLinkedList(stackTop);
    }

    // 禁用拷贝与赋值，防止 double free
    LinkedListStack(const LinkedListStack&) = delete;
    LinkedListStack& operator=(const LinkedListStack&) = delete;

    /* 获取栈长度 */
    size_t size() const {
        return stkSize;
    }

    /* 判断是否为空 */
    bool isEmpty() const {
        return stkSize == 0;
    }

    /* 入栈 */
    void push(int num) {
        ListNode* node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* 出栈 */
    int pop() {
        int val = top();

        ListNode* tmp = stackTop;
        stackTop = stackTop->next;
        delete tmp;
        stkSize--;

        return val;
    }

    /* 访问栈顶 */
    int top() const {
        if (isEmpty())
            throw std::out_of_range("栈为空");
        return stackTop->val;
    }

    /* 转为 vector 输出（保持栈顺序） */
    std::vector<int> toVector() const {
        std::vector<int> res;
        ListNode* node = stackTop;
        while (node != nullptr) {
            res.push_back(node->val);
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    // 栈上创建对象，自动释放内存
    LinkedListStack stack;

    // 入栈
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    std::cout << "栈 stack = ";
    printVector(stack.toVector());

    // 栈顶
    int topVal = stack.top();
    std::cout << "栈顶元素 top = " << topVal << '\n';

    // 出栈
    int popVal = stack.pop();
    std::cout << "出栈元素 pop = " << popVal << "，出栈后 stack = ";
    printVector(stack.toVector());

    // 长度 & 是否为空
    size_t size = stack.size();
    std::cout << "栈的长度 size = " << size << '\n';

    bool empty = stack.isEmpty();
    std::cout << "栈是否为空 = " << empty << '\n';

    return 0;
}
