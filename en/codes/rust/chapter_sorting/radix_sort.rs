/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Get the k-th digit of element num, where exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // Passing exp instead of k can avoid repeated expensive exponentiation here
    return ((num / exp) % 10) as usize;
}

/* Counting sort (based on nums k-th digit) */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // Decimal digit range is 0~9, therefore need a bucket array of length 10
    let mut counter = [0; 10];
    let n = nums.len();
    // Count the occurrence of digits 0~9
    for i in 0..n {
        let d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
        counter[d] += 1; // Count the occurrence of digit d
    }
    // Calculate prefix sum, converting "occurrence count" into "array index"
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse, based on bucket statistics, place each element into res
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // Get the index j for d in the array
        res[j] = nums[i]; // Place the current element at index j
        counter[d] -= 1; // Decrease the count of d by 1
    }
    // Use result to overwrite the original array nums
    nums.copy_from_slice(&res);
}

/* Radix sort */
fn radix_sort(nums: &mut [i32]) {
    // Get the maximum element of the array, used to determine the maximum number of digits
    let m = *nums.into_iter().max().unwrap();
    // Traverse from the lowest to the highest digit
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Driver Code */
fn main() {
    // Radix sort
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("After radix sort completes, nums = ");
    print_util::print_array(&nums);
}
