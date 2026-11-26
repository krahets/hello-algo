/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 循環配列を使った両端キュー */
typedef struct {
    int *nums;       // 両端キューの要素を格納する配列
    int front;       // 両端キューの先頭要素を指すインデックス
    int queSize;     // 両端キューの要素数
    int queCapacity; // 両端キューの容量
} ArrayDeque;

/* 生成関数 */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // 配列を初期化する
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* 解放関数 */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* 両端キューの容量を取得する */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* 両端キューの要素数を取得する */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* 両端キューが空かどうかを判定する */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* 循環配列のインデックスを求める */
int dequeIndex(ArrayDeque *deque, int i) {
    // 剰余を使って配列の先頭と末尾をつなぐ
    // i が配列の末尾を越えたら先頭に戻る
    // i が配列の先頭より前に出たら末尾に回る
    return ((i + capacity(deque)) % capacity(deque));
}

/* 先頭に追加する */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("両端キューが満杯です\r\n");
        return;
    }
    // 先頭のインデックスを左に 1 つ移す
    // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
    deque->front = dequeIndex(deque, deque->front - 1);
    // num を両端キューの先頭に追加する
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* 末尾に追加する */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("両端キューが満杯です\r\n");
        return;
    }
    // 両端キューの末尾要素の次の位置を示すインデックスを求める
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // num を両端キューの末尾に追加する
    deque->nums[rear] = num;
    deque->queSize++;
}

/* 両端キューの先頭要素を参照する */
int peekFirst(ArrayDeque *deque) {
    // 両端キューが空のときはアクセスできない
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* 両端キューの末尾要素を参照する */
int peekLast(ArrayDeque *deque) {
    // 両端キューが空のときはアクセスできない
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* 先頭から取り出す */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // 先頭のインデックスを 1 つ進める
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* 末尾から取り出す */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* 表示用の配列を返す */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* 実行例 */
int main() {
    /* 両端キューを初期化する */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("両端キュー deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 要素を参照する */
    int peekFirstNum = peekFirst(deque);
    printf("先頭要素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("末尾要素 peekLast = %d\r\n", peekLastNum);

    /* 要素を両端キューに追加する */
    pushLast(deque, 4);
    printf("末尾に 4 を追加した後の deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("先頭に 1 を追加した後の deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 両端キューから要素を取り出す */
    int popLastNum = popLast(deque);
    printf("末尾から取り出した要素 = %d 、末尾から取り出した後の deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("先頭から取り出した要素 = %d 、先頭から取り出した後の deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* 両端キューの要素数を取得する */
    int dequeSize = size(deque);
    printf("両端キューの要素数 size = %d\r\n", dequeSize);

    /* 両端キューが空かどうかを判定する */
    bool isEmpty = empty(deque);
    printf("両端キューは空か = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delArrayDeque(deque);

    return 0;
}