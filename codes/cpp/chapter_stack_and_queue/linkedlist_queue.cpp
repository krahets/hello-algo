/*
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

/* 基于链表实现的队列 */
class LinkedListQueue {
private:
    ListNode *front, *back;
    int qSize;

public:
    LinkedListQueue() {
        front = nullptr;
        back = nullptr;
        qSize = 0;
    }

    /* 获取队列的长度 */
    int size() {
        return qSize;
    }

    /* 判断队列是否为空 */
    bool empty() {
        return qSize == 0;
    }

    /* 入队 */
    void offer(int num) {
        // 尾结点后添加 num
        ListNode* node = new ListNode(num);
        node->next = back;
        back = node;
        qSize++;
    }

    /* 出队 */
    int poll() {
        if (qSize == 0)
            throw out_of_range("队列为空");
        // 删除头结点
        ListNode* node = front;
        front = front->next;
        return node->val;
    }

    /* 访问队首元素 */
    int peek() {
        return front->val;
    }

    /* 将 List 转化为 Array 并返回 */
    vector<int> toVector() {
        ListNode* node = front;
        vector<int> vec;
        while (node != nullptr) {
            vec.push_back(node->val);
            node = node->next;
        }
        reverse(vec.begin(), vec.end());
        return vec;
    }
};


/* Driver Code */
int main() {
    /* 初始化队列 */
    LinkedListQueue* queue = new LinkedListQueue();

    /* 元素入队 */
    queue->offer(1);
    queue->offer(3);
    queue->offer(2);
    queue->offer(5);
    queue->offer(4);
    cout << "队列 queue = ";
    PrintUtil::printVector(queue->toVector());

    /* 访问队首元素 */
    int peek = queue->peek();
    cout << "队首元素 peek = " << peek << endl;

    /* 元素出队 */
    int poll = queue->poll();
    cout << "出队元素 poll = " << poll << "，出队后 queue = ";
    PrintUtil::printVector(queue->toVector());

    /* 获取队列的长度 */
    int size = queue->size();
    cout << "队列长度 size = " << size << endl;

    /* 判断队列是否为空 */
    bool empty = queue->empty();
    cout << "队列是否为空 = " << empty << endl;

    return 0;
}
