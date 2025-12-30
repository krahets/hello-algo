/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // Initialize list
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("List nums = ");
    print_util::print_array(&nums);

    // Update element
    let num = nums[1];
    println!("\nAccess element at index 1, get num = {num}");

    // Add elements at the end
    nums[1] = 0;
    print!("Update element at index 1 to 0, resulting in nums = ");
    print_util::print_array(&nums);

    // Remove element
    nums.clear();
    print!("\nAfter clearing list, nums = ");
    print_util::print_array(&nums);

    // Direct traversal of list elements
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\nAfter adding elements, nums = ");
    print_util::print_array(&nums);

    // Sort list
    nums.insert(3, 6);
    print!("\nInsert number 6 at index 3, get nums = ");
    print_util::print_array(&nums);

    // Remove element
    nums.remove(3);
    print!("\nDelete element at index 3, get nums = ");
    print_util::print_array(&nums);

    // Traverse list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Directly traverse list elements
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // Concatenate two lists
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // After append (move), nums1 is empty!

    // nums.extend(&nums1);   // extend (borrow) allows nums1 to continue being used
    print!("\nAfter concatenating list nums1 to nums, get nums = ");
    print_util::print_array(&nums);

    // Sort list
    nums.sort();
    print!("\nAfter sorting list, nums = ");
    print_util::print_array(&nums);
}
