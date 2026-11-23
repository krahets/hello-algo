/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索による挿入位置の探索（重複要素がない場合） */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            return m; // target が見つかったので、挿入位置 m を返す
        }
    }
    // target が見つからなかったので、挿入位置 i を返す
    return i;
}

/* 二分探索による挿入位置の探索（重複要素がある場合） */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 実行用コード */
int main() {
    // 重複要素のない配列
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\n配列 nums = ";
    printVector(nums);
    // 二分探索による挿入位置の探索
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "要素 " << target << " の挿入位置のインデックスは " << index << endl;
    }

    // 重複要素を含む配列
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n配列 nums = ";
    printVector(nums);
    // 二分探索による挿入位置の探索
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "要素 " << target << " の挿入位置のインデックスは " << index << endl;
    }

    return 0;
}
