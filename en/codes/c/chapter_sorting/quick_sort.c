/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Swap elements */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* Partition with two pointers */
int partition(int nums[], int left, int right) {
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // Scan from right to left for the first element smaller than the pivot
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // Scan from left to right for the first element larger than the pivot
        }
        // Swap these two elements
        swap(nums, i, j);
    }
    // Swap the pivot into place between the two subarrays
    swap(nums, i, left);
    // Return the pivot index
    return i;
}

/* Quicksort */
void quickSort(int nums[], int left, int right) {
    // Stop recursing when the subarray has length 1
    if (left >= right) {
        return;
    }
    // Partition with two pointers
    int pivot = partition(nums, left, right);
    // Recurse on the left and right subarrays
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// Quicksort with median-of-three pivot selection follows

/* Select the median of three candidates */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m lies between l and r
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l lies between m and r
    return right;
}

/* Partition with two pointers (median of three) */
int partitionMedian(int nums[], int left, int right) {
    // Select the median of three candidates
    int med = medianThree(nums, left, (left + right) / 2, right);
    // Swap the median into the leftmost position
    swap(nums, left, med);
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // Scan from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left])
            i++;          // Scan from left to right for the first element larger than the pivot
        swap(nums, i, j); // Swap these two elements
    }
    swap(nums, i, left); // Swap the pivot into place between the two subarrays
    return i;            // Return the pivot index
}

/* Quicksort (median of three) */
void quickSortMedian(int nums[], int left, int right) {
    // Stop recursing when the subarray has length 1
    if (left >= right)
        return;
    // Partition with two pointers
    int pivot = partitionMedian(nums, left, right);
    // Recurse on the left and right subarrays
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// Quicksort with reduced recursion depth follows

/* Quicksort with reduced recursion depth */
void quickSortTailCall(int nums[], int left, int right) {
    // Stop when the subarray has length 1
    while (left < right) {
        // Partition with two pointers
        int pivot = partition(nums, left, right);
        // Apply quicksort to the shorter of the two subarrays
        if (pivot - left < right - pivot) {
            // Recursively sort the left subarray
            quickSortTailCall(nums, left, pivot - 1);
            // The remaining unsorted range is [pivot + 1, right]
            left = pivot + 1;
        } else {
            // Recursively sort the right subarray
            quickSortTailCall(nums, pivot + 1, right);
            // The remaining unsorted range is [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* Driver Code */
int main() {
    /* Quicksort */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("After quicksort, nums = ");
    printArray(nums, size);

    /* Quicksort with median-of-three pivot selection */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("After median-of-three quicksort, nums = ");
    printArray(nums1, size);

    /* Quicksort with reduced recursion depth */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("After quicksort with reduced recursion depth, nums = ");
    printArray(nums1, size);

    return 0;
}
