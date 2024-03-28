/**
 * File: merge_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 合併左子陣列和右子陣列 */
void merge(vector<int> &nums, int left, int mid, int right) {
    // 左子陣列區間為 [left, mid], 右子陣列區間為 [mid+1, right]
    // 建立一個臨時陣列 tmp ，用於存放合併後的結果
    vector<int> tmp(right - left + 1);
    // 初始化左子陣列和右子陣列的起始索引
    int i = left, j = mid + 1, k = 0;
    // 當左右子陣列都還有元素時，進行比較並將較小的元素複製到臨時陣列中
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++];
        else
            tmp[k++] = nums[j++];
    }
    // 將左子陣列和右子陣列的剩餘元素複製到臨時陣列中
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 將臨時陣列 tmp 中的元素複製回原陣列 nums 的對應區間
    for (k = 0; k < tmp.size(); k++) {
        nums[left + k] = tmp[k];
    }
}

/* 合併排序 */
void mergeSort(vector<int> &nums, int left, int right) {
    // 終止條件
    if (left >= right)
        return; // 當子陣列長度為 1 時終止遞迴
    // 劃分階段
    int mid = (left + right) / 2;    // 計算中點
    mergeSort(nums, left, mid);      // 遞迴左子陣列
    mergeSort(nums, mid + 1, right); // 遞迴右子陣列
    // 合併階段
    merge(nums, left, mid, right);
}

/* Driver Code */
int main() {
    /* 合併排序 */
    vector<int> nums = {7, 3, 2, 6, 0, 1, 5, 4};
    mergeSort(nums, 0, nums.size() - 1);
    cout << "合併排序完成後 nums = ";
    printVector(nums);

    return 0;
}
