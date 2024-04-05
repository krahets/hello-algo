/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分搜尋（雙閉區間） */
int binarySearch(vector<int> &nums, int target) {
    // 初始化雙閉區間 [0, n-1] ，即 i, j 分別指向陣列首元素、尾元素
    int i = 0, j = nums.size() - 1;
    // 迴圈，當搜尋區間為空時跳出（當 i > j 時為空）
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target)    // 此情況說明 target 在區間 [m+1, j] 中
            i = m + 1;
        else if (nums[m] > target) // 此情況說明 target 在區間 [i, m-1] 中
            j = m - 1;
        else // 找到目標元素，返回其索引
            return m;
    }
    // 未找到目標元素，返回 -1
    return -1;
}

/* 二分搜尋（左閉右開區間） */
int binarySearchLCRO(vector<int> &nums, int target) {
    // 初始化左閉右開區間 [0, n) ，即 i, j 分別指向陣列首元素、尾元素+1
    int i = 0, j = nums.size();
    // 迴圈，當搜尋區間為空時跳出（當 i = j 時為空）
    while (i < j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target)    // 此情況說明 target 在區間 [m+1, j) 中
            i = m + 1;
        else if (nums[m] > target) // 此情況說明 target 在區間 [i, m) 中
            j = m;
        else // 找到目標元素，返回其索引
            return m;
    }
    // 未找到目標元素，返回 -1
    return -1;
}

/* Driver Code */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* 二分搜尋（雙閉區間） */
    int index = binarySearch(nums, target);
    cout << "目標元素 6 的索引 = " << index << endl;

    /* 二分搜尋（左閉右開區間） */
    index = binarySearchLCRO(nums, target);
    cout << "目標元素 6 的索引 = " << index << endl;

    return 0;
}
