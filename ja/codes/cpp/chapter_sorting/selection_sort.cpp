/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 選択ソート */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // 外側ループ：未ソート範囲は[i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // 内側ループ：未ソート範囲内で最小要素を見つける
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 最小要素のインデックスを記録
        }
        // 最小要素を未ソート範囲の最初の要素と交換
        swap(nums[i], nums[k]);
    }
}

/* ドライバコード */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "選択ソート後、nums = ";
    printVector(nums);

    return 0;
}