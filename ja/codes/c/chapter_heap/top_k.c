/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* 要素をヒープに追加 */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 要素を反転する
    push(maxHeap, -val);
}

/* 要素をヒープから取り出す */
int popMinHeap(MaxHeap *maxHeap) {
    // 要素を反転する
    return -pop(maxHeap);
}

/* ヒープ先頭要素にアクセス */
int peekMinHeap(MaxHeap *maxHeap) {
    // 要素を反転する
    return -peek(maxHeap);
}

/* ヒープから要素を取り出す */
int *getMinHeap(MaxHeap *maxHeap) {
    // ヒープ内のすべての要素を反転して res 配列に格納
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// ヒープに基づいて配列中の最大の k 個の要素を求める関数
int *topKHeap(int *nums, int sizeNums, int k) {
    // 最小ヒープを初期化する
    // 注意: ヒープ内の全要素を反転し、最大ヒープで最小ヒープをシミュレートする
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 配列の先頭 k 個の要素をヒープに追加
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1 番目の要素から開始し、ヒープ長を k に保つ
    for (int i = k; i < sizeNums; i++) {
        // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("最大の %d 個の要素は: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
