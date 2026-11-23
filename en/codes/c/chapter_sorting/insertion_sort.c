/**
 * File: insertion_sort.c
 * Created Time: 2022-12-29
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* Insertion sort */
void insertionSort(int nums[], int size) {
    // Outer loop: the sorted range is [0, i-1]
    for (int i = 1; i < size; i++) {
        int base = nums[i], j = i - 1;
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while (j >= 0 && nums[j] > base) {
            // Shift nums[j] one position to the right
            nums[j + 1] = nums[j];
            j--;
        }
        // Place base at the correct position
        nums[j + 1] = base;
    }
}

/* Driver code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    insertionSort(nums, 6);
    printf("After insertion sort, nums = ");
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
