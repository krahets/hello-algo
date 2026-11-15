/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver code */
fn main() {
    // Initialize the list
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("List nums = ");
    print_util::print_array(&nums);

    // Access an element
    let num = nums[1];
    println!("\nAccessing the element at index 1 gives num = {num}");

    // Update an element
    nums[1] = 0;
    print!("Update the element at index 1 to 0, giving nums = ");
    print_util::print_array(&nums);

    // Clear the list
    nums.clear();
    print!("\nAfter clearing the list, nums = ");
    print_util::print_array(&nums);

    // Append an element at the end
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\nAfter adding elements, nums = ");
    print_util::print_array(&nums);

    // Insert an element in the middle
    nums.insert(3, 6);
    print!("\nInsert the number 6 at index 3, giving nums = ");
    print_util::print_array(&nums);

    // Remove an element
    nums.remove(3);
    print!("\nRemove the element at index 3, giving nums = ");
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
    nums.append(&mut nums1); // append moves the elements, leaving nums1 empty!

    // nums.extend(&nums1);   // extend borrows nums1, leaving its elements available
    print!("\nAppend list nums1 to nums, giving nums = ");
    print_util::print_array(&nums);

    // Sort the list
    nums.sort();
    print!("\nAfter sorting the list, nums = ");
    print_util::print_array(&nums);
}
