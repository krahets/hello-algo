/**
 * File: bucket_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++、类型安全、规范命名、可读性优化
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 桶排序 */
void bucketSort(std::vector<float>& nums) {
    // 若数组为空，直接返回
    if (nums.empty())
        return;

    // 初始化 k = n/2 个桶
    int n = static_cast<int>(nums.size());
    int k = n / 2;
    std::vector<std::vector<float>> buckets(k);

    // 1. 将数组元素分配到各个桶中
    for (float num : nums) {
        // 映射到桶索引 [0, k-1]
        int i = static_cast<int>(num * k);
        buckets[i].push_back(num);
    }

    // 2. 对每个桶单独排序
    for (auto& bucket : buckets) {
        std::sort(bucket.begin(), bucket.end());
    }

    // 3. 合并所有桶的结果
    int idx = 0;
    for (const auto& bucket : buckets) {
        for (float num : bucket) {
            nums[idx++] = num;
        }
    }
}

/* Driver Code */
int main() {
    // 输入数据范围 [0, 1)
    std::vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f,
                               0.43f, 0.91f, 0.75f, 0.15f, 0.37f};

    bucketSort(nums);

    std::cout << "桶排序完成后 nums = ";
    printVector(nums);

    return 0;
}
