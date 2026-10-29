/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 循環配列で実装したキュー */
typedef struct {
    int *nums;       // キューの要素を格納する配列
    int front;       // キューの先頭要素を指す先頭ポインタ
    int queSize;     // 現在のキューの要素数
    int queCapacity; // キューの容量
} ArrayQueue;

/* コンストラクタ */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // 配列を初期化する
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* デストラクタ */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* キューの容量を取得する */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* キューの長さを取得 */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* キューが空か判定 */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* キューの先頭要素にアクセス */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* エンキュー */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("キューが満杯です\r\n");
        return;
    }
    // 末尾のインデックス + 1 を指す末尾ポインタを計算する
    // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // num をキューの末尾に追加する
    queue->nums[rear] = num;
    queue->queSize++;
}

/* デキュー */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* 表示用の配列を返す */
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

/* 実行用コード */
int main() {
    /* キューを初期化する */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 要素をエンキューする */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("キュー queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* キューの先頭要素にアクセス */
    int peekNum = peek(queue);
    printf("キューの先頭要素 peek = %d\r\n", peekNum);

    /* 要素をデキューする */
    peekNum = pop(queue);
    printf("デキューした要素 pop = %d 、デキュー後 queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* キューの長さを取得 */
    int queueSize = size(queue);
    printf("キューの長さ size = %d\r\n", queueSize);

    /* キューが空か判定 */
    bool isEmpty = empty(queue);
    printf("キューは空か = %s\r\n", isEmpty ? "true" : "false");

    /* 循環配列をテストする */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("第 %d 回のエンキューとデキューの後 queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // メモリを解放する
    delArrayQueue(queue);

    return 0;
}