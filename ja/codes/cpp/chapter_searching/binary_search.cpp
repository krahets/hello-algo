/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索（閉区間） */
int binarySearch(vector<int> &nums, int target) {
    // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
    int i = 0, j = nums.size() - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空）
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を求める
        if (nums[m] < target)    // この場合、target の探索範囲は [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // この場合、target の探索範囲は [i, m-1]
            j = m - 1;
        else // 目標の要素が見つかったので、そのインデックスを返す
            return m;
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
int binarySearchLCRO(vector<int> &nums, int target) {
    // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
    int i = 0, j = nums.size();
    // 探索区間が空になるまで繰り返す（i = j のとき空）
    while (i < j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を求める
        if (nums[m] < target)    // この場合、target の探索範囲は [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // この場合、target の探索範囲は [i, m)
            j = m;
        else // 目標の要素が見つかったので、そのインデックスを返す
            return m;
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1;
}

/* 実行例 */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* 二分探索（閉区間） */
    int index = binarySearch(nums, target);
    cout << "目標値 6 のインデックス = " << index << endl;

    /* 二分探索（左閉右開区間） */
    index = binarySearchLCRO(nums, target);
    cout << "目標値 6 のインデックス = " << index << endl;

    return 0;
}
