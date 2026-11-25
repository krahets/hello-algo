/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 長さ n のヒープで、ノード i から下向きにヒープ化 */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // ノード i, l, r のうち値が最大のものを ma とする
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // i の値が最大か、左右の子のインデックス l, r がともに範囲外なら、ヒープ化を終了
        if (ma == i) {
            break;
        }
        // 2 つのノードを交換
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // 下向きのヒープ化を繰り返す
        i = ma;
    }
}

/* ヒープソート */
void heapSort(int nums[], int n) {
    // ヒープの構築：葉以外のすべてのノードをヒープ化
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // ヒープから最大要素を取り出す操作を n-1 回繰り返す
    for (int i = n - 1; i > 0; --i) {
        // 根と右端の葉を交換（先頭要素と末尾要素の交換）
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 根から下向きにヒープ化
        siftDown(nums, i, 0);
    }
}

/* 実行例 */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("ヒープソート後の nums = ");
    printArray(nums, n);

    return 0;
}