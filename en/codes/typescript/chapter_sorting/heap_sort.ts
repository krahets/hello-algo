/**
 * File: heap_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Heap length is n, start heapifying node i, from top to bottom */
function siftDown(nums: number[], n: number, i: number): void {
    while (true) {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // Swap two nodes
        if (ma === i) {
            break;
        }
        // Swap two nodes
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // Loop downwards heapification
        i = ma;
    }
}

/* Heap sort */
function heapSort(nums: number[]): void {
    // Build heap operation: heapify all nodes except leaves
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for (let i = nums.length - 1; i > 0; i--) {
        // Delete node
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // Start heapifying the root node, from top to bottom
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
const nums: number[] = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('After heap sort, nums =', nums);

export {};
