/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Sift down from node i in a heap of size n */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // Let ma be the index of the largest of nodes i, l, and r
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Stop if i is the largest or both child indices l and r are out of bounds
        if (ma == i) {
            break;
        }
        // Swap the two nodes
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // Continue sifting down
        i = ma;
    }
}

/* Heap sort */
void heapSort(int nums[], int n) {
    // Build the heap by sifting down from each non-leaf node
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // Extract the maximum from the heap in each of n-1 rounds
    for (int i = n - 1; i > 0; --i) {
        // Swap the root and rightmost leaf (the first and last elements)
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Sift down from the root
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("After heap sort, nums = ");
    printArray(nums, n);

    return 0;
}