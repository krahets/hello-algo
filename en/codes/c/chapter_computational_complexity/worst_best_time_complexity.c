/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Generate an array with elements { 1, 2, ..., n }, order shuffled */
int *randomNumbers(int n) {
    // Allocate heap memory (create 1D variable-length array: n elements of type int)
    int *nums = (int *)malloc(n * sizeof(int));
    // Generate array nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Randomly shuffle array elements
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* Find the index of number 1 in array nums */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // When element 1 is at the head of the array, best time complexity O(1) is achieved
        // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // Initialize random seed
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nArray [ 1, 2, ..., n ] after shuffling = ");
        printArray(nums, n);
        printf("Index of number 1 is %d\n", index);
        // Free heap memory
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
