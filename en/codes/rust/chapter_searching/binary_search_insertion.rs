/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* Find an insertion point using binary search (no duplicates) */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Initialize the closed interval [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if nums[m as usize] > target {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            return m;
        }
    }
    // Target was not found; return insertion point i
    i
}

/* Find an insertion point using binary search (with duplicates) */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Initialize the closed interval [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if nums[m as usize] > target {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            j = m - 1; // Continue searching [i, m-1] for the insertion point before any equal elements
        }
    }
    // Return insertion point i
    i
}

/* Driver code */
fn main() {
    // Array with no duplicate elements
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\nArray nums = {:?}", nums);
    // Find an insertion point using binary search
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("Insertion index for element {}: {}", target, index);
    }

    // Array containing duplicate elements
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nArray nums = {:?}", nums);
    // Find an insertion point using binary search
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("Insertion index for element {}: {}", target, index);
    }
}
