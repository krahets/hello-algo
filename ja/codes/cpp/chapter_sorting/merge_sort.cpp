/**
 * File: merge_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 左サブ配列と右サブ配列をマージ */
void merge(vector<int> &nums, int left, int mid, int right) {
    // 左サブ配列の区間は[left, mid]、右サブ配列の区間は[mid+1, right]
    // マージ結果を保存する一時配列tmpを作成
    vector<int> tmp(right - left + 1);
    // 左右サブ配列の開始インデックスを初期化
    int i = left, j = mid + 1, k = 0;
    // 両サブ配列に要素がある間、小さい方の要素を一時配列にコピー
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++];
        else
            tmp[k++] = nums[j++];
    }
    // 左右サブ配列の残りの要素を一時配列にコピー
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 一時配列tmpの要素を元の配列numsの対応する区間にコピー
    for (k = 0; k < tmp.size(); k++) {
        nums[left + k] = tmp[k];
    }
}

/* マージソート */
void mergeSort(vector<int> &nums, int left, int right) {
    // 終了条件
    if (left >= right)
        return; // サブ配列の長さが1の時、再帰を終了
    // 分割段階
    int mid = left + (right - left) / 2;    // 中点を計算
    mergeSort(nums, left, mid);      // 左サブ配列を再帰的に処理
    mergeSort(nums, mid + 1, right); // 右サブ配列を再帰的に処理
    // マージ段階
    merge(nums, left, mid, right);
}

/* ドライバコード */
int main() {
    /* マージソート */
    vector<int> nums = {7, 3, 2, 6, 0, 1, 5, 4};
    mergeSort(nums, 0, nums.size() - 1);
    cout << "マージソート後、nums = ";
    printVector(nums);

    return 0;
}