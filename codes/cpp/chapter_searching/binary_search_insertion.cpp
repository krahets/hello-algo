/**
 * File: binary_search_insertion.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、空数组安全、类型安全
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 二分查找插入点（无重复元素）*/
int binarySearchInsertionSimple(const std::vector<int>& nums, int target) {
    if (nums.empty())
        return 0;

    int i = 0;
    int j = static_cast<int>(nums.size()) - 1;

    while (i <= j) {
        int m = i + (j - i) / 2;
        if (nums[m] < target) {
            i = m + 1;
        } else if (nums[m] > target) {
            j = m - 1;
        } else {
            return m;
        }
    }
    return i;
}

/* 二分查找插入点（存在重复元素）*/
int binarySearchInsertion(const std::vector<int>& nums, int target) {
    if (nums.empty())
        return 0;

    int i = 0;
    int j = static_cast<int>(nums.size()) - 1;

    while (i <= j) {
        int m = i + (j - i) / 2;
        if (nums[m] < target) {
            i = m + 1;
        } else {
            j = m - 1;
        }
    }
    return i;
}

/* Driver Code */
int main() {
    // 无重复元素
    std::vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    std::cout << "\n数组 nums = ";
    printVector(nums);

    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        std::cout << "元素 " << target << " 的插入点索引为 " << index << '\n';
    }

    // 有重复元素
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    std::cout << "\n数组 nums = ";
    printVector(nums);

    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        std::cout << "元素 " << target << " 的插入点索引为 " << index << '\n';
    }

    return 0;
}
