/**
 * File: binary_search.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Binary search (closed interval on both sides) */
int binarySearch(int *nums, int len, int target) {
    // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
    int i = 0, j = len - 1;
    // Loop, exit when the search interval is empty (empty when i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target)    // This means target is in the interval [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // This means target is in the interval [i, m-1]
            j = m - 1;
        else // Found the target element, return its index
            return m;
    }
    // Target element not found, return -1
    return -1;
}

/* Binary search (left-closed right-open interval) */
int binarySearchLCRO(int *nums, int len, int target) {
    // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
    int i = 0, j = len;
    // Loop, exit when the search interval is empty (empty when i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target)    // This means target is in the interval [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // This means target is in the interval [i, m)
            j = m;
        else // Found the target element, return its index
            return m;
    }
    // Target element not found, return -1
    return -1;
}

/* Driver Code */
int main() {
    int target = 6;
    int nums[10] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Binary search (closed interval on both sides) */
    int index = binarySearch(nums, 10, target);
    printf("Index of target element 6 = %d\n", index);

    /* Binary search (left-closed right-open interval) */
    index = binarySearchLCRO(nums, 10, target);
    printf("Index of target element 6 = %d\n", index);

    return 0;
}
