/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* Bubble sort */
fn bubble_sort(nums: &mut [i32]) {
    // Outer loop: unsorted range is [0, i]
    for i in (1..nums.len()).rev() {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* Bubble sort (optimized with flag) */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // Outer loop: unsorted range is [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // Initialize flag
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // Record swapped elements
            }
        }
        if !flag {
            break; // If no elements were swapped in this round of "bubbling", exit
        };
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("After bubble sort, nums =");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\nAfter bubble sort, nums1 = ");
    print_util::print_array(&nums1);
}
