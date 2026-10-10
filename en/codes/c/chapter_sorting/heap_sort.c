/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Heap length is n, start heapifying node i, from top to bottom */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Swap two nodes
        if (ma == i) {
            break;
        }
        // Swap two nodes
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // Loop downwards heapification
        i = ma;
    }
}

/* Heap sort */
void heapSort(int nums[], int n) {
    // Build heap operation: heapify all nodes except leaves
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for (int i = n - 1; i > 0; --i) {
        // Delete node
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Start heapifying the root node, from top to bottom
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("After heap sort completes, nums = ");
    printArray(nums, n);

    return 0;
}