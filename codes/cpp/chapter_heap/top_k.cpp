/**
 * File: top_k.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、代码规范
 */

#include "../utils/common.hpp"
#include <vector>
#include <queue>
#include <iostream>

/* 基于堆查找数组中最大的 k 个元素 */
std::priority_queue<int, std::vector<int>, std::greater<int>>
topKHeap(const std::vector<int>& nums, int k) {
    // 小顶堆
    std::priority_queue<int, std::vector<int>, std::greater<int>> heap;

    // 前 k 个元素入堆
    for (int i = 0; i < k; ++i) {
        heap.push(nums[i]);
    }

    // 从第 k+1 个元素开始维护堆
    int n = static_cast<int>(nums.size());
    for (int i = k; i < n; ++i) {
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }

    return heap;
}

/* Driver Code */
int main() {
    std::vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    auto res = topKHeap(nums, k);
    std::cout << "最大的 " << k << " 个元素为: ";
    printHeap(res);

    return 0;
}
