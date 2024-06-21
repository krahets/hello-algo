/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 大顶堆 */
typedef struct {
    // size 代表的是实际元素的个数
    int size;
    // 使用预先分配内存的数组，避免扩容
    int data[MAX_SIZE];
} MaxHeap;

// 函数声明
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* 构造函数，根据切片建堆 */
MaxHeap *newMaxHeap(int nums[], int size) {
    // 所有元素入堆
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 堆化除叶节点以外的其他所有节点
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* 析构函数 */
void delMaxHeap(MaxHeap *maxHeap) {
    // 释放内存
    free(maxHeap);
}

/* 获取左子节点的索引 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 获取右子节点的索引 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 获取父节点的索引 */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 向下取整
}

/* 交换元素 */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* 获取堆大小 */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* 判断堆是否为空 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* 访问堆顶元素 */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 元素入堆 */
void push(MaxHeap *maxHeap, int val) {
    // 默认情况下，不应该添加这么多节点
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // 添加节点
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 从底至顶堆化
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 元素出堆 */
int pop(MaxHeap *maxHeap) {
    // 判空处理
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // 交换根节点与最右叶节点（交换首元素与尾元素）
    swap(maxHeap, 0, size(maxHeap) - 1);
    // 删除节点
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 从顶至底堆化
    siftDown(maxHeap, 0);

    // 返回堆顶元素
    return val;
}

/* 从节点 i 开始，从顶至底堆化 */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // 判断节点 i, l, r 中值最大的节点，记为 max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
        if (max == i) {
            break;
        }
        // 交换两节点
        swap(maxHeap, i, max);
        // 循环向下堆化
        i = max;
    }
}

/* 从节点 i 开始，从底至顶堆化 */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // 获取节点 i 的父节点
        int p = parent(maxHeap, i);
        // 当“越过根节点”或“节点无须修复”时，结束堆化
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 交换两节点
        swap(maxHeap, i, p);
        // 循环向上堆化
        i = p;
    }
}
