/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Get digit k of num, where exp = 10^(k-1) */
int digit(int num, int exp) {
    // Passing exp instead of k avoids repeating the costly exponentiation here
    return (num / exp) % 10;
}

/* Counting sort by digit k of each element in nums */
void countingSortDigit(int nums[], int size, int exp) {
    // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // Initialize to 0 so the memory can be freed later
    // Count the occurrences of digits 0 through 9
    for (int i = 0; i < size; i++) {
        // Let d be digit k of nums[i]
        int d = digit(nums[i], exp);
        // Count this occurrence of digit d
        counter[d]++;
    }
    // Compute prefix sums to convert counts into array positions
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Traverse backward and use the bucket counts to place each element in res
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the array index j for d
        res[j] = nums[i];       // Place the current element at index j
        counter[d]--;           // Decrement the count for d by 1
    }
    // Copy the result back into nums
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // Free memory
    free(res);
    free(counter);
}

/* Radix sort */
void radixSort(int nums[], int size) {
    // Find the largest element to determine the maximum number of digits
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // Work from the least significant digit to the most significant
    for (int exp = 1; max >= exp; exp *= 10)
        // Apply counting sort to the array elements by digit k
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // Here exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* Driver Code */
int main() {
    // Radix sort
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("After radix sort, nums = ");
    printArray(nums, size);
}
