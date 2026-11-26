/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* 初始化堆積 */
    // 初始化最大堆積
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("用輸入陣列建立堆積後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 取得堆積頂端元素 */
    printf("\n堆積頂端元素為 %d\n", peek(maxHeap));

    /* 將元素加入堆積 */
    push(maxHeap, 7);
    printf("\n將元素 7 加入堆積後\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* 取出堆積頂端元素 */
    int top = pop(maxHeap);
    printf("\n取出堆積頂端元素 %d 後\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* 取得堆積大小 */
    printf("\n堆積中的元素個數為 %d\n", size(maxHeap));

    /* 判斷堆積是否為空 */
    printf("\n堆積是否為空 %d\n", isEmpty(maxHeap));

    // 釋放記憶體
    delMaxHeap(maxHeap);

    return 0;
}
