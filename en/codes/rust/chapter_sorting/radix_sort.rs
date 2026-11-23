/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Get the k-th digit of num, where exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return ((num / exp) % 10) as usize;
}

/* Counting sort (sort nums by the k-th digit) */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    let mut counter = [0; 10];
    let n = nums.len();
    // Count the occurrences of each digit from 0 to 9
    for i in 0..n {
        let d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
        counter[d] += 1; // Count the occurrences of digit d
    }
    // Compute prefix sums to convert occurrence counts into array positions
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // Get the destination index j for digit d in the array
        res[j] = nums[i]; // Place the current element at index j
        counter[d] -= 1; // Decrease the count for d by 1
    }
    // Overwrite the original array nums with the result
    nums.copy_from_slice(&res);
}

/* Radix sort */
fn radix_sort(nums: &mut [i32]) {
    // Get the largest array element to determine the maximum number of digits
    let m = *nums.into_iter().max().unwrap();
    // Process digits from least significant to most significant
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Driver code */
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
