/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Binary search (closed interval) */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // Loop until the search interval is empty (when i > j)
    while i <= j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            // In this case, target must be in [m+1, j] if it exists
            i = m + 1;
        } else if nums[m as usize] > target {
            // In this case, target must be in [i, m-1] if it exists
            j = m - 1;
        } else {
            // The target element was found; return its index
            return m;
        }
    }
    // The target element was not found; return -1
    return -1;
}

/* Binary search (left-closed, right-open interval) */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    let mut i = 0;
    let mut j = nums.len() as i32;
    // Loop until the search interval is empty (when i = j)
    while i < j {
        let m = i + (j - i) / 2; // Calculate the midpoint index m
        if nums[m as usize] < target {
            // In this case, target must be in [m+1, j) if it exists
            i = m + 1;
        } else if nums[m as usize] > target {
            // In this case, target must be in [i, m) if it exists
            j = m;
        } else {
            // The target element was found; return its index
            return m;
        }
    }
    // The target element was not found; return -1
    return -1;
}

/* Driver code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Binary search (closed interval)
    let mut index = binary_search(&nums, target);
    println!("Index of target element 6 = {index}");

    // Binary search (left-closed, right-open interval)
    index = binary_search_lcro(&nums, target);
    println!("Index of target element 6 = {index}");
}
