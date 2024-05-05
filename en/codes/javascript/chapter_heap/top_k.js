/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* Push the element into heap */
function pushMinHeap(maxHeap, val) {
    // Negate elements
    maxHeap.push(-val);
}

/* Element exits heap */
function popMinHeap(maxHeap) {
    // Negate elements
    return -maxHeap.pop();
}

/* Access heap top element */
function peekMinHeap(maxHeap) {
    // Negate elements
    return -maxHeap.peek();
}

/* Remove elements from the heap */
function getMinHeap(maxHeap) {
    // Negate elements
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* Using heap to find the largest k elements in an array */
function topKHeap(nums, k) {
    // Initialize min-heap
    // Please note: We negate all elements in the heap to simulate a min-heap using a max-heap
    const maxHeap = new MaxHeap([]);
    // Enter the first k elements of the array into the heap
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // From the k+1th element, keep the heap length as k
    for (let i = k; i < nums.length; i++) {
        // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Return the element from the heap
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`最大的 ${k} 个元素为`, res);
