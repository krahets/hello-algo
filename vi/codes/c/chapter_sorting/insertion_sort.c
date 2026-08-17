/**
 * File: insertion_sort.c
 * Created Time: 2022-12-29
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* Insertion sort */
void insertionSort(int nums[], int size) {
    // Outer loop: sorted interval is [0, i-1]
    for (int i = 1; i < size; i++) {
        int base = nums[i], j = i - 1;
        // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
        while (j >= 0 && nums[j] > base) {
            // Move nums[j] to the right by one position
            nums[j + 1] = nums[j];
            j--;
        }
        // Assign base to the correct position
        nums[j + 1] = base;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    insertionSort(nums, 6);
    printf("After insertion sort completes, nums = ");
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
