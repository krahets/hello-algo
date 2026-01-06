/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ヒープの長さはn、ノードiから上から下へヒープ化を開始 */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // i、l、r の中で最大のノードを決定し、maとして記録
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // ノードiが最大か、インデックスl、rが境界外の場合、それ以上のヒープ化は不要で終了
        if (ma == i) {
            break;
        }
        // 二つのノードを交換
        swap(nums[i], nums[ma]);
        // 下向きにヒープ化をループ
        i = ma;
    }
}

/* ヒープソート */
void heapSort(vector<int> &nums) {
    // ヒープ構築操作：葉以外のすべてのノードをヒープ化
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // ヒープから最大要素を抽出し、n-1回繰り返す
    for (int i = nums.size() - 1; i > 0; --i) {
        // ルートノードを最右葉ノードと交換（最初の要素を最後の要素と交換）
        swap(nums[0], nums[i]);
        // ルートノードから上から下へヒープ化を開始
        siftDown(nums, i, 0);
    }
}

/* ドライバコード */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "ヒープソート後、nums = ";
    printVector(nums);

    return 0;
}