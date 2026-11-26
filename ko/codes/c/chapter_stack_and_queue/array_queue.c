/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 원형 배열로 구현한 큐 */
typedef struct {
    int *nums;       // 큐의 원소를 저장하는 배열
    int front;       // 맨 앞 원소를 가리키는 앞쪽 포인터
    int queSize;     // 현재 큐에 들어 있는 원소 수
    int queCapacity; // 큐의 용량
} ArrayQueue;

/* 생성자 */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // 배열 초기화
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* 소멸자 */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* 큐의 용량 조회 */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* 큐의 길이 조회 */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* 큐가 비어 있는지 확인 */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* 맨 앞 원소 조회 */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* 큐에 삽입 */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("큐가 가득 찼다\r\n");
        return;
    }
    // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
    // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // 맨 뒤에 num을 추가한다
    queue->nums[rear] = num;
    queue->queSize++;
}

/* 큐에서 꺼내기 */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* 출력할 배열 반환 */
int *toArray(ArrayQueue *queue, int *queSize) {
    *queSize = queue->queSize;
    int *res = (int *)calloc(queue->queSize, sizeof(int));
    int j = queue->front;
    for (int i = 0; i < queue->queSize; i++) {
        res[i] = queue->nums[j % queue->queCapacity];
        j++;
    }
    return res;
}

/* 실행 예제 */
int main() {
    /* 큐 초기화 */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* 큐에 원소 삽입 */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("큐 queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* 맨 앞 원소 조회 */
    int peekNum = peek(queue);
    printf("맨 앞 원소 peek = %d\r\n", peekNum);

    /* 큐에서 원소 꺼내기 */
    peekNum = pop(queue);
    printf("꺼낸 원소 pop = %d, 꺼낸 후 queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* 큐의 길이 조회 */
    int queueSize = size(queue);
    printf("큐의 길이 size = %d\r\n", queueSize);

    /* 큐가 비어 있는지 확인 */
    bool isEmpty = empty(queue);
    printf("큐가 비어 있는가 = %s\r\n", isEmpty ? "true" : "false");

    /* 원형 배열 테스트 */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("반복 %d — 삽입 + 삭제 후 queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // 메모리 해제
    delArrayQueue(queue);

    return 0;
}