/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Binary search (closed interval on both sides) */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // Loop, exit when the search interval is empty (empty when i > j)
    while i <= j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            // This means target is in the interval [m+1, j]
            i = m + 1;
        } else if nums[m as usize] > target {
            // This means target is in the interval [i, m-1]
            j = m - 1;
        } else {
            // Found the target element, return its index
            return m;
        }
    }
    // Target element not found, return -1
    return -1;
}

/* Binary search (left-closed right-open interval) */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
    let mut i = 0;
    let mut j = nums.len() as i32;
    // Loop, exit when the search interval is empty (empty when i = j)
    while i < j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            // This means target is in the interval [m+1, j)
            i = m + 1;
        } else if nums[m as usize] > target {
            // This means target is in the interval [i, m)
            j = m;
        } else {
            // Found the target element, return its index
            return m;
        }
    }
    // Target element not found, return -1
    return -1;
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Binary search (closed interval on both sides)
    let mut index = binary_search(&nums, target);
    println!("Index of target element 6 is {index}");

    // Binary search (left-closed right-open interval)
    index = binary_search_lcro(&nums, target);
    println!("Index of target element 6 is {index}");
}
