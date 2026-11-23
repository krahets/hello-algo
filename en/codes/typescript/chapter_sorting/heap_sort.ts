/**
 * File: heap_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Sift down from node i in a heap of size n */
function siftDown(nums: number[], n: number, i: number): void {
    while (true) {
        // Find the node with the largest value among i, l, and r, and store its index in ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // Stop if node i is largest or both child indices l and r are out of bounds
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
    // Build the heap by sifting down from every non-leaf node
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // Extract the largest element from the heap, repeating for n-1 rounds
    for (let i = nums.length - 1; i > 0; i--) {
        // Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // Sift down starting at the root
        siftDown(nums, i, 0);
    }
}

/* Driver code */
const nums: number[] = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('After heap sort, nums =', nums);

export {};
