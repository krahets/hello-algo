/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 建立陣列 nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 以系統時間產生亂數種子
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 隨機打亂陣列元素
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 在陣列 nums 中尋找數字 1 的索引 */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* 主程式 */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\n陣列 [ 1, 2, ..., n ] 打亂順序後 = ";
        printVector(nums);
        cout << "數字 1 的索引為 " << index << endl;
    }
    return 0;
}
