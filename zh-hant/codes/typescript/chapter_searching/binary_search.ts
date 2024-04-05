/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 二分搜尋（雙閉區間） */
function binarySearch(nums: number[], target: number): number {
    // 初始化雙閉區間 [0, n-1] ，即 i, j 分別指向陣列首元素、尾元素
    let i = 0,
        j = nums.length - 1;
    // 迴圈，當搜尋區間為空時跳出（當 i > j 時為空）
    while (i <= j) {
        // 計算中點索引 m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 此情況說明 target 在區間 [m+1, j] 中
            i = m + 1;
        } else if (nums[m] > target) {
            // 此情況說明 target 在區間 [i, m-1] 中
            j = m - 1;
        } else {
            // 找到目標元素，返回其索引
            return m;
        }
    }
    return -1; // 未找到目標元素，返回 -1
}

/* 二分搜尋（左閉右開區間） */
function binarySearchLCRO(nums: number[], target: number): number {
    // 初始化左閉右開區間 [0, n) ，即 i, j 分別指向陣列首元素、尾元素+1
    let i = 0,
        j = nums.length;
    // 迴圈，當搜尋區間為空時跳出（當 i = j 時為空）
    while (i < j) {
        // 計算中點索引 m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 此情況說明 target 在區間 [m+1, j) 中
            i = m + 1;
        } else if (nums[m] > target) {
            // 此情況說明 target 在區間 [i, m) 中
            j = m;
        } else {
            // 找到目標元素，返回其索引
            return m;
        }
    }
    return -1; // 未找到目標元素，返回 -1
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分搜尋（雙閉區間） */
let index = binarySearch(nums, target);
console.info('目標元素 6 的索引 = %d', index);

/* 二分搜尋（左閉右開區間） */
index = binarySearchLCRO(nums, target);
console.info('目標元素 6 的索引 = %d', index);

export {};
