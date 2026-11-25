/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 二分搜尋（閉區間） */
function binarySearch(nums: number[], target: number): number {
    // 將閉區間設為 [0, n-1]，i 和 j 分別指向陣列的首、末元素
    let i = 0,
        j = nums.length - 1;
    // 當搜尋區間為空（i > j）時，結束迴圈
    while (i <= j) {
        // 計算中點索引 m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 此時 target 若存在，必在區間 [m+1, j] 內
            i = m + 1;
        } else if (nums[m] > target) {
            // 此時 target 若存在，必在區間 [i, m-1] 內
            j = m - 1;
        } else {
            // 找到目標元素，回傳其索引
            return m;
        }
    }
    return -1; // 找不到目標元素，回傳 -1
}

/* 二分搜尋（左閉右開區間） */
function binarySearchLCRO(nums: number[], target: number): number {
    // 將左閉右開區間設為 [0, n)，i 指向陣列的首元素，j 指向末元素的下一個位置
    let i = 0,
        j = nums.length;
    // 當搜尋區間為空（i = j）時，結束迴圈
    while (i < j) {
        // 計算中點索引 m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 此時 target 若存在，必在區間 [m+1, j) 內
            i = m + 1;
        } else if (nums[m] > target) {
            // 此時 target 若存在，必在區間 [i, m) 內
            j = m;
        } else {
            // 找到目標元素，回傳其索引
            return m;
        }
    }
    return -1; // 找不到目標元素，回傳 -1
}

/* 主程式 */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分搜尋（閉區間） */
let index = binarySearch(nums, target);
console.info('目標元素 6 的索引 = %d', index);

/* 二分搜尋（左閉右開區間） */
index = binarySearchLCRO(nums, target);
console.info('目標元素 6 的索引 = %d', index);

export {};
