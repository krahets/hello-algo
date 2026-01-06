/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* Insertion sort */
fn insertion_sort(nums: &mut [i32]) {
    // Outer loop: sorted interval is [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // Move nums[j] to the right by one position
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // Assign base to the correct position
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("After insertion sort completes, nums = ");
    print_util::print_array(&nums);
}
