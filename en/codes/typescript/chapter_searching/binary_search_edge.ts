/**
 * File: binary_search_edge.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */
import { binarySearchInsertion } from './binary_search_insertion';

/* Binary search for the leftmost target */
function binarySearchLeftEdge(nums: Array<number>, target: number): number {
    // Equivalent to finding the insertion point of target
    const i = binarySearchInsertion(nums, target);
    // Target not found, return -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // Found target, return index i
    return i;
}

/* Binary search for the rightmost target */
function binarySearchRightEdge(nums: Array<number>, target: number): number {
    // Convert to finding the leftmost target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j points to the rightmost target, i points to the first element greater than target
    const j = i - 1;
    // Target not found, return -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // Found target, return index j
    return j;
}

/* Driver Code */
// Array with duplicate elements
let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nArray nums = ' + nums);
// Binary search left and right boundaries
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('Leftmost element ' + target + ' has index ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('Rightmost element ' + target + ' has index ' + index);
}

export {};
