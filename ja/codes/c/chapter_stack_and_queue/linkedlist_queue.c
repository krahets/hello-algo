/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストを使ったキュー */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* 生成関数 */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* 解放関数 */
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

/* キューの要素数を取得する */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* キューが空かどうかを判定する */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* エンキューする */
void push(LinkedListQueue *queue, int num) {
    // node をリストの末尾に追加する
    ListNode *node = newListNode(num);
    // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* キューの先頭要素を参照する */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* デキューする */
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

/* 実行例 */
int main() {
    /* キューを初期化する */
    LinkedListQueue *queue = newLinkedListQueue();

    /* 要素をキューに追加する */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("キュー queue = ");
    printLinkedListQueue(queue);

    /* キューの先頭要素を参照する */
    int peekNum = peek(queue);
    printf("先頭要素 peek = %d\r\n", peekNum);

    /* キューから要素を取り出す */
    peekNum = pop(queue);
    printf("デキューした要素 pop = %d 、デキュー後の queue = ", peekNum);
    printLinkedListQueue(queue);

    /* キューの要素数を取得する */
    int queueSize = size(queue);
    printf("キューの要素数 size = %d\r\n", queueSize);

    /* キューが空かどうかを判定する */
    bool isEmpty = empty(queue);
    printf("キューは空か = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delLinkedListQueue(queue);

    return 0;
}
