/**
 * File: binary_search_edge.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

const { binarySearchInsertion } = require('./binary_search_insertion.js');

/* Find the leftmost occurrence of target using binary search */
function binarySearchLeftEdge(nums, target) {
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
function binarySearchRightEdge(nums, target) {
    // Reduce the problem to finding the leftmost insertion point of target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j points to the rightmost target, while i points to the first element greater than target
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
const nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nArray nums = ' + nums);
// Find the left and right boundaries using binary search
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('Leftmost occurrence of ' + target + ' has index ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('Rightmost occurrence of ' + target + ' has index ' + index);
}
