/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 이중 연결 리스트 노드 */
typedef struct DoublyListNode {
    int val;                     // 노드 값
    struct DoublyListNode *next; // 다음 노드
    struct DoublyListNode *prev; // 이전 노드
} DoublyListNode;

/* 생성자 */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* 소멸자 */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* 이중 연결 리스트로 구현한 덱 */
typedef struct {
    DoublyListNode *front, *rear; // 머리 노드 front, 꼬리 노드 rear
    int queSize;                  // 덱의 길이
} LinkedListDeque;

/* 생성자 */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* 소멸자 */
void delLinkedListdeque(LinkedListDeque *deque) {
    // 모든 노드를 해제한다
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // deque 구조체를 해제한다
    free(deque);
}

/* 큐의 길이 반환 */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* 큐가 비어 있는지 판단 */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* 큐에 삽입 */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 맨 앞에 삽입하는 연산
    else if (isFront) {
        // node를 연결 리스트의 맨 앞에 추가한다
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 머리 노드를 갱신한다
    }
    // 맨 뒤에 삽입하는 연산
    else {
        // node를 연결 리스트의 맨 뒤에 추가한다
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // 큐 길이를 갱신한다
}

/* 맨 앞에 삽입 */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 맨 뒤에 삽입 */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* 맨 앞 원소 접근 */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* 맨 뒤 원소 접근 */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* 큐에서 꺼내기 */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // 같은 노드를 가리키므로 하나만 해제하면 된다
        deque->front = NULL;
        deque->rear = NULL;
    }
    // 맨 앞에서 꺼내는 연산
    else if (isFront) {
        val = peekFirst(deque); // 머리 노드의 값을 임시로 저장한다
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // 머리 노드를 갱신한다
    }
    // 맨 뒤에서 꺼내는 연산
    else {
        val = peekLast(deque); // 꼬리 노드의 값을 임시로 저장한다
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 꼬리 노드를 갱신한다
    }
    deque->queSize--; // 큐 길이를 갱신한다
    return val;
}

/* 맨 앞에서 꺼내기 */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* 맨 뒤에서 꺼내기 */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* 큐 출력 */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // 연결 리스트의 데이터를 배열에 복사한다
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* 실행 코드 */
int main() {
    /* 덱 초기화 */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("덱 deque = ");
    printLinkedListDeque(deque);

    /* 원소 접근 */
    int peekFirstNum = peekFirst(deque);
    printf("맨 앞 원소 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("맨 앞 원소 peekLast = %d\r\n", peekLastNum);

    /* 큐에 원소 삽입 */
    pushLast(deque, 4);
    printf("원소 4를 맨 뒤에 삽입한 후 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("원소 1을 맨 앞에 삽입한 후 deque =");
    printLinkedListDeque(deque);

    /* 큐에서 원소 꺼내기 */
    int popLastNum = popLast(deque);
    printf("맨 뒤에서 꺼낸 원소 popLast = %d, 꺼낸 후 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("맨 앞에서 꺼낸 원소 popFirst = %d, 꺼낸 후 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* 큐의 길이 반환 */
    int dequeSize = size(deque);
    printf("덱의 길이 size = %d\r\n", dequeSize);

    /* 큐가 비어 있는지 판단 */
    bool isEmpty = empty(deque);
    printf("덱이 비어 있는가 = %s\r\n", isEmpty ? "true" : "false");

    // 메모리 해제
    delLinkedListdeque(deque);

    return 0;
}
