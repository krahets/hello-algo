/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Binary search (closed interval on both sides) */
function binarySearch(nums: number[], target: number): number {
    // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
    let i = 0,
        j = nums.length - 1;
    // Loop, exit when the search interval is empty (empty when i > j)
    while (i <= j) {
        // Calculate the midpoint index m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // This means target is in the interval [m+1, j]
            i = m + 1;
        } else if (nums[m] > target) {
            // This means target is in the interval [i, m-1]
            j = m - 1;
        } else {
            // Found the target element, return its index
            return m;
        }
    }
    return -1; // Target element not found, return -1
}

/* Binary search (left-closed right-open interval) */
function binarySearchLCRO(nums: number[], target: number): number {
    // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
    let i = 0,
        j = nums.length;
    // Loop, exit when the search interval is empty (empty when i = j)
    while (i < j) {
        // Calculate the midpoint index m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // This means target is in the interval [m+1, j)
            i = m + 1;
        } else if (nums[m] > target) {
            // This means target is in the interval [i, m)
            j = m;
        } else {
            // Found the target element, return its index
            return m;
        }
    }
    return -1; // Target element not found, return -1
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Binary search (closed interval on both sides) */
let index = binarySearch(nums, target);
console.info('Index of target element 6 is %d', index);

/* Binary search (left-closed right-open interval) */
index = binarySearchLCRO(nums, target);
console.info('Index of target element 6 is %d', index);

export {};
