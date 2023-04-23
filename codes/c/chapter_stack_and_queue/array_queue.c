/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基于环形数组实现的队列 */
struct arrayQueue {
    int *nums;       // 用于存储队列元素的数组
    int front;       // 队首指针，指向队首元素
    int queSize;     // 尾指针，指向队尾 + 1
    int queCapacity; // 队列容量
};

typedef struct arrayQueue arrayQueue;

/* 构造函数 */
arrayQueue *newArrayQueue(int capacity) {
    arrayQueue *queue = (arrayQueue *)malloc(sizeof(arrayQueue));
    // 初始化数组
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* 析构函数 */
void delArrayQueue(arrayQueue *queue) {
    free(queue->nums);
    queue->queCapacity = 0;
}

/* 获取队列的容量 */
int capacity(arrayQueue *queue) {
    return queue->queCapacity;
}

/* 获取队列的长度 */
int size(arrayQueue *queue) {
    return queue->queSize;
}

/* 判断队列是否为空 */
bool empty(arrayQueue *queue) {
    return queue->queSize == 0;
}

/* 访问队首元素 */
int peek(arrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* 入队 */
void push(arrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("队列已满\r\n");
        return;
    }
    // 计算队尾指针，指向队尾索引 + 1
    // 通过取余操作，实现 rear 越过数组尾部后回到头部
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // 将 num 添加至队尾
    queue->nums[rear] = num;
    queue->queSize++;
}

/* 出队 */
void pop(arrayQueue *queue) {
    int num = peek(queue);
    // 队首指针向后移动一位，若越过尾部则返回到数组头部
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
}

/* 打印队列 */
void printArrayQueue(arrayQueue *queue) {
    int arr[queue->queSize];
    // 拷贝
    for (int i = 0, j = queue->front; i < queue->queSize; i++, j++) {
        arr[i] = queue->nums[j % queue->queCapacity];
    }
    printArray(arr, queue->queSize);
}

/* Driver Code */
int main() {
    /* 初始化队列 */
    int capacity = 10;
    arrayQueue *queue = newArrayQueue(capacity);

    /* 元素入队 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("队列 queue = ");
    printArrayQueue(queue);

    /* 访问队首元素 */
    int peekNum = peek(queue);
    printf("队首元素 peek = %d\r\n", peekNum);

    /* 元素出队 */
    pop(queue);
    printf("出队元素 pop = %d，出队后 queue = ", peekNum);
    printArrayQueue(queue);

    /* 获取队列的长度 */
    int queueSize = size(queue);
    printf("队列长度 size = %d\r\n", queueSize);

    /* 判断队列是否为空 */
    bool isEmpty = empty(queue);
    printf("队列是否为空 = %s\r\n", isEmpty ? "true" : "false");

    /* 测试环形数组 */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("第 %d 轮入队 + 出队后 queue = ", i);
        printArrayQueue(queue);
    }

    // 释放内存
    delArrayQueue(queue);

    return 0;
}
