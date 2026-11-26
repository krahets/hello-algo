/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Binary search for an insertion point (no duplicates) */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Compute the midpoint index m, rounding down with Math.floor()
        if (nums[m] < target) {
            i = m + 1; // Any match must lie in [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Any match must lie in [i, m-1]
        } else {
            return m; // Found target. Return insertion point m
        }
    }
    // Target not found. Return insertion point i
    return i;
}

/* Binary search for an insertion point (duplicates allowed) */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Compute the midpoint index m, rounding down with Math.floor()
        if (nums[m] < target) {
            i = m + 1; // Any match must lie in [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Any match must lie in [i, m-1]
        } else {
            j = m - 1; // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    return i;
}

/* Driver code */
if (require.main === module) {
    // Array without duplicates
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    console.log('\nArray nums = ' + nums);
    // Find the insertion point using binary search
    for (const target of [6, 9]) {
        const index = binarySearchInsertionSimple(nums, target);
        console.log('Element ' + target + ' has insertion index ' + index);
    }

    // Array with duplicates
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    console.log('\nArray nums = ' + nums);
    // Find the insertion point using binary search
    for (const target of [2, 6, 20]) {
        const index = binarySearchInsertion(nums, target);
        console.log('Element ' + target + ' has insertion index ' + index);
    }
}

module.exports = {
    binarySearchInsertion,
};
