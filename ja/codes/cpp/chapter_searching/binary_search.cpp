/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索（両閉区間） */
int binarySearch(vector<int> &nums, int target) {
    // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
    int i = 0, j = nums.size() - 1;
    // ループし、探索区間が空になったら終了する（i > j で空）
    while (i <= j) {
        int m = i + (j - i) / 2; // 中点インデックス m を計算
        if (nums[m] < target)    // この場合、target は区間 [m+1, j] にある
            i = m + 1;
        else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
            j = m - 1;
        else // 目標要素が見つかったらそのインデックスを返す
            return m;
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
int binarySearchLCRO(vector<int> &nums, int target) {
    // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
    int i = 0, j = nums.size();
    // ループし、探索区間が空になったら終了する（i = j で空）
    while (i < j) {
        int m = i + (j - i) / 2; // 中点インデックス m を計算
        if (nums[m] < target)    // この場合、target は区間 [m+1, j) にある
            i = m + 1;
        else if (nums[m] > target) // この場合、target は区間 [i, m) にある
            j = m;
        else // 目標要素が見つかったらそのインデックスを返す
            return m;
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* Driver Code */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* 二分探索（両閉区間） */
    int index = binarySearch(nums, target);
    cout << "対象要素 6 のインデックス = " << index << endl;

    /* 二分探索（左閉右開区間） */
    index = binarySearchLCRO(nums, target);
    cout << "対象要素 6 のインデックス = " << index << endl;

    return 0;
}
