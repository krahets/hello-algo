/*
 * File: leetcode_two_sum.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

class SolutionBruteForce {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int size = nums.size();
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return { i, j };
            }
        }
        return {};
    }
};

class SolutionHashMap {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int size = nums.size();
        unordered_map<int, int> dic;
        for (int i = 0; i < size; i++) {
            if (dic.find(target - nums[i]) != dic.end()) {
                return { dic[target - nums[i]], i };
            }
            dic.emplace(nums[i], i);
        }
        return {};
    }
};


int main() {
    // ======= Test Case =======
    vector<int> nums = { 2,7,11,15 };
    int target = 9;
    
    // ====== Driver Code ======
    // 方法一
    SolutionBruteForce* slt1 = new SolutionBruteForce();
    vector<int> res = slt1->twoSum(nums, target);
    PrintUtil::printVector(res);
    // 方法二
    SolutionHashMap* slt2 = new SolutionHashMap();
    res = slt2->twoSum(nums, target);
    PrintUtil::printVector(res);
}
