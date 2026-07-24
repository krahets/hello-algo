/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <algorithm>
#include <chrono>
#include <random>

using namespace std;

/* 打印数组 */
void printVector(vector<int>& nums) {
    cout << "[ ";
    for (int i = 0; i < nums.size(); i++) {
        cout << nums[i] << " ";
    }
    cout << "]";
}

/* 生成一个数组，元素为 {1,2,...,n}，顺序随机打乱 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 生成 1,2,...,n
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 随机种子
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 打乱顺序
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 查找数组中的数字 1 */
int findOne(vector<int>& nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 最好 O(1)：1 在第一个
        // 最坏 O(n)：1 在最后一个
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    // 测试 10 次即可观察效果（原版 1000 次太多）
    for (int i = 0; i < 10; i++) {
        int n = 10;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        
        cout << "\n打乱后数组 = ";
        printVector(nums);
        cout << " ｜ 数字 1 的索引 = " << index << endl;
    }

    return 0;
}
