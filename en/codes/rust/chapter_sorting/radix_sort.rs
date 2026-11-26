/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Get digit k of num, where exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // Passing exp instead of k avoids repeating the costly exponentiation here
    return ((num / exp) % 10) as usize;
}

/* Counting sort by digit k of each element in nums */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
    let mut counter = [0; 10];
    let n = nums.len();
    // Count the occurrences of digits 0 through 9
    for i in 0..n {
        let d = digit(nums[i], exp); // Let d be digit k of nums[i]
        counter[d] += 1; // Count this occurrence of digit d
    }
    // Compute prefix sums to convert counts into array positions
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // Traverse backward and use the bucket counts to place each element in res
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // Get the array index j for d
        res[j] = nums[i]; // Place the current element at index j
        counter[d] -= 1; // Decrement the count for d by 1
    }
    // Copy the result back into nums
    nums.copy_from_slice(&res);
}

/* Radix sort */
fn radix_sort(nums: &mut [i32]) {
    // Find the largest element to determine the maximum number of digits
    let m = *nums.into_iter().max().unwrap();
    // Work from the least significant digit to the most significant
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
    print!("After radix sort, nums = ");
    print_util::print_array(&nums);
}
