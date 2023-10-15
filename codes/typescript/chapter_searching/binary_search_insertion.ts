/**
 * File: binary_search_insertion.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 二分查找插入点（无重复元素） */
function binarySearchInsertionSimple(
    nums: Array<number>,
    target: number
): number {
    let i = 0,
        j = nums.length - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 计算中点索引 m, 使用 Math.floor() 向下取整
        if (nums[m] < target) {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            return m; // 找到 target ，返回插入点 m
        }
    }
    // 未找到 target ，返回插入点 i
    return i;
}

/* 二分查找插入点（存在重复元素） */
function binarySearchInsertion(nums: Array<number>, target: number): number {
    let i = 0,
        j = nums.length - 1; // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 计算中点索引 m, 使用 Math.floor() 向下取整
        if (nums[m] < target) {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
    }
    // 返回插入点 i
    return i;
}

/* Driver Code */
// 无重复元素的数组
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\n数组 nums = ' + nums);
// 二分查找插入点
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('元素 ' + target + ' 的插入点的索引为 ' + index);
}

// 包含重复元素的数组
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n数组 nums = ' + nums);
// 二分查找插入点
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('元素 ' + target + ' 的插入点的索引为 ' + index);
}

export { binarySearchInsertion };
