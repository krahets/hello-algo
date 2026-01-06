/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バブルソート */
void bubbleSort(vector<int> &nums) {
    // 外側ループ：未ソート範囲は[0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // 内側ループ：未ソート範囲[0, i]内の最大要素を範囲の右端に交換
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]とnums[j + 1]を交換
                // ここではstdのswapを使用
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* バブルソート（フラグ最適化版）*/
void bubbleSortWithFlag(vector<int> &nums) {
    // 外側ループ：未ソート範囲は[0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // フラグを初期化
        // 内側ループ：未ソート範囲[0, i]内の最大要素を範囲の右端に交換
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]とnums[j + 1]を交換
                // ここではstdのswapを使用
                swap(nums[j], nums[j + 1]);
                flag = true; // 交換された要素を記録
            }
        }
        if (!flag)
            break; // この回の「バブリング」で要素が交換されなかった場合、終了
    }
}

/* ドライバコード */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "バブルソート後、nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "バブルソート後、nums1 = ";
    printVector(nums1);

    return 0;
}