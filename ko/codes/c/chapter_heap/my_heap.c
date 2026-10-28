/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 최대 힙 */
typedef struct {
    // size는 실제 원소 개수를 나타낸다
    int size;
    // 메모리를 미리 할당한 배열을 사용하여 용량 확장을 피한다
    int data[MAX_SIZE];
} MaxHeap;

// 함수 선언
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* 생성자: 슬라이스를 바탕으로 힙 구성 */
MaxHeap *newMaxHeap(int nums[], int size) {
    // 모든 원소를 힙에 삽입한다
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* 소멸자 */
void delMaxHeap(MaxHeap *maxHeap) {
    // 메모리 해제
    free(maxHeap);
}

/* 왼쪽 자식 노드의 인덱스 반환 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 오른쪽 자식 노드의 인덱스 반환 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 부모 노드의 인덱스 반환 */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 내림
}

/* 원소 교환 */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* 힙 크기 반환 */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* 힙이 비어 있는지 판단 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* 힙의 루트 원소 접근 */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 힙에 원소 삽입 */
void push(MaxHeap *maxHeap, int val) {
    // 기본적으로 이렇게 많은 노드를 추가해서는 안 된다
    if (maxHeap->size == MAX_SIZE) {
        printf("힙이 가득 찼다!");
        return;
    }
    // 노드 추가
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 아래에서 위로 힙을 재정렬한다
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 힙에서 원소 꺼내기 */
int pop(MaxHeap *maxHeap) {
    // 비어 있는 경우를 처리한다
    if (isEmpty(maxHeap)) {
        printf("힙이 비어 있다!");
        return INT_MAX;
    }
    // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // 노드 삭제
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 위에서 아래로 힙을 재정렬한다
    siftDown(maxHeap, 0);

    // 힙의 루트 원소를 반환한다
    return val;
}

/* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 max로 표시한다
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
        if (max == i) {
            break;
        }
        // 두 노드를 교환한다
        swap(maxHeap, i, max);
        // 아래쪽으로 힙 재정렬을 반복한다
        i = max;
    }
}

/* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // 노드 i의 부모 노드를 구한다
        int p = parent(maxHeap, i);
        // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 두 노드를 교환한다
        swap(maxHeap, i, p);
        // 위쪽으로 힙 재정렬을 반복한다
        i = p;
    }
}
