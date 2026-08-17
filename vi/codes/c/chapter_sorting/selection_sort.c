/**
 * File: selection_sort.c
 * Created Time: 2023-05-31
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Selection sort */
void selectionSort(int nums[], int n) {
    // Outer loop: unsorted interval is [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // Inner loop: find the smallest element within the unsorted interval
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // Record the index of the smallest element
        }
        // Swap the smallest element with the first element of the unsorted interval
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    selectionSort(nums, n);

    printf("After selection sort completes, nums = ");
    printArray(nums, n);

    return 0;
}
