/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Generate a shuffled array containing { 1, 2, ..., n } */
int *randomNumbers(int n) {
    // Allocate heap memory for a one-dimensional array of n elements of type int
    int *nums = (int *)malloc(n * sizeof(int));
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Shuffle the array elements at random
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* Find the index of 1 in the array nums */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // Best case: 1 is the first element, so the search takes O(1) time
        // Worst case: 1 is the last element, so the search takes O(n) time
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // Initialize the random seed
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nShuffled array [ 1, 2, ..., n ] = ");
        printArray(nums, n);
        printf("Index of 1 = %d\n", index);
        // Free the heap memory
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
