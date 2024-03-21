/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 二分查找（双闭区间） */
function binarySearch(nums: number[], target: number): number {
    // 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    let i = 0,
        j = nums.length - 1;
    // 循环，当搜索区间为空时跳出（当 i > j 时为空）
    while (i <= j) {
        // 计算中点索引 m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 此情况说明 target 在区间 [m+1, j] 中
            i = m + 1;
        } else if (nums[m] > target) {
            // 此情况说明 target 在区间 [i, m-1] 中
            j = m - 1;
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }
    return -1; // 未找到目标元素，返回 -1
}

/* 二分查找（左闭右开区间） */
function binarySearchLCRO(nums: number[], target: number): number {
    // 初始化左闭右开区间 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
    let i = 0,
        j = nums.length;
    // 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while (i < j) {
        // 计算中点索引 m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 此情况说明 target 在区间 [m+1, j) 中
            i = m + 1;
        } else if (nums[m] > target) {
            // 此情况说明 target 在区间 [i, m) 中
            j = m;
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }
    return -1; // 未找到目标元素，返回 -1
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分查找（双闭区间） */
let index = binarySearch(nums, target);
console.info('目标元素 6 的索引 = %d', index);

/* 二分查找（左闭右开区间） */
index = binarySearchLCRO(nums, target);
console.info('目标元素 6 的索引 = %d', index);

export {};
