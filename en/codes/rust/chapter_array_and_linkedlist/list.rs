/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // Initialize the list
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("List nums = ");
    print_util::print_array(&nums);

    // Access an element
    let num = nums[1];
    println!("\nReading index 1 gives num = {num}");

    // Update an element
    nums[1] = 0;
    print!("After setting the element at index 1 to 0, nums = ");
    print_util::print_array(&nums);

    // Clear the list
    nums.clear();
    print!("\nAfter clearing the list, nums = ");
    print_util::print_array(&nums);

    // Append an element
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\nAfter appending elements, nums = ");
    print_util::print_array(&nums);

    // Insert an element in the middle
    nums.insert(3, 6);
    print!("\nAfter inserting 6 at index 3, nums = ");
    print_util::print_array(&nums);

    // Remove an element
    nums.remove(3);
    print!("\nAfter removing the element at index 3, nums = ");
    print_util::print_array(&nums);

    // Traverse the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Iterate directly over the list elements
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // Concatenate two lists
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // After append moves the elements, nums1 is empty!

    // nums.extend(&nums1);   // extend borrows nums1, so it can still be used
    print!("\nAfter appending nums1 to nums, nums = ");
    print_util::print_array(&nums);

    // Sort the list
    nums.sort();
    print!("\nAfter sorting, nums = ");
    print_util::print_array(&nums);
}
