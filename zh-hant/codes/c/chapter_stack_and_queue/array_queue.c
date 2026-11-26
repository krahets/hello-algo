/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 以環狀陣列實作佇列 */
typedef struct {
    int *nums;       // 存放佇列元素的陣列
    int front;       // 隊首索引，記錄隊首元素在陣列中的位置
    int queSize;     // 佇列目前的元素個數
    int queCapacity; // 佇列容量
} ArrayQueue;

/* 建立佇列 */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // 初始化陣列
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* 釋放佇列的記憶體 */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* 取得佇列容量 */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* 取得佇列長度 */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* 判斷佇列是否為空 */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* 讀取隊首元素 */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* 入隊 */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("佇列已滿\r\n");
        return;
    }
    // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
    // 取餘數，讓 rear 超過陣列末端時繞回開頭
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // 將 num 加到隊尾
    queue->nums[rear] = num;
    queue->queSize++;
}

/* 出隊 */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* 回傳陣列以便輸出 */
int *toArray(ArrayQueue *queue, int *queSize) {
    *queSize = queue->queSize;
    int *res = (int *)calloc(queue->queSize, sizeof(int));
    int j = queue->front;
    for (int i = 0; i < queue->queSize; i++) {
        res[i] = queue->nums[j % queue->queCapacity];
        j++;
    }
    return res;
}

/* 範例程式 */
int main() {
    /* 初始化佇列 */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 將元素加入佇列 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("佇列 queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* 讀取隊首元素 */
    int peekNum = peek(queue);
    printf("隊首元素 peek = %d\r\n", peekNum);

    /* 從佇列取出元素 */
    peekNum = pop(queue);
    printf("出隊元素 pop = %d ，出隊後 queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* 取得佇列長度 */
    int queueSize = size(queue);
    printf("佇列長度 size = %d\r\n", queueSize);

    /* 判斷佇列是否為空 */
    bool isEmpty = empty(queue);
    printf("佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    /* 測試環狀陣列 */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("第 %d 輪入隊 + 出隊後 queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // 釋放記憶體
    delArrayQueue(queue);

    return 0;
}