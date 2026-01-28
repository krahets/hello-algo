/**
 * File: bubble_sort.c
 * Created Time: 2022-12-26
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* Bubble sort */
void bubbleSort(int nums[], int size) {
    // Outer loop: unsorted range is [0, i]
    for (int i = size - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
            }
        }
    }
}

/* Bubble sort (flag optimization) */
void bubbleSortWithFlag(int nums[], int size) {
    // Outer loop: unsorted range is [0, i]
    for (int i = size - 1; i > 0; i--) {
        bool flag = false;
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
                flag = true;
            }
        }
        if (!flag)
            break;
    }
}

/* Driver Code */
int main() {
    int nums[6] = {4, 1, 3, 1, 5, 2};
    printf("After bubble sort: ");
    bubbleSort(nums, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }

    int nums1[6] = {4, 1, 3, 1, 5, 2};
    printf("\nAfter optimized bubble sort: ");
    bubbleSortWithFlag(nums1, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums1[i]);
    }
    printf("\n");

    return 0;
}
