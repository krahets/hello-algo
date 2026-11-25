/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* Binary search for an insertion point (no duplicates) */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Initialize the closed interval [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Compute the midpoint index m
        if nums[m as usize] < target {
            i = m + 1; // Any match must lie in [m+1, j]
        } else if nums[m as usize] > target {
            j = m - 1; // Any match must lie in [i, m-1]
        } else {
            return m;
        }
    }
    // Target not found. Return insertion point i
    i
}

/* Binary search for an insertion point (duplicates allowed) */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Initialize the closed interval [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Compute the midpoint index m
        if nums[m as usize] < target {
            i = m + 1; // Any match must lie in [m+1, j]
        } else if nums[m as usize] > target {
            j = m - 1; // Any match must lie in [i, m-1]
        } else {
            j = m - 1; // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    i
}

/* Driver code */
fn main() {
    // Array without duplicates
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\nArray nums = {:?}", nums);
    // Find the insertion point using binary search
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("Insertion index for {} = {}", target, index);
    }

    // Array with duplicates
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nArray nums = {:?}", nums);
    // Find the insertion point using binary search
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("Insertion index for {} = {}", target, index);
    }
}
