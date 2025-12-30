/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Binary search for insertion point (no duplicate elements) */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // target is in the interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target is in the interval [i, m-1]
        } else {
            return m; // Found target, return insertion point m
        }
    }
    // Target not found, return insertion point i
    return i;
}

/* Binary search for insertion point (with duplicate elements) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // target is in the interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target is in the interval [i, m-1]
        } else {
            j = m - 1; // The first element less than target is in the interval [i, m-1]
        }
    }
    // Return insertion point i
    return i;
}

/* Driver Code */
int main() {
    // Array without duplicate elements
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\nArray nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // Binary search for insertion point
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("Insertion point index for element %d is %d\n", targets1[i], index);
    }

    // Array with duplicate elements
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nArray nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // Binary search for insertion point
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("Insertion point index for element %d is %d\n", targets2[i], index);
    }

    return 0;
}
