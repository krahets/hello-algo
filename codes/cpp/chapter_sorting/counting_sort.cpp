/**
 * File: counting_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、空数组安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 计数排序（简易版） */
void countingSortNaive(std::vector<int>& nums) {
    // 空数组直接返回
    if (nums.empty())
        return;

    // 1. 统计最大值
    int m = 0;
    for (int num : nums) {
        m = std::max(m, num);
    }

    // 2. 统计元素出现次数
    std::vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }

    // 3. 重建原数组
    int idx = 0;
    for (int num = 0; num <= m; ++num) {
        while (counter[num]-- > 0) {
            nums[idx++] = num;
        }
    }
}

/* 计数排序（完整稳定版） */
void countingSort(std::vector<int>& nums) {
    if (nums.empty())
        return;

    // 1. 统计最大值
    int m = 0;
    for (int num : nums) {
        m = std::max(m, num);
    }

    // 2. 统计出现次数
    std::vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }

    // 3. 前缀和，计算尾索引
    for (int i = 0; i < m; ++i) {
        counter[i + 1] += counter[i];
    }

    // 4. 倒序遍历，实现稳定排序
    int n = static_cast<int>(nums.size());
    std::vector<int> res(n);
    for (int i = n - 1; i >= 0; --i) {
        int num = nums[i];
        res[counter[num] - 1] = num;
        counter[num]--;
    }

    nums = std::move(res); // 移动语义，优化性能
}

/* Driver Code */
int main() {
    std::vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    std::cout << "计数排序（简易版）完成后 nums = ";
    printVector(nums);

    std::vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    std::cout << "计数排序（稳定版）完成后 nums1 = ";
    printVector(nums1);

    return 0;
}
