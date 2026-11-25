/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 插入排序 */
function insertionSort(nums: number[]): void {
    // 外層迴圈：已排序的區間為 [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // 內層迴圈：將 base 插入已排序區間 [0, i-1] 中的正確位置
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // 將 nums[j] 向右移動一格
            j--;
        }
        nums[j + 1] = base; // 將 base 寫入正確位置
    }
}

/* 主程式 */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('插入排序完成後 nums =', nums);

export {};
