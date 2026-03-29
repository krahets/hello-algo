/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 双方向連結リストノード */
typedef struct DoublyListNode {
    int val;                     // ノード値
    struct DoublyListNode *next; // 後続ノード
    struct DoublyListNode *prev; // 前駆ノード
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

/* 双方向連結リストベースの両端キュー */
typedef struct {
    DoublyListNode *front, *rear; // 先頭ノード front、末尾ノード rear
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
    // すべてのノードを解放
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

/* キューが空かどうかを判定 */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* エンキュー */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // 連結リストが空なら、`front` と `rear` の両方を `node` に向ける
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 先頭へのエンキュー操作
    else if (isFront) {
        // node を連結リストの先頭に追加
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 先頭ノードを更新する
    }
    // 末尾へのエンキュー操作
    else {
        // node を連結リストの末尾に追加
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // キューの長さを更新
}

/* キュー先頭にエンキュー */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* キュー末尾にエンキュー */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* キュー先頭の要素にアクセス */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* キュー末尾の要素にアクセス */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* デキュー */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // キュー先頭からの取り出し
    if (isFront) {
        val = peekFirst(deque); // 先頭ノードの値を一時保存
        DoublyListNode *fNext = deque->front->next;
        if (fNext) {
            fNext->prev = NULL;
            deque->front->next = NULL;
        }
        delDoublyListNode(deque->front);
        deque->front = fNext; // 先頭ノードを更新する
    }
    // キュー末尾からの取り出し
    else {
        val = peekLast(deque); // 末尾ノードの値を一時保存
        DoublyListNode *rPrev = deque->rear->prev;
        if (rPrev) {
            rPrev->next = NULL;
            deque->rear->prev = NULL;
        }
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 末尾ノードを更新する
    }
    deque->queSize--; // キューの長さを更新
    return val;
}

/* キュー先頭からデキュー */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* キュー末尾からデキュー */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* キューを出力する */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // 連結リスト内のデータを配列にコピー
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* Driver Code */
int main() {
    /* 両端キューを初期化 */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("両端キュー deque = ");
    printLinkedListDeque(deque);

    /* 要素にアクセス */
    int peekFirstNum = peekFirst(deque);
    printf("先頭要素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("先頭要素 peekLast = %d\r\n", peekLastNum);

    /* 要素をエンキュー */
    pushLast(deque, 4);
    printf("要素 4 を末尾に追加した後 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("要素 1 を先頭に追加した後 deque =");
    printLinkedListDeque(deque);

    /* 要素をデキュー */
    int popLastNum = popLast(deque);
    printf("末尾から取り出した要素 popLast = %d ，末尾から取り出した後 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("先頭から取り出した要素 popFirst = %d ，先頭から取り出した後 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* キューの長さを取得 */
    int dequeSize = size(deque);
    printf("両端キューの長さ size = %d\r\n", dequeSize);

    /* キューが空かどうかを判定 */
    bool isEmpty = empty(deque);
    printf("両端キューが空かどうか = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delLinkedListdeque(deque);

    return 0;
}
