/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 用二分搜尋找插入點（無重複元素） */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if (nums[m] > target) {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            return m; // 找到 target，回傳插入點 m
        }
    }
    // 找不到 target，回傳插入點 i
    return i;
}

/* 用二分搜尋找插入點（有重複元素） */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if (nums[m] > target) {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            j = m - 1; // 最右邊小於 target 的元素位於區間 [i, m-1] 內
        }
    }
    // 回傳插入點 i
    return i;
}

/* 主程式 */
int main() {
    // 不含重複元素的陣列
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\n陣列 nums = ";
    printVector(nums);
    // 用二分搜尋找插入點
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "元素 " << target << " 的插入位置索引為 " << index << endl;
    }

    // 含有重複元素的陣列
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n陣列 nums = ";
    printVector(nums);
    // 用二分搜尋找插入點
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "元素 " << target << " 的插入位置索引為 " << index << endl;
    }

    return 0;
}
