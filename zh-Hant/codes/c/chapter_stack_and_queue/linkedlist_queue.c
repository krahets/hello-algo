/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基於鏈結串列實現的佇列 */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* 建構子 */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* 析構函式 */
void delLinkedListQueue(LinkedListQueue *queue) {
    // 釋放所有節點
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // 釋放 queue 結構體
    free(queue);
}

/* 獲取佇列的長度 */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* 判斷佇列是否為空 */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* 入列 */
void push(LinkedListQueue *queue, int num) {
    // 尾節點處新增 node
    ListNode *node = newListNode(num);
    // 如果佇列為空，則令頭、尾節點都指向該節點
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // 如果佇列不為空，則將該節點新增到尾節點後
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* 訪問佇列首元素 */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* 出列 */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* 列印佇列 */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // 複製鏈結串列中的資料到陣列
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* Driver Code */
int main() {
    /* 初始化佇列 */
    LinkedListQueue *queue = newLinkedListQueue();

    /* 元素入列 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("佇列 queue = ");
    printLinkedListQueue(queue);

    /* 訪問佇列首元素 */
    int peekNum = peek(queue);
    printf("佇列首元素 peek = %d\r\n", peekNum);

    /* 元素出列 */
    peekNum = pop(queue);
    printf("出列元素 pop = %d ，出列後 queue = ", peekNum);
    printLinkedListQueue(queue);

    /* 獲取佇列的長度 */
    int queueSize = size(queue);
    printf("佇列長度 size = %d\r\n", queueSize);

    /* 判斷佇列是否為空 */
    bool isEmpty = empty(queue);
    printf("佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    // 釋放記憶體
    delLinkedListQueue(queue);

    return 0;
}
