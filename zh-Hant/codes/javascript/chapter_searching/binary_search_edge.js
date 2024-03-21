/**
 * File: binary_search_edge.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

const { binarySearchInsertion } = require('./binary_search_insertion.js');

/* 二分搜尋最左一個 target */
function binarySearchLeftEdge(nums, target) {
    // 等價於查詢 target 的插入點
    const i = binarySearchInsertion(nums, target);
    // 未找到 target ，返回 -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // 找到 target ，返回索引 i
    return i;
}

/* 二分搜尋最右一個 target */
function binarySearchRightEdge(nums, target) {
    // 轉化為查詢最左一個 target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j 指向最右一個 target ，i 指向首個大於 target 的元素
    const j = i - 1;
    // 未找到 target ，返回 -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // 找到 target ，返回索引 j
    return j;
}

/* Driver Code */
// 包含重複元素的陣列
const nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n陣列 nums = ' + nums);
// 二分搜尋左邊界和右邊界
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('最左一個元素 ' + target + ' 的索引為 ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('最右一個元素 ' + target + ' 的索引為 ' + index);
}
