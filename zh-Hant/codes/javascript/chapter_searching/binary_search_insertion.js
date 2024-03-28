/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 二分搜尋插入點（無重複元素） */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m, 使用 Math.floor() 向下取整
        if (nums[m] < target) {
            i = m + 1; // target 在區間 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1; // target 在區間 [i, m-1] 中
        } else {
            return m; // 找到 target ，返回插入點 m
        }
    }
    // 未找到 target ，返回插入點 i
    return i;
}

/* 二分搜尋插入點（存在重複元素） */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m, 使用 Math.floor() 向下取整
        if (nums[m] < target) {
            i = m + 1; // target 在區間 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1; // target 在區間 [i, m-1] 中
        } else {
            j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
        }
    }
    // 返回插入點 i
    return i;
}

/* Driver Code */
// 無重複元素的陣列
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\n陣列 nums = ' + nums);
// 二分搜尋插入點
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('元素 ' + target + ' 的插入點的索引為 ' + index);
}

// 包含重複元素的陣列
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n陣列 nums = ' + nums);
// 二分搜尋插入點
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('元素 ' + target + ' 的插入點的索引為 ' + index);
}

module.exports = {
    binarySearchInsertion,
};
