/**
 * File: binary_search_recur.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Binary search: problem f(i, j) */
int dfs(int nums[], int target, int i, int j) {
    // An empty interval contains no target, so return -1
    if (i > j) {
        return -1;
    }
    // Compute the middle index m
    int m = (i + j) / 2;
    if (nums[m] < target) {
        // Recursively solve f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Recursively solve f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Target found: return its index
        return m;
    }
}

/* Binary search */
int binarySearch(int nums[], int target, int numsSize) {
    int n = numsSize;
    // Solve f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver code */
int main() {
    int target = 6;
    int nums[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    int numsSize = sizeof(nums) / sizeof(nums[0]);

    // Binary search (closed interval)
    int index = binarySearch(nums, target, numsSize);
    printf("Index of target 6 = %d\n", index);

    return 0;
}
