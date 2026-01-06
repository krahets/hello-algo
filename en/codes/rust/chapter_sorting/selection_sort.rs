/*
 * File: selection_sort.rs
 * Created Time: 2023-05-30
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* Selection sort */
fn selection_sort(nums: &mut [i32]) {
    if nums.is_empty() {
        return;
    }
    let n = nums.len();
    // Outer loop: unsorted interval is [i, n-1]
    for i in 0..n - 1 {
        // Inner loop: find the smallest element within the unsorted interval
        let mut k = i;
        for j in i + 1..n {
            if nums[j] < nums[k] {
                k = j; // Record the index of the smallest element
            }
        }
        // Swap the smallest element with the first element of the unsorted interval
        nums.swap(i, k);
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    selection_sort(&mut nums);
    print!("\nAfter selection sort, nums = ");
    print_util::print_array(&nums);
}
