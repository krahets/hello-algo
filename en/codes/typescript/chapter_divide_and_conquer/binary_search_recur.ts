/**
 * File: binary_search_recur.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Binary search: problem f(i, j) */
function dfs(nums: number[], target: number, i: number, j: number): number {
    // If the interval is empty, indicating no target element, return -1
    if (i > j) {
        return -1;
    }
    // Calculate midpoint index m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // Recursive subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Recursive subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Found the target element, thus return its index
        return m;
    }
}

/* Binary search */
function binarySearch(nums: number[], target: number): number {
    const n = nums.length;
    // Solve problem f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// Binary search (double closed interval)
const index = binarySearch(nums, target);
console.log(`目标元素 6 的索引 = ${index}`);

export {};
