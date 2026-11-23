/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Access an element at a random index */
fn random_access(nums: &[i32]) -> i32 {
    // Choose a random index in [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Get and return the randomly selected element
    let random_num = nums[random_index];
    random_num
}

/* Extend the array length */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // Initialize an array with the extended length
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Copy all elements from the original array to the new one
    res[0..nums.len()].copy_from_slice(nums);

    // Return the new, extended array
    res
}

/* Insert element num at index `index` in the array */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Shift all elements at and after index `index` one position to the right
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index `index`
    nums[index] = num;
}

/* Remove the element at index `index` */
fn remove(nums: &mut [i32], index: usize) {
    // Shift all elements after index `index` one position to the left
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

/* Find a specified element in the array */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Driver code */
fn main() {
    /* Initialize the array */
    let arr: [i32; 5] = [0; 5];
    print!("Array arr = ");
    print_util::print_array(&arr);
    // In Rust, [i32; 5] is an array type with a fixed length, whereas &[i32] is a reference to a slice
    // Rust array lengths are determined at compile time, so their lengths must be constant expressions
    // Vec is the type normally used for dynamic arrays in Rust
    // To simplify the extend() method, the following examples use a vector to represent an array
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nArray nums = ");
    print_util::print_array(&nums);

    // Random access
    let random_num = random_access(&nums);
    println!("\nRandom element from nums: {}", random_num);

    // Extend the length
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("Extend the array length to 8, giving nums = ");
    print_util::print_array(&nums);

    // Insert an element
    insert(&mut nums, 6, 3);
    print!("\nInsert the number 6 at index 3, giving nums = ");
    print_util::print_array(&nums);

    // Remove an element
    remove(&mut nums, 2);
    print!("\nAfter removing the element at index 2, nums = ");
    print_util::print_array(&nums);

    // Traverse the array
    traverse(&nums);

    // Find an element
    let index = find(&nums, 3).unwrap();
    println!("\nSearching nums for element 3 gives index = {}", index);
}
