/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分搜尋（閉區間） */
int binarySearch(vector<int> &nums, int target) {
    // 將閉區間設為 [0, n-1]，i 和 j 分別指向陣列的首、末元素
    int i = 0, j = nums.size() - 1;
    // 當搜尋區間為空（i > j）時，結束迴圈
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target)    // 此時 target 若存在，必在區間 [m+1, j] 內
            i = m + 1;
        else if (nums[m] > target) // 此時 target 若存在，必在區間 [i, m-1] 內
            j = m - 1;
        else // 找到目標元素，回傳其索引
            return m;
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 二分搜尋（左閉右開區間） */
int binarySearchLCRO(vector<int> &nums, int target) {
    // 將左閉右開區間設為 [0, n)，i 指向陣列的首元素，j 指向末元素的下一個位置
    int i = 0, j = nums.size();
    // 當搜尋區間為空（i = j）時，結束迴圈
    while (i < j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target)    // 此時 target 若存在，必在區間 [m+1, j) 內
            i = m + 1;
        else if (nums[m] > target) // 此時 target 若存在，必在區間 [i, m) 內
            j = m;
        else // 找到目標元素，回傳其索引
            return m;
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 主程式 */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* 二分搜尋（閉區間） */
    int index = binarySearch(nums, target);
    cout << "目標元素 6 的索引 = " << index << endl;

    /* 二分搜尋（左閉右開區間） */
    index = binarySearchLCRO(nums, target);
    cout << "目標元素 6 的索引 = " << index << endl;

    return 0;
}
