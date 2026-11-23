/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索による挿入位置の探索（重複要素がある場合） */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else {
            j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 二分探索で最も左にある target を探す */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // target の挿入位置を探すことに等しい
    int i = binarySearchInsertion(nums, target);
    // target が見つからなかったので、-1 を返す
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // target が見つかったので、インデックス i を返す
    return i;
}

/* 二分探索で最も右にある target を探す */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // 最も左にある target + 1 を探す問題に変換する
    int i = binarySearchInsertion(nums, target + 1);
    // j は最も右にある target を指し、i は target より大きい最初の要素を指す
    int j = i - 1;
    // target が見つからなかったので、-1 を返す
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // target が見つかったので、インデックス j を返す
    return j;
}

/* 実行用コード */
int main() {
    // 重複要素を含む配列
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n配列 nums = ";
    printVector(nums);

    // 二分探索で左境界と右境界を求める
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "最も左にある要素 " << target << " のインデックスは " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "最も右にある要素 " << target << " のインデックスは " << index << endl;
    }

    return 0;
}
