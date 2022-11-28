/*
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../include/include.hpp"
#include<vector>

/* 基于数组(向量)实现的栈 */
class ArrayStack {
    vector<int> vec;
public:
    ArrayStack() {
        // 初始化列表（动态数组）
        vec = vector<int>();
    }
    /* 获取栈的长度 */
    int size() {
        return vec.size();
    }
    /* 判断栈是否为空 */
    bool isEmpty() {
        return size() == 0;
    }
    /* 入栈 */
    void push(int num) {
        vec.push_back(num);
    }
    /* 出栈 */
    int pop() {
        int oldTop = vec.back();
        vec.pop_back();
        return oldTop;
    }
    /* 访问栈顶元素 */
    int top() {
        return vec.back();
    }
    /* 访问索引 index 处元素 */
    int get(int index) {
        return vec.at(index);
    }
};
