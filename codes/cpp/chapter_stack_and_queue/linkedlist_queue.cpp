/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基于链表实现的队列 */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // 头节点 front ，尾节点 rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 遍历链表删除节点，释放内存
        freeMemoryLinkedList(front);
    }

    /* 获取队列的长度 */
    int size() {
        return queSize;
    }

    /* 判断队列是否为空 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 入队 */
    void push(int num) {
        // 在尾节点后添加 num
        ListNode *node = new ListNode(num);
        // 如果队列为空，则令头、尾节点都指向该节点
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // 如果队列不为空，则将该节点添加到尾节点后
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出队 */
    int pop() {
        int num = peek();
        // 删除头节点
        ListNode *tmp = front;
        front = front->next;
        // 释放内存
        delete tmp;
        queSize--;
        return num;
    }

    /* 访问队首元素 */
    int peek() {
        if (size() == 0)
            throw out_of_range("队列为空");
        return front->val;
    }

    /* 将链表转化为 Vector 并返回 */
    vector<int> toVector() {
        ListNode *node = front;
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
    /* 初始化队列 */
    LinkedListQueue *queue = new LinkedListQueue();

    /* 元素入队 */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "队列 queue = ";
    printVector(queue->toVector());

    /* 访问队首元素 */
    int peek = queue->peek();
    cout << "队首元素 peek = " << peek << endl;

    /* 元素出队 */
    peek = queue->pop();
    cout << "出队元素 pop = " << peek << "，出队后 queue = ";
    printVector(queue->toVector());

    /* 获取队列的长度 */
    int size = queue->size();
    cout << "队列长度 size = " << size << endl;

    /* 判断队列是否为空 */
    bool empty = queue->isEmpty();
    cout << "队列是否为空 = " << empty << endl;

    // 释放内存
    delete queue;

    return 0;
}
