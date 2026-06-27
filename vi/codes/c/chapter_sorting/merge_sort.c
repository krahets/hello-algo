/**
 * File: merge_sort.c
 * Created Time: 2022-03-21
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Merge left subarray and right subarray */
void merge(int *nums, int left, int mid, int right) {
    // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
    // Create a temporary array tmp to store the merged results
    int tmpSize = right - left + 1;
    int *tmp = (int *)malloc(tmpSize * sizeof(int));
    // Initialize the start indices of the left and right subarrays
    int i = left, j = mid + 1, k = 0;
    // While both subarrays still have elements, compare and copy the smaller element into the temporary array
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // Copy the remaining elements of the left and right subarrays into the temporary array
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
    for (k = 0; k < tmpSize; ++k) {
        nums[left + k] = tmp[k];
    }
    // Free memory
    free(tmp);
}

/* Merge sort */
void mergeSort(int *nums, int left, int right) {
    // Termination condition
    if (left >= right)
        return; // Terminate recursion when subarray length is 1
    // Divide and conquer stage
    int mid = left + (right - left) / 2;    // Calculate midpoint
    mergeSort(nums, left, mid);      // Recursively process the left subarray
    mergeSort(nums, mid + 1, right); // Recursively process the right subarray
    // Merge stage
    merge(nums, left, mid, right);
}

/* Driver Code */
int main() {
    /* Merge sort */
    int nums[] = {7, 3, 2, 6, 0, 1, 5, 4};
    int size = sizeof(nums) / sizeof(int);
    mergeSort(nums, 0, size - 1);
    printf("After merge sort completes, nums = ");
    printArray(nums, size);

    return 0;
}
