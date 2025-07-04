/**
 * File: binary_search_recur.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 二分查找：问题 f(i, j) */
function dfs(nums, target, i, j) {
    // 若区间为空，代表无目标元素，则返回 -1
    if (i > j) {
        return -1;
    }
    // 计算中点索引 m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // 递归子问题 f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // 递归子问题 f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // 找到目标元素，返回其索引
        return m;
    }
}

/* 二分查找 */
function binarySearch(nums, target) {
    const n = nums.length;
    // 求解问题 f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// 二分查找（双闭区间）
const index = binarySearch(nums, target);
console.log(`目标元素 6 的索引 = ${index}`);
