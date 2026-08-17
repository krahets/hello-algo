/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Binary search for insertion point (with duplicate elements) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Initialize closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // target is in the interval [m+1, j]
        } else {
            j = m - 1; // The first element less than target is in the interval [i, m-1]
        }
    }
    // Return insertion point i
    return i;
}

/* Binary search for the leftmost target */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // Equivalent to finding the insertion point of target
    int i = binarySearchInsertion(nums, numSize, target);
    // Target not found, return -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // Found target, return index i
    return i;
}

/* Binary search for the rightmost target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // Convert to finding the leftmost target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j points to the rightmost target, i points to the first element greater than target
    int j = i - 1;
    // Target not found, return -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Found target, return index j
    return j;
}

/* Driver Code */
int main() {
    // Array with duplicate elements
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nArray nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // Binary search left and right boundaries
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Leftmost element %d index is %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Rightmost element %d index is %d\n", targets[i], index);
    }

    return 0;
}