/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索（両端閉区間） */
int binarySearch(vector<int> &nums, int target) {
    // 両端閉区間[0, n-1]を初期化、すなわちi、jはそれぞれ配列の最初の要素と最後の要素を指す
    int i = 0, j = nums.size() - 1;
    // 探索区間が空になるまでループ（i > jの時空になる）
    while (i <= j) {
        int m = i + (j - i) / 2; // 中点インデックスmを計算
        if (nums[m] < target)    // この状況はtargetが区間[m+1, j]にあることを示す
            i = m + 1;
        else if (nums[m] > target) // この状況はtargetが区間[i, m-1]にあることを示す
            j = m - 1;
        else // ターゲット要素が見つかったため、そのインデックスを返す
            return m;
    }
    // ターゲット要素が見つからなかったため、-1を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
int binarySearchLCRO(vector<int> &nums, int target) {
    // 左閉右開区間[0, n)を初期化、すなわちi、jはそれぞれ配列の最初の要素と最後の要素+1を指す
    int i = 0, j = nums.size();
    // 探索区間が空になるまでループ（i = jの時空になる）
    while (i < j) {
        int m = i + (j - i) / 2; // 中点インデックスmを計算
        if (nums[m] < target)    // この状況はtargetが区間[m+1, j)にあることを示す
            i = m + 1;
        else if (nums[m] > target) // この状況はtargetが区間[i, m)にあることを示す
            j = m;
        else // ターゲット要素が見つかったため、そのインデックスを返す
            return m;
    }
    // ターゲット要素が見つからなかったため、-1を返す
    return -1;
}

/* ドライバコード */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* 二分探索（両端閉区間） */
    int index = binarySearch(nums, target);
    cout << "ターゲット要素6のインデックス =" << index << endl;

    /* 二分探索（左閉右開区間） */
    index = binarySearchLCRO(nums, target);
    cout << "ターゲット要素6のインデックス =" << index << endl;

    return 0;
}