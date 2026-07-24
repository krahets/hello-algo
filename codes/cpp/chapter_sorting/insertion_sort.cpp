/**
 * File: insertion_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、空数组安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 插入排序 */
void insertionSort(std::vector<int>& nums) {
    // 空数组或只有一个元素，直接返回
    if (nums.size() <= 1)
        return;

    int n = static_cast<int>(nums.size());
    // 外循环：已排序区间为 [0, i-1]
    for (int i = 1; i < n; ++i) {
        int base = nums[i];
        int j = i - 1;

        // 内循环：将 base 插入到已排序区间的正确位置
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // 元素右移
            --j;
        }
        nums[j + 1] = base; // 插入元素
    }
}

/* Driver Code */
int main() {
    std::vector<int> nums = {4, 1, 3, 1, 5, 2};
    insertionSort(nums);
    std::cout << "插入排序完成后 nums = ";
    printVector(nums);

    return 0;
}
