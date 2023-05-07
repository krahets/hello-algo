/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 双向链表节点 */
struct doublyListNode {
    int val;                     // 节点值
    struct doublyListNode *next; // 后继节点
    struct doublyListNode *prev; // 前驱节点
};

typedef struct doublyListNode doublyListNode;

/* 构造函数 */
doublyListNode *newDoublyListNode(int num) {
    doublyListNode *new = (doublyListNode *)malloc(sizeof(doublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* 析构函数 */
void delDoublyListNode(doublyListNode *node) {
    free(node);
}

/* 基于双向链表实现的双向队列 */
struct linkedListDeque {
    doublyListNode *front, *rear; // 头节点 front ，尾节点 rear
    int queSize;                  // 双向队列的长度
};

typedef struct linkedListDeque linkedListDeque;

/* 构造函数 */
linkedListDeque *newLinkedListDeque() {
    linkedListDeque *deque = (linkedListDeque *)malloc(sizeof(linkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* 析构函数 */
void delLinkedListdeque(linkedListDeque *deque) {
    // 释放所有节点
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        doublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // 释放 deque 结构体
    free(deque);
}

/* 获取队列的长度 */
int size(linkedListDeque *deque) {
    return deque->queSize;
}

/* 判断队列是否为空 */
bool empty(linkedListDeque *deque) {
    return (size(deque) == 0);
}

/* 入队 */
void push(linkedListDeque *deque, int num, bool isFront) {
    doublyListNode *node = newDoublyListNode(num);
    // 若链表为空，则令 front, rear 都指向node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 队首入队操作
    else if (isFront) {
        // 将 node 添加至链表头部
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 更新头节点
    }
    // 对尾入队操作
    else {
        // 将 node 添加至链表尾部
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // 更新队列长度
}

/* 队首入队 */
void pushFirst(linkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 队尾入队 */
void pushLast(linkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* 访问队首元素 */
int peekFirst(linkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* 访问队尾元素 */
int peekLast(linkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* 出队 */
int pop(linkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // 队首出队操作
    if (isFront) {
        val = peekFirst(deque); // 暂存头节点值
        doublyListNode *fNext = deque->front->next;
        if (fNext) {
            fNext->prev = NULL;
            deque->front->next = NULL;
            delDoublyListNode(deque->front);
        }
        deque->front = fNext; // 更新头节点
    }
    // 队尾出队操作
    else {
        val = peekLast(deque); // 暂存尾节点值
        doublyListNode *rPrev = deque->rear->prev;
        if (rPrev) {
            rPrev->next = NULL;
            deque->rear->prev = NULL;
            delDoublyListNode(deque->rear);
        }
        deque->rear = rPrev; // 更新尾节点
    }
    deque->queSize--; // 更新队列长度
    return val;
}

/* 队首出队 */
int popFirst(linkedListDeque *deque) {
    return pop(deque, true);
}

/* 队尾出队 */
int popLast(linkedListDeque *deque) {
    return pop(deque, false);
}

/* 打印队列 */
void printLinkedListDeque(linkedListDeque *deque) {
    int arr[deque->queSize];
    // 拷贝链表中的数据到数组
    int i;
    doublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
}

/* Driver Code */
int main() {
    /* 初始化双向队列 */
    linkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("双向队列 deque = ");
    printLinkedListDeque(deque);

    /* 访问元素 */
    int peekFirstNum = peekFirst(deque);
    printf("队首元素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("队首元素 peekLast = %d\r\n", peekLastNum);

    /* 元素入队 */
    pushLast(deque, 4);
    printf("元素 4 队尾入队后 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("元素 1 队首入队后 deque =");
    printLinkedListDeque(deque);

    /* 元素出队 */
    int popLastNum = popLast(deque);
    printf("队尾出队元素 popLast = %d，队尾出队后 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("队首出队元素 popFirst = %d，队首出队后 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* 获取队列的长度 */
    int dequeSize = size(deque);
    printf("双向队列长度 size = %d\r\n", dequeSize);

    /* 判断队列是否为空 */
    bool isEmpty = empty(deque);
    printf("双向队列是否为空 = %s\r\n", isEmpty ? "true" : "false");

    // 释放内存
    delLinkedListdeque(deque);

    return 0;
}
