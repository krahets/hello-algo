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
    // あらかじめメモリを確保した配列を使い、拡張を避ける
    int data[MAX_SIZE];
} MaxHeap;

// 関数宣言
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* コンストラクタ。スライスからヒープを構築する */
MaxHeap *newMaxHeap(int nums[], int size) {
    // すべての要素をヒープに入れる
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // 葉ノード以外のすべてのノードをヒープ化
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* デストラクタ */
void delMaxHeap(MaxHeap *maxHeap) {
    // メモリを解放する
    free(maxHeap);
}

/* 左子ノードのインデックスを取得 */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* 右子ノードのインデックスを取得 */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* 親ノードのインデックスを取得 */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // 切り捨て
}

/* 要素を交換 */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* ヒープのサイズを取得 */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* ヒープが空かどうかを判定 */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* ヒープ先頭要素にアクセス */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* 要素をヒープに追加 */
void push(MaxHeap *maxHeap, int val) {
    // 通常は、これほど多くのノードを追加すべきではない
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // ノードを追加
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // 下から上へヒープ化
    siftUp(maxHeap, maxHeap->size - 1);
}

/* 要素をヒープから取り出す */
int pop(MaxHeap *maxHeap) {
    // 空判定の処理
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
    swap(maxHeap, 0, size(maxHeap) - 1);
    // ノードを削除
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // 上から下へヒープ化
    siftDown(maxHeap, 0);

    // ヒープ先頭要素を返す
    return val;
}

/* ノード i から始めて、上から下へヒープ化 */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // ノード i, l, r のうち値が最大のノードを max とする
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if (max == i) {
            break;
        }
        // 2 つのノードを交換
        swap(maxHeap, i, max);
        // ループで上から下へヒープ化
        i = max;
    }
}

/* ノード i から始めて、下から上へヒープ化 */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // ノード i の親ノードを取得
        int p = parent(maxHeap, i);
        // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // 2 つのノードを交換
        swap(maxHeap, i, p);
        // ループで下から上へヒープ化
        i = p;
    }
}
