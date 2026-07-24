/**
 * File: binary_search_recur.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 二分查找：递归实现 */
int dfs(vector<int>& nums, int target, int i, int j) {
    // 区间为空，代表未找到目标元素
    if (i > j) {
        return -1;
    }

    // 计算中点索引（防止溢出写法：i + (j - i) / 2）
    int m = i + (j - i) / 2;

    if (nums[m] < target) {
        // 目标元素在右半区间 [m+1, j]
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // 目标元素在左半区间 [i, m-1]
        return dfs(nums, target, i, m - 1);
    } else {
        // 找到目标，返回索引
        return m;
    }
}

/* 二分查找入口函数 */
int binarySearch(vector<int>& nums, int target) {
    return dfs(nums, target, 0, nums.size() - 1);
}

/* 主函数测试 */
int main() {
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    int target = 6;

    int index = binarySearch(nums, target);
    cout << "目标元素 " << target << " 的索引 = " << index << endl;

    return 0;
}
