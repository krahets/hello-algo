/**
 * File: binary_search_recur.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Binary search: problem f(i, j) */
function dfs(nums, target, i, j) {
    // If the interval is empty, the target is absent; return -1
    if (i > j) {
        return -1;
    }
    // Calculate the midpoint index m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // Recurse on subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Recurse on subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // The target element was found; return its index
        return m;
    }
}

/* Binary search */
function binarySearch(nums, target) {
    const n = nums.length;
    // Solve problem f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// Binary search (closed interval)
const index = binarySearch(nums, target);
console.log(`Index of target element 6 = ${index}`);
