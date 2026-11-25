/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* Binary search on a closed interval */
function binarySearch(nums, target) {
    // Initialize the closed interval [0, n-1] with i at the first element and j at the last
    let i = 0,
        j = nums.length - 1;
    // Stop when the search interval is empty (i > j)
    while (i <= j) {
        // Compute the midpoint index m, rounding down with parseInt()
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // Any match must lie in [m+1, j]
            i = m + 1;
        else if (nums[m] > target)
            // Any match must lie in [i, m-1]
            j = m - 1;
        else return m; // Found the target. Return its index
    }
    // Target not found. Return -1
    return -1;
}

/* Binary search on a left-closed, right-open interval */
function binarySearchLCRO(nums, target) {
    // Initialize [0, n) with i at the first element and j one past the last
    let i = 0,
        j = nums.length;
    // Stop when the search interval is empty (i = j)
    while (i < j) {
        // Compute the midpoint index m, rounding down with parseInt()
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // Any match must lie in [m+1, j)
            i = m + 1;
        else if (nums[m] > target)
            // Any match must lie in [i, m)
            j = m;
        // Found the target. Return its index
        else return m;
    }
    // Target not found. Return -1
    return -1;
}

/* Driver code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Binary search on a closed interval */
let index = binarySearch(nums, target);
console.log('Index of target 6 = ' + index);

/* Binary search on a left-closed, right-open interval */
index = binarySearchLCRO(nums, target);
console.log('Index of target 6 = ' + index);
