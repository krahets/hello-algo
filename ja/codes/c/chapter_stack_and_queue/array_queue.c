/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 循環配列を使ったキュー */
typedef struct {
    int *nums;       // キューの要素を格納する配列
    int front;       // キューの先頭要素を指すインデックス
    int queSize;     // 現在のキューの要素数
    int queCapacity; // キューの容量
} ArrayQueue;

/* 生成関数 */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // 配列を初期化する
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* 解放関数 */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* キューの容量を取得する */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* キューの要素数を取得する */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* キューが空かどうかを判定する */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* キューの先頭要素を参照する */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* エンキューする */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("キューが満杯です\r\n");
        return;
    }
    // キューの末尾要素の次の位置を示すインデックスを求める
    // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // num をキューの末尾に追加する
    queue->nums[rear] = num;
    queue->queSize++;
}

/* デキューする */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
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

/* 実行例 */
int main() {
    /* キューを初期化する */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 要素をキューに追加する */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("キュー queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* キューの先頭要素を参照する */
    int peekNum = peek(queue);
    printf("先頭要素 peek = %d\r\n", peekNum);

    /* キューから要素を取り出す */
    peekNum = pop(queue);
    printf("デキューした要素 pop = %d 、デキュー後の queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* キューの要素数を取得する */
    int queueSize = size(queue);
    printf("キューの要素数 size = %d\r\n", queueSize);

    /* キューが空かどうかを判定する */
    bool isEmpty = empty(queue);
    printf("キューは空か = %s\r\n", isEmpty ? "true" : "false");

    /* 循環配列の動作を確認する */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("第 %d 回のエンキューとデキューを終えた後の queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // メモリを解放する
    delArrayQueue(queue);

    return 0;
}