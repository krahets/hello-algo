/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* ヒープに要素を挿入する */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 要素の符号を反転する
    push(maxHeap, -val);
}

/* ヒープから要素を取り出す */
int popMinHeap(MaxHeap *maxHeap) {
    // 要素の符号を反転する
    return -pop(maxHeap);
}

/* ヒープの先頭要素にアクセスする */
int peekMinHeap(MaxHeap *maxHeap) {
    // 要素の符号を反転する
    return -peek(maxHeap);
}

/* ヒープ内の要素を取り出す */
int *getMinHeap(MaxHeap *maxHeap) {
    // ヒープの全要素の符号を反転し、res 配列に格納する
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// ヒープを使って配列内の大きいほうから k 個の要素を求める関数
int *topKHeap(int *nums, int sizeNums, int k) {
    // 最小ヒープを初期化する
    // 注意：ヒープの全要素の符号を反転することで、最大ヒープを使って最小ヒープを再現する
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 配列の先頭 k 個の要素をヒープに挿入する
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1 番目の要素から始め、ヒープの長さを k に保つ
    for (int i = k; i < sizeNums; i++) {
        // 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    int *res = getMinHeap(maxHeap);
    // メモリを解放する
    delMaxHeap(maxHeap);
    return res;
}

/* 実行用コード */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("大きいほうから %d 個の要素： ", k);
    printArray(res, k);

    free(res);
    return 0;
}
