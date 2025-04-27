/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 二分搜尋插入點（存在重複元素） */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 初始化雙閉區間 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1; // target 在區間 [m+1, j] 中
        } else {
            j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
        }
    }
    // 返回插入點 i
    return i;
}

/* 二分搜尋最左一個 target */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // 等價於查詢 target 的插入點
    int i = binarySearchInsertion(nums, numSize, target);
    // 未找到 target ，返回 -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // 找到 target ，返回索引 i
    return i;
}

/* 二分搜尋最右一個 target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // 轉化為查詢最左一個 target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j 指向最右一個 target ，i 指向首個大於 target 的元素
    int j = i - 1;
    // 未找到 target ，返回 -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // 找到 target ，返回索引 j
    return j;
}

/* Driver Code */
int main() {
    // 包含重複元素的陣列
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n陣列 nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // 二分搜尋左邊界和右邊界
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最左一個元素 %d 的索引為 %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最右一個元素 %d 的索引為 %d\n", targets[i], index);
    }

    return 0;
}