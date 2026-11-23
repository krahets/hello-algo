/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Find an insertion point using binary search (no duplicates) */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            return m; // Target was found; return insertion point m
        }
    }
    // Target was not found; return insertion point i
    return i;
}

/* Find an insertion point using binary search (with duplicates) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            j = m - 1; // Continue in [i, m-1] to find the rightmost element smaller than target
        }
    }
    // Return insertion point i
    return i;
}

/* Driver code */
int main() {
    // Array with no duplicate elements
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\nArray nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // Find an insertion point using binary search
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("Insertion index for element %d: %d\n", targets1[i], index);
    }

    // Array containing duplicate elements
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nArray nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // Find an insertion point using binary search
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("Insertion index for element %d: %d\n", targets2[i], index);
    }

    return 0;
}
