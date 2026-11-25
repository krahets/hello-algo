/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 用二分搜尋找插入點（有重複元素） */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 將閉區間設為 [0, n-1]
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
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // 等同於搜尋 target 的插入點
    int i = binarySearchInsertion(nums, numSize, target);
    // 找不到 target，回傳 -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // 找到 target，回傳索引 i
    return i;
}

/* 用二分搜尋找最右邊的 target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // 改為搜尋 target + 1 的最左插入位置
    int i = binarySearchInsertion(nums, numSize, target + 1);
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
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n陣列 nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // 用二分搜尋找左界和右界
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最左邊的元素 %d 的索引為 %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最右邊的元素 %d 的索引為 %d\n", targets[i], index);
    }

    return 0;
}
