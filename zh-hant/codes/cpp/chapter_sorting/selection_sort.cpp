/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 選擇排序 */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // 外層迴圈：未排序區間為 [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // 內層迴圈：找出未排序區間中的最小元素
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 記錄最小元素的索引
        }
        // 將最小元素與未排序區間的第一個元素交換
        swap(nums[i], nums[k]);
    }
}

/* 主程式 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "選擇排序完成後 nums = ";
    printVector(nums);

    return 0;
}
