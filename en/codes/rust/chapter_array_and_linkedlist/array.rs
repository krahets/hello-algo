/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use rand::Rng;

/* Random access to elements */
fn random_access(nums: &[i32]) -> i32 {
    // Randomly select a number in the range [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Retrieve and return a random element
    let random_num = nums[random_index];
    random_num
}

/* Extend array length */
fn extend(nums: Vec<i32>, enlarge: usize) -> Vec<i32> {
    // Initialize an extended length array
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Copy all elements from the original array to the new one
    for i in 0..nums.len() {
        res[i] = nums[i];
    }
    // Return the new array after expansion
    res
}

/* Insert element num at `index` */
fn insert(nums: &mut Vec<i32>, num: i32, index: usize) {
    // Move all elements after `index` one position backward
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index
    nums[index] = num;
}

/* Remove the element at `index` */
fn remove(nums: &mut Vec<i32>, index: usize) {
    // Move all elements after `index` one position forward
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
    // Traverse array elements
    for num in nums {
        _count += num;
    }
}

/* Search for a specified element in the array */
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
    /* Initialize an array */
    let arr = [0; 5];
    print!("Array arr =");
    print_util::print_array(&arr);
    // In Rust, specifying a length (e.g., [i32; 5]) denotes an array
    // Since Rust arrays are designed with compile-time fixed lengths, only constants can be used to specify their lengths
    // For the ease of implementing the extend() method, here (Vec) is treated as an array (Array), which is commonly used for dynamic arrays in Rust
    let nums = vec![1, 3, 2, 5, 4];
    print!("\nArray nums =");
    print_util::print_array(&nums);

    // Random access
    let random_num = random_access(&nums);
    println!("\nRetrieve a random element from nums {}", random_num);

    // Length extension
    let mut nums = extend(nums, 3);
    print!("Extend the array length to 8, resulting in nums =");
    print_util::print_array(&nums);

    // Insert element
    insert(&mut nums, 6, 3);
    print!("\nInsert number 6 at index 3, resulting in nums = ");
    print_util::print_array(&nums);

    // Remove element
    remove(&mut nums, 2);
    print!("\nRemove the element at index 2, resulting in nums = ");
    print_util::print_array(&nums);

    // Traverse array
    traverse(&nums);

    // Search for elements
    let index = find(&nums, 3).unwrap();
    println!("\nFind element 3 in nums, index = {}", index);
}
