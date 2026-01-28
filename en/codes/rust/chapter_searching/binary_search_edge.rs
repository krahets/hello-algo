/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* Binary search for the leftmost target */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // Equivalent to finding the insertion point of target
    let i = binary_search_insertion(nums, target);
    // Target not found, return -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // Found target, return index i
    i
}

/* Binary search for the rightmost target */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // Convert to finding the leftmost target + 1
    let i = binary_search_insertion(nums, target + 1);
    // j points to the rightmost target, i points to the first element greater than target
    let j = i - 1;
    // Target not found, return -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // Found target, return index j
    j
}

/* Driver Code */
fn main() {
    // Array with duplicate elements
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nArray nums = {:?}", nums);

    // Binary search left and right boundaries
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("Leftmost element {} index is {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("Rightmost element {} index is {}", target, index);
    }
}
