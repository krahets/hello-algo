/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 最大堆積 */
typedef struct {
    // size 代表實際的元素個數
    int size;
    // 使用預先配置記憶體的陣列，避免擴充容量
    int data[MAX_SIZE];
} MaxHeap;

// 函式宣告
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* 建構函式，根據切片建立堆積 */
MaxHeap *newMaxHeap(int nums[], int size) {
    // 將所有元素加入堆積
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 從每個非葉節點向下調整堆積
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* 解構函式 */
void delMaxHeap(MaxHeap *maxHeap) {
    // 釋放記憶體
    free(maxHeap);
}

/* 取得左子節點的索引 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 取得右子節點的索引 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 取得父節點的索引 */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 無條件捨去至整數
}

/* 交換元素 */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* 取得堆積大小 */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* 判斷堆積是否為空 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* 讀取堆積頂端元素 */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 將元素加入堆積 */
void push(MaxHeap *maxHeap, int val) {
    // 在預設情況下，不應加入這麼多節點
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // 新增節點
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 由下往上調整堆積
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 從堆積取出元素 */
int pop(MaxHeap *maxHeap) {
    // 檢查堆積是否為空
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // 交換根節點與最右側的葉節點（即首尾兩個元素）
    swap(maxHeap, 0, size(maxHeap) - 1);
    // 刪除節點
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 由上往下調整堆積
    siftDown(maxHeap, 0);

    // 回傳堆積頂端元素
    return val;
}

/* 從節點 i 開始向下調整堆積 */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // 找出節點 i、l、r 中值最大的節點，記為 max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
        if (max == i) {
            break;
        }
        // 交換兩個節點
        swap(maxHeap, i, max);
        // 繼續向下調整堆積
        i = max;
    }
}

/* 從節點 i 開始向上調整堆積 */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // 取得節點 i 的父節點
        int p = parent(maxHeap, i);
        // 若已越過根節點，或節點已符合堆積性質，就結束調整
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 交換兩個節點
        swap(maxHeap, i, p);
        // 繼續向上調整堆積
        i = p;
    }
}
