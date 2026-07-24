/**
 * File: bubble_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、规范命名、可读性优化
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm> // std::swap

/* 冒泡排序 */
void bubbleSort(std::vector<int>& nums) {
    int n = static_cast<int>(nums.size());
    // 外循环：未排序区间为 [0, i]
    for (int i = n - 1; i > 0; --i) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至右端
        for (int j = 0; j < i; ++j) {
            if (nums[j] > nums[j + 1]) {
                std::swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* 冒泡排序（标志优化）*/
void bubbleSortWithFlag(std::vector<int>& nums) {
    int n = static_cast<int>(nums.size());
    // 外循环：未排序区间为 [0, i]
    for (int i = n - 1; i > 0; --i) {
        bool swapped = false;
        // 内循环：冒泡交换
        for (int j = 0; j < i; ++j) {
            if (nums[j] > nums[j + 1]) {
                std::swap(nums[j], nums[j + 1]);
                swapped = true;
            }
        }
        if (!swapped) {
            break; // 未发生交换，说明已有序，提前退出
        }
    }
}

/* Driver Code */
int main() {
    std::vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    std::cout << "冒泡排序完成后 nums = ";
    printVector(nums);

    std::vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    std::cout << "冒泡排序（优化）完成后 nums1 = ";
    printVector(nums1);

    return 0;
}
