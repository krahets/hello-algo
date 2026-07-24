/**
 * File: array_stack.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(miaochengyou1119)
 * Improved: 现代 C++、const 正确性、可读性、内存安全
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>

/* 基于数组实现的栈 */
class ArrayStack {
private:
    std::vector<int> stack;  // 底层容器

public:
    /* 获取栈的长度（const 不修改成员） */
    size_t size() const {
        return stack.size();
    }

    /* 判断栈是否为空 */
    bool isEmpty() const {
        return stack.empty();  // 更标准的 STL 写法
    }

    /* 入栈 */
    void push(int num) {
        stack.push_back(num);
    }

    /* 出栈 */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* 访问栈顶元素 */
    int top() const {
        if (isEmpty())
            throw std::out_of_range("栈为空");
        return stack.back();
    }

    /* 转换为 vector 输出 */
    std::vector<int> toVector() const {
        return stack;
    }
};

/* Driver Code */
int main() {
    // 栈上创建对象，自动释放内存，无需 delete
    ArrayStack stack;

    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    std::cout << "栈 stack = ";
    printVector(stack.toVector());

    /* 访问栈顶元素 */
    int topVal = stack.top();
    std::cout << "栈顶元素 top = " << topVal << '\n';

    /* 元素出栈 */
    int popVal = stack.pop();
    std::cout << "出栈元素 pop = " << popVal << "，出栈后 stack = ";
    printVector(stack.toVector());

    /* 获取栈的长度 */
    size_t size = stack.size();
    std::cout << "栈的长度 size = " << size << '\n';

    /* 判断是否为空 */
    bool empty = stack.isEmpty();
    std::cout << "栈是否为空 = " << empty << '\n';

    return 0;
}
