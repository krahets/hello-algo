/**
 * File: insertion_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 插入排序 */
void insertionSort(vector<int> &nums) {
    // 外迴圈：已排序區間為 [0, i-1]
    for (int i = 1; i < nums.size(); i++) {
        int base = nums[i], j = i - 1;
        // 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // 將 nums[j] 向右移動一位
            j--;
        }
        nums[j + 1] = base; // 將 base 賦值到正確位置
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    insertionSort(nums);
    cout << "插入排序完成後 nums = ";
    printVector(nums);

    return 0;
}
