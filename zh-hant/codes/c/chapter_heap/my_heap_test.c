/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* 初始化堆積 */
    // 初始化大頂堆積
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("輸入陣列並建堆積後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 獲取堆積頂元素 */
    printf("\n堆積頂元素為 %d\n", peek(maxHeap));

    /* 元素入堆積 */
    push(maxHeap, 7);
    printf("\n元素 7 入堆積後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 堆積頂元素出堆積 */
    int top = pop(maxHeap);
    printf("\n堆積頂元素 %d 出堆積後\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* 獲取堆積大小 */
    printf("\n堆積元素數量為 %d\n", size(maxHeap));

    /* 判斷堆積是否為空 */
    printf("\n堆積是否為空 %d\n", isEmpty(maxHeap));

    // 釋放記憶體
    delMaxHeap(maxHeap);

    return 0;
}
