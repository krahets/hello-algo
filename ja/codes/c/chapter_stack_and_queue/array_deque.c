/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 循環配列ベースの両端キュー */
typedef struct {
    int *nums;       // キュー要素を格納する配列
    int front;       // 先頭ポインタ。先頭要素を指す
    int queSize;     // 末尾ポインタ。キューの末尾 + 1 を指す
    int queCapacity; // キューの容量
} ArrayDeque;

/* コンストラクタ */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // 配列を初期化
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

/* 両端キューの容量を取得 */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* 両端キューの長さを取得 */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* 両端キューが空かどうかを判定 */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* 循環配列のインデックスを計算 */
int dequeIndex(ArrayDeque *deque, int i) {
    // 剰余演算により配列の先頭と末尾をつなげる
    // i が配列の末尾を越えたら先頭に戻る
    // i が配列の先頭を越えたら末尾に戻る
    return ((i + capacity(deque)) % capacity(deque));
}

/* キュー先頭にエンキュー */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("両端キューがいっぱいです\r\n");
        return;
    }
    // 先頭ポインタを左に 1 つ移動する
    // 剰余演算により front が配列の先頭を越えたあと末尾に戻るようにする
    deque->front = dequeIndex(deque, deque->front - 1);
    // num をキューの先頭に追加
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* キュー末尾にエンキュー */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("両端キューがいっぱいです\r\n");
        return;
    }
    // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // num をキュー末尾に追加
    deque->nums[rear] = num;
    deque->queSize++;
}

/* キュー先頭の要素にアクセス */
int peekFirst(ArrayDeque *deque) {
    // アクセス例外：双方向キューが空です
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* キュー末尾の要素にアクセス */
int peekLast(ArrayDeque *deque) {
    // アクセス例外：双方向キューが空です
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* キュー先頭からデキュー */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // 先頭ポインタを 1 つ後ろへ進める
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* キュー末尾からデキュー */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* 出力用の配列を返す */
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

/* Driver Code */
int main() {
    /* キューを初期化 */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("両端キュー deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 要素にアクセス */
    int peekFirstNum = peekFirst(deque);
    printf("先頭要素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("末尾要素 peekLast = %d\r\n", peekLastNum);

    /* 要素をエンキュー */
    pushLast(deque, 4);
    printf("要素 4 を末尾に追加後 deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("要素 1 を先頭に追加後 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 要素をデキュー */
    int popLastNum = popLast(deque);
    printf("末尾から取り出した要素 = %d ，末尾から取り出した後 deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("先頭から取り出した要素 = %d ，先頭から取り出した後 deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* キューの長さを取得 */
    int dequeSize = size(deque);
    printf("両端キューの長さ size = %d\r\n", dequeSize);

    /* キューが空かどうかを判定 */
    bool isEmpty = empty(deque);
    printf("キューが空かどうか = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delArrayDeque(deque);

    return 0;
}