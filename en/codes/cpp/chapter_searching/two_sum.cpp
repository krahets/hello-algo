/**
 * File: two_sum.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Method 1: Brute force enumeration */
vector<int> twoSumBruteForce(vector<int> &nums, int target) {
    int size = nums.size();
    // Two nested loops, time complexity is O(n^2)
    for (int i = 0; i < size - 1; i++) {
        for (int j = i + 1; j < size; j++) {
            if (nums[i] + nums[j] == target)
                return {i, j};
        }
    }
    return {};
}

/* Method 2: Auxiliary hash table */
vector<int> twoSumHashTable(vector<int> &nums, int target) {
    int size = nums.size();
    // Auxiliary hash table, space complexity is O(n)
    unordered_map<int, int> dic;
    // Single loop, time complexity is O(n)
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
    // Method 1
    vector<int> res = twoSumBruteForce(nums, target);
    cout << "Method 1 res = ";
    printVector(res);
    // Method 2
    res = twoSumHashTable(nums, target);
    cout << "Method 2 res = ";
    printVector(res);

    return 0;
}
