/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 最大ヒープ */
typedef struct {
    // size は実際の要素数を表す
    int size;
    // 拡張を避けるため、あらかじめメモリを確保した配列を使う
    int data[MAX_SIZE];
} MaxHeap;

// 関数宣言
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* スライスからヒープを構築するコンストラクタ */
MaxHeap *newMaxHeap(int nums[], int size) {
    // すべての要素をヒープに入れる
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 葉以外のすべてのノードをヒープ化する
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* デストラクタ */
void delMaxHeap(MaxHeap *maxHeap) {
    // メモリを解放する
    free(maxHeap);
}

/* 左の子のインデックスを取得する */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 右の子のインデックスを取得する */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 親のインデックスを取得する */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 小数点以下を切り捨てる
}

/* 要素を交換する */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* ヒープのサイズを取得する */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* ヒープが空か判定する */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* ヒープの根の要素を参照する */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 要素をヒープに挿入する */
void push(MaxHeap *maxHeap, int val) {
    // 通常、これほど多くのノードを追加することは想定していない
    if (maxHeap->size == MAX_SIZE) {
        printf("ヒープが満杯です！");
        return;
    }
    // ノードを追加する
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 上に向かってヒープ化する
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 根の要素をヒープから取り出す */
int pop(MaxHeap *maxHeap) {
    // 空の場合の処理
    if (isEmpty(maxHeap)) {
        printf("ヒープが空です！");
        return INT_MAX;
    }
    // 根と最も右の葉（先頭要素と末尾要素）を交換する
    swap(maxHeap, 0, size(maxHeap) - 1);
    // ノードを削除する
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 下に向かってヒープ化する
    siftDown(maxHeap, 0);

    // 根の要素を返す
    return val;
}

/* ノード i から下に向かってヒープ化する */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // ノード i、l、r のうち値が最大のものを max とする
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
        if (max == i) {
            break;
        }
        // 2 つのノードを交換する
        swap(maxHeap, i, max);
        // 下へのヒープ化を繰り返す
        i = max;
    }
}

/* ノード i から上に向かってヒープ化する */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // ノード i の親を取得する
        int p = parent(maxHeap, i);
        // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 2 つのノードを交換する
        swap(maxHeap, i, p);
        // 上へのヒープ化を繰り返す
        i = p;
    }
}
