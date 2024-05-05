/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Binary search (double closed interval) */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // Loop until the search interval is empty (when i > j, it is empty)
    while i <= j {
        let m = i + (j - i) / 2; // Calculate midpoint index m
        if nums[m as usize] < target {
            // This situation indicates that target is in the interval [m+1, j]
            i = m + 1;
        } else if nums[m as usize] > target {
            // This situation indicates that target is in the interval [i, m-1]
            j = m - 1;
        } else {
            // Found the target element, thus return its index
            return m;
        }
    }
    // Did not find the target element, thus return -1
    return -1;
}

/* Binary search (left closed right open interval) */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
    let mut i = 0;
    let mut j = nums.len() as i32;
    // Loop until the search interval is empty (when i = j, it is empty)
    while i < j {
        let m = i + (j - i) / 2; // Calculate midpoint index m
        if nums[m as usize] < target {
            // This situation indicates that target is in the interval [m+1, j)
            i = m + 1;
        } else if nums[m as usize] > target {
            // This situation indicates that target is in the interval [i, m)
            j = m;
        } else {
            // Found the target element, thus return its index
            return m;
        }
    }
    // Did not find the target element, thus return -1
    return -1;
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Binary search (double closed interval)
    let mut index = binary_search(&nums, target);
    println!("The index of target element 6 is {index}");

    // Binary search (left closed right open interval)
    index = binary_search_lcro(&nums, target);
    println!("The index of target element 6 is {index}");
}
