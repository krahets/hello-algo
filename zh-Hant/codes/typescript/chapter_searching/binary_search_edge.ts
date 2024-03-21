/**
 * File: binary_search_edge.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */
import { binarySearchInsertion } from './binary_search_insertion';

/* 二分查找最左一个 target */
function binarySearchLeftEdge(nums: Array<number>, target: number): number {
    // 等价于查找 target 的插入点
    const i = binarySearchInsertion(nums, target);
    // 未找到 target ，返回 -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // 找到 target ，返回索引 i
    return i;
}

/* 二分查找最右一个 target */
function binarySearchRightEdge(nums: Array<number>, target: number): number {
    // 转化为查找最左一个 target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
    const j = i - 1;
    // 未找到 target ，返回 -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // 找到 target ，返回索引 j
    return j;
}

/* Driver Code */
// 包含重复元素的数组
let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n数组 nums = ' + nums);
// 二分查找左边界和右边界
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('最左一个元素 ' + target + ' 的索引为 ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('最右一个元素 ' + target + ' 的索引为 ' + index);
}

export {};
