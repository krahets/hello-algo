/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索で挿入位置を探す（重複要素あり） */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 両閉区間 [0, n-1] を初期化
    while (i <= j) {
        int m = i + (j - i) / 2; // 中点インデックス m を計算
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] にある
        } else {
            j = m - 1; // target より小さい最初の要素は区間 [i, m-1] にある
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 最も左の target を二分探索 */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // target の挿入位置を探すのと等価
    int i = binarySearchInsertion(nums, target);
    // target が見つからなければ、-1 を返す
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // target が見つかったら、インデックス i を返す
    return i;
}

/* 最も右の target を二分探索 */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // 最左の target + 1 を探す問題に変換する
    int i = binarySearchInsertion(nums, target + 1);
    // j は最も右の target を指し、i は target より大きい最初の要素を指す
    int j = i - 1;
    // target が見つからなければ、-1 を返す
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // target が見つかったら、インデックス j を返す
    return j;
}

/* Driver Code */
int main() {
    // 重複要素を含む配列
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n配列 nums = ";
    printVector(nums);

    // 二分探索で左端と右端を探す
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "一番左の要素 " << target << " のインデックスは " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "一番右の要素 " << target << " のインデックスは " << index << endl;
    }

    return 0;
}
