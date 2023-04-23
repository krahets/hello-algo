/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基于链表实现的队列 */
struct linkedListQueue {
    ListNode *front, *rear;
    int queSize;
};

typedef struct linkedListQueue linkedListQueue;

/* 构造函数 */
linkedListQueue *newLinkedListQueue() {
    linkedListQueue *queue = (linkedListQueue *)malloc(sizeof(linkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* 析构函数 */
void delLinkedListQueue(linkedListQueue *queue) {
    // 释放所有节点
    for (int i = 0; i < queue->queSize && queue->front != NULL; i++) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // 释放 queue 结构体
    free(queue);
}

/* 获取队列的长度 */
int size(linkedListQueue *queue) {
    return queue->queSize;
}

/* 判断队列是否为空 */
bool empty(linkedListQueue *queue) {
    return (size(queue) == 0);
}

/* 入队 */
void push(linkedListQueue *queue, int num) {
    // 尾节点处添加 node
    ListNode *node = newListNode(num);
    // 如果队列为空，则令头、尾节点都指向该节点
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // 如果队列不为空，则将该节点添加到尾节点后
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* 访问队首元素 */
int peek(linkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* 出队 */
void pop(linkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
}

/* 打印队列 */
void printLinkedListQueue(linkedListQueue *queue) {
    int arr[queue->queSize];
    // 拷贝链表中的数据到数组
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize && queue->front != queue->rear; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
}

/* Driver Code */
int main() {
    /* 初始化队列 */
    linkedListQueue *queue = newLinkedListQueue();

    /* 元素入队 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("队列 queue = ");
    printLinkedListQueue(queue);

    /* 访问队首元素 */
    int peekNum = peek(queue);
    printf("队首元素 peek = %d\r\n", peekNum);

    /* 元素出队 */
    pop(queue);
    printf("出队元素 pop = %d，出队后 queue = ", peekNum);
    printLinkedListQueue(queue);

    /* 获取队列的长度 */
    int queueSize = size(queue);
    printf("队列长度 size = %d\r\n", queueSize);

    /* 判断队列是否为空 */
    bool isEmpty = empty(queue);
    printf("队列是否为空 = %s\r\n", isEmpty ? "true" : "false");

    // 释放内存
    delLinkedListQueue(queue);

    return 0;
}
