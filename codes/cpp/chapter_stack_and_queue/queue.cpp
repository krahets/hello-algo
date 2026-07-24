/**
 * File: queue.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 修复逻辑bug、现代C++、可读性、鲁棒性
 */

#include "../utils/common.hpp"
#include <queue>
#include <iostream>

/* Driver Code */
int main() {
    // 初始化队列（显式 std:: 更规范）
    std::queue<int> queue;

    // 元素入队
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    std::cout << "队列 queue = ";
    printQueue(queue);

    // 访问队首元素
    int frontVal = queue.front();
    std::cout << "队首元素 front = " << frontVal << '\n';

    // 【修复】出队前先保存值，再弹出，逻辑正确
    int popVal = queue.front();
    queue.pop();
    std::cout << "出队元素 = " << popVal << "，出队后 queue = ";
    printQueue(queue);

    // 获取队列长度（size_t 是标准类型）
    size_t size = queue.size();
    std::cout << "队列长度 size = " << size << '\n';

    // 判断是否为空
    bool empty = queue.empty();
    std::cout << "队列是否为空 = " << std::boolalpha << empty << '\n';

    return 0;
}
