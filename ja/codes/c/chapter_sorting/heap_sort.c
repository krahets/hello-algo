/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* ヒープの長さは n。ノード i から下方向にヒープ化 */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // ノード i, l, r のうち値が最大のノードを ma とする
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if (ma == i) {
            break;
        }
        // 2 つのノードを交換
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // ループで上から下へヒープ化
        i = ma;
    }
}

/* ヒープソート */
void heapSort(int nums[], int n) {
    // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // ヒープから最大要素を取り出し、n-1 回繰り返す
    for (int i = n - 1; i > 0; --i) {
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 根ノードを起点に、上から下へヒープ化
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("ヒープソート完了後 nums = ");
    printArray(nums, n);

    return 0;
}