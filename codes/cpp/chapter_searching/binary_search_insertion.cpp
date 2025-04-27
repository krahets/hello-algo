/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分查找插入点（无重复元素） */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 计算中点索引 m
        if (nums[m] < target) {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            return m; // 找到 target ，返回插入点 m
        }
    }
    // 未找到 target ，返回插入点 i
    return i;
}

/* 二分查找插入点（存在重复元素） */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 计算中点索引 m
        if (nums[m] < target) {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
    }
    // 返回插入点 i
    return i;
}

/* Driver Code */
int main() {
    // 无重复元素的数组
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\n数组 nums = ";
    printVector(nums);
    // 二分查找插入点
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "元素 " << target << " 的插入点的索引为 " << index << endl;
    }

    // 包含重复元素的数组
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n数组 nums = ";
    printVector(nums);
    // 二分查找插入点
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "元素 " << target << " 的插入点的索引为 " << index << endl;
    }

    return 0;
}
