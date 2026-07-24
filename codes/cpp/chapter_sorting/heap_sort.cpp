/**
 * File: heap_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++规范、类型安全、代码健壮优化
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/**
 * @brief 自上而下堆化（构建大顶堆）
 * @param nums 数组
 * @param n 堆有效长度
 * @param i 当前堆化节点下标
 */
void siftDown(std::vector<int>& nums, int n, int i)
{
    while (true)
    {
        int left = 2 * i + 1;
        int right = 2 * i + 2;
        int maxIdx = i;

        // 找出最大值下标
        if (left < n && nums[left] > nums[maxIdx])
            maxIdx = left;
        if (right < n && nums[right] > nums[maxIdx])
            maxIdx = right;

        // 当前节点已是最大，无需调整
        if (maxIdx == i)
            break;

        std::swap(nums[i], nums[maxIdx]);
        i = maxIdx;
    }
}

/* 堆排序 */
void heapSort(std::vector<int>& nums)
{
    if (nums.empty())
        return;

    int size = static_cast<int>(nums.size());
    // 1. 初始化建大顶堆
    for (int i = size / 2 - 1; i >= 0; --i)
    {
        siftDown(nums, size, i);
    }

    // 2. 依次取出堆顶最大值放到数组尾部
    for (int i = size - 1; i > 0; --i)
    {
        std::swap(nums[0], nums[i]);
        siftDown(nums, i, 0);
    }
}

/* 主函数测试 */
int main()
{
    std::vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    std::cout << "堆排序完成后 nums = ";
    printVector(nums);

    return 0;
}
