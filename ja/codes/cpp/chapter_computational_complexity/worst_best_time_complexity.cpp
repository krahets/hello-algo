/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // システム時刻を使って乱数シードを生成する
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 配列要素をランダムにシャッフル
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 配列 nums 内で数値 1 のインデックスを探す */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
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
        cout << "\n配列 [ 1, 2, ..., n ] をシャッフルした後 = ";
        printVector(nums);
        cout << "数字 1 のインデックスは " << index << endl;
    }
    return 0;
}
