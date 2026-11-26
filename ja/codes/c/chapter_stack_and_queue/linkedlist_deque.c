/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 双方向連結リストのノード */
typedef struct DoublyListNode {
    int val;                     // ノードの値
    struct DoublyListNode *next; // 次のノード
    struct DoublyListNode *prev; // 前のノード
} DoublyListNode;

/* 生成関数 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* 解放関数 */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* 双方向連結リストを使った両端キュー */
typedef struct {
    DoublyListNode *front, *rear; // front は先頭ノード、rear は末尾ノードを指す
    int queSize;                  // 両端キューの要素数
} LinkedListDeque;

/* 生成関数 */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* 解放関数 */
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

/* 両端キューの要素数を取得する */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* 両端キューが空かどうかを判定する */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* エンキューする */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // リストが空なら、front と rear の両方が node を指すようにする
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 先頭に追加する
    else if (isFront) {
        // node をリストの先頭に追加する
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 先頭ノードを更新する
    }
    // 末尾に追加する
    else {
        // node をリストの末尾に追加する
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // 両端キューの要素数を更新する
}

/* 先頭に追加する */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 末尾に追加する */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* 両端キューの先頭要素を参照する */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* 両端キューの末尾要素を参照する */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* デキューする */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // 同じノードを指しているので、解放は一度でよい
        deque->front = NULL;
        deque->rear = NULL;
    }
    // 先頭から取り出す
    else if (isFront) {
        val = peekFirst(deque); // 先頭ノードの値を一時的に保存する
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // 先頭ノードを更新する
    }
    // 末尾から取り出す
    else {
        val = peekLast(deque); // 末尾ノードの値を一時的に保存する
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 末尾ノードを更新する
    }
    deque->queSize--; // 両端キューの要素数を更新する
    return val;
}

/* 先頭から取り出す */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* 末尾から取り出す */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* 両端キューを表示する */
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

/* 実行例 */
int main() {
    /* 両端キューを初期化する */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("両端キュー deque = ");
    printLinkedListDeque(deque);

    /* 要素を参照する */
    int peekFirstNum = peekFirst(deque);
    printf("先頭要素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("末尾要素 peekLast = %d\r\n", peekLastNum);

    /* 要素を両端キューに追加する */
    pushLast(deque, 4);
    printf("末尾に 4 を追加した後の deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("先頭に 1 を追加した後の deque =");
    printLinkedListDeque(deque);

    /* 両端キューから要素を取り出す */
    int popLastNum = popLast(deque);
    printf("末尾から取り出した要素 popLast = %d 、末尾から取り出した後の deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("先頭から取り出した要素 popFirst = %d 、先頭から取り出した後の deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* 両端キューの要素数を取得する */
    int dequeSize = size(deque);
    printf("両端キューの要素数 size = %d\r\n", dequeSize);

    /* 両端キューが空かどうかを判定する */
    bool isEmpty = empty(deque);
    printf("両端キューは空か = %s\r\n", isEmpty ? "true" : "false");

    // メモリを解放する
    delLinkedListdeque(deque);

    return 0;
}
