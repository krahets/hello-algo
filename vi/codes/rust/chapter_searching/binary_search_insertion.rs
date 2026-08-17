/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* Binary search for insertion point (no duplicate elements) */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Initialize closed interval [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            i = m + 1; // target is in the interval [m+1, j]
        } else if nums[m as usize] > target {
            j = m - 1; // target is in the interval [i, m-1]
        } else {
            return m;
        }
    }
    // Target not found, return insertion point i
    i
}

/* Binary search for insertion point (with duplicate elements) */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Initialize closed interval [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            i = m + 1; // target is in the interval [m+1, j]
        } else if nums[m as usize] > target {
            j = m - 1; // target is in the interval [i, m-1]
        } else {
            j = m - 1; // The first element less than target is in the interval [i, m-1]
        }
    }
    // Return insertion point i
    i
}

/* Driver Code */
fn main() {
    // Array without duplicate elements
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\nArray nums = {:?}", nums);
    // Binary search for insertion point
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("Insertion point index for element {} is {}", target, index);
    }

    // Array with duplicate elements
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nArray nums = {:?}", nums);
    // Binary search for insertion point
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("Insertion point index for element {} is {}", target, index);
    }
}
