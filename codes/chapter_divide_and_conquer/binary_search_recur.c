/**
 * File: binary_search_recur.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 二分查找：问题 f(i, j) */
int dfs(vector *nums, int target, int i, int j) {
    // 若区间为空，代表无目标元素，则返回 -1
    if (i > j) {
        return -1;
    }
    // 计算中点索引 m
    int m = (i + j) / 2;
    int *elem = nums->data[m];
    if (*elem < target) {
        // 递归子问题 f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (*elem > target) {
        // 递归子问题 f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // 找到目标元素，返回其索引
        return m;
    }
}

/* 二分查找 */
int binarySearch(vector *nums, int target) {
    int n = nums->size;
    // 求解问题 f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
int main() {
    int target = 6;
    int nums[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    vector *iNums = newVector(); // int
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        vectorPushback(iNums, &nums[i], sizeof(int));
    }

    // 二分查找（双闭区间）
    int index = binarySearch(iNums, target);
    printf("目标元素 6 的索引 = %d\n", index);

    return 0;
}
