/**
 * File: merge_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、空数组安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 合并左子数组和右子数组 */
void merge(std::vector<int>& nums, int left, int mid, int right) {
    // 临时数组存储合并结果
    std::vector<int> tmp(right - left + 1);
    int i = left, j = mid + 1, k = 0;

    // 合并两个有序子数组
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++];
        else
            tmp[k++] = nums[j++];
    }

    // 处理剩余元素
    while (i <= mid)
        tmp[k++] = nums[i++];
    while (j <= right)
        tmp[k++] = nums[j++];

    // 复制回原数组
    for (k = 0; k < tmp.size(); ++k) {
        nums[left + k] = tmp[k];
    }
}

/* 归并排序 */
void mergeSort(std::vector<int>& nums, int left, int right) {
    // 终止条件：子数组长度为 1
    if (left >= right)
        return;

    // 划分
    int mid = left + (right - left) / 2; // 防溢出
    mergeSort(nums, left, mid);
    mergeSort(nums, mid + 1, right);

    // 合并
    merge(nums, left, mid, right);
}

/* Driver Code */
int main() {
    std::vector<int> nums = {7, 3, 2, 6, 0, 1, 5, 4};

    // 空数组安全处理
    if (!nums.empty()) {
        mergeSort(nums, 0, static_cast<int>(nums.size()) - 1);
    }

    std::cout << "归并排序完成后 nums = ";
    printVector(nums);

    return 0;
}
