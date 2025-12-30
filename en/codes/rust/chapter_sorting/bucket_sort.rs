/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Bucket sort */
fn bucket_sort(nums: &mut [f64]) {
    // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. Distribute array elements into various buckets
    for &num in nums.iter() {
        // Input data range is [0, 1), use num * k to map to index range [0, k-1]
        let i = (num * k as f64) as usize;
        // Add num to bucket i
        buckets[i].push(num);
    }
    // 2. Sort each bucket
    for bucket in &mut buckets {
        // Use built-in sorting function, can also replace with other sorting algorithms
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. Traverse buckets to merge results
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Driver Code */
fn main() {
    // Assume input data is floating point, interval [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("After bucket sort completes, nums = ");
    print_util::print_array(&nums);
}
