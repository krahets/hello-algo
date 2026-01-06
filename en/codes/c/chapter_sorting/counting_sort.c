/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Reanon (793584285@qq.com), Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
void countingSortNaive(int nums[], int size) {
    // 1. Count the maximum element m in the array
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Traverse counter, filling each element back into the original array nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
    // 4. Free memory
    free(counter);
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
void countingSort(int nums[], int size) {
    // 1. Count the maximum element m in the array
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    int *counter = calloc(m, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
    // counter[num]-1 is the last index where num appears in res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums in reverse order, placing each element into the result array res
    // Initialize the array res to record results
    int *res = malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Place num at the corresponding index
        counter[num]--;              // Decrement the prefix sum by 1, getting the next index to place num
    }
    // Use result array res to overwrite the original array nums
    memcpy(nums, res, size * sizeof(int));
    // 5. Free memory
    free(res);
    free(counter);
}

/* Driver Code */
int main() {
    int nums[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size = sizeof(nums) / sizeof(int);
    countingSortNaive(nums, size);
    printf("After counting sort (cannot sort objects) completes, nums = ");
    printArray(nums, size);

    int nums1[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size1 = sizeof(nums1) / sizeof(int);
    countingSort(nums1, size1);
    printf("After counting sort completes, nums1 = ");
    printArray(nums1, size1);

    return 0;
}
