/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* 將元素加入堆積 */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 將元素變號
    push(maxHeap, -val);
}

/* 從堆積取出元素 */
int popMinHeap(MaxHeap *maxHeap) {
    // 將元素變號
    return -pop(maxHeap);
}

/* 讀取堆積頂端元素 */
int peekMinHeap(MaxHeap *maxHeap) {
    // 將元素變號
    return -peek(maxHeap);
}

/* 取出堆積中的元素 */
int *getMinHeap(MaxHeap *maxHeap) {
    // 將堆積裡的所有元素變號，存入陣列 res
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

/* 以堆積找出陣列中最大 k 個元素的函式 */
int *topKHeap(int *nums, int sizeNums, int k) {
    // 初始化最小堆積
    // 注意：將堆積裡的所有元素變號，就能用最大堆積模擬最小堆積
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 將陣列的前 k 個元素加入堆積
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // 從第 k+1 個元素開始，讓堆積大小維持在 k
    for (int i = k; i < sizeNums; i++) {
        // 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
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
    printf("最大的 %d 個元素為： ", k);
    printArray(res, k);

    free(res);
    return 0;
}
