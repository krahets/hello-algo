/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 生成数组 nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 使用系统时间生成随机种子
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 随机打乱数组元素
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
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
        cout << "\n数组 [ 1, 2, ..., n ] 被打乱后 = ";
        printVector(nums);
        cout << "数字 1 的索引为 " << index << endl;
    }
    return 0;
}
