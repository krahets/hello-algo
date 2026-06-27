/**
 * File: radix_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Get the k-th digit of element num, where exp = 10^(k-1) */
function digit(num: number, exp: number): number {
    // Passing exp instead of k can avoid repeated expensive exponentiation here
    return Math.floor(num / exp) % 10;
}

/* Counting sort (based on nums k-th digit) */
function countingSortDigit(nums: number[], exp: number): void {
    // Decimal digit range is 0~9, therefore need a bucket array of length 10
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // Count the occurrence of digits 0~9
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
        counter[d]++; // Count the occurrence of digit d
    }
    // Calculate prefix sum, converting "occurrence count" into "array index"
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse, based on bucket statistics, place each element into res
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // Get the index j for d in the array
        res[j] = nums[i]; // Place the current element at index j
        counter[d]--; // Decrease the count of d by 1
    }
    // Use result to overwrite the original array nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Radix sort */
function radixSort(nums: number[]): void {
    // Get the maximum element of the array, used to determine the maximum number of digits
    let m: number = Math.max(... nums);
    // Traverse from the lowest to the highest digit
    for (let exp = 1; exp <= m; exp *= 10) {
        // Perform counting sort on the k-th digit of array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // i.e., exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* Driver Code */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('After radix sort, nums =', nums);

export {};
