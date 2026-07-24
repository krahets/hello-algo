/**
 * File: selection_sort.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++规范、类型安全、健壮性优化
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 选择排序 */
void selectionSort(std::vector<int>& nums)
{
    // 数组长度小于2无需排序
    if (nums.size() <= 1)
        return;

    int n = static_cast<int>(nums.size());
    // 外循环：确定已排序区间尾部
    for (int i = 0; i < n - 1; ++i)
    {
        int minIdx = i;
        // 寻找未排序区间最小值下标
        for (int j = i + 1; j < n; ++j)
        {
            if (nums[j] < nums[minIdx])
                minIdx = j;
        }
        // 交换最小值到当前位置
        std::swap(nums[i], nums[minIdx]);
    }
}

/* 主函数测试 */
int main()
{
    std::vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    std::cout << "选择排序完成后 nums = ";
    printVector(nums);

    return 0;
}
