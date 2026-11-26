/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 用二分搜尋找插入點（有重複元素） */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else {
            j = m - 1; // 最右邊小於 target 的元素位於區間 [i, m-1] 內
        }
    }
    // 回傳插入點 i
    return i;
}

/* 用二分搜尋找最左邊的 target */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // 等同於搜尋 target 的插入點
    int i = binarySearchInsertion(nums, target);
    // 找不到 target，回傳 -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // 找到 target，回傳索引 i
    return i;
}

/* 用二分搜尋找最右邊的 target */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // 改為搜尋 target + 1 的最左插入位置
    int i = binarySearchInsertion(nums, target + 1);
    // j 指向最右邊的 target，i 指向第一個大於 target 的元素
    int j = i - 1;
    // 找不到 target，回傳 -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // 找到 target，回傳索引 j
    return j;
}

/* 主程式 */
int main() {
    // 含有重複元素的陣列
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n陣列 nums = ";
    printVector(nums);

    // 用二分搜尋找左界和右界
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "最左邊的元素 " << target << " 的索引為 " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "最右邊的元素 " << target << " 的索引為 " << index << endl;
    }

    return 0;
}
