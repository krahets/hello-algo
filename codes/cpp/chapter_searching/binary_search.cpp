/**
 * File: binary_search.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、空数组安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 二分查找（双闭区间）*/
// 使用 const 保证不修改原数组，更安全、更通用
int binarySearch(const std::vector<int>& nums, int target) {
    // 空数组直接返回 -1，避免非法访问
    if (nums.empty())
        return -1;

    int i = 0;
    int j = static_cast<int>(nums.size()) - 1;

    while (i <= j) {
        // 计算中点，防整数溢出
        int m = i + (j - i) / 2;
        if (nums[m] < target) {
            i = m + 1;
        } else if (nums[m] > target) {
            j = m - 1;
        } else {
            // 找到目标
            return m;
        }
    }
    // 未找到
    return -1;
}

/* 二分查找（左闭右开区间）*/
int binarySearchLCRO(const std::vector<int>& nums, int target) {
    if (nums.empty())
        return -1;

    int i = 0;
    int j = static_cast<int>(nums.size());

    while (i < j) {
        int m = i + (j - i) / 2;
        if (nums[m] < target) {
            i = m + 1;
        } else if (nums[m] > target) {
            j = m;
        } else {
            return m;
        }
    }
    return -1;
}

/* Driver Code */
int main() {
    const int target = 6;
    std::vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    // 二分查找（双闭区间）
    int index = binarySearch(nums, target);
    std::cout << "目标元素 6 的索引 = " << index << std::endl;

    // 二分查找（左闭右开区间）
    index = binarySearchLCRO(nums, target);
    std::cout << "目标元素 6 的索引 = " << index << std::endl;

    return 0;
}
