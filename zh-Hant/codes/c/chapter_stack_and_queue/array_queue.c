/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基於環形陣列實現的佇列 */
typedef struct {
    int *nums;       // 用於儲存佇列元素的陣列
    int front;       // 佇列首指標，指向佇列首元素
    int queSize;     // 尾指標，指向佇列尾 + 1
    int queCapacity; // 佇列容量
} ArrayQueue;

/* 建構子 */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // 初始化陣列
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* 析構函式 */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* 獲取佇列的容量 */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* 獲取佇列的長度 */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* 判斷佇列是否為空 */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* 訪問佇列首元素 */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* 入列 */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("佇列已滿\r\n");
        return;
    }
    // 計算佇列尾指標，指向佇列尾索引 + 1
    // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // 將 num 新增至佇列尾
    queue->nums[rear] = num;
    queue->queSize++;
}

/* 出列 */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Driver Code */
int main() {
    /* 初始化佇列 */
    int capacity = 10;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 元素入列 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("佇列 queue = ");
    printArray(queue->nums, queue->queSize);

    /* 訪問佇列首元素 */
    int peekNum = peek(queue);
    printf("佇列首元素 peek = %d\r\n", peekNum);

    /* 元素出列 */
    peekNum = pop(queue);
    printf("出列元素 pop = %d ，出列後 queue = ", peekNum);
    printArray(queue->nums, queue->queSize);

    /* 獲取佇列的長度 */
    int queueSize = size(queue);
    printf("佇列長度 size = %d\r\n", queueSize);

    /* 判斷佇列是否為空 */
    bool isEmpty = empty(queue);
    printf("佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    /* 測試環形陣列 */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("第 %d 輪入列 + 出列後 queue = ", i);
        printArray(queue->nums, queue->queSize);
    }

    // 釋放記憶體
    delArrayQueue(queue);

    return 0;
}
