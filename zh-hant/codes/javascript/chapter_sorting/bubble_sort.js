/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 氣泡排序 */
function bubbleSort(nums) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
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

/* 氣泡排序（以旗標最佳化）*/
function bubbleSortWithFlag(nums) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // 初始化旗標
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // 記錄本輪曾交換元素
            }
        }
        if (!flag) break; // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
    }
}

/* 主程式 */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('氣泡排序完成後 nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('氣泡排序完成後 nums =', nums1);
