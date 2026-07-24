/**
 * File: linkedlist_deque.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、const 正确性、类型安全、内存安全、禁止拷贝
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>
#include <iomanip>

/* 双向链表节点 */
struct DoublyListNode {
    int val;
    DoublyListNode* next;
    DoublyListNode* prev;

    explicit DoublyListNode(int val) 
        : val(val), prev(nullptr), next(nullptr) {}
};

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
private:
    DoublyListNode* front = nullptr;
    DoublyListNode* rear = nullptr;
    size_t queSize = 0;  // 无符号类型，更安全

public:
    /* 构造方法 */
    LinkedListDeque() = default;

    /* 析构方法 */
    ~LinkedListDeque() {
        DoublyListNode* cur = front;
        while (cur != nullptr) {
            DoublyListNode* tmp = cur;
            cur = cur->next;
            delete tmp;
        }
    }

    /* 禁用拷贝构造 & 赋值（防止浅拷贝、double free） */
    LinkedListDeque(const LinkedListDeque&) = delete;
    LinkedListDeque& operator=(const LinkedListDeque&) = delete;

    /* 获取队列长度 */
    size_t size() const {
        return queSize;
    }

    /* 判断是否为空 */
    bool isEmpty() const {
        return queSize == 0;
    }

    /* 队首入队 */
    void pushFirst(int num) {
        DoublyListNode* node = new DoublyListNode(num);
        if (isEmpty()) {
            front = rear = node;
        } else {
            node->next = front;
            front->prev = node;
            front = node;
        }
        queSize++;
    }

    /* 队尾入队 */
    void pushLast(int num) {
        DoublyListNode* node = new DoublyListNode(num);
        if (isEmpty()) {
            front = rear = node;
        } else {
            rear->next = node;
            node->prev = rear;
            rear = node;
        }
        queSize++;
    }

    /* 队首出队 */
    int popFirst() {
        if (isEmpty())
            throw std::out_of_range("双向队列为空");
        
        int val = front->val;
        DoublyListNode* newFront = front->next;
        
        delete front;
        
        if (newFront != nullptr) {
            newFront->prev = nullptr;
        } else {
            rear = nullptr;
        }
        
        front = newFront;
        queSize--;
        return val;
    }

    /* 队尾出队 */
    int popLast() {
        if (isEmpty())
            throw std::out_of_range("双向队列为空");
        
        int val = rear->val;
        DoublyListNode* newRear = rear->prev;
        
        delete rear;
        
        if (newRear != nullptr) {
            newRear->next = nullptr;
        } else {
            front = nullptr;
        }
        
        rear = newRear;
        queSize--;
        return val;
    }

    /* 访问队首元素 */
    int peekFirst() const {
        if (isEmpty())
            throw std::out_of_range("双向队列为空");
        return front->val;
    }

    /* 访问队尾元素 */
    int peekLast() const {
        if (isEmpty())
            throw std::out_of_range("双向队列为空");
        return rear->val;
    }

    /* 转为 vector 用于打印 */
    std::vector<int> toVector() const {
        std::vector<int> res;
        res.reserve(queSize);
        
        DoublyListNode* node = front;
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
    LinkedListDeque deque;

    deque.pushLast(3);
    deque.pushLast(2);
    deque.pushLast(5);
    std::cout << "双向队列 deque = ";
    printVector(deque.toVector());

    // 访问元素
    int peekFirst = deque.peekFirst();
    std::cout << "队首元素 peekFirst = " << peekFirst << '\n';
    int peekLast = deque.peekLast();
    std::cout << "队尾元素 peekLast = " << peekLast << '\n';

    // 入队
    deque.pushLast(4);
    std::cout << "元素 4 队尾入队后 deque = ";
    printVector(deque.toVector());
    
    deque.pushFirst(1);
    std::cout << "元素 1 队首入队后 deque = ";
    printVector(deque.toVector());

    // 出队
    int popLast = deque.popLast();
    std::cout << "队尾出队元素 = " << popLast << "，出队后 deque = ";
    printVector(deque.toVector());
    
    int popFirst = deque.popFirst();
    std::cout << "队首出队元素 = " << popFirst << "，出队后 deque = ";
    printVector(deque.toVector());

    // 获取长度 & 是否为空
    size_t size = deque.size();
    std::cout << "双向队列长度 size = " << size << '\n';
    
    bool isEmpty = deque.isEmpty();
    std::cout << "双向队列是否为空 = " << std::boolalpha << isEmpty << '\n';

    return 0;
}
