/**
 * File: counting_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Counting sort */
// Simple implementation that cannot sort objects
function countingSortNaive(nums) {
    // 1. Find the largest array element m
    let m = Math.max(...nums);
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Traverse counter and write each value back into nums
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Counting sort */
// Full implementation that can sort objects and is stable
function countingSort(nums) {
    // 1. Find the largest array element m
    let m = Math.max(...nums);
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Compute prefix sums in counter to locate the last position for each value
    // That is, counter[num]-1 is the last index of num in res
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums backward and place each element in the result array res
    // Initialize the result array res
    const n = nums.length;
    const res = new Array(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // Place num at its corresponding index
        counter[num]--; // Decrement the prefix sum by 1 to find the next index for num
    }
    // Copy res back into the original array nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Driver Code */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('After counting sort (values only), nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('After counting sort, nums1 =', nums1);
