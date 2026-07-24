/**
 * File: binary_search_edge.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、空数组安全、类型安全
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

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

/* 二分查找最左一个 target */
int binarySearchLeftEdge(const std::vector<int>& nums, int target) {
    int i = binarySearchInsertion(nums, target);
    if (i == nums.size() || nums[i] != target)
        return -1;

    return i;
}

/* 二分查找最右一个 target */
int binarySearchRightEdge(const std::vector<int>& nums, int target) {
    int i = binarySearchInsertion(nums, target + 1);
    int j = i - 1;

    if (j == -1 || nums[j] != target)
        return -1;

    return j;
}

/* Driver Code */
int main() {
    std::vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    std::cout << "\n数组 nums = ";
    printVector(nums);

    // 查找左、右边界
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        std::cout << "最左一个元素 " << target << " 的索引为 " << index << '\n';

        index = binarySearchRightEdge(nums, target);
        std::cout << "最右一个元素 " << target << " 的索引为 " << index << '\n';
    }

    return 0;
}
