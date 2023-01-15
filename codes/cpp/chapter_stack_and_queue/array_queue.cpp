/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

/* 基于环形数组实现的队列 */
class ArrayQueue {
private:
    int *nums;      // 用于存储队列元素的数组
    int cap;        // 队列容量
    int front = 0;  // 头指针，指向队首
    int rear = 0;   // 尾指针，指向队尾 + 1

public:
    ArrayQueue(int capacity) {
        // 初始化数组
        cap = capacity;
        nums = new int[capacity];
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* 获取队列的容量 */
    int capacity() {
        return cap;
    }

    /* 获取队列的长度 */
    int size() {
        // 由于将数组看作为环形，可能 rear < front ，因此需要取余数
        return (capacity() + rear - front) % capacity();
    }

    /* 判断队列是否为空 */
    bool empty() {
        return rear - front == 0;
    }

    /* 入队 */
    void offer(int num) {
        if (size() == capacity()) {
            cout << "队列已满" << endl;
            return;
        }
        // 尾结点后添加 num
        nums[rear] = num;
        // 尾指针向后移动一位，越过尾部后返回到数组头部
        rear = (rear + 1) % capacity();
    }

    /* 出队 */
    void poll() {
        int num = peek();
        // 队头指针向后移动一位，若越过尾部则返回到数组头部
        front = (front + 1) % capacity();
    }

    /* 访问队首元素 */
    int peek() {
        if (empty())
            throw out_of_range("队列为空");
        return nums[front];
    }

    /* 将数组转化为 Vector 并返回 */
    vector<int> toVector() {
        int siz = size();
        int cap = capacity();
        // 仅转换有效长度范围内的列表元素
        vector<int> arr(siz);
        for (int i = 0, j = front; i < siz; i++, j++) {
            arr[i] = nums[j % cap];
        }
        return arr;
    }
};


/* Driver Code */
int main() {
    /* 初始化队列 */
    int capacity = 10;
    ArrayQueue* queue = new ArrayQueue(capacity);

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
    queue->poll();
    cout << "出队元素 poll = " << peek << "，出队后 queue = ";
    PrintUtil::printVector(queue->toVector());

    /* 获取队列的长度 */
    int size = queue->size();
    cout << "队列长度 size = " << size << endl;

    /* 判断队列是否为空 */
    bool empty = queue->empty();
    cout << "队列是否为空 = " << empty << endl;

    /* 测试环形数组 */
    for (int i = 0; i < 10; i++) {
        queue->offer(i);
        queue->poll();
        cout << "第 " << i << " 轮入队 + 出队后 queue = ";
        PrintUtil::printVector(queue->toVector());
    }

    // 释放内存
    delete queue;

    return 0;
}
