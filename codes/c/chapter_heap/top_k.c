/**
 * File: top_k.c
 * Created Time: 2023-10-10
 * Author: lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define HEAP_MAX_SIZE 100

typedef struct {
    int size;
    int data[HEAP_MAX_SIZE];
} MinHeap;

/* 构造最小堆 */
MinHeap* createHeap() {
    MinHeap* heap = (MinHeap*)malloc(sizeof(MinHeap));
    heap->size = 0;
    return heap;
}

/* 将数据放入堆 */
void pushHeap(MinHeap* heap, int value) {
    if (heap->size == HEAP_MAX_SIZE) {
        if (heap->data[0] < value) {
            heap->data[0] = value;
        }
        return;
    }

    int i = heap->size++;
    while (i > 0) {
        int parent = (i - 1) / 2;
        if (heap->data[parent] <= value) break;
        heap->data[i] = heap->data[parent];
        i = parent;
    }
    heap->data[i] = value;
}

/* 基于堆查找数组中最大的 k 个元素 */
MinHeap *topKHeap(int *nums, int size, int k) {
    // 创建一个最小堆    
    MinHeap *heap = createHeap();
    for (int i = 0; i < k; i++) {
        pushHeap(heap, nums[i]);
    }

    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (int i = k; i < size; i++) {
        // 若当前元素大于堆顶元素，则将堆顶元素替换为当前元素，并重新调整堆
        if (nums[i] > heap->data[0]) {
            heap->data[0] = nums[i];
        }
    }

    return heap;
}

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int size = sizeof(nums) / sizeof(nums[0]);
    int k = 3;

    MinHeap *result = topKHeap(nums, size, k);

    printf("最大的 %d 个元素为: ", k);
    printHeap(result->data, k);

    free(result);

    return 0;
}
