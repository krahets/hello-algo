/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 雙向鏈結串列節點 */
typedef struct DoublyListNode {
    int val;                     // 節點值
    struct DoublyListNode *next; // 後繼節點
    struct DoublyListNode *prev; // 前驅節點
} DoublyListNode;

/* 建構子 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* 析構函式 */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* 基於雙向鏈結串列實現的雙向佇列 */
typedef struct {
    DoublyListNode *front, *rear; // 頭節點 front ，尾節點 rear
    int queSize;                  // 雙向佇列的長度
} LinkedListDeque;

/* 建構子 */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* 析構函式 */
void delLinkedListdeque(LinkedListDeque *deque) {
    // 釋放所有節點
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // 釋放 deque 結構體
    free(deque);
}

/* 獲取佇列的長度 */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* 判斷佇列是否為空 */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* 入列 */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // 若鏈結串列為空，則令 front 和 rear 都指向node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 佇列首入列操作
    else if (isFront) {
        // 將 node 新增至鏈結串列頭部
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 更新頭節點
    }
    // 佇列尾入列操作
    else {
        // 將 node 新增至鏈結串列尾部
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // 更新佇列長度
}

/* 佇列首入列 */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 佇列尾入列 */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* 訪問佇列首元素 */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* 訪問佇列尾元素 */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* 出列 */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // 佇列首出列操作
    if (isFront) {
        val = peekFirst(deque); // 暫存頭節點值
        DoublyListNode *fNext = deque->front->next;
        if (fNext) {
            fNext->prev = NULL;
            deque->front->next = NULL;
        }
        delDoublyListNode(deque->front);
        deque->front = fNext; // 更新頭節點
    }
    // 佇列尾出列操作
    else {
        val = peekLast(deque); // 暫存尾節點值
        DoublyListNode *rPrev = deque->rear->prev;
        if (rPrev) {
            rPrev->next = NULL;
            deque->rear->prev = NULL;
        }
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 更新尾節點
    }
    deque->queSize--; // 更新佇列長度
    return val;
}

/* 佇列首出列 */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* 佇列尾出列 */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* 列印佇列 */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // 複製鏈結串列中的資料到陣列
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
    /* 初始化雙向佇列 */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("雙向佇列 deque = ");
    printLinkedListDeque(deque);

    /* 訪問元素 */
    int peekFirstNum = peekFirst(deque);
    printf("佇列首元素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("佇列首元素 peekLast = %d\r\n", peekLastNum);

    /* 元素入列 */
    pushLast(deque, 4);
    printf("元素 4 佇列尾入列後 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("元素 1 佇列首入列後 deque =");
    printLinkedListDeque(deque);

    /* 元素出列 */
    int popLastNum = popLast(deque);
    printf("佇列尾出列元素 popLast = %d ，佇列尾出列後 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("佇列首出列元素 popFirst = %d ，佇列首出列後 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* 獲取佇列的長度 */
    int dequeSize = size(deque);
    printf("雙向佇列長度 size = %d\r\n", dequeSize);

    /* 判斷佇列是否為空 */
    bool isEmpty = empty(deque);
    printf("雙向佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    // 釋放記憶體
    delLinkedListdeque(deque);

    return 0;
}
