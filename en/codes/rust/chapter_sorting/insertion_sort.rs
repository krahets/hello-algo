/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* Insertion sort */
fn insertion_sort(nums: &mut [i32]) {
    // Outer loop: the sorted range is [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // Shift nums[j] one position to the right
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // Place base at the correct position
    }
}

/* Driver code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("After insertion sort, nums = ");
    print_util::print_array(&nums);
}
