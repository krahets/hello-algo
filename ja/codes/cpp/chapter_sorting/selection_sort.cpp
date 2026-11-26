/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 選択ソート */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // 外側のループ：未整列区間は [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // 内側のループ：未整列区間の最小要素を探す
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 最小要素のインデックスを記録
        }
        // その最小要素と未整列区間の先頭要素を交換
        swap(nums[i], nums[k]);
    }
}

/* 実行例 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "選択ソート後の nums = ";
    printVector(nums);

    return 0;
}
