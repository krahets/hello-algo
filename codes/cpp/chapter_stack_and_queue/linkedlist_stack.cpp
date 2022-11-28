/*
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../include/include.hpp"
#include<list>

/* 基于链表实现的栈 */
class LinkedListStack {
    list<int> lst;
public:
    LinkedListStack() {
        // 初始化空链表
        lst.clear();
    }
    /* 获取栈的长度 */
    int size() {
        return lst.size();
    }
    /* 判断栈是否为空 */
    bool isEmpty() {
        return lst.empty();
    }
    /* 入栈 */
    void push(int num) {
        lst.push_back(num);
    }
    /* 出栈 */
    int pop() {
        int oldTop = lst.back();
        lst.pop_back();
        return oldTop;
    }
    /* 访问栈顶元素 */
    int top() {
        return lst.back();
    }
};
