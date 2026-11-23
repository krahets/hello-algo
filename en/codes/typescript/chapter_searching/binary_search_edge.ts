/**
 * File: binary_search_edge.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */
import { binarySearchInsertion } from './binary_search_insertion';

/* Find the leftmost occurrence of target using binary search */
function binarySearchLeftEdge(nums: Array<number>, target: number): number {
    // This is equivalent to finding the insertion point of target
    const i = binarySearchInsertion(nums, target);
    // If target was not found, return -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // Target was found; return index i
    return i;
}

/* Find the rightmost occurrence of target using binary search */
function binarySearchRightEdge(nums: Array<number>, target: number): number {
    // Reduce the problem to finding the leftmost insertion point of target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // For integer elements, i is the first index greater than target (or the array length); j is the candidate rightmost target index
    const j = i - 1;
    // If target was not found, return -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // Target was found; return index j
    return j;
}

/* Driver code */
// Array containing duplicate elements
let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nArray nums = ' + nums);
// Find the left and right boundaries using binary search
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('Leftmost occurrence of ' + target + ' has index ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('Rightmost occurrence of ' + target + ' has index ' + index);
}

export {};
