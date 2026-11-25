/**
 * File: binary_search_edge.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

const { binarySearchInsertion } = require('./binary_search_insertion.js');

/* Use binary search to find the leftmost occurrence of target */
function binarySearchLeftEdge(nums, target) {
    // Equivalent to finding the insertion point for target
    const i = binarySearchInsertion(nums, target);
    // Target not found. Return -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // Found target. Return index i
    return i;
}

/* Use binary search to find the rightmost occurrence of target */
function binarySearchRightEdge(nums, target) {
    // Search for the leftmost occurrence of target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j points to the rightmost occurrence of target, and i to the first larger element
    const j = i - 1;
    // Target not found. Return -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // Found target. Return index j
    return j;
}

/* Driver code */
// Array with duplicates
const nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nArray nums = ' + nums);
// Find the left and right boundaries using binary search
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('The leftmost occurrence of ' + target + ' is at index ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('The rightmost occurrence of ' + target + ' is at index ' + index);
}
