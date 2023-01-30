/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"

/* 基于环形数组形成的队列 */
struct ArrayQueue {
    int *nums;    // 用于存储队列元素的数组
    int cap;      // 队列容量
    int front;    // 头指针，指向队首
    int rear;     // 尾指针，指向队尾 + 1
};

typedef struct ArrayQueue ArrayQueue;

/* 构造函数 */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *) malloc(sizeof(ArrayQueue));
    // 初始化数组
    queue->cap = capacity;
    queue->nums = (int *) malloc(sizeof(int) * queue->cap);
    queue->front = 0;
    queue->rear = 0;
    return queue;
}

/* 析构函数 */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    queue->cap = 0;
}

/* 获取队列的容量 */
int capacity(ArrayQueue *queue) {
    return queue->cap;
}

/* 获取队列的长度 */
int size(ArrayQueue *queue) {
    // 由于将数组看作环形队列，可能 rear < front，因此需要取余数
    return (capacity(queue) + queue->rear - queue->front) % capacity(queue);
}

/* 判断队列是否为空 */
bool empty(ArrayQueue *queue) {
    return queue->rear - queue->front == 0;
}

/* 访问队首元素 */
int peek(ArrayQueue *queue) {
  assert(size(queue) != 0);
  return queue->nums[queue->front];
}

/* 入队 */
void offer(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("队列已满\r\n");
        return;
    }
    queue->nums[queue->rear] = num;
    queue->rear = (queue->rear + 1) % capacity(queue);
}

/*  出队 */
void poll(ArrayQueue *queue) {
    int num = peek(queue);
    queue->front = (queue->front + 1) % capacity(queue);
}

/* 打印基于环形数组形成的队列 */
void printArrayQueue(ArrayQueue *queue) {
    int siz = size(queue);
    int cap = capacity(queue);
    int arr[siz];
    // 拷贝
    for (int i = 0, j = queue->front; i < siz; i++, j++) {
        arr[i] = queue->nums[j % cap];
    }
    printArray(arr, siz);
}


/* Driver Code */
int main() {
    /* 初始化队列 */
    int capacity = 10;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 元素入队 */
    offer(queue, 1);
    offer(queue, 3);
    offer(queue, 2);
    offer(queue, 5);
    offer(queue, 4);
    printf("队列 queue = ");
    printArrayQueue(queue);

    /* 访问队首元素 */
    int peekNum = peek(queue);
    printf("队首元素 peek = %d\r\n", peekNum);

    /* 元素出队 */
    poll(queue);
    printf("出队元素 poll = %d，出队后 queue = ", peekNum);
    printArrayQueue(queue);

    /* 获取队列的长度 */
    int queueSize = size(queue);
    printf("队列长度 size = %d\r\n", queueSize);

    /* 判断队列是否为空 */
    bool isEmpty = empty(queue);
    printf("队列是否为空 = %s\r\n", isEmpty ? "true" : "false");

    /* 测试环形数组 */
    for (int i = 0; i < 10; i++) {
        offer(queue, i);
        poll(queue);
        printf("第 %d 轮入队 + 出队后 queue = ", i);
        printArrayQueue(queue);
    }

    // 释放内存
    delArrayQueue(queue);
    return 0;
}