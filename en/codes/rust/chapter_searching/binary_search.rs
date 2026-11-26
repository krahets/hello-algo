/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Binary search on a closed interval */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // Initialize the closed interval [0, n-1] with i at the first element and j at the last
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // Stop when the search interval is empty (i > j)
    while i <= j {
        let m = i + (j - i) / 2; // Compute the midpoint index m
        if nums[m as usize] < target {
            // Any match must lie in [m+1, j]
            i = m + 1;
        } else if nums[m as usize] > target {
            // Any match must lie in [i, m-1]
            j = m - 1;
        } else {
            // Found the target. Return its index
            return m;
        }
    }
    // Target not found. Return -1
    return -1;
}

/* Binary search on a left-closed, right-open interval */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // Initialize [0, n) with i at the first element and j one past the last
    let mut i = 0;
    let mut j = nums.len() as i32;
    // Stop when the search interval is empty (i = j)
    while i < j {
        let m = i + (j - i) / 2; // Compute the midpoint index m
        if nums[m as usize] < target {
            // Any match must lie in [m+1, j)
            i = m + 1;
        } else if nums[m as usize] > target {
            // Any match must lie in [i, m)
            j = m;
        } else {
            // Found the target. Return its index
            return m;
        }
    }
    // Target not found. Return -1
    return -1;
}

/* Driver code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Binary search on a closed interval
    let mut index = binary_search(&nums, target);
    println!("Index of target 6 = {index}");

    // Binary search on a left-closed, right-open interval
    index = binary_search_lcro(&nums, target);
    println!("Index of target 6 = {index}");
}
