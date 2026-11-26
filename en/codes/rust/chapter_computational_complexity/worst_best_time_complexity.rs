/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* Generate a shuffled array containing { 1, 2, ..., n } */
fn random_numbers(n: i32) -> Vec<i32> {
    // Generate the array nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // Shuffle the array elements at random
    nums.shuffle(&mut thread_rng());
    nums
}

/* Find the index of 1 in the array nums */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // Best case: 1 is the first element, so the search takes O(1) time
        // Worst case: 1 is the last element, so the search takes O(n) time
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
        print!("\nShuffled array [ 1, 2, ..., n ] = ");
        print_util::print_array(&nums);
        println!("\nIndex of 1 = {}", index);
    }
}
