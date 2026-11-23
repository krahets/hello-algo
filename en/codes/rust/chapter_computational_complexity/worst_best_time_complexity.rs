/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* Generate an array containing { 1, 2, ..., n } in shuffled order */
fn random_numbers(n: i32) -> Vec<i32> {
    // Generate the array nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // Randomly shuffle the array elements
    nums.shuffle(&mut thread_rng());
    nums
}

/* Find the index of the number 1 in array nums */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // When 1 is at the start of the array, the best-case time complexity is O(1)
        // When 1 is at the end of the array, the worst-case time complexity is O(n)
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* Driver code */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\nArray [ 1, 2, ..., n ] after shuffling = ");
        print_util::print_array(&nums);
        println!("\nIndex of number 1: {}", index);
    }
}
