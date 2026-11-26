/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Reanon (793584285@qq.com), Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Counting sort */
// Simple implementation that cannot sort objects
void countingSortNaive(int nums[], int size) {
    // 1. Find the largest array element m
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Traverse counter and write each value back into nums
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
// Full implementation that can sort objects and is stable
void countingSort(int nums[], int size) {
    // 1. Find the largest array element m
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Compute prefix sums in counter to locate the last position for each value
    // That is, counter[num]-1 is the last index of num in res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums backward and place each element in the result array res
    // Initialize the result array res
    int *res = malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Place num at its corresponding index
        counter[num]--;              // Decrement the prefix sum by 1 to find the next index for num
    }
    // Copy res back into the original array nums
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
    printf("After counting sort (values only), nums = ");
    printArray(nums, size);

    int nums1[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size1 = sizeof(nums1) / sizeof(int);
    countingSort(nums1, size1);
    printf("After counting sort, nums1 = ");
    printArray(nums1, size1);

    return 0;
}
