/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* 元素入堆 */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 元素取反
    push(maxHeap, -val);
}

/* 元素出堆 */
int popMinHeap(MaxHeap *maxHeap) {
    // 元素取反
    return -pop(maxHeap);
}

/* 访问堆顶元素 */
int peekMinHeap(MaxHeap *maxHeap) {
    // 元素取反
    return -peek(maxHeap);
}

/* 取出堆中元素 */
int *getMinHeap(MaxHeap *maxHeap) {
    // 将堆中所有元素取反并存入 res 数组
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// 基于堆查找数组中最大的 k 个元素的函数
int *topKHeap(int *nums, int sizeNums, int k) {
    // 初始化小顶堆
    // 请注意：我们将堆中所有元素取反，从而用大顶堆来模拟小顶堆
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 将数组的前 k 个元素入堆
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (int i = k; i < sizeNums; i++) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    int *res = getMinHeap(maxHeap);
    // 释放内存
    delMaxHeap(maxHeap);
    return res;
}

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("最大的 %d 个元素为: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
