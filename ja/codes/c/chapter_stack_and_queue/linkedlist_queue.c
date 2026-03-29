/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストベースのキュー */
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
    // すべてのノードを解放
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

/* キューが空かどうかを判定 */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* エンキュー */
void push(LinkedListQueue *queue, int num) {
    // 末尾ノードに node を追加
    ListNode *node = newListNode(num);
    // キューが空なら、先頭・末尾ノードをともにそのノードに設定
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // キューが空でなければ、そのノードを末尾ノードの後ろに追加
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* キュー先頭の要素にアクセス */
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

/* キューを出力する */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // 連結リスト内のデータを配列にコピー
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
    /* キューを初期化 */
    LinkedListQueue *queue = newLinkedListQueue();

    /* 要素をエンキュー */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("キュー queue = ");
    printLinkedListQueue(queue);

    /* キュー先頭の要素にアクセス */
    int peekNum = peek(queue);
    printf("先頭要素 peek = %d\r\n", peekNum);

    /* 要素をデキュー */
    peekNum = pop(queue);
    printf("デキューした要素 pop = %d ，デキュー後 queue = ", peekNum);
    printLinkedListQueue(queue);

    /* キューの長さを取得 */
    int queueSize = size(queue);
    printf("キューの長さ size = %d\r\n", queueSize);

    /* キューが空かどうかを判定 */
    bool isEmpty = empty(queue);
    printf("キューが空かどうか = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delLinkedListQueue(queue);

    return 0;
}
