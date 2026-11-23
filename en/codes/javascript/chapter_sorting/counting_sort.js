/**
 * File: counting_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Counting sort */
// Simple implementation; cannot be used to sort objects
function countingSortNaive(nums) {
    // 1. Find the maximum array element m
    let m = Math.max(...nums);
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Traverse counter and fill the original array nums with the elements
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Counting sort */
// Full implementation; stable and adaptable to sorting objects
function countingSort(nums) {
    // 1. Find the maximum array element m
    let m = Math.max(...nums);
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Compute prefix sums of counter to convert occurrence counts into end positions
    // That is, counter[num]-1 is the index of the last occurrence of num in res
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums in reverse and place each element in the result array res
    // Initialize array res to store the result
    const n = nums.length;
    const res = new Array(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // Place num at the corresponding index
        counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
    }
    // Overwrite the original array nums with the result array res
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Driver code */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('After counting sort (cannot sort objects), nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('After counting sort, nums1 =', nums1);
