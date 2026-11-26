/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* Use binary search to find the leftmost occurrence of target */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // Equivalent to finding the insertion point for target
    let i = binary_search_insertion(nums, target);
    // Target not found. Return -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // Found target. Return index i
    i
}

/* Use binary search to find the rightmost occurrence of target */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // Search for the leftmost occurrence of target + 1
    let i = binary_search_insertion(nums, target + 1);
    // j points to the rightmost occurrence of target, and i to the first larger element
    let j = i - 1;
    // Target not found. Return -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // Found target. Return index j
    j
}

/* Driver code */
fn main() {
    // Array with duplicates
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nArray nums = {:?}", nums);

    // Find the left and right boundaries using binary search
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("Index of the leftmost occurrence of {} = {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("Index of the rightmost occurrence of {} = {}", target, index);
    }
}
