/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 循環配列ベースのキュー */
typedef struct {
    int *nums;       // キュー要素を格納する配列
    int front;       // 先頭ポインタ。先頭要素を指す
    int queSize;     // 現在のキュー内の要素数
    int queCapacity; // キューの容量
} ArrayQueue;

/* コンストラクタ */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // 配列を初期化
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

/* キューの容量を取得 */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* キューの長さを取得 */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* キューが空かどうかを判定 */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* キュー先頭の要素にアクセス */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* エンキュー */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("キューは満杯です\r\n");
        return;
    }
    // 末尾ポインタを計算し、末尾インデックス + 1 を指す
    // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // num をキュー末尾に追加
    queue->nums[rear] = num;
    queue->queSize++;
}

/* デキュー */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* 出力用の配列を返す */
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

/* Driver Code */
int main() {
    /* キューを初期化 */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 要素をエンキュー */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("キュー queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* キュー先頭の要素にアクセス */
    int peekNum = peek(queue);
    printf("先頭要素 peek = %d\r\n", peekNum);

    /* 要素をデキュー */
    peekNum = pop(queue);
    printf("デキューした要素 pop = %d ，デキュー後 queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* キューの長さを取得 */
    int queueSize = size(queue);
    printf("キューの長さ size = %d\r\n", queueSize);

    /* キューが空かどうかを判定 */
    bool isEmpty = empty(queue);
    printf("キューが空かどうか = %s\r\n", isEmpty ? "true" : "false");

    /* 循環配列をテストする */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("第 %d 回のエンキュー + デキュー後 queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // メモリを解放する
    delArrayQueue(queue);

    return 0;
}
