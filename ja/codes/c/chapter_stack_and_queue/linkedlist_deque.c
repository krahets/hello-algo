/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 双方向連結リストのノード */
typedef struct DoublyListNode {
    int val;                     // ノードの値
    struct DoublyListNode *next; // 後続ノード
    struct DoublyListNode *prev; // 前のノード
} DoublyListNode;

/* コンストラクタ */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* デストラクタ */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* 双方向連結リストで実装した両端キュー */
typedef struct {
    DoublyListNode *front, *rear; // 先頭ノード front 、末尾ノード rear
    int queSize;                  // 両端キューの長さ
} LinkedListDeque;

/* コンストラクタ */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* デストラクタ */
void delLinkedListdeque(LinkedListDeque *deque) {
    // すべてのノードを解放する
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // deque 構造体を解放する
    free(deque);
}

/* キューの長さを取得 */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* キューが空か判定 */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* エンキュー */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // 連結リストが空の場合、front と rear の両方が node を指すようにする
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 先頭へのエンキュー操作
    else if (isFront) {
        // node を連結リストの先頭に追加する
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 先頭ノードを更新する
    }
    // 末尾へのエンキュー操作
    else {
        // node を連結リストの末尾に追加する
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // キューの長さを更新する
}

/* 先頭にエンキューする */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 末尾にエンキューする */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* キューの先頭要素にアクセス */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* キューの末尾要素にアクセスする */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* デキュー */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // 同じノードを指しているため、片方を解放すればよい
        deque->front = NULL;
        deque->rear = NULL;
    }
    // 先頭からのデキュー操作
    else if (isFront) {
        val = peekFirst(deque); // 先頭ノードの値を一時保存する
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // 先頭ノードを更新する
    }
    // 末尾からのデキュー操作
    else {
        val = peekLast(deque); // 末尾ノードの値を一時保存する
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 末尾ノードを更新する
    }
    deque->queSize--; // キューの長さを更新する
    return val;
}

/* 先頭からデキューする */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* 末尾からデキューする */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* キューを表示する */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // 連結リストのデータを配列にコピーする
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* 実行用コード */
int main() {
    /* 両端キューを初期化する */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("両端キュー deque = ");
    printLinkedListDeque(deque);

    /* 要素にアクセスする */
    int peekFirstNum = peekFirst(deque);
    printf("キューの先頭要素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("キューの先頭要素 peekLast = %d\r\n", peekLastNum);

    /* 要素をエンキューする */
    pushLast(deque, 4);
    printf("要素 4 を末尾にエンキューした後 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("要素 1 を先頭にエンキューした後 deque =");
    printLinkedListDeque(deque);

    /* 要素をデキューする */
    int popLastNum = popLast(deque);
    printf("末尾からデキューした要素 popLast = %d 、末尾からデキューした後 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("先頭からデキューした要素 popFirst = %d 、先頭からデキューした後 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* キューの長さを取得 */
    int dequeSize = size(deque);
    printf("両端キューの長さ size = %d\r\n", dequeSize);

    /* キューが空か判定 */
    bool isEmpty = empty(deque);
    printf("両端キューは空か = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delLinkedListdeque(deque);

    return 0;
}
