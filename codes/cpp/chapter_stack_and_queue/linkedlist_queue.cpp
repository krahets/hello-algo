/**
 * File: linkedlist_queue.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、const 正确性、内存安全、鲁棒性
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>

/* 基于链表实现的队列 */
class LinkedListQueue {
private:
    ListNode* front = nullptr; // 队首
    ListNode* rear = nullptr;  // 队尾
    size_t queSize = 0;        // 无符号类型，更安全

public:
    LinkedListQueue() = default;

    ~LinkedListQueue() {
        freeMemoryLinkedList(front);
    }

    // 禁用拷贝与赋值，防止 double free
    LinkedListQueue(const LinkedListQueue&) = delete;
    LinkedListQueue& operator=(const LinkedListQueue&) = delete;

    /* 获取队列长度 */
    size_t size() const {
        return queSize;
    }

    /* 判断是否为空 */
    bool isEmpty() const {
        return queSize == 0;
    }

    /* 入队 */
    void push(int num) {
        ListNode* node = new ListNode(num);
        if (isEmpty()) {
            front = rear = node;
        } else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出队 */
    int pop() {
        int val = peek();

        ListNode* tmp = front;
        front = front->next;
        delete tmp;
        queSize--;

        // 关键修复：队列空时，把 rear 也置空
        if (isEmpty()) {
            rear = nullptr;
        }

        return val;
    }

    /* 访问队首 */
    int peek() const {
        if (isEmpty())
            throw std::out_of_range("队列为空");
        return front->val;
    }

    /* 转为 vector 输出 */
    std::vector<int> toVector() const {
        std::vector<int> res;
        ListNode* node = front;
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
    LinkedListQueue queue;

    // 入队
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    std::cout << "队列 queue = ";
    printVector(queue.toVector());

    // 访问队首
    int peekVal = queue.peek();
    std::cout << "队首元素 peek = " << peekVal << '\n';

    // 出队
    int popVal = queue.pop();
    std::cout << "出队元素 pop = " << popVal << "，出队后 queue = ";
    printVector(queue.toVector());

    // 长度 & 是否为空
    size_t size = queue.size();
    std::cout << "队列长度 size = " << size << '\n';

    bool empty = queue.isEmpty();
    std::cout << "队列是否为空 = " << empty << '\n';

    return 0;
}
