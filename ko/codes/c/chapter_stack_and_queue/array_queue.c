/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 원형 배열로 구현한 큐 */
typedef struct {
    int *nums;       // 큐의 원소를 저장하는 배열
    int front;       // 맨 앞 원소를 가리키는 맨 앞 포인터
    int queSize;     // 현재 큐의 원소 개수
    int queCapacity; // 큐 용량
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

/* 큐의 용량 반환 */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* 큐의 길이 반환 */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* 큐가 비어 있는지 판단 */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* 맨 앞 원소 접근 */
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
    // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
    // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // num을 맨 뒤에 추가한다
    queue->nums[rear] = num;
    queue->queSize++;
}

/* 큐에서 꺼내기 */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* 출력에 사용할 배열 반환 */
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

/* 실행 코드 */
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

    /* 맨 앞 원소 접근 */
    int peekNum = peek(queue);
    printf("큐의 맨 앞 원소 peek = %d\r\n", peekNum);

    /* 큐에서 원소 꺼내기 */
    peekNum = pop(queue);
    printf("큐에서 꺼낸 원소 pop = %d, 꺼낸 후 queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* 큐의 길이 반환 */
    int queueSize = size(queue);
    printf("큐의 길이 size = %d\r\n", queueSize);

    /* 큐가 비어 있는지 판단 */
    bool isEmpty = empty(queue);
    printf("큐가 비어 있는가 = %s\r\n", isEmpty ? "true" : "false");

    /* 원형 배열 테스트 */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("%d번째 삽입 + 꺼내기 후 queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // 메모리 해제
    delArrayQueue(queue);

    return 0;
}