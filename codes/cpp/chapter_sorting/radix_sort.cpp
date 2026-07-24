/**
 * File: radix_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、空数组安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
int digit(int num, int exp) {
    return (num / exp) % 10;
}

/* 计数排序（根据 nums 第 k 位排序） */
void countingSortDigit(std::vector<int>& nums, int exp) {
    if (nums.empty())
        return;

    std::vector<int> counter(10, 0);
    int n = static_cast<int>(nums.size());

    // 统计第 k 位数字出现次数
    for (int i = 0; i < n; ++i) {
        int d = digit(nums[i], exp);
        counter[d]++;
    }

    // 前缀和转换为索引
    for (int i = 1; i < 10; ++i) {
        counter[i] += counter[i - 1];
    }

    // 倒序填充，保证稳定性
    std::vector<int> res(n);
    for (int i = n - 1; i >= 0; --i) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1;
        res[j] = nums[i];
        counter[d]--;
    }

    // 覆盖回原数组
    nums = std::move(res);
}

/* 基数排序 */
void radixSort(std::vector<int>& nums) {
    if (nums.empty())
        return;

    // 获取数组最大值
    int m = *std::max_element(nums.begin(), nums.end());
    // 从低位到高位依次排序
    for (int exp = 1; exp <= m; exp *= 10) {
        countingSortDigit(nums, exp);
    }
}

/* Driver Code */
int main() {
    std::vector<int> nums = {10546151, 35663510, 42865989, 34862445, 81883077,
                             88906420, 72429244, 30524779, 82060337, 63832996};

    radixSort(nums);

    std::cout << "基数排序完成后 nums = ";
    printVector(nums);

    return 0;
}
