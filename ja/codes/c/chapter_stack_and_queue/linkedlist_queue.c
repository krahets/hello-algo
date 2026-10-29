/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストで実装したキュー */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* コンストラクタ */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* デストラクタ */
void delLinkedListQueue(LinkedListQueue *queue) {
    // すべてのノードを解放する
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // queue 構造体を解放する
    free(queue);
}

/* キューの長さを取得 */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* キューが空か判定 */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* エンキュー */
void push(LinkedListQueue *queue, int num) {
    // 末尾ノードに node を追加する
    ListNode *node = newListNode(num);
    // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // キューが空でない場合、このノードを末尾ノードの後ろに追加する
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* キューの先頭要素にアクセス */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* デキュー */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* キューを表示する */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // 連結リストのデータを配列にコピーする
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* 実行用コード */
int main() {
    /* キューを初期化する */
    LinkedListQueue *queue = newLinkedListQueue();

    /* 要素をエンキューする */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("キュー queue = ");
    printLinkedListQueue(queue);

    /* キューの先頭要素にアクセス */
    int peekNum = peek(queue);
    printf("キューの先頭要素 peek = %d\r\n", peekNum);

    /* 要素をデキューする */
    peekNum = pop(queue);
    printf("デキューした要素 pop = %d 、デキュー後 queue = ", peekNum);
    printLinkedListQueue(queue);

    /* キューの長さを取得 */
    int queueSize = size(queue);
    printf("キューの長さ size = %d\r\n", queueSize);

    /* キューが空か判定 */
    bool isEmpty = empty(queue);
    printf("キューは空か = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delLinkedListQueue(queue);

    return 0;
}
