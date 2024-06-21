/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 泡沫排序 */
function bubbleSort(nums) {
    // 外迴圈：未排序區間為 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* 泡沫排序（標誌最佳化）*/
function bubbleSortWithFlag(nums) {
    // 外迴圈：未排序區間為 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // 初始化標誌位
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // 記錄交換元素
            }
        }
        if (!flag) break; // 此輪“冒泡”未交換任何元素，直接跳出
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('泡沫排序完成後 nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('泡沫排序完成後 nums =', nums1);
