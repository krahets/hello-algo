/**
 * File: deque.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 修复逻辑bug、现代C++、可读性、鲁棒性
 */

#include "../utils/common.hpp"
#include <deque>
#include <iostream>

/* Driver Code */
int main() {
    // 初始化双向队列（显式 std:: 更规范）
    std::deque<int> deque;

    // 元素入队
    deque.push_back(2);   // 队尾入队
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // 队首入队
    deque.push_front(1);
    std::cout << "双向队列 deque = ";
    printDeque(deque);

    // 访问元素
    int front = deque.front();
    std::cout << "队首元素 front = " << front << '\n';
    int back = deque.back();
    std::cout << "队尾元素 back = " << back << '\n';

    // 【修复】出队前先获取值，再打印，逻辑正确
    // 队首出队
    int pop_front_val = deque.front();
    deque.pop_front();
    std::cout << "队首出队元素 = " << pop_front_val 
              << "，出队后 deque = ";
    printDeque(deque);

    // 队尾出队
    int pop_back_val = deque.back();
    deque.pop_back();
    std::cout << "队尾出队元素 = " << pop_back_val 
              << "，出队后 deque = ";
    printDeque(deque);

    // 获取长度（使用 size_t，容器标准类型）
    size_t size = deque.size();
    std::cout << "双向队列长度 size = " << size << '\n';

    // 判断是否为空
    bool empty = deque.empty();
    std::cout << "双向队列是否为空 = " << std::boolalpha << empty << '\n';

    return 0;
}
