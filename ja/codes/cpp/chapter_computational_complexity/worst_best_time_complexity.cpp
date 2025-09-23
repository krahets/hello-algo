/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素 {1, 2, ..., n} をランダムにシャッフルした配列を生成 */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // システム時刻を使用してランダムシードを生成
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // 配列要素をランダムにシャッフル
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* 配列 nums で数値1のインデックスを見つける */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // 要素1が配列の先頭にある場合、最良時間計算量 O(1) を達成
        // 要素1が配列の末尾にある場合、最悪時間計算量 O(n) を達成
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* ドライバーコード */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\n配列 [ 1, 2, ..., n ] をシャッフル後 = ";
        printVector(nums);
        cout << "数値1のインデックスは " << index << endl;
    }
    return 0;
}