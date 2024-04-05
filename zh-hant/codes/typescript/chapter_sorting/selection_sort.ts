/**
 * File: selection_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 選擇排序 */
function selectionSort(nums: number[]): void {
    let n = nums.length;
    // 外迴圈：未排序區間為 [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // 內迴圈：找到未排序區間內的最小元素
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // 記錄最小元素的索引
            }
        }
        // 將該最小元素與未排序區間的首個元素交換
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* Driver Code */
const nums: number[] = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('選擇排序完成後 nums =', nums);

export {};
