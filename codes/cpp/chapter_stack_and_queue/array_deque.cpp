/**
 * File: array_deque.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、const 正确性、内存安全、禁止拷贝
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>
#include <iomanip>

/* 基于环形数组实现的双向队列 */
class ArrayDeque {
private:
    std::vector<int> nums;    // 存储元素
    size_t front = 0;         // 队首索引（无符号类型，安全）
    size_t queSize = 0;       // 元素个数

    /* 计算环形数组索引 */
    size_t index(int i) const {
        int cap = static_cast<int>(capacity());
        int idx = (i % cap + cap) % cap;  // 保证非负
        return static_cast<size_t>(idx);
    }

public:
    /* 显式构造函数，禁止隐式转换 */
    explicit ArrayDeque(size_t capacity) {
        nums.resize(capacity);
    }

    /* 禁用拷贝构造 & 赋值（防止浅拷贝、double free） */
    ArrayDeque(const ArrayDeque&) = delete;
    ArrayDeque& operator=(const ArrayDeque&) = delete;

    /* 获取容量 / 大小 / 是否为空 */
    size_t capacity() const {
        return nums.size();
    }

    size_t size() const {
        return queSize;
    }

    bool isEmpty() const {
        return queSize == 0;
    }

    /* 队首入队 */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            std::cerr << "双向队列已满" << std::endl;
            return;
        }
        front = index(static_cast<int>(front) - 1);
        nums[front] = num;
        queSize++;
    }

    /* 队尾入队 */
    void pushLast(int num) {
        if (queSize == capacity()) {
            std::cerr << "双向队列已满" << std::endl;
            return;
        }
        size_t rear = index(static_cast<int>(front + queSize));
        nums[rear] = num;
        queSize++;
    }

    /* 队首出队 */
    int popFirst() {
        int num = peekFirst();
        front = index(static_cast<int>(front) + 1);
        queSize--;
        return num;
    }

    /* 队尾出队 */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 访问队首 / 队尾（const 安全） */
    int peekFirst() const {
        if (isEmpty())
            throw std::out_of_range("双向队列为空");
        return nums[front];
    }

    int peekLast() const {
        if (isEmpty())
            throw std::out_of_range("双向队列为空");
        size_t last = index(static_cast<int>(front + queSize - 1));
        return nums[last];
    }

    /* 转为 vector 输出 */
    std::vector<int> toVector() const {
        std::vector<int> res(queSize);
        for (size_t i = 0; i < queSize; ++i) {
            size_t idx = index(static_cast<int>(front + i));
            res[i] = nums[idx];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* 初始化双向队列（栈上创建，自动释放） */
    ArrayDeque deque(10);

    deque.pushLast(3);
    deque.pushLast(2);
    deque.pushLast(5);
    std::cout << "双向队列 deque = ";
    printVector(deque.toVector());

    /* 访问元素 */
    int peekFirst = deque.peekFirst();
    std::cout << "队首元素 peekFirst = " << peekFirst << std::endl;
    int peekLast = deque.peekLast();
    std::cout << "队尾元素 peekLast = " << peekLast << std::endl;

    /* 元素入队 */
    deque.pushLast(4);
    std::cout << "元素 4 队尾入队后 deque = ";
    printVector(deque.toVector());
    deque.pushFirst(1);
    std::cout << "元素 1 队首入队后 deque = ";
    printVector(deque.toVector());

    /* 元素出队 */
    int popLast = deque.popLast();
    std::cout << "队尾出队元素 = " << popLast << "，队尾出队后 deque = ";
    printVector(deque.toVector());
    int popFirst = deque.popFirst();
    std::cout << "队首出队元素 = " << popFirst << "，队首出队后 deque = ";
    printVector(deque.toVector());

    /* 获取长度 & 是否为空 */
    size_t size = deque.size();
    std::cout << "双向队列长度 size = " << size << std::endl;
    bool isEmpty = deque.isEmpty();
    std::cout << "双向队列是否为空 = " << std::boolalpha << isEmpty << std::endl;

    return 0;
}
