/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 以鏈結串列實作佇列 */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* 建立佇列 */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* 釋放佇列的記憶體 */
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

/* 取得佇列長度 */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* 判斷佇列是否為空 */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* 入隊 */
void push(LinkedListQueue *queue, int num) {
    // 將 node 接在尾節點之後
    ListNode *node = newListNode(num);
    // 若佇列為空，讓隊首與隊尾都指向新節點
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // 若佇列非空，將新節點接在尾節點之後
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* 讀取隊首元素 */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* 出隊 */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* 輸出佇列內容 */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // 將鏈結串列的資料複製到陣列中
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* 範例程式 */
int main() {
    /* 初始化佇列 */
    LinkedListQueue *queue = newLinkedListQueue();

    /* 將元素加入佇列 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("佇列 queue = ");
    printLinkedListQueue(queue);

    /* 讀取隊首元素 */
    int peekNum = peek(queue);
    printf("隊首元素 peek = %d\r\n", peekNum);

    /* 從佇列取出元素 */
    peekNum = pop(queue);
    printf("出隊元素 pop = %d ，出隊後 queue = ", peekNum);
    printLinkedListQueue(queue);

    /* 取得佇列長度 */
    int queueSize = size(queue);
    printf("佇列長度 size = %d\r\n", queueSize);

    /* 判斷佇列是否為空 */
    bool isEmpty = empty(queue);
    printf("佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    // 釋放記憶體
    delLinkedListQueue(queue);

    return 0;
}
