/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 循環配列で実装した両端キュー */
typedef struct {
    int *nums;       // キューの要素を格納する配列
    int front;       // キューの先頭要素を指す先頭ポインタ
    int queSize;     // キューの末尾 + 1 を指す末尾ポインタ
    int queCapacity; // キューの容量
} ArrayDeque;

/* コンストラクタ */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // 配列を初期化する
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* デストラクタ */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* 両端キューの容量を取得する */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* 両端キューの長さを取得する */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* 両端キューが空かどうかを判定する */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* 循環配列のインデックスを計算する */
int dequeIndex(ArrayDeque *deque, int i) {
    // 剰余演算を使い、配列の先頭と末尾をつなぐ
    // i が配列の末尾を越えたら、先頭に戻る
    // i が配列の先頭を越えたら、末尾に戻る
    return ((i + capacity(deque)) % capacity(deque));
}

/* 先頭にエンキューする */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("両端キューが満杯です\r\n");
        return;
    }
    // 先頭ポインタを左に 1 つ移動する
    // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
    deque->front = dequeIndex(deque, deque->front - 1);
    // num をキューの先頭に追加する
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* 末尾にエンキューする */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("両端キューが満杯です\r\n");
        return;
    }
    // 末尾のインデックス + 1 を指す末尾ポインタを計算する
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // num をキューの末尾に追加する
    deque->nums[rear] = num;
    deque->queSize++;
}

/* キューの先頭要素にアクセス */
int peekFirst(ArrayDeque *deque) {
    // アクセス例外：両端キューが空です
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* キューの末尾要素にアクセスする */
int peekLast(ArrayDeque *deque) {
    // アクセス例外：両端キューが空です
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* 先頭からデキューする */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // 先頭ポインタを後ろに 1 つ移動する
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* 末尾からデキューする */
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

/* 実行用コード */
int main() {
    /* キューを初期化する */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("両端キュー deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 要素にアクセスする */
    int peekFirstNum = peekFirst(deque);
    printf("キューの先頭要素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("キューの末尾要素 peekLast = %d\r\n", peekLastNum);

    /* 要素をエンキューする */
    pushLast(deque, 4);
    printf("要素 4 を末尾にエンキューした後 deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("要素 1 を先頭にエンキューした後 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 要素をデキューする */
    int popLastNum = popLast(deque);
    printf("末尾からデキューした要素 = %d 、末尾からデキューした後 deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("先頭からデキューした要素 = %d 、先頭からデキューした後 deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* キューの長さを取得 */
    int dequeSize = size(deque);
    printf("両端キューの長さ size = %d\r\n", dequeSize);

    /* キューが空か判定 */
    bool isEmpty = empty(deque);
    printf("キューは空か = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delArrayDeque(deque);

    return 0;
}