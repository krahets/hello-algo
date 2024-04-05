/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 生成陣列 nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 使用系統時間生成隨機種子
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 隨機打亂陣列元素
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 查詢陣列 nums 中數字 1 所在索引 */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\n陣列 [ 1, 2, ..., n ] 被打亂後 = ";
        printVector(nums);
        cout << "數字 1 的索引為 " << index << endl;
    }
    return 0;
}
