/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 이중 연결 리스트의 노드 */
typedef struct DoublyListNode {
    int val;                     // 노드의 값
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
    DoublyListNode *front, *rear; // 첫 노드 front와 마지막 노드 rear
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
    // 모든 노드의 메모리 해제
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // deque 구조체의 메모리 해제
    free(deque);
}

/* 덱의 길이 조회 */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* 덱이 비어 있는지 확인 */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* 덱에 삽입 */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // 맨 앞에 삽입하는 연산
    else if (isFront) {
        // 연결 리스트의 맨 앞에 node를 추가한다
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // 첫 노드 갱신
    }
    // 맨 뒤에 삽입하는 연산
    else {
        // 연결 리스트의 맨 뒤에 node를 추가한다
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // 덱의 길이 갱신
}

/* 맨 앞에 삽입 */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* 맨 뒤에 삽입 */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* 맨 앞 원소 조회 */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* 맨 뒤 원소 조회 */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* 덱에서 꺼내기 */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // 같은 노드를 가리키므로 메모리를 한 번만 해제하면 된다
        deque->front = NULL;
        deque->rear = NULL;
    }
    // 맨 앞에서 꺼내는 연산
    else if (isFront) {
        val = peekFirst(deque); // 첫 노드의 값을 임시로 저장한다
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // 첫 노드 갱신
    }
    // 맨 뒤에서 꺼내는 연산
    else {
        val = peekLast(deque); // 마지막 노드의 값을 임시로 저장한다
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // 마지막 노드 갱신
    }
    deque->queSize--; // 덱의 길이 갱신
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

/* 덱 출력 */
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

/* 실행 예제 */
int main() {
    /* 덱 초기화 */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("덱 deque = ");
    printLinkedListDeque(deque);

    /* 원소 조회 */
    int peekFirstNum = peekFirst(deque);
    printf("맨 앞 원소 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("맨 뒤 원소 peekLast = %d\r\n", peekLastNum);

    /* 덱에 원소 삽입 */
    pushLast(deque, 4);
    printf("맨 뒤에 원소 4를 삽입한 후 deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("맨 앞에 원소 1을 삽입한 후 deque =");
    printLinkedListDeque(deque);

    /* 덱에서 원소 꺼내기 */
    int popLastNum = popLast(deque);
    printf("맨 뒤에서 꺼낸 원소 popLast = %d, 맨 뒤에서 꺼낸 후 deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("맨 앞에서 꺼낸 원소 popFirst = %d, 맨 앞에서 꺼낸 후 deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* 덱의 길이 조회 */
    int dequeSize = size(deque);
    printf("덱의 길이 size = %d\r\n", dequeSize);

    /* 덱이 비어 있는지 확인 */
    bool isEmpty = empty(deque);
    printf("덱이 비어 있는가 = %s\r\n", isEmpty ? "true" : "false");

    // 메모리 해제
    delLinkedListdeque(deque);

    return 0;
}
