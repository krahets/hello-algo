/**
 * File: linkedlist_deque->cpp
 * Created Time: 2023-03-02
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"


/* 双向链表结点 */
struct DoubleListNode {
    int val;               // 结点值
    DoubleListNode *next;  // 后继结点指针
    DoubleListNode *prev;  // 前驱结点指针
    DoubleListNode(int val) : val(val), prev(nullptr), next(nullptr) {}
};

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
private:
    DoubleListNode *front, *rear; // 头结点 front ，尾结点 rear
    int queSize = 0;              // 双向队列的长度

public:
    /* 构造方法 */
    LinkedListDeque() : front(nullptr), rear(nullptr) {}

    /* 析构方法 */
    ~LinkedListDeque() {
        // 释放内存
        DoubleListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 获取双向队列的长度 */
    int size() {
        return queSize;
    }

    /* 判断双向队列是否为空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 入队操作 */
    void push(int num, bool isFront) {
        DoubleListNode *node = new DoubleListNode(num);
        // 若链表为空，则令 front, rear 都指向 node
        if (isEmpty())
            front = rear = node;
        // 队首入队操作
        else if (isFront) {
            // 将 node 添加至链表头部
            front->prev = node;
            node->next = front;
            front = node; // 更新头结点
        // 队尾入队操作
        } else {
            // 将 node 添加至链表尾部
            rear->next = node;
            node->prev = rear;
            rear = node;  // 更新尾结点
        }
        queSize++; // 更新队列长度
    }

    /* 队首入队 */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 队尾入队 */
    void pushLast(int num) {
        push(num, false);
    }

    /* 出队操作 */
    int poll(bool isFront) {
        // 若队列为空，直接返回 -1
        if (isEmpty())
            return -1;
        int val;
        // 队首出队操作
        if (isFront) {
            val = front->val; // 暂存头结点值
            // 删除头结点
            DoubleListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            front = fNext;   // 更新头结点
        // 队尾出队操作
        } else {
            val = rear->val; // 暂存尾结点值
            // 删除尾结点
            DoubleListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            rear = rPrev;    // 更新尾结点
        }
        queSize--; // 更新队列长度
        return val;
    }

    /* 队首出队 */
    int pollFirst() {
        return poll(true);
    }

    /* 队尾出队 */
    int pollLast() {
        return poll(false);
    }

    /* 访问队首元素 */
    int peekFirst() {
        return isEmpty() ? -1 : front->val;
    }

    /* 访问队尾元素 */
    int peekLast() {
        return isEmpty() ? -1 : rear->val;
    }

    /* 返回数组用于打印 */
    vector<int> toVector() {
        DoubleListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* 初始化双向队列 */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "双向队列 deque = ";
    PrintUtil::printVector(deque->toVector());

    /* 访问元素 */
    int peekFirst = deque->peekFirst();
    cout << "队首元素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "队尾元素 peekLast = " << peekLast << endl;

    /* 元素入队 */
    deque->pushLast(4);
    cout << "元素 4 队尾入队后 deque =" ;
    PrintUtil::printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "元素 1 队首入队后 deque = ";
    PrintUtil::printVector(deque->toVector());

    /* 元素出队 */
    int pollLast = deque->pollLast();
    cout << "队尾出队元素 = " << pollLast << "，队尾出队后 deque = ";
    PrintUtil::printVector(deque->toVector());
    int pollFirst = deque->pollFirst();
    cout << "队首出队元素 = " << pollFirst << "，队首出队后 deque = ";
    PrintUtil::printVector(deque->toVector());

    /* 获取双向队列的长度 */
    int size = deque->size();
    cout << "双向队列长度 size = " << size << endl;

    /* 判断双向队列是否为空 */
    bool isEmpty = deque->isEmpty();
    cout << "双向队列是否为空 = " << boolalpha << isEmpty << endl;

    // 释放内存
    delete deque;

    return 0;
}
