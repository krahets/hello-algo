/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* Binary search (double closed interval) */
function binarySearch(nums, target) {
    // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
    let i = 0,
        j = nums.length - 1;
    // Loop until the search interval is empty (when i > j, it is empty)
    while (i <= j) {
        // Calculate the midpoint index m, using parseInt() for floor division
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // This situation indicates that target is in the interval [m+1, j]
            i = m + 1;
        else if (nums[m] > target)
            // This situation indicates that target is in the interval [i, m-1]
            j = m - 1;
        else return m; // Found the target element, thus return its index
    }
    // Did not find the target element, thus return -1
    return -1;
}

/* Binary search (left closed right open interval) */
function binarySearchLCRO(nums, target) {
    // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
    let i = 0,
        j = nums.length;
    // Loop until the search interval is empty (when i = j, it is empty)
    while (i < j) {
        // Calculate the midpoint index m, using parseInt() for floor division
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // This situation indicates that target is in the interval [m+1, j)
            i = m + 1;
        else if (nums[m] > target)
            // This situation indicates that target is in the interval [i, m)
            j = m;
        // Found the target element, thus return its index
        else return m;
    }
    // Did not find the target element, thus return -1
    return -1;
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Binary search (double closed interval) */
let index = binarySearch(nums, target);
console.log('Index of target element 6 =' + index);

/* Binary search (left closed right open interval) */
index = binarySearchLCRO(nums, target);
console.log('Index of target element 6 =' + index);
