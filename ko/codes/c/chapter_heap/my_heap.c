/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 최대 힙 */
typedef struct {
    // size는 실제 원소 수를 나타냄
    int size;
    // 크기를 늘릴 필요가 없도록 메모리를 미리 할당한 배열 사용
    int data[MAX_SIZE];
} MaxHeap;

// 함수 선언
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* 슬라이스로 힙을 만드는 생성자 */
MaxHeap *newMaxHeap(int nums[], int size) {
    // 모든 원소를 힙에 삽입
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 리프를 제외한 모든 노드에서 힙 복구
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* 소멸자 */
void delMaxHeap(MaxHeap *maxHeap) {
    // 메모리 해제
    free(maxHeap);
}

/* 왼쪽 자식 노드의 인덱스 구하기 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 오른쪽 자식 노드의 인덱스 구하기 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 부모 노드의 인덱스 구하기 */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 소수점 이하 내림
}

/* 원소 교환 */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* 힙 크기 구하기 */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* 힙이 비었는지 확인 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* 힙의 루트 원소 조회 */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 힙에 원소 삽입 */
void push(MaxHeap *maxHeap, int val) {
    // 기본 설정에서는 이렇게 많은 노드를 추가하면 안 됨
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // 노드 추가
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 아래에서 위로 힙 복구
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 힙에서 원소 꺼내기 */
int pop(MaxHeap *maxHeap) {
    // 빈 힙 처리
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // 노드 삭제
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 위에서 아래로 힙 복구
    siftDown(maxHeap, 0);

    // 힙의 루트 원소 반환
    return val;
}

/* 노드 i부터 위에서 아래로 힙 복구 */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 max에 저장
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
        if (max == i) {
            break;
        }
        // 두 노드 교환
        swap(maxHeap, i, max);
        // 아래로 내려가며 힙 복구 반복
        i = max;
    }
}

/* 노드 i부터 아래에서 위로 힙 복구 */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // 노드 i의 부모 노드 구하기
        int p = parent(maxHeap, i);
        // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 두 노드 교환
        swap(maxHeap, i, p);
        // 위로 올라가며 힙 복구 반복
        i = p;
    }
}
