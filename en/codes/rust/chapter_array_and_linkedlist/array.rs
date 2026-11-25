/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Access a random element */
fn random_access(nums: &[i32]) -> i32 {
    // Pick a random index in [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Get and return the element at that index
    let random_num = nums[random_index];
    random_num
}

/* Extend the array */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // Initialize an array with the new length
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Copy all elements from the original array into the new array
    res[0..nums.len()].copy_from_slice(nums);

    // Return the new, longer array
    res
}

/* Insert num at the specified array index */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Shift the elements from index onward one position to the right
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Store num at the specified index
    nums[index] = num;
}

/* Remove the element at the specified index */
fn remove(nums: &mut [i32], index: usize) {
    // Shift all elements after index one position to the left
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* Traverse the array */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // Traverse the array by index
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Iterate directly over the array elements
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* Find a given element in the array */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    /* Initialize the array */
    let arr: [i32; 5] = [0; 5];
    print!("Array arr = ");
    print_util::print_array(&arr);
    // In Rust, specifying the length ([i32; 5]) gives an array, while &[i32] borrows a slice of unspecified length
    // Rust fixes array lengths at compile time, so the length must be a constant
    // A vector is the usual dynamic array type in Rust
    // To simplify the extend() method for extending an array, we use a vector as the array below
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nArray nums = ");
    print_util::print_array(&nums);

    // Random access
    let random_num = random_access(&nums);
    println!("\nRandom element from nums: {}", random_num);

    // Extend the array
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("After extending the array to length 8, nums = ");
    print_util::print_array(&nums);

    // Insert an element
    insert(&mut nums, 6, 3);
    print!("\nAfter inserting 6 at index 3, nums = ");
    print_util::print_array(&nums);

    // Remove an element
    remove(&mut nums, 2);
    print!("\nAfter removing the element at index 2, nums = ");
    print_util::print_array(&nums);

    // Traverse the array
    traverse(&nums);

    // Find an element
    let index = find(&nums, 3).unwrap();
    println!("\nIndex of 3 in nums = {}", index);
}
