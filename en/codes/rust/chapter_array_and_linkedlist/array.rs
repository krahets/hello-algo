/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Random access to element */
fn random_access(nums: &[i32]) -> i32 {
    // Randomly select a number in interval [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Retrieve and return the random element
    let random_num = nums[random_index];
    random_num
}

/* Extend array length */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // Initialize an array with extended length
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Copy all elements from original array to new
    res[0..nums.len()].copy_from_slice(nums);

    // Return the extended new array
    res
}

/* Insert element num at index index in the array */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Move all elements at and after index index backward by one position
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index index
    nums[index] = num;
}

/* Remove the element at index index */
fn remove(nums: &mut [i32], index: usize) {
    // Move all elements after index index forward by one position
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* Traverse array */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // Traverse array by index
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Direct traversal of array elements
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* Find the specified element in the array */
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
    /* Initialize array */
    let arr: [i32; 5] = [0; 5];
    print!("Array arr = ");
    print_util::print_array(&arr);
    // In Rust, specifying length ([i32; 5]) is an array, without length (&[i32]) is a slice
    // Since Rust arrays are designed to have compile-time determined length, only constants can specify length
    // Vector is the type Rust generally uses as a dynamic array
    // To facilitate implementing the extend() method, the following treats vector as array
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nArray nums = ");
    print_util::print_array(&nums);

    // Insert element
    let random_num = random_access(&nums);
    println!("\nGet random element {} from nums", random_num);

    // Traverse array
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("Extend array length to 8, resulting in nums = ");
    print_util::print_array(&nums);

    // Insert element
    insert(&mut nums, 6, 3);
    print!("\nInsert number 6 at index 3, get nums = ");
    print_util::print_array(&nums);

    // Remove element
    remove(&mut nums, 2);
    print!("\nDelete element at index 2, get nums = ");
    print_util::print_array(&nums);

    // Traverse array
    traverse(&nums);

    // Find element
    let index = find(&nums, 3).unwrap();
    println!("\nFind element 3 in nums, index = {}", index);
}
