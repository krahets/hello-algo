/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 二分查找插入点（存在重复元素） */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 计算中点索引 m
        if (nums[m] < target) {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else {
            j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
    }
    // 返回插入点 i
    return i;
}

/* 二分查找最左一个 target */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // 等价于查找 target 的插入点
    int i = binarySearchInsertion(nums, numSize, target);
    // 未找到 target ，返回 -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // 找到 target ，返回索引 i
    return i;
}

/* 二分查找最右一个 target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // 转化为查找最左一个 target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
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
    // 包含重复元素的数组
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n数组 nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // 二分查找左边界和右边界
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最左一个元素 %d 的索引为 %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("最右一个元素 %d 的索引为 %d\n", targets[i], index);
    }

    return 0;
}