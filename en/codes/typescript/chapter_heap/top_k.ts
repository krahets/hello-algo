/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* Element enters heap */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // Negate element
    maxHeap.push(-val);
}

/* Element exits heap */
function popMinHeap(maxHeap: MaxHeap): number {
    // Negate element
    return -maxHeap.pop();
}

/* Access top element */
function peekMinHeap(maxHeap: MaxHeap): number {
    // Negate element
    return -maxHeap.peek();
}

/* Extract elements from heap */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // Negate element
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* Find the largest k elements in array based on heap */
function topKHeap(nums: number[], k: number): number[] {
    // Python's heapq module implements min heap by default
    // Note: We negate all heap elements to simulate min heap using max heap
    const maxHeap = new MaxHeap([]);
    // Enter the first k elements of array into heap
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Starting from the (k+1)th element, maintain heap length as k
    for (let i = k; i < nums.length; i++) {
        // If current element is greater than top element, top element exits heap, current element enters heap
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Return elements in heap
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`The largest ${k} elements are`, res);
