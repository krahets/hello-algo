/**
 * File: two_sum.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 方法一：暴力枚举 */
vector<int> twoSumBruteForce(vector<int> &nums, int target) {
    int size = nums.size();
    // 两层循环，时间复杂度为 O(n^2)
    for (int i = 0; i < size - 1; i++) {
        for (int j = i + 1; j < size; j++) {
            if (nums[i] + nums[j] == target)
                return {i, j};
        }
    }
    return {};
}

/* 方法二：辅助哈希表 */
vector<int> twoSumHashTable(vector<int> &nums, int target) {
    int size = nums.size();
    // 辅助哈希表，空间复杂度为 O(n)
    unordered_map<int, int> dic;
    // 单层循环，时间复杂度为 O(n)
    for (int i = 0; i < size; i++) {
        if (dic.find(target - nums[i]) != dic.end()) {
            return {dic[target - nums[i]], i};
        }
        dic.emplace(nums[i], i);
    }
    return {};
}

/* Driver Code */
int main() {
    // ======= Test Case =======
    vector<int> nums = {2, 7, 11, 15};
    int target = 13;

    // ====== Driver Code ======
    // 方法一
    vector<int> res = twoSumBruteForce(nums, target);
    cout << "方法一 res = ";
    printVector(res);
    // 方法二
    res = twoSumHashTable(nums, target);
    cout << "方法二 res = ";
    printVector(res);

    return 0;
}
