/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* Binary search (closed interval on both sides) */
function binarySearch(nums, target) {
    // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
    let i = 0,
        j = nums.length - 1;
    // Loop, exit when the search interval is empty (empty when i > j)
    while (i <= j) {
        // Calculate midpoint index m, use parseInt() to round down
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // This means target is in the interval [m+1, j]
            i = m + 1;
        else if (nums[m] > target)
            // This means target is in the interval [i, m-1]
            j = m - 1;
        else return m; // Found the target element, return its index
    }
    // Target element not found, return -1
    return -1;
}

/* Binary search (left-closed right-open interval) */
function binarySearchLCRO(nums, target) {
    // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
    let i = 0,
        j = nums.length;
    // Loop, exit when the search interval is empty (empty when i = j)
    while (i < j) {
        // Calculate midpoint index m, use parseInt() to round down
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // This means target is in the interval [m+1, j)
            i = m + 1;
        else if (nums[m] > target)
            // This means target is in the interval [i, m)
            j = m;
        // Found the target element, return its index
        else return m;
    }
    // Target element not found, return -1
    return -1;
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Binary search (closed interval on both sides) */
let index = binarySearch(nums, target);
console.log('Index of target element 6 = ' + index);

/* Binary search (left-closed right-open interval) */
index = binarySearchLCRO(nums, target);
console.log('Index of target element 6 = ' + index);
