/**
 * File: binary_search_edge.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

const { binarySearchInsertion } = require('./binary_search_insertion.js');

/* 用二分搜尋找最左邊的 target */
function binarySearchLeftEdge(nums, target) {
    // 等同於搜尋 target 的插入點
    const i = binarySearchInsertion(nums, target);
    // 找不到 target，回傳 -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // 找到 target，回傳索引 i
    return i;
}

/* 用二分搜尋找最右邊的 target */
function binarySearchRightEdge(nums, target) {
    // 改為搜尋 target + 1 的最左插入位置
    const i = binarySearchInsertion(nums, target + 1);
    // j 指向最右邊的 target，i 指向第一個大於 target 的元素
    const j = i - 1;
    // 找不到 target，回傳 -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // 找到 target，回傳索引 j
    return j;
}

/* 主程式 */
// 含有重複元素的陣列
const nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n陣列 nums = ' + nums);
// 用二分搜尋找左界和右界
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('最左邊的元素 ' + target + ' 的索引為 ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('最右邊的元素 ' + target + ' 的索引為 ' + index);
}
