/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 長さ n のヒープを、ノード i から下向きにヒープ化する */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // ノード i, l, r のうち値が最大のノードを求め、ma とする
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if (ma == i) {
            break;
        }
        // 2 つのノードを交換する
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // 下向きのヒープ化を繰り返す
        i = ma;
    }
}

/* ヒープソート */
void heapSort(int nums[], int n) {
    // ヒープの構築：葉ノード以外の全ノードをヒープ化する
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // ヒープから最大要素を取り出す処理を n-1 回繰り返す
    for (int i = n - 1; i > 0; --i) {
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 根ノードから下向きにヒープ化する
        siftDown(nums, i, 0);
    }
}

/* 実行用コード */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("ヒープソート完了後 nums = ");
    printArray(nums, n);

    return 0;
}