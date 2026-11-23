/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Find an insertion point using binary search (with duplicates) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else {
            j = m - 1; // Continue in [i, m-1] to find the rightmost element smaller than target
        }
    }
    // Return insertion point i
    return i;
}

/* Find the leftmost occurrence of target using binary search */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // This is equivalent to finding the insertion point of target
    int i = binarySearchInsertion(nums, numSize, target);
    // If target was not found, return -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // Target was found; return index i
    return i;
}

/* Find the rightmost occurrence of target using binary search */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // Reduce the problem to finding the leftmost insertion point of target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j points to the rightmost target, while i points to the first element greater than target
    int j = i - 1;
    // If target was not found, return -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Target was found; return index j
    return j;
}

/* Driver code */
int main() {
    // Array containing duplicate elements
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nArray nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // Find the left and right boundaries using binary search
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Index of the leftmost occurrence of %d: %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Index of the rightmost occurrence of %d: %d\n", targets[i], index);
    }

    return 0;
}
