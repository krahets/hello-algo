/*
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../include/include.hpp"

/* 基于链表实现的栈 */
class LinkedListStack {
private:
    list<int> list;
public:
    /* 获取栈的长度 */
    int size() {
        return list.size();
    }
    /* 判断栈是否为空 */
    bool empty() {
        return list.empty();
    }
    /* 入栈 */
    void push(int num) {
        list.push_back(num);
    }
    /* 出栈 */
    int pop() {
        int oldTop = list.back();
        list.pop_back();
        return oldTop;
    }
    /* 访问栈顶元素 */
    int top() {
        return list.back();
    }

    /* 将 List 转化为 Array 并返回 */
    vector<int> toVector() {
        vector<int> vec;
        for (int num : list) {
            vec.push_back(num);
        }
        return vec;
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
    vector<int> vec = stack->toVector();
    PrintUtil::printVector(vec);

    /* 访问栈顶元素 */
    int top = stack->top();
    cout << "栈顶元素 top = " << top << endl;

    /* 元素出栈 */
    int pop = stack->pop();
    cout << "出栈元素 pop = " << pop << "，出栈后 stack = ";
    vec = stack->toVector();
    PrintUtil::printVector(vec);

    /* 获取栈的长度 */
    int size = stack->size();
    cout << "栈的长度 size = " << size << endl;

    /* 判断是否为空 */
    bool empty = stack->empty();
    cout << "栈是否为空 = " << empty << endl;
}
