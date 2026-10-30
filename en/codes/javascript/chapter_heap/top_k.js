/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* Push an element onto the heap */
function pushMinHeap(maxHeap, val) {
    // Negate the value
    maxHeap.push(-val);
}

/* Pop an element from the heap */
function popMinHeap(maxHeap) {
    // Negate the value
    return -maxHeap.pop();
}

/* Access the top element of the heap */
function peekMinHeap(maxHeap) {
    // Negate the value
    return -maxHeap.peek();
}

/* Get the elements in the heap */
function getMinHeap(maxHeap) {
    // Negate the value
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* Use a heap to find the k largest elements in an array */
function topKHeap(nums, k) {
    // Initialize a min heap
    // Note: negate all values in the heap to simulate a min heap with a max heap
    const maxHeap = new MaxHeap([]);
    // Push the first k array elements onto the heap
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Starting with element k+1, keep the heap size at k
    for (let i = k; i < nums.length; i++) {
        // If the current element is larger than the heap top, pop the top element and push the current element
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
console.log(`The largest ${k} elements are`, res);
