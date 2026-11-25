/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 長さ n のヒープで、ノード i から下向きにヒープ化 */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
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
        swap(nums[i], nums[ma]);
        // 下向きのヒープ化を繰り返す
        i = ma;
    }
}

/* ヒープソート */
void heapSort(vector<int> &nums) {
    // ヒープの構築：葉以外のすべてのノードをヒープ化
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // ヒープから最大要素を取り出す操作を n-1 回繰り返す
    for (int i = nums.size() - 1; i > 0; --i) {
        // 根と右端の葉を交換（先頭要素と末尾要素の交換）
        swap(nums[0], nums[i]);
        // 根から下向きにヒープ化
        siftDown(nums, i, 0);
    }
}

/* 実行例 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "ヒープソート後の nums = ";
    printVector(nums);

    return 0;
}
