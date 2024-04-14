/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 大頂堆積 */
typedef struct {
    // size 代表的是實際元素的個數
    int size;
    // 使用預先分配記憶體的陣列，避免擴容
    int data[MAX_SIZE];
} MaxHeap;

// 函式宣告
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* 建構子，根據切片建堆積 */
MaxHeap *newMaxHeap(int nums[], int size) {
    // 所有元素入堆積
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 堆積化除葉節點以外的其他所有節點
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* 析構函式 */
void delMaxHeap(MaxHeap *maxHeap) {
    // 釋放記憶體
    free(maxHeap);
}

/* 獲取左子節點的索引 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 獲取右子節點的索引 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 獲取父節點的索引 */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 向下取整
}

/* 交換元素 */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* 獲取堆積大小 */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* 判斷堆積是否為空 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* 訪問堆積頂元素 */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 元素入堆積 */
void push(MaxHeap *maxHeap, int val) {
    // 預設情況下，不應該新增這麼多節點
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // 新增節點
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 從底至頂堆積化
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 元素出堆積 */
int pop(MaxHeap *maxHeap) {
    // 判空處理
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // 交換根節點與最右葉節點（交換首元素與尾元素）
    swap(maxHeap, 0, size(maxHeap) - 1);
    // 刪除節點
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 從頂至底堆積化
    siftDown(maxHeap, 0);

    // 返回堆積頂元素
    return val;
}

/* 從節點 i 開始，從頂至底堆積化 */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // 判斷節點 i, l, r 中值最大的節點，記為 max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
        if (max == i) {
            break;
        }
        // 交換兩節點
        swap(maxHeap, i, max);
        // 迴圈向下堆積化
        i = max;
    }
}

/* 從節點 i 開始，從底至頂堆積化 */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // 獲取節點 i 的父節點
        int p = parent(maxHeap, i);
        // 當“越過根節點”或“節點無須修復”時，結束堆積化
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 交換兩節點
        swap(maxHeap, i, p);
        // 迴圈向上堆積化
        i = p;
    }
}
