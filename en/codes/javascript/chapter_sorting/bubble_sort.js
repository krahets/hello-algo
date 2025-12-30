/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Bubble sort */
function bubbleSort(nums) {
    // Outer loop: unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* Bubble sort (flag optimization) */
function bubbleSortWithFlag(nums) {
    // Outer loop: unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // Initialize flag
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // Record element swap
            }
        }
        if (!flag) break; // No elements were swapped in this round of "bubbling", exit directly
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('After bubble sort, nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('After bubble sort, nums =', nums1);
