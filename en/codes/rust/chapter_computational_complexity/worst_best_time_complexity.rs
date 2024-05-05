/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use rand::seq::SliceRandom;
use rand::thread_rng;

/* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
fn random_numbers(n: i32) -> Vec<i32> {
    // Generate array nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // Randomly shuffle array elements
    nums.shuffle(&mut thread_rng());
    nums
}

/* Find the index of number 1 in array nums */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // When element 1 is at the start of the array, achieve best time complexity O(1)
        // When element 1 is at the end of the array, achieve worst time complexity O(n)
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\nThe array [ 1, 2, ..., n ] after being shuffled =");
        print_util::print_array(&nums);
        println!("\nThe index of number 1 is {}", index);
    }
}
