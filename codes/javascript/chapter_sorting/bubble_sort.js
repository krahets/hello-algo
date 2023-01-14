/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 冒泡排序 */
function bubbleSort(nums) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (let i = nums.length - 1; i > 0; i--) {
        // 内循环：冒泡操作
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* 冒泡排序（标志优化）*/
function bubbleSortWithFlag(nums) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // 初始化标志位
        // 内循环：冒泡操作
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;  // 记录交换元素
            }
        }
        if (!flag) break;     // 此轮冒泡未交换任何元素，直接跳出
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log("排序后数组 nums =", nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log("排序后数组 nums =", nums1);
