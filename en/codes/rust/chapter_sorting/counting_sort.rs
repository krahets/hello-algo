/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Counting sort */
// Simple implementation that cannot sort objects
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. Find the largest array element m
    let m = *nums.iter().max().unwrap();
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. Traverse counter and write each value back into nums
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Counting sort */
// Full implementation that can sort objects and is stable
fn counting_sort(nums: &mut [i32]) {
    // 1. Find the largest array element m
    let m = *nums.iter().max().unwrap() as usize;
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. Compute prefix sums in counter to locate the last position for each value
    // That is, counter[num]-1 is the last index of num in res
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums backward and place each element in the result array res
    // Initialize the result array res
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // Place num at its corresponding index
        counter[num as usize] -= 1; // Decrement the prefix sum by 1 to find the next index for num
    }
    // Copy res back into the original array nums
    nums.copy_from_slice(&res)
}

/* Driver Code */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("After counting sort (values only), nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\nAfter counting sort, nums1 = ");
    print_util::print_array(&nums1);
}
