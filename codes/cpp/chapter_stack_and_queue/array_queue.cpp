/**
 * File: array_queue.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(miaochengyou1119)
 * Improved: 现代 C++、类型安全、const 正确性、内存安全、禁止拷贝
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>

/* 基于环形数组实现的队列 */
class ArrayQueue {
private:
    int* nums = nullptr;        // 存储元素的数组
    size_t front = 0;           // 队首指针（无符号安全索引）
    size_t queSize = 0;         // 当前元素数量
    size_t queCapacity = 0;     // 容量

    /* 计算环形索引（安全、非负） */
    size_t index(int i) const {
        int cap = static_cast<int>(queCapacity);
        return static_cast<size_t>((i % cap + cap) % cap);
    }

public:
    /* 构造函数：显式、禁止隐式转换 */
    explicit ArrayQueue(size_t capacity) : queCapacity(capacity) {
        nums = new int[queCapacity]();
    }

    /* 析构函数 */
    ~ArrayQueue() {
        delete[] nums;
    }

    /* 禁用拷贝与赋值（防止浅拷贝、double free） */
    ArrayQueue(const ArrayQueue&) = delete;
    ArrayQueue& operator=(const ArrayQueue&) = delete;

    /* 获取容量、大小、判空（const 安全） */
    size_t capacity() const {
        return queCapacity;
    }

    size_t size() const {
        return queSize;
    }

    bool isEmpty() const {
        return queSize == 0;
    }

    /* 入队 */
    void push(int num) {
        if (queSize == queCapacity) {
            std::cerr << "队列已满" << std::endl;
            return;
        }
        size_t rear = index(static_cast<int>(front + queSize));
        nums[rear] = num;
        queSize++;
    }

    /* 出队 */
    int pop() {
        int num = peek();
        front = index(static_cast<int>(front + 1));
        queSize--;
        return num;
    }

    /* 访问队首 */
    int peek() const {
        if (isEmpty())
            throw std::out_of_range("队列为空");
        return nums[front];
    }

    /* 转为 vector 输出 */
    std::vector<int> toVector() const {
        std::vector<int> arr(queSize);
        for (size_t i = 0; i < queSize; ++i) {
            size_t idx = index(static_cast<int>(front + i));
            arr[i] = nums[idx];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* 栈上创建对象，自动释放内存，无需 delete */
    const size_t capacity = 10;
    ArrayQueue queue(capacity);

    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    std::cout << "队列 queue = ";
    printVector(queue.toVector());

    /* 访问队首元素 */
    int peekVal = queue.peek();
    std::cout << "队首元素 peek = " << peekVal << '\n';

    /* 元素出队 */
    int popVal = queue.pop();
    std::cout << "出队元素 pop = " << popVal << "，出队后 queue = ";
    printVector(queue.toVector());

    /* 获取队列长度 */
    size_t size = queue.size();
    std::cout << "队列长度 size = " << size << '\n';

    /* 判断是否为空 */
    bool empty = queue.isEmpty();
    std::cout << "队列是否为空 = " << empty << '\n';

    /* 测试环形数组 */
    for (size_t i = 0; i < 10; ++i) {
        queue.push(static_cast<int>(i));
        queue.pop();
        std::cout << "第 " << i << " 轮入队+出队后 queue = ";
        printVector(queue.toVector());
    }

    return 0;
}
