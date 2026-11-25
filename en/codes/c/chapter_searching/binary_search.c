/**
 * File: binary_search.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Binary search on a closed interval */
int binarySearch(int *nums, int len, int target) {
    // Initialize the closed interval [0, n-1] with i at the first element and j at the last
    int i = 0, j = len - 1;
    // Stop when the search interval is empty (i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target)    // Any match must lie in [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // Any match must lie in [i, m-1]
            j = m - 1;
        else // Found the target. Return its index
            return m;
    }
    // Target not found. Return -1
    return -1;
}

/* Binary search on a left-closed, right-open interval */
int binarySearchLCRO(int *nums, int len, int target) {
    // Initialize [0, n) with i at the first element and j one past the last
    int i = 0, j = len;
    // Stop when the search interval is empty (i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target)    // Any match must lie in [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // Any match must lie in [i, m)
            j = m;
        else // Found the target. Return its index
            return m;
    }
    // Target not found. Return -1
    return -1;
}

/* Driver code */
int main() {
    int target = 6;
    int nums[10] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Binary search on a closed interval */
    int index = binarySearch(nums, 10, target);
    printf("Index of target 6 = %d\n", index);

    /* Binary search on a left-closed, right-open interval */
    index = binarySearchLCRO(nums, 10, target);
    printf("Index of target 6 = %d\n", index);

    return 0;
}
