/**
 * File: heap_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Sift down from node i in a heap of size n */
function siftDown(nums: number[], n: number, i: number): void {
    while (true) {
        // Let ma be the index of the largest of nodes i, l, and r
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // Stop if i is the largest or both child indices l and r are out of bounds
        if (ma === i) {
            break;
        }
        // Swap the two nodes
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // Continue sifting down
        i = ma;
    }
}

/* Heap sort */
function heapSort(nums: number[]): void {
    // Build the heap by sifting down from each non-leaf node
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // Extract the maximum from the heap in each of n-1 rounds
    for (let i = nums.length - 1; i > 0; i--) {
        // Swap the root and rightmost leaf (the first and last elements)
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // Sift down from the root
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
const nums: number[] = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('After heap sort, nums =', nums);

export {};
