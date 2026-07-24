/**
 * File: quick_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、类型安全、空数组安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 快速排序类 */
class QuickSort {
private:
    /* 哨兵划分 */
    static int partition(std::vector<int>& nums, int left, int right) {
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;
            while (i < j && nums[i] <= nums[left])
                i++;
            std::swap(nums[i], nums[j]);
        }
        std::swap(nums[i], nums[left]);
        return i;
    }

public:
    /* 快速排序 */
    static void quickSort(std::vector<int>& nums, int left, int right) {
        if (left >= right)
            return;

        int pivot = partition(nums, left, right);
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* 快速排序类（中位基准数优化） */
class QuickSortMedian {
private:
    /* 选取三个候选元素的中位数 */
    static int medianThree(std::vector<int>& nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid;
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left;
        return right;
    }

    /* 哨兵划分（三数取中值） */
    static int partition(std::vector<int>& nums, int left, int right) {
        int med = medianThree(nums, left, (left + right) / 2, right);
        std::swap(nums[left], nums[med]);

        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;
            while (i < j && nums[i] <= nums[left])
                i++;
            std::swap(nums[i], nums[j]);
        }
        std::swap(nums[i], nums[left]);
        return i;
    }

public:
    static void quickSort(std::vector<int>& nums, int left, int right) {
        if (left >= right)
            return;

        int pivot = partition(nums, left, right);
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* 快速排序类（递归深度优化） */
class QuickSortTailCall {
private:
    static int partition(std::vector<int>& nums, int left, int right) {
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;
            while (i < j && nums[i] <= nums[left])
                i++;
            std::swap(nums[i], nums[j]);
        }
        std::swap(nums[i], nums[left]);
        return i;
    }

public:
    static void quickSort(std::vector<int>& nums, int left, int right) {
        while (left < right) {
            int pivot = partition(nums, left, right);
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);
                left = pivot + 1;
            } else {
                quickSort(nums, pivot + 1, right);
                right = pivot - 1;
            }
        }
    }
};

/* Driver Code */
int main() {
    std::vector<int> nums = {2, 4, 1, 0, 3, 5};
    if (!nums.empty()) {
        QuickSort::quickSort(nums, 0, static_cast<int>(nums.size()) - 1);
    }
    std::cout << "快速排序完成后 nums = ";
    printVector(nums);

    std::vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    if (!nums1.empty()) {
        QuickSortMedian::quickSort(nums1, 0, static_cast<int>(nums1.size()) - 1);
    }
    std::cout << "快速排序（中位基准数优化）完成后 nums = ";
    printVector(nums1);

    std::vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    if (!nums2.empty()) {
        QuickSortTailCall::quickSort(nums2, 0, static_cast<int>(nums2.size()) - 1);
    }
    std::cout << "快速排序（递归深度优化）完成后 nums = ";
    printVector(nums2);

    return 0;
}
