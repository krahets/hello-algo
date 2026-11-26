/**
 * File: two_sum.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 方法一：窮舉法 */
vector<int> twoSumBruteForce(vector<int> &nums, int target) {
    int size = nums.size();
    // 使用兩層迴圈，時間複雜度為 O(n^2)
    for (int i = 0; i < size - 1; i++) {
        for (int j = i + 1; j < size; j++) {
            if (nums[i] + nums[j] == target)
                return {i, j};
        }
    }
    return {};
}

/* 方法二：使用輔助雜湊表 */
vector<int> twoSumHashTable(vector<int> &nums, int target) {
    int size = nums.size();
    // 使用輔助雜湊表，空間複雜度為 O(n)
    unordered_map<int, int> dic;
    // 使用單層迴圈，時間複雜度為 O(n)
    for (int i = 0; i < size; i++) {
        if (dic.find(target - nums[i]) != dic.end()) {
            return {dic[target - nums[i]], i};
        }
        dic.emplace(nums[i], i);
    }
    return {};
}

/* 主程式 */
int main() {
    // ======= 測試案例 =======
    vector<int> nums = {2, 7, 11, 15};
    int target = 13;

    // ====== 主程式 ======
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
