/**
 * File: binary_search_recur.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 二分搜尋：問題 f(i, j) */
function dfs(nums: number[], target: number, i: number, j: number): number {
    // 若區間為空，表示沒有目標元素，回傳 -1
    if (i > j) {
        return -1;
    }
    // 計算中點索引 m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // 遞迴求解子問題 f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // 遞迴求解子問題 f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // 找到目標元素，回傳其索引
        return m;
    }
}

/* 二分搜尋 */
function binarySearch(nums: number[], target: number): number {
    const n = nums.length;
    // 求解問題 f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* 主程式 */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// 二分搜尋（兩端皆含的閉區間）
const index = binarySearch(nums, target);
console.log(`目標元素 6 的索引 = ${index}`);

export {};
