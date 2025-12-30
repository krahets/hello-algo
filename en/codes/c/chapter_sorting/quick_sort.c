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

/* Sentinel partition */
int partition(int nums[], int left, int right) {
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // Search from right to left for the first element smaller than the pivot
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // Search from left to right for the first element greater than the pivot
        }
        // Swap these two elements
        swap(nums, i, j);
    }
    // Swap the pivot to the boundary between the two subarrays
    swap(nums, i, left);
    // Return the index of the pivot
    return i;
}

/* Quick sort */
void quickSort(int nums[], int left, int right) {
    // Terminate recursion when subarray length is 1
    if (left >= right) {
        return;
    }
    // Sentinel partition
    int pivot = partition(nums, left, right);
    // Recursively process the left subarray and right subarray
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// Quick sort with median-of-three optimization below

/* Select the median of three candidate elements */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m is between l and r
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l is between m and r
    return right;
}

/* Sentinel partition (median of three) */
int partitionMedian(int nums[], int left, int right) {
    // Select the median of three candidate elements
    int med = medianThree(nums, left, (left + right) / 2, right);
    // Swap the median to the array's leftmost position
    swap(nums, left, med);
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // Search from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left])
            i++;          // Search from left to right for the first element greater than the pivot
        swap(nums, i, j); // Swap these two elements
    }
    swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
    return i;            // Return the index of the pivot
}

/* Quick sort (median-of-three) */
void quickSortMedian(int nums[], int left, int right) {
    // Terminate recursion when subarray length is 1
    if (left >= right)
        return;
    // Sentinel partition
    int pivot = partitionMedian(nums, left, right);
    // Recursively process the left subarray and right subarray
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// Quick sort with recursion depth optimization below

/* Quick sort (recursion depth optimization) */
void quickSortTailCall(int nums[], int left, int right) {
    // Terminate when subarray length is 1
    while (left < right) {
        // Sentinel partition operation
        int pivot = partition(nums, left, right);
        // Perform quick sort on the shorter of the two subarrays
        if (pivot - left < right - pivot) {
            // Recursively sort the left subarray
            quickSortTailCall(nums, left, pivot - 1);
            // Remaining unsorted interval is [pivot + 1, right]
            left = pivot + 1;
        } else {
            // Recursively sort the right subarray
            quickSortTailCall(nums, pivot + 1, right);
            // Remaining unsorted interval is [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* Driver Code */
int main() {
    /* Quick sort */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("After quick sort completes, nums = ");
    printArray(nums, size);

    /* Quick sort (recursion depth optimization) */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("After quick sort (median pivot optimization), nums = ");
    printArray(nums1, size);

    /* Quick sort (recursion depth optimization) */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("After quick sort (recursion depth optimization), nums = ");
    printArray(nums1, size);

    return 0;
}
