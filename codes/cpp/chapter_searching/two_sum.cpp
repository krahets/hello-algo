/**
 * File: two_sum.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、代码规范
 */

#include "../utils/common.hpp"
#include <vector>
#include <unordered_map>
#include <iostream>

/* 方法一：暴力枚举 */
std::vector<int> twoSumBruteForce(const std::vector<int>& nums, int target) {
    int n = static_cast<int>(nums.size());
    for (int i = 0; i < n - 1; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if (nums[i] + nums[j] == target) {
                return {i, j};
            }
        }
    }
    return {};
}

/* 方法二：辅助哈希表 */
std::vector<int> twoSumHashTable(const std::vector<int>& nums, int target) {
    int n = static_cast<int>(nums.size());
    std::unordered_map<int, int> dic;

    for (int i = 0; i < n; ++i) {
        auto it = dic.find(target - nums[i]);
        if (it != dic.end()) {
            return {it->second, i};
        }
        dic.emplace(nums[i], i);
    }
    return {};
}

/* Driver Code */
int main() {
    std::vector<int> nums = {2, 7, 11, 15};
    int target = 13;

    // 方法一
    std::vector<int> res = twoSumBruteForce(nums, target);
    std::cout << "方法一 res = ";
    printVector(res);

    // 方法二
    res = twoSumHashTable(nums, target);
    std::cout << "方法二 res = ";
    printVector(res);

    return 0;
}
