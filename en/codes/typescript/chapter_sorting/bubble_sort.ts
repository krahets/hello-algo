/**
 * File: bubble_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Bubble sort */
function bubbleSort(nums: number[]): void {
    // Outer loop: the unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
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

/* Bubble sort (flag optimization)*/
function bubbleSortWithFlag(nums: number[]): void {
    // Outer loop: the unsorted range is [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // Initialize the flag
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // Record that a swap occurred
            }
        }
        if (!flag) break; // Exit immediately if this pass made no swaps
    }
}

/* Driver code */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('After bubble sort, array =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('After bubble sort, array =', nums1);

export {};
