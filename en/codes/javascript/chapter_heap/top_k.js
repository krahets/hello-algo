/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* Push an element onto the heap */
function pushMinHeap(maxHeap, val) {
    // Negate the elements
    maxHeap.push(-val);
}

/* Pop an element from the heap */
function popMinHeap(maxHeap) {
    // Negate the elements
    return -maxHeap.pop();
}

/* Peek at the root */
function peekMinHeap(maxHeap) {
    // Negate the elements
    return -maxHeap.peek();
}

/* Retrieve the elements in the heap */
function getMinHeap(maxHeap) {
    // Negate the elements
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* Find the k largest elements in the array using a heap */
function topKHeap(nums, k) {
    // Initialize a min-heap
    // Negate all values so the max-heap acts as a min-heap
    const maxHeap = new MaxHeap([]);
    // Push the first k array elements onto the heap
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Starting with element k+1, keep the heap size at k
    for (let i = k; i < nums.length; i++) {
        // If the current element exceeds the root, pop the root and push the current element
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Return the elements in the heap
    return getMinHeap(maxHeap);
}

/* Driver code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`The ${k} largest elements are:`, res);
