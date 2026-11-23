/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Find an insertion point using binary search (no duplicates) */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Calculate midpoint index m, using Math.floor() to round down
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            return m; // Target was found; return insertion point m
        }
    }
    // Target was not found; return insertion point i
    return i;
}

/* Find an insertion point using binary search (with duplicates) */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Calculate midpoint index m, using Math.floor() to round down
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            j = m - 1; // Continue in [i, m-1] to find the rightmost element smaller than target
        }
    }
    // Return insertion point i
    return i;
}

/* Driver code */
// Array with no duplicate elements
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\nArray nums = ' + nums);
// Find an insertion point using binary search
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('Element ' + target + ' has insertion index ' + index);
}

// Array containing duplicate elements
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nArray nums = ' + nums);
// Find an insertion point using binary search
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('Element ' + target + ' has insertion index ' + index);
}

module.exports = {
    binarySearchInsertion,
};
