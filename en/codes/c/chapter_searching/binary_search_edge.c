/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Binary search for an insertion point (duplicates allowed) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Any match must lie in [m+1, j]
        } else {
            j = m - 1; // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    return i;
}

/* Use binary search to find the leftmost occurrence of target */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // Equivalent to finding the insertion point for target
    int i = binarySearchInsertion(nums, numSize, target);
    // Target not found. Return -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // Found target. Return index i
    return i;
}

/* Use binary search to find the rightmost occurrence of target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // Search for the leftmost occurrence of target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j points to the rightmost occurrence of target, and i to the first larger element
    int j = i - 1;
    // Target not found. Return -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Found target. Return index j
    return j;
}

/* Driver code */
int main() {
    // Array with duplicates
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nArray nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // Find the left and right boundaries using binary search
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Index of the leftmost occurrence of %d = %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Index of the rightmost occurrence of %d = %d\n", targets[i], index);
    }

    return 0;
}
