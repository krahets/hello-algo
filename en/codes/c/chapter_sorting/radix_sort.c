/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Get the k-th digit of num, where exp = 10^(k-1) */
int digit(int num, int exp) {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return (num / exp) % 10;
}

/* Counting sort (sort nums by the k-th digit) */
void countingSortDigit(int nums[], int size, int exp) {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // Initialize the counts to 0
    // Count the occurrences of each digit from 0 to 9
    for (int i = 0; i < size; i++) {
        // Get the k-th digit of nums[i] and store it in d
        int d = digit(nums[i], exp);
        // Count the occurrences of digit d
        counter[d]++;
    }
    // Compute prefix sums to convert occurrence counts into array positions
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the destination index j for digit d in the array
        res[j] = nums[i];       // Place the current element at index j
        counter[d]--;           // Decrease the count for d by 1
    }
    // Overwrite the original array nums with the result
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // Free memory
    free(res);
    free(counter);
}

/* Radix sort */
void radixSort(int nums[], int size) {
    // Get the largest array element to determine the maximum number of digits
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // Process digits from least significant to most significant
    for (int exp = 1; max >= exp; exp *= 10)
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* Driver code */
int main() {
    // Radix sort
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("After radix sort, nums = ");
    printArray(nums, size);
}
