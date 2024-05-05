/**
 * File: heap_sort.js
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Heap length is n, start heapifying node i, from top to bottom */
function siftDown(nums, n, i) {
    while (true) {
        // Determine the largest node among i, l, r, noted as ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
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
function heapSort(nums) {
    // Build heap operation: heapify all nodes except leaves
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for (let i = nums.length - 1; i > 0; i--) {
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // Start heapifying the root node, from top to bottom
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('Heap sort completed nums =', nums);
