/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Get the k-th digit of element num, where exp = 10^(k-1) */
int digit(int num, int exp) {
    // Passing exp instead of k can avoid repeated expensive exponentiation here
    return (num / exp) % 10;
}

/* Counting sort (based on nums k-th digit) */
void countingSortDigit(int nums[], int size, int exp) {
    // Decimal digit range is 0~9, therefore need a bucket array of length 10
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // Initialize to 0 to support subsequent memory release
    // Count the occurrence of digits 0~9
    for (int i = 0; i < size; i++) {
        // Get the k-th digit of nums[i], noted as d
        int d = digit(nums[i], exp);
        // Count the occurrence of digit d
        counter[d]++;
    }
    // Calculate prefix sum, converting "occurrence count" into "array index"
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse, based on bucket statistics, place each element into res
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the index j for d in the array
        res[j] = nums[i];       // Place the current element at index j
        counter[d]--;           // Decrease the count of d by 1
    }
    // Use result to overwrite the original array nums
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // Free memory
    free(res);
    free(counter);
}

/* Radix sort */
void radixSort(int nums[], int size) {
    // Get the maximum element of the array, used to determine the maximum number of digits
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // Traverse from the lowest to the highest digit
    for (int exp = 1; max >= exp; exp *= 10)
        // Perform counting sort on the k-th digit of array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // i.e., exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* Driver Code */
int main() {
    // Radix sort
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("After radix sort completes, nums = ");
    printArray(nums, size);
}
