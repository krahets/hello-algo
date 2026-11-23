/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Generate an array containing { 1, 2, ..., n } in shuffled order */
int *randomNumbers(int n) {
    // Allocate heap memory for a one-dimensional array of n int elements
    int *nums = (int *)malloc(n * sizeof(int));
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Randomly shuffle the array elements
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* Find the index of the number 1 in array nums */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // When 1 is at the start of the array, the best-case time complexity is O(1)
        // When 1 is at the end of the array, the worst-case time complexity is O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver code */
int main(int argc, char *argv[]) {
    // Initialize the random seed
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nArray [ 1, 2, ..., n ] after shuffling = ");
        printArray(nums, n);
        printf("Index of the number 1: %d\n", index);
        // Free the heap memory
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
