/**
 * File: top_k.cpp
 * Created Time: 2023-10-10
 * Author: lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

/* 用于最小堆的比较函数 */
int compare(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 基于堆查找数组中最大的 k 个元素 */
int *topKHeap(int *nums, int size, int k) {
    // 创建一个大小为 k 的最小堆    
    int *heap = (int *)malloc(k * sizeof(int));
    for (int i = 0; i < k; i++) {
        heap[i] = nums[i];
    }
    qsort(heap, k, sizeof(int), compare);

    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (int i = k; i < size; i++) {
        // 若当前元素大于堆顶元素，则将堆顶元素替换为当前元素，并重新调整堆
        if (nums[i] > heap[0]) {
            heap[0] = nums[i];
            qsort(heap, k, sizeof(int), compare);
        }
    }

    int *result = (int *)malloc(k * sizeof(int));
    // 将最大的 k 个元素复制到结果数组中
    for (int i = 0; i < k; i++) {
        result[i] = heap[i];
    }

    // 释放堆内存
    free(heap);

    return result;
}

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int size = sizeof(nums) / sizeof(nums[0]);
    int k = 3;

    int *result = topKHeap(nums, size, k);

    printf("最大的 %d 个元素为: ", k);
    printHeap(result, k);

    free(result);

    return 0;
}
