/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 大顶堆 */
struct maxHeap {
    // size 代表的是实际元素的个数
    int size;
    // 使用预先分配内存的数组，避免扩容
    int data[MAX_SIZE];
};

typedef struct maxHeap maxHeap;

void siftDown(maxHeap *h, int i);

void siftUp(maxHeap *h, int i);

/* 构造函数，根据切片建堆 */
maxHeap *newMaxHeap(int nums[], int size) {
    // 所有元素入堆
    maxHeap *h = (maxHeap *)malloc(sizeof(maxHeap));
    h->size = size;
    memcpy(h->data, nums, size * sizeof(int));
    for (int i = size - 1; i >= 0; i--) {
        // 堆化除叶节点以外的其他所有节点
        siftDown(h, i);
    }
    return h;
}

/* 获取左子节点索引 */
int left(maxHeap *h, int i) {
    return 2 * i + 1;
}

/* 获取右子节点索引 */
int right(maxHeap *h, int i) {
    return 2 * i + 2;
}

/* 获取父节点索引 */
int parent(maxHeap *h, int i) {
    return (i - 1) / 2;
}

/* 交换元素 */
void swap(maxHeap *h, int i, int j) {
    int temp = h->data[i];
    h->data[i] = h->data[j];
    h->data[j] = temp;
}

/* 获取堆大小 */
int size(maxHeap *h) {
    return h->size;
}

/* 判断堆是否为空 */
int isEmpty(maxHeap *h) {
    return h->size == 0;
}

/* 访问堆顶元素 */
int peek(maxHeap *h) {
    return h->data[0];
}

/* 元素入堆 */
void push(maxHeap *h, int val) {
    // 默认情况下，不应该添加这么多节点
    if (h->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // 添加节点
    h->data[h->size] = val;
    h->size++;

    // 从底至顶堆化
    siftUp(h, h->size - 1);
}

/* 元素出堆 */
int pop(maxHeap *h) {
    // 判空处理
    if (isEmpty(h)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // 交换根节点与最右叶节点（即交换首元素与尾元素）
    swap(h, 0, size(h) - 1);
    // 删除节点
    int val = h->data[h->size - 1];
    h->size--;
    // 从顶至底堆化
    siftDown(h, 0);

    // 返回堆顶元素
    return val;
}

/* 从节点 i 开始，从顶至底堆化 */
void siftDown(maxHeap *h, int i) {
    while (true) {
        // 判断节点 i, l, r 中值最大的节点，记为 max
        int l = left(h, i);
        int r = right(h, i);
        int max = i;
        if (l < size(h) && h->data[l] > h->data[max]) {
            max = l;
        }
        if (r < size(h) && h->data[r] > h->data[max]) {
            max = r;
        }
        // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
        if (max == i) {
            break;
        }
        // 交换两节点
        swap(h, i, max);
        // 循环向下堆化
        i = max;
    }
}

/* 从节点 i 开始，从底至顶堆化 */
void siftUp(maxHeap *h, int i) {
    while (true) {
        // 获取节点 i 的父节点
        int p = parent(h, i);
        // 当“越过根节点”或“节点无需修复”时，结束堆化
        if (p < 0 || h->data[i] <= h->data[p]) {
            break;
        }
        // 交换两节点
        swap(h, i, p);
        // 循环向上堆化
        i = p;
    }
}

/* Driver Code */
int main() {
    /* 初始化堆 */
    // 初始化大顶堆
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    maxHeap *heap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("输入数组并建堆后\n");
    printHeap(heap->data, heap->size);

    /* 获取堆顶元素 */
    printf("\n堆顶元素为 %d\n", peek(heap));

    /* 元素入堆 */
    push(heap, 7);
    printf("\n元素 7 入堆后\n");
    printHeap(heap->data, heap->size);

    /* 堆顶元素出堆 */
    int top = pop(heap);
    printf("\n堆顶元素 %d 出堆后\n", top);
    printHeap(heap->data, heap->size);

    /* 获取堆大小 */
    printf("\n堆元素数量为 %d\n", size(heap));

    /* 判断堆是否为空 */
    printf("\n堆是否为空 %d\n", isEmpty(heap));

    // 释放内存
    free(heap);

    return 0;
}
