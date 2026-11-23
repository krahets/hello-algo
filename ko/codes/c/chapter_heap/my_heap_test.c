/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* 실행 코드 */
int main() {
    /* 힙 초기화 */
    // 최대 힙 초기화
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("배열을 입력하여 힙을 구성한 후\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 힙의 루트 원소 반환 */
    printf("\n힙의 루트 원소: %d\n", peek(maxHeap));

    /* 힙에 원소 삽입 */
    push(maxHeap, 7);
    printf("\n원소 7을 힙에 삽입한 후\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 힙의 루트 원소 꺼내기 */
    int top = pop(maxHeap);
    printf("\n힙의 루트 원소를 꺼낸 후(원소: %d)\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* 힙 크기 반환 */
    printf("\n힙의 원소 개수: %d\n", size(maxHeap));

    /* 힙이 비어 있는지 판단 */
    printf("\n힙이 비어 있는가: %d\n", isEmpty(maxHeap));

    // 메모리 해제
    delMaxHeap(maxHeap);

    return 0;
}
