/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 원형 배열로 구현한 덱 */
typedef struct {
    int *nums;       // 덱의 원소를 저장하는 배열
    int front;       // 맨 앞 원소를 가리키는 앞쪽 포인터
    int queSize;     // 덱에 저장된 원소 수
    int queCapacity; // 덱의 용량
} ArrayDeque;

/* 생성자 */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // 배열 초기화
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* 소멸자 */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* 덱의 용량 조회 */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* 덱의 길이 조회 */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* 덱이 비어 있는지 확인 */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* 원형 배열의 인덱스 계산 */
int dequeIndex(ArrayDeque *deque, int i) {
    // 나머지 연산을 이용해 배열의 처음과 끝을 연결한다
    // i가 배열의 끝을 넘으면 처음으로 돌아간다
    // i가 배열의 시작 위치보다 작아지면 끝으로 돌아간다
    return ((i + capacity(deque)) % capacity(deque));
}

/* 맨 앞에 삽입 */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("덱이 가득 찼다\r\n");
        return;
    }
    // 앞쪽 포인터를 왼쪽으로 한 칸 옮긴다
    // 나머지 연산을 이용해 front가 배열의 시작 위치보다 작아지면 끝으로 돌아가게 한다
    deque->front = dequeIndex(deque, deque->front - 1);
    // 맨 앞에 num을 추가한다
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* 맨 뒤에 삽입 */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("덱이 가득 찼다\r\n");
        return;
    }
    // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // 맨 뒤에 num을 추가한다
    deque->nums[rear] = num;
    deque->queSize++;
}

/* 맨 앞 원소 조회 */
int peekFirst(ArrayDeque *deque) {
    // 덱이 비어 있으면 원소에 접근할 수 없다
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* 맨 뒤 원소 조회 */
int peekLast(ArrayDeque *deque) {
    // 덱이 비어 있으면 원소에 접근할 수 없다
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* 맨 앞에서 꺼내기 */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // 앞쪽 포인터를 한 칸 전진시킨다
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* 맨 뒤에서 꺼내기 */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* 출력할 배열 반환 */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* 실행 예제 */
int main() {
    /* 덱 초기화 */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("덱 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 원소 조회 */
    int peekFirstNum = peekFirst(deque);
    printf("맨 앞 원소 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("맨 뒤 원소 peekLast = %d\r\n", peekLastNum);

    /* 덱에 원소 삽입 */
    pushLast(deque, 4);
    printf("맨 뒤에 원소 4를 삽입한 후 deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("맨 앞에 원소 1을 삽입한 후 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 덱에서 원소 꺼내기 */
    int popLastNum = popLast(deque);
    printf("맨 뒤에서 꺼낸 원소 = %d, 맨 뒤에서 꺼낸 후 deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("맨 앞에서 꺼낸 원소 = %d, 맨 앞에서 꺼낸 후 deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* 덱의 길이 조회 */
    int dequeSize = size(deque);
    printf("덱의 길이 size = %d\r\n", dequeSize);

    /* 덱이 비어 있는지 확인 */
    bool isEmpty = empty(deque);
    printf("덱이 비어 있는가 = %s\r\n", isEmpty ? "true" : "false");

    // 메모리 해제
    delArrayDeque(deque);

    return 0;
}