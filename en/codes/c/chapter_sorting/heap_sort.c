/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Sift down from node i in a heap of size n */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // Find the node with the largest value among i, l, and r, and store its index in ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Stop if node i is largest or both child indices l and r are out of bounds
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
    // Build the heap by sifting down from every non-leaf node
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // Extract the largest element from the heap, repeating for n-1 rounds
    for (int i = n - 1; i > 0; --i) {
        // Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Sift down starting at the root
        siftDown(nums, i, 0);
    }
}

/* Driver code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("After heap sort, nums = ");
    printArray(nums, n);

    return 0;
}