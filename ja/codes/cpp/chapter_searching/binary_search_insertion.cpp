/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 挿入ポイントの二分探索（重複要素なし） */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 両端閉区間[0, n-1]を初期化
    while (i <= j) {
        int m = i + (j - i) / 2; // 中点インデックスmを計算
        if (nums[m] < target) {
            i = m + 1; // ターゲットは区間[m+1, j]にある
        } else if (nums[m] > target) {
            j = m - 1; // ターゲットは区間[i, m-1]にある
        } else {
            return m; // ターゲットが見つかったため、挿入ポイントmを返す
        }
    }
    // ターゲットが見つからなかったため、挿入ポイントiを返す
    return i;
}

/* 挿入ポイントの二分探索（重複要素あり） */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 両端閉区間[0, n-1]を初期化
    while (i <= j) {
        int m = i + (j - i) / 2; // 中点インデックスmを計算
        if (nums[m] < target) {
            i = m + 1; // ターゲットは区間[m+1, j]にある
        } else if (nums[m] > target) {
            j = m - 1; // ターゲットは区間[i, m-1]にある
        } else {
            j = m - 1; // ターゲット未満の最初の要素は区間[i, m-1]にある
        }
    }
    // 挿入ポイントiを返す
    return i;
}

/* ドライバコード */
int main() {
    // 重複要素のない配列
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\n配列 nums = ";
    printVector(nums);
    // 挿入ポイントの二分探索
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "要素 " << target << " の挿入ポイントインデックスは " << index << " です" << endl;
    }

    // 重複要素を含む配列
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n配列 nums = ";
    printVector(nums);
    // 挿入ポイントの二分探索
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "要素 " << target << " の挿入ポイントインデックスは " << index << " です" << endl;
    }

    return 0;
}