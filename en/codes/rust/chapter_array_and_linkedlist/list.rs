/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* Driver Code */
fn main() {
    // Initialize list
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("List nums =");
    print_util::print_array(&nums);

    // Access element
    let num = nums[1];
    println!("\nAccess element at index 1, resulting in num = {num}");

    // Update element
    nums[1] = 0;
    print!("Update the element at index 1 to 0, resulting in nums =");
    print_util::print_array(&nums);

    // Clear list
    nums.clear();
    print!("\nClear the list, resulting in nums = ");
    print_util::print_array(&nums);

    // Add element at the end
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\nAdd elements, resulting in nums = ");
    print_util::print_array(&nums);

    // Insert element in the middle
    nums.insert(3, 6);
    print!("\nInsert number 6 at index 3, resulting in nums = ");
    print_util::print_array(&nums);

    // Remove element
    nums.remove(3);
    print!("\nRemove the element at index 3, resulting in nums = ");
    print_util::print_array(&nums);

    // Traverse the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Traverse the list elements
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // Concatenate two lists
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append (move) leaves nums1 empty!

    // nums.extend(&nums1);   // extend (borrow) allows nums1 to continue being used
    print!("\nConcatenate list nums1 to nums, resulting in nums = ");
    print_util::print_array(&nums);

    // Sort list
    nums.sort();
    print!("\nSort the list, resulting in nums = ");
    print_util::print_array(&nums);
}
