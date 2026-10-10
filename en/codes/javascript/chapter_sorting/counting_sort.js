/**
 * File: counting_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
function countingSortNaive(nums) {
    // 1. Count the maximum element m in the array
    let m = Math.max(...nums);
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Traverse counter, filling each element back into the original array nums
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
function countingSort(nums) {
    // 1. Count the maximum element m in the array
    let m = Math.max(...nums);
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
    // counter[num]-1 is the last index where num appears in res
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums in reverse order, placing each element into the result array res
    // Initialize the array res to record results
    const n = nums.length;
    const res = new Array(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // Place num at the corresponding index
        counter[num]--; // Decrement the prefix sum by 1, getting the next index to place num
    }
    // Use result array res to overwrite the original array nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Driver Code */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('After counting sort (cannot sort objects), nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('After counting sort, nums1 =', nums1);
