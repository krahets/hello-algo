/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 연결 리스트로 구현한 큐 */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* 생성자 */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* 소멸자 */
void delLinkedListQueue(LinkedListQueue *queue) {
    // 모든 노드의 메모리 해제
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // queue 구조체의 메모리 해제
    free(queue);
}

/* 큐의 길이 조회 */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* 큐가 비어 있는지 확인 */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* 큐에 삽입 */
void push(LinkedListQueue *queue, int num) {
    // 마지막 노드 뒤에 node를 추가한다
    ListNode *node = newListNode(num);
    // 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* 맨 앞 원소 조회 */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* 큐에서 꺼내기 */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* 큐 출력 */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // 연결 리스트의 데이터를 배열에 복사한다
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* 실행 예제 */
int main() {
    /* 큐 초기화 */
    LinkedListQueue *queue = newLinkedListQueue();

    /* 큐에 원소 삽입 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("큐 queue = ");
    printLinkedListQueue(queue);

    /* 맨 앞 원소 조회 */
    int peekNum = peek(queue);
    printf("맨 앞 원소 peek = %d\r\n", peekNum);

    /* 큐에서 원소 꺼내기 */
    peekNum = pop(queue);
    printf("꺼낸 원소 pop = %d, 꺼낸 후 queue = ", peekNum);
    printLinkedListQueue(queue);

    /* 큐의 길이 조회 */
    int queueSize = size(queue);
    printf("큐의 길이 size = %d\r\n", queueSize);

    /* 큐가 비어 있는지 확인 */
    bool isEmpty = empty(queue);
    printf("큐가 비어 있는가 = %s\r\n", isEmpty ? "true" : "false");

    // 메모리 해제
    delLinkedListQueue(queue);

    return 0;
}
