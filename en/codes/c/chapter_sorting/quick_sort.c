/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Swap the elements */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* Two-pointer partitioning */
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
    // Swap the pivot into the boundary position between the two subarrays
    swap(nums, i, left);
    // Return the pivot index
    return i;
}

/* Quick sort */
void quickSort(int nums[], int left, int right) {
    // Stop recursing when the subarray has at most one element
    if (left >= right) {
        return;
    }
    // Two-pointer partitioning
    int pivot = partition(nums, left, right);
    // Recurse on the left and right subarrays
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// Quick sort with median-of-three pivot optimization follows

/* Select the median of three candidate elements */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m lies between l and r
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l lies between m and r
    return right;
}

/* Two-pointer partitioning (median of three) */
int partitionMedian(int nums[], int left, int right) {
    // Select the median of three candidate elements
    int med = medianThree(nums, left, (left + right) / 2, right);
    // Swap the median into the leftmost position of the array
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
    swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
    return i;            // Return the pivot index
}

/* Quick sort (median of three) */
void quickSortMedian(int nums[], int left, int right) {
    // Stop recursing when the subarray has at most one element
    if (left >= right)
        return;
    // Two-pointer partitioning
    int pivot = partitionMedian(nums, left, right);
    // Recurse on the left and right subarrays
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// Quick sort with recursion depth optimization follows

/* Quick sort (recursion depth optimization) */
void quickSortTailCall(int nums[], int left, int right) {
    // Stop when the subarray has at most one element
    while (left < right) {
        // Perform two-pointer partitioning
        int pivot = partition(nums, left, right);
        // Apply quick sort to the shorter of the two subarrays
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

/* Driver code */
int main() {
    /* Quick sort */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("After quick sort, nums = ");
    printArray(nums, size);

    /* Quick sort (median pivot optimization) */
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
