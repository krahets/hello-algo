/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* 실행 예제 */
int main() {
    /* 힙 초기화 */
    // 최대 힙 초기화
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("입력 배열로 만든 힙\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 힙의 루트 원소 구하기 */
    printf("\n힙의 루트 원소: %d\n", peek(maxHeap));

    /* 힙에 원소 삽입 */
    push(maxHeap, 7);
    printf("\n원소 7을 삽입한 힙\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 힙의 루트 원소 꺼내기 */
    int top = pop(maxHeap);
    printf("\n루트 원소 %d을 꺼낸 뒤의 힙\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* 힙 크기 구하기 */
    printf("\n힙의 원소 수: %d\n", size(maxHeap));

    /* 힙이 비었는지 확인 */
    printf("\n빈 힙 여부: %d\n", isEmpty(maxHeap));

    // 메모리 해제
    delMaxHeap(maxHeap);

    return 0;
}
