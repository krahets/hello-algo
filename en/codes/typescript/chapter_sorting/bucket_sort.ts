/**
 * File: bucket_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Bucket sort */
function bucketSort(nums: number[]): void {
    // Set k = n/2 and create ceil(k) buckets, aiming for about 2 elements per bucket
    const k = nums.length / 2;
    const buckets: number[][] = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. Distribute the array elements among the buckets
    for (const num of nums) {
        // The input range is [0, 1); floor(num * k) maps each value to an index in [0, ceil(k)-1]
        const i = Math.floor(num * k);
        // Add num to bucket i
        buckets[i].push(num);
    }
    // 2. Sort each bucket
    for (const bucket of buckets) {
        // Use the built-in sorting function, or replace it with another sorting algorithm
        bucket.sort((a, b) => a - b);
    }
    // 3. Traverse the buckets to combine the results
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver code */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('After bucket sort, nums =', nums);

export {};
