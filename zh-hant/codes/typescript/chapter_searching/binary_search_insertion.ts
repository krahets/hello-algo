/**
 * File: binary_search_insertion.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

import { pathToFileURL } from 'node:url';

/* 用二分搜尋找插入點（無重複元素） */
function binarySearchInsertionSimple(
    nums: Array<number>,
    target: number
): number {
    let i = 0,
        j = nums.length - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m，以 Math.floor() 向下取整
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if (nums[m] > target) {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            return m; // 找到 target，回傳插入點 m
        }
    }
    // 找不到 target，回傳插入點 i
    return i;
}

/* 用二分搜尋找插入點（有重複元素） */
function binarySearchInsertion(nums: Array<number>, target: number): number {
    let i = 0,
        j = nums.length - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m，以 Math.floor() 向下取整
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if (nums[m] > target) {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            j = m - 1; // 最右邊小於 target 的元素位於區間 [i, m-1] 內
        }
    }
    // 回傳插入點 i
    return i;
}

/* 主程式 */
if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
    // 不含重複元素的陣列
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    console.log('\n陣列 nums = ' + nums);
    // 用二分搜尋找插入點
    for (const target of [6, 9]) {
        const index = binarySearchInsertionSimple(nums, target);
        console.log('元素 ' + target + ' 的插入位置索引為 ' + index);
    }

    // 含有重複元素的陣列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    console.log('\n陣列 nums = ' + nums);
    // 用二分搜尋找插入點
    for (const target of [2, 6, 20]) {
        const index = binarySearchInsertion(nums, target);
        console.log('元素 ' + target + ' 的插入位置索引為 ' + index);
    }
}

export { binarySearchInsertion };
