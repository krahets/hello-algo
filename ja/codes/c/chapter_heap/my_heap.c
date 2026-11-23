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
    // あらかじめメモリを確保した配列を使い、容量の拡張を避ける
    int data[MAX_SIZE];
} MaxHeap;

// 関数宣言
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* コンストラクタ：スライスからヒープを構築する */
MaxHeap *newMaxHeap(int nums[], int size) {
    // すべての要素をヒープに挿入する
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 葉ノード以外の全ノードをヒープ化する
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* デストラクタ */
void delMaxHeap(MaxHeap *maxHeap) {
    // メモリを解放する
    free(maxHeap);
}

/* 左の子のインデックスを取得 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 右の子のインデックスを取得 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 親のインデックスを取得 */
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

/* ヒープが空か判定 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* ヒープの先頭要素にアクセスする */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* ヒープに要素を挿入する */
void push(MaxHeap *maxHeap, int val) {
    // 既定の設定では、これほど多くのノードを追加してはならない
    if (maxHeap->size == MAX_SIZE) {
        printf("ヒープが満杯です！");
        return;
    }
    // ノードを追加する
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 下から上へヒープ化する
    siftUp(maxHeap, maxHeap->size - 1);
}

/* ヒープから要素を取り出す */
int pop(MaxHeap *maxHeap) {
    // 空かどうかを確認する
    if (isEmpty(maxHeap)) {
        printf("ヒープが空です！");
        return INT_MAX;
    }
    // 根と最右の葉を交換（先頭要素と末尾要素を交換）
    swap(maxHeap, 0, size(maxHeap) - 1);
    // ノードを削除する
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 上から下へヒープ化する
    siftDown(maxHeap, 0);

    // ヒープの先頭要素を返す
    return val;
}

/* ノード i から下向きにヒープ化する */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // ノード i, l, r のうち値が最大のノードを求め、max とする
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if (max == i) {
            break;
        }
        // 2 つのノードを交換する
        swap(maxHeap, i, max);
        // 下向きのヒープ化を繰り返す
        i = max;
    }
}

/* ノード i から上向きにヒープ化する */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // ノード i の親ノードを取得する
        int p = parent(maxHeap, i);
        // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 2 つのノードを交換する
        swap(maxHeap, i, p);
        // 上向きのヒープ化を繰り返す
        i = p;
    }
}
