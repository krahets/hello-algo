/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* 元素入堆積 */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 元素取反
    push(maxHeap, -val);
}

/* 元素出堆積 */
int popMinHeap(MaxHeap *maxHeap) {
    // 元素取反
    return -pop(maxHeap);
}

/* 訪問堆積頂元素 */
int peekMinHeap(MaxHeap *maxHeap) {
    // 元素取反
    return -peek(maxHeap);
}

/* 取出堆積中元素 */
int *getMinHeap(MaxHeap *maxHeap) {
    // 將堆積中所有元素取反並存入 res 陣列
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// 基於堆積查詢陣列中最大的 k 個元素的函式
int *topKHeap(int *nums, int sizeNums, int k) {
    // 初始化小頂堆積
    // 請注意：我們將堆積中所有元素取反，從而用大頂堆積來模擬小頂堆積
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 將陣列的前 k 個元素入堆積
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // 從第 k+1 個元素開始，保持堆積的長度為 k
    for (int i = k; i < sizeNums; i++) {
        // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    int *res = getMinHeap(maxHeap);
    // 釋放記憶體
    delMaxHeap(maxHeap);
    return res;
}

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("最大的 %d 個元素為: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
