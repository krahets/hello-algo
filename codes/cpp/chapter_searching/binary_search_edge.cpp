/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-05-21
 * Author: Krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分查找最左一个元素 */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 计算中点索引 m
        if (nums[m] < target)
            i = m + 1; // target 在区间 [m+1, j] 中
        else if (nums[m] > target)
            j = m - 1; // target 在区间 [i, m-1] 中
        else
            j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
    }
    if (i == nums.size() || nums[i] != target)
        return -1; // 未找到目标元素，返回 -1
    return i;
}

/* 二分查找最右一个元素 */
int binarySearchRightEdge(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 计算中点索引 m
        if (nums[m] < target)
            i = m + 1; // target 在区间 [m+1, j] 中
        else if (nums[m] > target)
            j = m - 1; // target 在区间 [i, m-1] 中
        else
            i = m + 1; // 首个大于 target 的元素在区间 [m+1, j] 中
    }
    if (j < 0 || nums[j] != target)
        return -1; // 未找到目标元素，返回 -1
    return j;
}

/* Driver Code */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};

    // 二分查找最左一个元素
    int indexLeft = binarySearchLeftEdge(nums, target);
    cout << "数组中最左一个元素 6 的索引 = " << indexLeft << endl;

    // 二分查找最右一个元素
    int indexRight = binarySearchRightEdge(nums, target);
    cout << "数组中最右一个元素 6 的索引 = " << indexRight << endl;

    return 0;
}
