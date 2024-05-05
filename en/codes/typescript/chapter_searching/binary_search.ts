/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Binary search (double closed interval) */
function binarySearch(nums: number[], target: number): number {
    // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
    let i = 0,
        j = nums.length - 1;
    // Loop until the search interval is empty (when i > j, it is empty)
    while (i <= j) {
        // Calculate midpoint index m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // This situation indicates that target is in the interval [m+1, j]
            i = m + 1;
        } else if (nums[m] > target) {
            // This situation indicates that target is in the interval [i, m-1]
            j = m - 1;
        } else {
            // Found the target element, thus return its index
            return m;
        }
    }
    return -1; // Did not find the target element, thus return -1
}

/* Binary search (left closed right open interval) */
function binarySearchLCRO(nums: number[], target: number): number {
    // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
    let i = 0,
        j = nums.length;
    // Loop until the search interval is empty (when i = j, it is empty)
    while (i < j) {
        // Calculate midpoint index m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // This situation indicates that target is in the interval [m+1, j)
            i = m + 1;
        } else if (nums[m] > target) {
            // This situation indicates that target is in the interval [i, m)
            j = m;
        } else {
            // Found the target element, thus return its index
            return m;
        }
    }
    return -1; // Did not find the target element, thus return -1
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Binary search (double closed interval) */
let index = binarySearch(nums, target);
console.info('Index of target element 6 = %d', index);

/* Binary search (left closed right open interval) */
index = binarySearchLCRO(nums, target);
console.info('Index of target element 6 = %d', index);

export {};
