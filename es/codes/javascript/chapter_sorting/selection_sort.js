/**
 * File: selection_sort.js
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 选择排序 */
function selectionSort(nums) {
    let n = nums.length;
    // 外循环：未排序区间为 [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // 内循环：找到未排序区间内的最小元素
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // 记录最小元素的索引
            }
        }
        // 将该最小元素与未排序区间的首个元素交换
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('选择排序完成后 nums =', nums);
