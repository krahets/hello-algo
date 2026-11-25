/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 雙向鏈結串列的節點 */
typedef struct DoublyListNode {
    int val;                     // 節點值
    struct DoublyListNode *next; // 下一個節點
    struct DoublyListNode *prev; // 上一個節點
} DoublyListNode;

/* 建立雙向鏈結串列節點 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* 釋放雙向鏈結串列節點的記憶體 */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* 以雙向鏈結串列實作雙端佇列 */
typedef struct {
    DoublyListNode *front, *rear; // front 指向首節點，rear 指向尾節點
    int queSize;                  // 雙端佇列長度
} LinkedListDeque;

/* 建立雙端佇列 */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* 釋放雙端佇列的記憶體 */
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

/* 取得雙端佇列長度 */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* 判斷雙端佇列是否為空 */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* 從指定的一端加入元素 */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // 若鏈結串列為空，讓 front 和 rear 都指向 node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 從隊首加入元素
    else if (isFront) {
        // 將 node 加到鏈結串列的開頭
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 更新首節點
    }
    // 從隊尾加入元素
    else {
        // 將 node 加到鏈結串列的末端
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // 將雙端佇列長度加 1
}

/* 從隊首加入元素 */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 從隊尾加入元素 */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* 讀取隊首元素 */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* 讀取隊尾元素 */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* 從指定的一端取出元素 */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // 佇列長度為 1 時，首尾兩端指向同一個節點
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // 兩者指向同一個節點，只需釋放一次
        deque->front = NULL;
        deque->rear = NULL;
    }
    // 從隊首取出元素
    else if (isFront) {
        val = peekFirst(deque); // 暫存首節點的值
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // 更新首節點
    }
    // 從隊尾取出元素
    else {
        val = peekLast(deque); // 暫存尾節點的值
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 更新尾節點
    }
    deque->queSize--; // 將雙端佇列長度減 1
    return val;
}

/* 從隊首取出元素 */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* 從隊尾取出元素 */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* 輸出雙端佇列內容 */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // 將鏈結串列的資料複製到陣列中
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* 範例程式 */
int main() {
    /* 初始化雙端佇列 */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("雙端佇列 deque = ");
    printLinkedListDeque(deque);

    /* 讀取隊首與隊尾元素 */
    int peekFirstNum = peekFirst(deque);
    printf("隊首元素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("隊尾元素 peekLast = %d\r\n", peekLastNum);

    /* 將元素加入雙端佇列 */
    pushLast(deque, 4);
    printf("將元素 4 加到隊尾後 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("將元素 1 加到隊首後 deque =");
    printLinkedListDeque(deque);

    /* 從雙端佇列取出元素 */
    int popLastNum = popLast(deque);
    printf("從隊尾取出的元素 popLast = %d ，取出後 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("從隊首取出的元素 popFirst = %d ，取出後 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* 取得雙端佇列長度 */
    int dequeSize = size(deque);
    printf("雙端佇列長度 size = %d\r\n", dequeSize);

    /* 判斷雙端佇列是否為空 */
    bool isEmpty = empty(deque);
    printf("雙端佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    // 釋放記憶體
    delLinkedListdeque(deque);

    return 0;
}
