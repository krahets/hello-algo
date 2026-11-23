/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* Binary search (closed interval) */
function binarySearch(nums, target) {
    // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    let i = 0,
        j = nums.length - 1;
    // Loop until the search interval is empty (when i > j)
    while (i <= j) {
        // Calculate midpoint index m, using parseInt() to round down
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // In this case, target must be in [m+1, j] if it exists
            i = m + 1;
        else if (nums[m] > target)
            // In this case, target must be in [i, m-1] if it exists
            j = m - 1;
        else return m; // The target element was found; return its index
    }
    // The target element was not found; return -1
    return -1;
}

/* Binary search (left-closed, right-open interval) */
function binarySearchLCRO(nums, target) {
    // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    let i = 0,
        j = nums.length;
    // Loop until the search interval is empty (when i = j)
    while (i < j) {
        // Calculate midpoint index m, using parseInt() to round down
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // In this case, target must be in [m+1, j) if it exists
            i = m + 1;
        else if (nums[m] > target)
            // In this case, target must be in [i, m) if it exists
            j = m;
        // The target element was found; return its index
        else return m;
    }
    // The target element was not found; return -1
    return -1;
}

/* Driver code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Binary search (closed interval) */
let index = binarySearch(nums, target);
console.log('Index of target element 6 = ' + index);

/* Binary search (left-closed, right-open interval) */
index = binarySearchLCRO(nums, target);
console.log('Index of target element 6 = ' + index);
