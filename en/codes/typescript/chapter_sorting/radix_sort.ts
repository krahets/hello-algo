/**
 * File: radix_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Get the k-th digit of num, where exp = 10^(k-1) */
function digit(num: number, exp: number): number {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return Math.floor(num / exp) % 10;
}

/* Counting sort (sort nums by the k-th digit) */
function countingSortDigit(nums: number[], exp: number): void {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // Count the occurrences of each digit from 0 to 9
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
        counter[d]++; // Count the occurrences of digit d
    }
    // Compute prefix sums to convert occurrence counts into array positions
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // Get the destination index j for digit d in the array
        res[j] = nums[i]; // Place the current element at index j
        counter[d]--; // Decrease the count for d by 1
    }
    // Overwrite the original array nums with the result
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Radix sort */
function radixSort(nums: number[]): void {
    // Get the largest array element to determine the maximum number of digits
    let m: number = Math.max(... nums);
    // Process digits from least significant to most significant
    for (let exp = 1; exp <= m; exp *= 10) {
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* Driver code */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('After radix sort, nums =', nums);

export {};
