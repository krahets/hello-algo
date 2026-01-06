/**
 * File: insertion_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 挿入ソート */
void insertionSort(vector<int> &nums) {
    // 外側ループ：ソート済み範囲は[0, i-1]
    for (int i = 1; i < nums.size(); i++) {
        int base = nums[i], j = i - 1;
        // 内側ループ：baseをソート済み範囲[0, i-1]内の正しい位置に挿入
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // nums[j]を一つ右に移動
            j--;
        }
        nums[j + 1] = base; // baseを正しい位置に代入
    }
}

/* ドライバコード */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    insertionSort(nums);
    cout << "挿入ソート後、nums = ";
    printVector(nums);

    return 0;
}