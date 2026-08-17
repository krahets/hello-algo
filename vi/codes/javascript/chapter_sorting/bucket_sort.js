/**
 * File: bucket_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Bucket sort */
function bucketSort(nums) {
    // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
    const k = nums.length / 2;
    const buckets = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. Distribute array elements into various buckets
    for (const num of nums) {
        // Input data range is [0, 1), use num * k to map to index range [0, k-1]
        const i = Math.floor(num * k);
        // Add num to bucket i
        buckets[i].push(num);
    }
    // 2. Sort each bucket
    for (const bucket of buckets) {
        // Use built-in sorting function, can also replace with other sorting algorithms
        bucket.sort((a, b) => a - b);
    }
    // 3. Traverse buckets to merge results
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('After bucket sort, nums =', nums);
